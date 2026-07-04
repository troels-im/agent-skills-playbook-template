#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."
. policies/_lib/common.sh

max_lines="${MAX_FILE_LINES:-1500}"
violations_file="/tmp/agent-skills-playbook-file-size-violations.$$"
: > "$violations_file"

tracked_and_untracked_files | while IFS= read -r path; do
  [ -n "$path" ] || continue
  [ -f "$path" ] || continue
  is_text_file "$path" || continue
  lines="$(wc -l < "$path" | tr -d ' ')"
  if [ "$lines" -gt "$max_lines" ]; then
    printf '%s: %s lines exceeds limit %s\n' "$path" "$lines" "$max_lines" >> "$violations_file"
  fi
done

if [ -s "$violations_file" ]; then
  cat "$violations_file" >&2
  rm -f "$violations_file"
  printf 'Policy guide: policies/file-size/guide.md\n' >&2
  exit 1
fi

rm -f "$violations_file"
printf 'Checked text files; line limit is %s.\n' "$max_lines"
