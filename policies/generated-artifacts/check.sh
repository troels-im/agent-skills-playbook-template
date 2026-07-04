#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations=""

git ls-files -co --exclude-standard | while IFS= read -r path; do
  case "$path" in
    .DS_Store|*/.DS_Store|*.log|*.tmp|*.temp|*.profraw|*.profdata|*.lcov)
      printf '%s: generated or local artifact should not be committed\n' "$path"
      ;;
    coverage|coverage/*|*/coverage|*/coverage/*|dist|dist/*|*/dist|*/dist/*)
      printf '%s: generated output should not be committed\n' "$path"
      ;;
    build|build/*|*/build|*/build/*|target|target/*|*/target|*/target/*)
      printf '%s: build output should not be committed\n' "$path"
      ;;
    node_modules|node_modules/*|*/node_modules|*/node_modules/*)
      printf '%s: dependency install should not be committed\n' "$path"
      ;;
    .cache|.cache/*|*/.cache|*/.cache/*|__pycache__|*/__pycache__|*/__pycache__/*)
      printf '%s: cache output should not be committed\n' "$path"
      ;;
  esac
done > /tmp/agent-skills-playbook-generated-violations.$$

if [ -s /tmp/agent-skills-playbook-generated-violations.$$ ]; then
  cat /tmp/agent-skills-playbook-generated-violations.$$ >&2
  rm -f /tmp/agent-skills-playbook-generated-violations.$$
  printf 'Policy guide: policies/generated-artifacts/guide.md\n' >&2
  exit 1
fi

rm -f /tmp/agent-skills-playbook-generated-violations.$$
printf 'No generated artifacts found.\n'
