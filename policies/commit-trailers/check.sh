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
subject_regex='^(feat|fix|docs|test|refactor|chore|perf|build|ci|style|revert)([(][A-Za-z0-9._/-]+[)])?!?: .+'

for commit in $commits; do
  changed_done_task="$(
    git show --format= --unified=0 "$commit" -- 'work-trace/**/tasks/*.md' |
      grep -E '^\+(Done|Validated)$' || true
  )"

  message="$(git log -1 --format=%B "$commit")"
  has_trace_trailer="$(printf '%s\n' "$message" | grep -E '^Trace-[A-Za-z]+: ' || true)"

  [ -n "$changed_done_task" ] || [ -n "$has_trace_trailer" ] || continue

  subject="$(git log -1 --format=%s "$commit")"
  if ! printf '%s\n' "$subject" | grep -Eq "$subject_regex"; then
    violations="${violations}${commit}: trace commit subject is not conventional
"
  fi

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

printf 'Trace commit trailers are valid.\n'
