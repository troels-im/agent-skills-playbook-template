#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations=""

for trace_file in $(find work-trace -path '*/trace.yaml' | sort); do
  case "$trace_file" in
    work-trace/_template/trace.yaml) continue ;;
  esac

  provider="$(awk -F': *' '$1 ~ /^  provider$/ { print $2; exit }' "$trace_file" | tr -d '"')"
  id="$(awk -F': *' '$1 ~ /^  id$/ { print $2; exit }' "$trace_file" | tr -d '"')"
  url="$(awk -F': *' '$1 ~ /^  url$/ { print $2; exit }' "$trace_file" | tr -d '"')"
  project="$(awk -F': *' '$1 ~ /^  project$/ { print $2; exit }' "$trace_file" | tr -d '"')"
  title="$(awk -F': *' '$1 ~ /^  title$/ { print $2; exit }' "$trace_file" | tr -d '"')"

  case "$provider" in
    github|gitlab|linear|local) ;;
    *)
      violations="${violations}${trace_file}: tracker.provider must be github, gitlab, linear, or local
"
      ;;
  esac

  for field_name in id url project title; do
    eval "field_value=\${$field_name}"
    if [ -z "$field_value" ] && [ "$provider" != "local" ]; then
      violations="${violations}${trace_file}: tracker.${field_name} is required for provider '${provider}'
"
    fi
  done
done

if [ -n "$violations" ]; then
  printf '%s' "$violations" >&2
  printf 'Policy guide: policies/tracker-provider/guide.md\n' >&2
  exit 1
fi

printf 'Tracker providers are valid.\n'
