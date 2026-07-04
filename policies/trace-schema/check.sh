#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations=""

for trace_dir in work-trace/* work-trace/examples/*; do
  [ -d "$trace_dir" ] || continue
  case "$trace_dir" in
    work-trace/_template|work-trace/examples) continue ;;
  esac

  trace_file="$trace_dir/trace.yaml"
  if [ ! -f "$trace_file" ]; then
    violations="${violations}${trace_dir}: missing trace.yaml
"
    continue
  fi

  trace_id="$(awk -F': *' '$1 == "trace_id" { print $2; exit }' "$trace_file" | tr -d '"')"
  expected_id="$(basename "$trace_dir")"
  if [ "$trace_id" != "$expected_id" ]; then
    violations="${violations}${trace_file}: trace_id '${trace_id}' does not match directory '${expected_id}'
"
  fi

  for key in trace_id tracker artifacts requirements acceptance tasks commits code_refs test_refs; do
    if ! grep -Eq "^${key}:" "$trace_file"; then
      violations="${violations}${trace_file}: missing top-level '${key}:' section
"
    fi
  done
done

if [ -n "$violations" ]; then
  printf '%s' "$violations" >&2
  printf 'Policy guide: policies/trace-schema/guide.md\n' >&2
  exit 1
fi

printf 'Trace schemas are valid.\n'
