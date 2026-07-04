#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/.."

run_policy() {
  name="$1"
  shift
  printf '\n==> %s\n' "$name"
  "$@"
}

run_policy "file size" sh policies/file-size/check.sh
run_policy "change checkpoint" sh policies/change-checkpoint/check.sh
run_policy "skill spec" sh policies/skill-spec/check.sh
run_policy "playbook spec" sh policies/playbook-spec/check.sh
run_policy "index coverage" sh policies/index-coverage/check.sh
run_policy "generated artifacts" sh policies/generated-artifacts/check.sh
run_policy "secret hygiene" sh policies/secret-hygiene/check.sh
run_policy "trace schema" sh policies/trace-schema/check.sh
run_policy "tracker provider" sh policies/tracker-provider/check.sh
run_policy "trace links" sh policies/trace-links/check.sh
run_policy "commit trailers" sh policies/commit-trailers/check.sh

printf '\nAll policies passed.\n'
