---
title: Task Risk Classification
domain: repository
summary: Choose verification, review, and retrospective depth from the accepted task scope.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Task Risk Classification

Use this playbook at the start of every task before choosing tests, review
depth, or retrospective depth.

## Goal

Keep quality high without applying production-sized process to low-risk work.

The classification should answer:

- what changed or will change
- whether the change affects executable behavior
- which focused checks prove the touched surface is still valid
- whether `just turn-test` is required
- whether review was explicitly requested and has clear acceptance criteria

## Input Check

Before editing, identify:

1. The accepted scope.
2. Files or directories likely to change.
3. Whether those files affect policy, release, production behavior, security,
   generated artifacts, or user-facing behavior.
4. Whether the user explicitly requested broader verification.

If scope is ambiguous, ask one concise question or choose the higher class when
extra verification is cheaper than guessing wrong.

## Classes

### Class 0: No Repository Change

Use for conversation, analysis, planning, status, or read-only inspection.

Required verification:

- none

### Class 1: Content-Only Change

Use for docs, indexes, playbooks, trace files, and markdown metadata when the
change has no executable, policy, CI, release, generated artifact, or security
impact.

Required verification:

- focused checks for touched files
- `just turn-test` when practical before handoff

Escalate to Class 2 when content changes agent operating rules or repository
governance.

### Class 2: Governance Or Tooling Change

Use for `AGENTS.md`, `CLAUDE.md`, playbook workflow rules, policies, scripts,
CI, or shared developer tooling.

Required verification:

- focused checks for touched surface
- `just turn-test`

### Class 3: Production Or High-Risk Change

Use for consumer project production code, release artifacts, dependency
changes, migrations, security-sensitive behavior, or user-facing behavior.

Required verification:

- focused checks for touched surface
- `just turn-test`
- any domain-specific checks named by the consuming repository or playbook

## Output

Record the chosen class in working notes or final response with:

- playbooks followed
- required verification gates
- skipped gates justified by class
- whether review was requested or skipped
- any escalation decision
