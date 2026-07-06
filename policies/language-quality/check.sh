#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

status=0

for language_check in policies/language-quality/languages/*.sh; do
  case "$language_check" in
    */_lib.sh) continue ;;
  esac

  name="$(basename "$language_check" .sh)"
  printf '\n-- %s --\n' "$name"
  if ! sh "$language_check"; then
    status=1
  fi
done

if [ "$status" -ne 0 ]; then
  printf 'Policy guide: policies/language-quality/guide.md\n' >&2
  exit 1
fi

printf 'Language quality checks completed.\n'
