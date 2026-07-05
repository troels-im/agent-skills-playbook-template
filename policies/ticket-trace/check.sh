#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations_file="/tmp/agent-skills-ticket-trace-violations.$$"
: > "$violations_file"

ticket_count() {
  awk '/^tickets:/ { t = 1; next } t && /^[A-Za-z_]+:/ { t = 0 } t && /^  - id:/ { count++ } END { print count + 0 }' "$1"
}

requirement_ids() {
  awk '
    /^requirements:/ { r = 1; next }
    r && /^[A-Za-z_]+:/ { r = 0 }
    r && /^  - id:/ { sub(/^  - id:[[:space:]]*/, ""); gsub(/"/, ""); print }
  ' "$1"
}

ticket_values() {
  key="$2"
  awk -v key="$key" '
    /^tickets:/ { t = 1; next }
    t && /^[A-Za-z_]+:/ { t = 0 }
    t && index($0, "    " key ":") == 1 {
      sub("^    " key ":[[:space:]]*", "")
      gsub(/"/, "")
      print
    }
  ' "$1"
}

ticket_requirement_ids() {
  awk '
    /^tickets:/ { t = 1; next }
    t && /^[A-Za-z_]+:/ { t = 0; r = 0 }
    t && /^  - id:/ { r = 0; next }
    t && /^    requirements:/ { r = 1; next }
    r && /^      - / { sub(/^      -[[:space:]]*/, ""); gsub(/"/, ""); print }
    t && /^    [A-Za-z_]+:/ && $0 !~ /^    requirements:/ { r = 0 }
  ' "$1"
}

for trace_file in $(find work-trace -path '*/trace.yaml' | sort); do
  case "$trace_file" in
    work-trace/_template/trace.yaml) continue ;;
  esac

  provider="$(awk -F': *' '$1 ~ /^  provider$/ { print $2; exit }' "$trace_file" | tr -d '"')"
  count="$(ticket_count "$trace_file")"
  if [ "$count" -eq 0 ]; then
    printf '%s: missing tickets section entries\n' "$trace_file" >> "$violations_file"
    continue
  fi

  ticket_reqs="$(ticket_requirement_ids "$trace_file")"
  for req in $(requirement_ids "$trace_file"); do
    if ! printf '%s\n' "$ticket_reqs" | grep -Fxq "$req"; then
      printf '%s: requirement %s is not mapped to a ticket\n' "$trace_file" "$req" >> "$violations_file"
    fi
  done

  case "$provider" in
    local)
      files="$(ticket_values "$trace_file" file)"
      file_count="$(printf '%s\n' "$files" | sed '/^$/d' | wc -l | tr -d ' ')"
      [ "$file_count" -ge "$count" ] || printf '%s: local tracker tickets must include file paths\n' "$trace_file" >> "$violations_file"
      trace_dir="$(dirname "$trace_file")"
      printf '%s\n' "$files" | sed '/^$/d' |
      while IFS= read -r rel_path; do
        case "$rel_path" in
          ../../tickets/*|tickets/*) ;;
          *) printf '%s: local ticket file must live under tickets/: %s\n' "$trace_file" "$rel_path" >> "$violations_file" ;;
        esac
        [ -f "$trace_dir/$rel_path" ] || printf '%s: local ticket file missing: %s\n' "$trace_file" "$rel_path" >> "$violations_file"
      done
      ;;
    github|gitlab|linear)
      url_count="$(ticket_values "$trace_file" url | sed '/^$/d' | wc -l | tr -d ' ')"
      [ "$url_count" -ge "$count" ] || printf '%s: external tracker tickets must include urls\n' "$trace_file" >> "$violations_file"
      ;;
  esac
done

if [ -s "$violations_file" ]; then
  cat "$violations_file" >&2
  rm -f "$violations_file"
  printf 'Policy guide: policies/ticket-trace/guide.md\n' >&2
  exit 1
fi

rm -f "$violations_file"
printf 'Tickets are traced.\n'

