---
title: Write PRD
domain: planning
summary: Create a checked-in product requirements document linked to trace artifacts.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Write PRD

Use this playbook when a product or workflow change needs a checked-in product
requirements document.

## Goal

Create a PRD that can be traced to tickets, requirements, acceptance criteria,
tasks, reviews, and implementation commits.

## Workflow

1. Confirm or create the work trace.
2. Load relevant context and prior decisions.
3. Draft `work-trace/{trace-id}/prd.md`.
4. Include:
   - problem
   - users or stakeholders
   - goals
   - non-goals
   - requirements
   - acceptance criteria
   - risks
   - rollout or verification notes
5. Link the PRD from `trace.yaml`.
6. Split execution work with `split-into-tickets` when the PRD is too large for
   one ticket.

## Verification

- PRD exists in the work trace.
- Requirements and acceptance criteria have stable IDs or explicit deferrals.
- `just test` passes when repository files change.
