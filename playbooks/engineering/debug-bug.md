---
title: Debug Bug
domain: engineering
summary: Diagnose and fix a bug with a reproduce-minimize-fix loop.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Debug Bug

Use this playbook for defects, regressions, flaky behavior, or performance
problems.

## Workflow

1. Reproduce the bug or record why it cannot be reproduced yet.
2. Minimize the failing case.
3. Form one hypothesis at a time.
4. Instrument or inspect to test the hypothesis.
5. Fix the smallest confirmed cause.
6. Add regression coverage where the consuming repo supports it.
7. Link the fix to requirements, tasks, and commits.
8. Run focused verification and `just turn-test`.

## Anti-Patterns

Avoid:

- fixing before reproducing
- changing multiple unrelated causes at once
- leaving no regression evidence
