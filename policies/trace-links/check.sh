#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations_file="/tmp/agent-skills-trace-links-violations.$$"
: > "$violations_file"

check_trace_relative() {
  trace_file="$1"
  rel_path="$2"
  [ -n "$rel_path" ] || return 0
  case "$rel_path" in
    http://*|https://*) return 0 ;;
  esac
  trace_dir="$(dirname "$trace_file")"
  if [ ! -f "$trace_dir/$rel_path" ]; then
    printf '%s: referenced trace file missing: %s\n' "$trace_file" "$rel_path" >> "$violations_file"
  fi
}

check_repo_relative() {
  trace_file="$1"
  rel_path="$2"
  [ -n "$rel_path" ] || return 0
  case "$rel_path" in
    http://*|https://*) return 0 ;;
  esac
  if [ ! -e "$rel_path" ]; then
    printf '%s: referenced repository path missing: %s\n' "$trace_file" "$rel_path" >> "$violations_file"
  fi
}

for trace_file in $(find work-trace -path '*/trace.yaml' | sort); do
  case "$trace_file" in
    work-trace/_template/trace.yaml) continue ;;
  esac

  awk -F': *' '$1 ~ /^    file$/ { print $2 }' "$trace_file" | tr -d '"' |
  while IFS= read -r rel_path; do
    check_trace_relative "$trace_file" "$rel_path"
  done

  awk '
    /^  (prd|requirements|acceptance|tasks|adrs|reviews):/ { in_artifacts = 1; next }
    /^  [a-zA-Z_]+:/ && $1 !~ /^-/ { in_artifacts = 0 }
    in_artifacts && /^    - / { sub(/^    - /, ""); print }
  ' "$trace_file" | tr -d '"' |
  while IFS= read -r rel_path; do
    check_trace_relative "$trace_file" "$rel_path"
  done

  awk '
    /^code_refs:/ { in_code = 1; next }
    /^[a-zA-Z_]+:/ { in_code = 0 }
    in_code && /^  - path:/ { sub(/^  - path:[[:space:]]*/, ""); print }
  ' "$trace_file" | tr -d '"' |
  while IFS= read -r rel_path; do
    check_repo_relative "$trace_file" "$rel_path"
  done
done

if [ -s "$violations_file" ]; then
  cat "$violations_file" >&2
  rm -f "$violations_file"
  printf 'Policy guide: policies/trace-links/guide.md\n' >&2
  exit 1
fi

rm -f "$violations_file"
printf 'Trace links resolve.\n'
