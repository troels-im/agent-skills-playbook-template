#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."
. policies/_lib/common.sh

patterns='(BEGIN (RSA |OPENSSH |EC |DSA )?PRIVATE KEY|ghp_[A-Za-z0-9_]{20,}|github_pat_[A-Za-z0-9_]{20,}|AKIA[0-9A-Z]{16}|SECRET_ACCESS_KEY|api[_-]?key[[:space:]]*=|token[[:space:]]*=|password[[:space:]]*=)'

violations_file="/tmp/agent-skills-playbook-secret-violations.$$"
: > "$violations_file"

tracked_and_untracked_files | while IFS= read -r path; do
  [ -f "$path" ] || continue
  is_text_file "$path" || continue
  case "$path" in
    policies/secret-hygiene/check.sh|policies/secret-hygiene/guide.md)
      continue
      ;;
  esac
  if grep -EIn "$patterns" "$path" >/dev/null 2>&1; then
    grep -EIn "$patterns" "$path" >> "$violations_file" || true
  fi
done

if [ -s "$violations_file" ]; then
  cat "$violations_file" >&2
  rm -f "$violations_file"
  printf 'Policy guide: policies/secret-hygiene/guide.md\n' >&2
  exit 1
fi

rm -f "$violations_file"
printf 'No obvious secrets found.\n'
