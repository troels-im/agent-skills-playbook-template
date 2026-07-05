---
title: QA Only
domain: quality
summary: Perform report-only QA without fixing.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# QA Only

Use this playbook when the user asks for QA, testing, or validation but does not
ask you to fix issues.

## Workflow

1. Confirm the QA target and accepted scope.
2. Load relevant indexes and playbooks.
3. Run `just turn-test` unless the task is read-only by request.
4. Run any user-specified checks.
5. Report findings first, with evidence and reproduction steps.
6. Do not edit files.

## Output

Include:

- checks run
- results
- findings ordered by severity
- residual risks
- recommended next actions
