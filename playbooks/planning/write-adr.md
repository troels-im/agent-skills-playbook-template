---
title: Write ADR
domain: planning
summary: Create a checked-in architecture decision record linked to requirements and tasks.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Write ADR

Use this playbook when an architectural, workflow, policy, or tooling decision
should be durable and traceable.

## Goal

Record the decision, alternatives, consequences, and trace links before the
choice disappears into implementation.

## Workflow

1. Confirm the decision is worth an ADR.
2. Create `work-trace/{trace-id}/adrs/ADR-###-short-title.md`.
3. Record:
   - status
   - context
   - decision
   - alternatives considered
   - consequences
   - related requirements, tasks, and tickets
4. Link the ADR from `trace.yaml`.
5. Update affected requirements or tasks with the ADR id.

## Verification

- ADR is checked in.
- ADR links to at least one requirement, task, or ticket.
- `just turn-test` passes when repository files change.
