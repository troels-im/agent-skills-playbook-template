---
title: Split Into Tickets
domain: planning
summary: Split a PRD, spec, or plan into externally tracked tickets.
created: 2026-07-04
last_used: null
last_updated: 2026-07-05
---

# Split Into Tickets

Use this playbook when a PRD, spec, or plan needs to become GitHub, GitLab,
Linear, or local tickets.

## Vocabulary

- Ticket: external tracker-facing unit of work.
- Task: checked-in local implementation chunk inside a work trace.

## Goal

Create small, independently reviewable tickets that preserve trace links back
to the checked-in plan.

## Workflow

1. Load the source PRD, spec, or work trace.
2. Confirm assumptions that shape ticket boundaries were reviewed or explicitly
   deferred with `playbooks/planning/verify-assumptions.md`.
3. Identify vertical slices with independent value and verification.
4. For each ticket, include:
   - source trace id
   - requirements and acceptance criteria
   - dependencies
   - out-of-scope notes
   - verification expectation
5. Create or update external tracker tickets using the configured provider.
6. Record provider ids in `trace.yaml`.
7. Create local tasks only after ticket boundaries are accepted.

## Verification

- Every created ticket links back to the checked-in trace.
- Assumption review status is clear before ticket boundaries are created.
- Every requirement is mapped to a ticket or explicit deferral.
- `just turn-test` passes when repository files change.
