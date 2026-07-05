---
title: Write PRD
domain: planning
summary: Create a checked-in product requirements document linked to trace artifacts.
created: 2026-07-04
last_used: null
last_updated: 2026-07-05
---

# Write PRD

Use this playbook when a product or workflow change needs a checked-in product
requirements document.

## Goal

Create a PRD that can be traced to tickets, requirements, acceptance criteria,
tasks, reviews, and implementation commits.

## Workflow

1. Confirm or create the work trace.
2. Verify assumptions with `playbooks/planning/verify-assumptions.md`.
   Continue only after user review, unless the user explicitly said not to ask,
   not to disturb, to fill gaps, or to proceed with best judgment.
3. Load relevant context and prior decisions.
4. Draft `work-trace/{trace-id}/prd.md`.
5. Include:
   - problem
   - users or stakeholders
   - goals
   - non-goals
   - user transformations
   - user stories
   - requirements
   - acceptance criteria
   - risks
   - rollout or verification notes
6. Link the PRD from `trace.yaml`.
7. Split execution work with `split-into-tickets` when the PRD is too large for
   one ticket.

Every persisted user story must follow `user-story-slicing.md`: one user
action, Fibonacci estimate of 1, 2, 3, or 5, and no story larger than 5 points.
Each story must include screen, entry, success, failure, and not-allowed
details where relevant. The PRD must make clear that actions without user
stories are out of scope.
Every persisted user story must map to at least one acceptance criterion.

## Verification

- PRD exists in the work trace.
- Assumptions file exists and has been reviewed or explicitly deferred before
  PRD drafting.
- Requirements and acceptance criteria have stable IDs or explicit deferrals.
- Persisted user stories are mapped to acceptance criteria.
- Persisted user stories each describe one action and are no larger than 5
  points.
- Persisted user stories cover happy and unhappy paths for touched screens,
  routes, states, and workflows.
- The PRD makes clear what users can and cannot do.
- `just turn-test` passes when repository files change.
