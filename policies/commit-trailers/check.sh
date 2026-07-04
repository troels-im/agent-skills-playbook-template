#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  printf 'No commits yet; commit trailer policy not applicable.\n'
  exit 0
fi

if [ -n "${TRACE_BASE_REF:-}" ] && git rev-parse --verify "$TRACE_BASE_REF" >/dev/null 2>&1; then
  commits="$(git rev-list "${TRACE_BASE_REF}..HEAD")"
else
  commits="$(git rev-list --max-count=1 HEAD)"
fi

violations=""

for commit in $commits; do
  changed_done_task="$(
    git show --format= --unified=0 "$commit" -- 'work-trace/**/tasks/*.md' |
      grep -E '^\+(Done|Validated)$' || true
  )"

  [ -n "$changed_done_task" ] || continue

  message="$(git log -1 --format=%B "$commit")"
  for trailer in Trace-Task Trace-Req Trace-Test; do
    if ! printf '%s\n' "$message" | grep -Eq "^${trailer}: "; then
      violations="${violations}${commit}: task completion commit missing ${trailer} trailer
"
    fi
  done
done

if [ -n "$violations" ]; then
  printf '%s' "$violations" >&2
  printf 'Policy guide: policies/commit-trailers/guide.md\n' >&2
  exit 1
fi

printf 'Completion commit trailers are valid.\n'
