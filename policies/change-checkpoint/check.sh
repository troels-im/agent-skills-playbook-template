#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

limit="${CHANGE_CHECKPOINT_LINES:-500}"

if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  printf 'No HEAD commit yet; checkpoint policy starts after the initial commit.\n'
  exit 0
fi

changed_lines="$(
  git diff --numstat HEAD -- |
    awk '{ added += $1; deleted += $2 } END { print added + deleted + 0 }'
)"

untracked_lines="$(
  git ls-files -o --exclude-standard |
    while IFS= read -r path; do
      [ -f "$path" ] || continue
      grep -Iq . "$path" 2>/dev/null || continue
      wc -l < "$path"
    done |
    awk '{ total += $1 } END { print total + 0 }'
)"

total=$((changed_lines + untracked_lines))

if [ "$total" -gt "$limit" ]; then
  printf 'Local changes contain %s changed lines; checkpoint limit is %s.\n' "$total" "$limit" >&2
  printf 'Commit a coherent checkpoint before continuing.\n' >&2
  printf 'Policy guide: policies/change-checkpoint/guide.md\n' >&2
  exit 1
fi

printf 'Local changed lines: %s/%s.\n' "$total" "$limit"
