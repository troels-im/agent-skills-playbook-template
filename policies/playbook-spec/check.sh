#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

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

for path in $(find playbooks -type f -name '*.md' | sort); do
  case "$path" in
    */index.md) continue ;;
  esac

  first_line="$(sed -n '1p' "$path")"
  if [ "$first_line" != "---" ]; then
    violations="${violations}${path}: missing YAML front matter
"
    continue
  fi

  for field in title domain summary created last_used last_updated; do
    value="$(field_value "$path" "$field" || true)"
    if [ -z "$value" ]; then
      violations="${violations}${path}: missing front matter field '${field}'
"
    fi
  done

  created="$(field_value "$path" created || true)"
  last_used="$(field_value "$path" last_used || true)"
  last_updated="$(field_value "$path" last_updated || true)"

  if [ -n "$created" ] && ! printf '%s\n' "$created" | grep -Eq '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; then
    violations="${violations}${path}: created must be YYYY-MM-DD
"
  fi
  if [ -n "$last_used" ] && ! printf '%s\n' "$last_used" | grep -Eq '^([0-9]{4}-[0-9]{2}-[0-9]{2}|null)$'; then
    violations="${violations}${path}: last_used must be YYYY-MM-DD or null
"
  fi
  if [ -n "$last_updated" ] && ! printf '%s\n' "$last_updated" | grep -Eq '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; then
    violations="${violations}${path}: last_updated must be YYYY-MM-DD
"
  fi
done

if [ -n "$violations" ]; then
  printf '%s' "$violations" >&2
  printf 'Policy guide: policies/playbook-spec/guide.md\n' >&2
  exit 1
fi

printf 'Playbook front matter is valid.\n'
