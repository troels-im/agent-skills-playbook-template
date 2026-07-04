---
title: No Matching Playbook
domain: repository
summary: Work safely when no existing playbook matches the accepted task.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# No Matching Playbook

Use this playbook when the user request is valid but no existing playbook
matches after checking `playbooks/index.md` and the relevant domain index.

## Goal

Make uncovered work explicit without breaking the rule that a task follows a
playbook.

## Workflow

1. Classify risk with `task-risk-classification.md`.
2. State that no existing playbook matched.
3. Name the nearest partial context you did load, such as a root index, policy,
   or related domain index.
4. Proceed with the smallest safe workflow for the accepted scope.
5. Keep evidence as you go: files inspected, commands run, decisions made, and
   assumptions.
6. At finish, decide whether the work revealed a reusable workflow.
7. If reusable, follow `writing-playbooks-from-sessions.md` or record a
   retrospective recommendation.

## Verification

- Use the verification required by the task risk class.
- Run `just test` for governance, tooling, or high-risk changes.
- For read-only Class 0 work, no repository verification is required.

## Anti-Patterns

Avoid:

- pretending an unrelated playbook applies
- creating a new playbook before the reusable workflow is clear
- skipping verification because the task was uncovered
- adding broad root instructions instead of a focused playbook
