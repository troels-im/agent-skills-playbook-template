---
title: QA And Fix
domain: quality
summary: QA and fix issues within accepted scope.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# QA And Fix

Use this playbook when the user asks you to test, QA, and fix issues within a
defined scope.

## Workflow

1. Confirm target and scope.
2. Classify risk.
3. Run focused checks to reproduce issues.
4. Fix the smallest set of valid issues.
5. Re-run focused checks.
6. Run `just test` when repository files changed.
7. Report what was fixed, what was verified, and what remains.

## Anti-Patterns

Avoid:

- broad refactors during QA
- changing behavior without a failing observation or acceptance criterion
- claiming full coverage from one smoke test
