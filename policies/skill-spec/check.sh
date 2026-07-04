#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

if [ ! -d .agents/skills ]; then
  printf 'No .agents/skills directory found; skill spec policy not applicable.\n'
  exit 0
fi

violations=""

field_value() {
  path="$1"
  key="$2"
  awk -v key="$key" '
    NR == 1 && $0 == "---" { in_frontmatter = 1; next }
    NR > 1 && in_frontmatter && $0 == "---" { exit }
    in_frontmatter && index($0, key ":") == 1 {
      value = substr($0, length(key) + 2)
      sub(/^[[:space:]]+/, "", value)
      print value
      exit
    }
  ' "$path"
}

for dir in .agents/skills/*; do
  [ -d "$dir" ] || continue
  skill="$dir/SKILL.md"
  if [ ! -f "$skill" ]; then
    violations="${violations}${dir}: missing SKILL.md
"
    continue
  fi
  if [ "$(sed -n '1p' "$skill")" != "---" ]; then
    violations="${violations}${skill}: missing YAML front matter
"
    continue
  fi
  for field in name description; do
    value="$(field_value "$skill" "$field" || true)"
    if [ -z "$value" ]; then
      violations="${violations}${skill}: missing front matter field '${field}'
"
    fi
  done
done

if [ -n "$violations" ]; then
  printf '%s' "$violations" >&2
  printf 'Policy guide: policies/skill-spec/guide.md\n' >&2
  exit 1
fi

printf 'Skill front matter is valid.\n'
