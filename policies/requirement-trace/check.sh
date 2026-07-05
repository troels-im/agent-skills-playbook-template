#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../.."

violations_file="/tmp/agent-skills-requirement-trace-violations.$$"
: > "$violations_file"

subject_regex='^(feat|fix|docs|test|refactor|chore|perf|build|ci|style|revert)([(][A-Za-z0-9._/-]+[)])?!?: .+'

requirement_has_code() {
  trace_file="$1"
  req="$2"
  awk -v req="$req" '
    /^requirements:/ { in_requirements = 1; next }
    in_requirements && /^[a-zA-Z_]+:/ { in_requirements = 0; in_req = 0; in_code = 0 }
    in_requirements && /^  - id:/ {
      id = $0
      sub(/^  - id:[[:space:]]*/, "", id)
      gsub(/"/, "", id)
      in_req = (id == req)
      in_code = 0
      next
    }
    in_req && /^    code:/ { in_code = 1; next }
    in_req && in_code && /^      - / {
      value = $0
      sub(/^      -[[:space:]]*/, "", value)
      if (value != "") found = 1
    }
    in_req && /^    [A-Za-z_]+:/ && $0 !~ /^    code:/ { in_code = 0 }
    END { exit found ? 0 : 1 }
  ' "$trace_file"
}

code_refs_has_requirement() {
  trace_file="$1"
  req="$2"
  awk -v req="$req" '
    /^code_refs:/ { in_code_refs = 1; next }
    in_code_refs && /^[a-zA-Z_]+:/ { in_code_refs = 0; in_ref = 0; in_reqs = 0 }
    in_code_refs && /^  - path:/ { in_ref = 1; in_reqs = 0; next }
    in_ref && /^    requirements:/ { in_reqs = 1; next }
    in_reqs && /^      - / {
      value = $0
      sub(/^      -[[:space:]]*/, "", value)
      gsub(/"/, "", value)
      if (value == req) found = 1
    }
    in_ref && /^    [A-Za-z_]+:/ && $0 !~ /^    requirements:/ { in_reqs = 0 }
    END { exit found ? 0 : 1 }
  ' "$trace_file"
}

check_commit_subjects() {
  trace_file="$1"
  awk -v trace_file="$trace_file" -v subject_regex="$subject_regex" '
    function check_commit() {
      if (hash == "") return
      if (subject == "") {
        printf "%s: commit %s missing conventional commit subject\n", trace_file, hash
      } else if (subject !~ subject_regex) {
        printf "%s: commit %s subject is not conventional: %s\n", trace_file, hash, subject
      }
      if (!trace_req) printf "%s: commit %s missing Trace-Req trailer\n", trace_file, hash
      if (!trace_task) printf "%s: commit %s missing Trace-Task trailer\n", trace_file, hash
      if (!trace_test) printf "%s: commit %s missing Trace-Test trailer\n", trace_file, hash
    }
    /^commits:/ { in_commits = 1; next }
    in_commits && /^[a-zA-Z_]+:/ {
      check_commit()
      in_commits = 0
      hash = subject = ""
      trace_req = trace_task = trace_test = 0
    }
    in_commits && /^  - hash:/ {
      check_commit()
      hash = $0
      sub(/^  - hash:[[:space:]]*/, "", hash)
      gsub(/"/, "", hash)
      subject = ""
      trace_req = trace_task = trace_test = 0
      next
    }
    in_commits && /^    subject:/ {
      subject = $0
      sub(/^    subject:[[:space:]]*/, "", subject)
      gsub(/^"|"$/, "", subject)
      next
    }
    in_commits && /^      Trace-Req:/ { trace_req = 1 }
    in_commits && /^      Trace-Task:/ { trace_task = 1 }
    in_commits && /^      Trace-Test:/ { trace_test = 1 }
    END { if (in_commits) check_commit() }
  ' "$trace_file" >> "$violations_file"
}

for trace_file in $(find work-trace -path '*/trace.yaml' | sort); do
  case "$trace_file" in
    work-trace/_template/trace.yaml) continue ;;
  esac

  check_commit_subjects "$trace_file"

  req_ids="$(
    awk '
      /^requirements:/ { in_requirements = 1; next }
      in_requirements && /^[a-zA-Z_]+:/ { in_requirements = 0 }
      in_requirements && /^  - id:/ {
        id = $0
        sub(/^  - id:[[:space:]]*/, "", id)
        gsub(/"/, "", id)
        print id
      }
    ' "$trace_file"
  )"

  for req in $req_ids; do
    if ! requirement_has_code "$trace_file" "$req"; then
      printf '%s: requirement %s has no code mapping\n' "$trace_file" "$req" >> "$violations_file"
    fi
    if ! code_refs_has_requirement "$trace_file" "$req"; then
      printf '%s: requirement %s is not linked from code_refs\n' "$trace_file" "$req" >> "$violations_file"
    fi
    if ! grep -Eq "^[[:space:]]*Trace-Req:[[:space:]]*${req}$" "$trace_file"; then
      printf '%s: requirement %s is not linked to a commit Trace-Req trailer\n' "$trace_file" "$req" >> "$violations_file"
    fi
  done
done

if [ -s "$violations_file" ]; then
  cat "$violations_file" >&2
  rm -f "$violations_file"
  printf 'Policy guide: policies/requirement-trace/guide.md\n' >&2
  exit 1
fi

rm -f "$violations_file"
printf 'Requirements map to code through commits.\n'
