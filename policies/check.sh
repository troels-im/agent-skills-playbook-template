#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/.."

mode="${1:-turn}"

run_policy() {
  name="$1"
  shift
  printf '\n==> %s\n' "$name"
  "$@"
}

run_turn_policies() {
  run_policy "file size" sh policies/file-size/check.sh
  run_policy "change checkpoint" sh policies/change-checkpoint/check.sh
  run_policy "TODO/FIXME format" sh policies/todo-format/check.sh
  run_policy "skill spec" sh policies/skill-spec/check.sh
  run_policy "playbook spec" sh policies/playbook-spec/check.sh
  run_policy "index coverage" sh policies/index-coverage/check.sh
  run_policy "generated artifacts" sh policies/generated-artifacts/check.sh
  run_policy "secret hygiene" sh policies/secret-hygiene/check.sh
  run_policy "language quality" sh policies/language-quality/check.sh
  run_policy "trace schema" sh policies/trace-schema/check.sh
  run_policy "tracker provider" sh policies/tracker-provider/check.sh
  run_policy "trace links" sh policies/trace-links/check.sh
  run_policy "ticket trace" sh policies/ticket-trace/check.sh
  run_policy "commit trailers" sh policies/commit-trailers/check.sh
}

case "$mode" in
  turn)
    run_turn_policies
    printf '\nTurn policies passed.\n'
    ;;
  pr)
    run_turn_policies
    run_policy "requirement trace" sh policies/requirement-trace/check.sh
    run_policy "subagent trace review" sh policies/subagent-trace-review/check.sh
    printf '\nPR policies passed.\n'
    ;;
  *)
    printf 'Unknown policy mode: %s\n' "$mode" >&2
    printf 'Use: %s [turn|pr]\n' "$0" >&2
    exit 1
    ;;
esac
