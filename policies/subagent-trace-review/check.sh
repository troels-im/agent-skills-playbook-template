#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

base="${TRACE_BASE_REF:-origin/main}"

if ! git rev-parse --verify "$base" >/dev/null 2>&1; then
  printf 'No PR base ref found; subagent trace review gate skipped.\n'
  exit 0
fi

changed_files="$(git diff --name-only "$base...HEAD" 2>/dev/null || git diff --name-only "$base..HEAD")"

needs_review=0
code_refs_file="/tmp/agent-skills-code-refs.$$"
: > "$code_refs_file"

find work-trace -path '*/trace.yaml' | sort |
while IFS= read -r trace_file; do
  case "$trace_file" in
    work-trace/_template/trace.yaml|work-trace/examples/*) continue ;;
  esac
  awk '
    /^code_refs:/ { in_code = 1; next }
    /^[a-zA-Z_]+:/ { in_code = 0 }
    in_code && /^  - path:/ {
      path = $0
      sub(/^  - path:[[:space:]]*/, "", path)
      gsub(/"/, "", path)
      print path
    }
  ' "$trace_file" >> "$code_refs_file"
done

for path in $changed_files; do
  case "$path" in
    work-trace/_template/*|work-trace/examples/*) ;;
    work-trace/*/trace.yaml|work-trace/*/requirements/*|work-trace/*/acceptance/*|work-trace/*/tasks/*)
      needs_review=1
      ;;
    *)
      if grep -Fxq "$path" "$code_refs_file"; then
        needs_review=1
      fi
      ;;
  esac
done

rm -f "$code_refs_file"

if [ "$needs_review" -eq 0 ]; then
  printf 'No traced requirement/code changes requiring subagent review.\n'
  exit 0
fi

if [ "${SUBAGENT_TRACE_REVIEW:-}" = "passed" ]; then
  printf 'Subagent trace review acknowledged by SUBAGENT_TRACE_REVIEW=passed.\n'
  exit 0
fi

if [ -n "${SUBAGENT_TRACE_REVIEW_REPORT:-}" ] &&
   [ -f "$SUBAGENT_TRACE_REVIEW_REPORT" ] &&
   grep -Eq '^Status:[[:space:]]*Passed$' "$SUBAGENT_TRACE_REVIEW_REPORT" &&
   grep -Eq '^Subagent:' "$SUBAGENT_TRACE_REVIEW_REPORT"; then
  printf 'Subagent trace review report passed: %s\n' "$SUBAGENT_TRACE_REVIEW_REPORT"
  exit 0
fi

printf 'PR trace review requires a subagent to verify requirement/code bidirectionality.\n' >&2
printf 'Provide SUBAGENT_TRACE_REVIEW=passed or SUBAGENT_TRACE_REVIEW_REPORT=<file> after review.\n' >&2
printf 'Policy guide: policies/subagent-trace-review/guide.md\n' >&2
exit 1
