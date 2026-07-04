---
title: Split Into Tickets
domain: planning
summary: Split a PRD, spec, or plan into externally tracked tickets.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
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
2. Identify vertical slices with independent value and verification.
3. For each ticket, include:
   - source trace id
   - requirements and acceptance criteria
   - dependencies
   - out-of-scope notes
   - verification expectation
4. Create or update external tracker tickets using the configured provider.
5. Record provider ids in `trace.yaml`.
6. Create local tasks only after ticket boundaries are accepted.

## Verification

- Every created ticket links back to the checked-in trace.
- Every requirement is mapped to a ticket or explicit deferral.
- `just test` passes when repository files change.
