#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations_file="/tmp/agent-skills-todo-format-violations.$$"
: > "$violations_file"

files="$(git ls-files && git ls-files -o --exclude-standard)"

printf '%s\n' "$files" | sort -u |
while IFS= read -r path; do
  [ -n "$path" ] || continue
  [ -f "$path" ] || continue
  grep -Iq . "$path" 2>/dev/null || continue

  awk -v path="$path" '
    /(^|[^A-Za-z])(TODO|FIXME)(:|\()/ {
      valid = /(^|[^A-Za-z])(TODO|FIXME)\([A-Za-z0-9][A-Za-z0-9._:#@\/_-]*\):[[:space:]]+[^[:space:]]/
      if (!valid) {
        printf "%s:%d: TODO/FIXME must use TODO(ticket_id): description or FIXME(ticket_id): description\n", path, NR
      }
    }
  ' "$path" >> "$violations_file"
done

if [ -s "$violations_file" ]; then
  cat "$violations_file" >&2
  rm -f "$violations_file"
  printf 'Policy guide: policies/todo-format/guide.md\n' >&2
  exit 1
fi

rm -f "$violations_file"
printf 'TODO/FIXME markers are ticketed.\n'
