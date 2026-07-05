---
title: Test Drive Change
domain: engineering
summary: Use a red-green-refactor loop for trace-linked changes.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Test Drive Change

Use this playbook when a feature or bug fix can be driven by an automated or
manual failing check first.

## Workflow

1. Pick one requirement or acceptance criterion.
2. Write or identify the failing check.
3. Confirm it fails for the right reason.
4. Implement the smallest change to pass.
5. Refactor only while preserving the check.
6. Record test evidence in the task and requirement trace.
7. Run focused checks and `just turn-test`.

## Quality Bar

- Tests prove behavior, not implementation trivia.
- Each change maps to a requirement, acceptance criterion, or task.
- Refactoring does not widen scope.
