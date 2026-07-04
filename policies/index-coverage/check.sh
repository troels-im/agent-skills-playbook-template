#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations=""

for dir in docs playbooks policies; do
  if [ -d "$dir" ] && [ ! -f "$dir/index.md" ]; then
    violations="${violations}${dir}: missing index.md
"
  fi
done

find playbooks policies docs -mindepth 1 -maxdepth 2 -type d 2>/dev/null | sort |
while IFS= read -r dir; do
  [ -n "$dir" ] || continue
  case "$dir" in
    policies/_lib) continue ;;
  esac
  if find "$dir" -maxdepth 1 -type f | grep -q .; then
    if [ ! -f "$dir/index.md" ] && [ ! -f "$dir/README.md" ] && [ ! -f "$dir/guide.md" ]; then
      printf '%s: missing index.md or README.md\n' "$dir"
    fi
  fi
done > /tmp/agent-skills-playbook-index-violations.$$

if [ -s /tmp/agent-skills-playbook-index-violations.$$ ]; then
  violations="${violations}$(cat /tmp/agent-skills-playbook-index-violations.$$)"
fi
rm -f /tmp/agent-skills-playbook-index-violations.$$

if [ -n "$violations" ]; then
  printf '%s\n' "$violations" >&2
  printf 'Policy guide: policies/index-coverage/guide.md\n' >&2
  exit 1
fi

printf 'Index coverage is present.\n'
