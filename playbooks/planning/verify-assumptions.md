---
title: Verify Assumptions
domain: planning
summary: Write assumptions to a trace file and review them with the user before user stories, specs, PRDs, acceptance criteria, or tickets.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# Verify Assumptions

Use this playbook before creating user stories, specs, PRDs, acceptance
criteria, or tickets. Even when the direction seems obvious, write down the
assumptions that would otherwise stay implicit.

## Inputs

- User goal or prompt.
- Interview notes, counsel questions, prior decisions, examples, prototypes, or
  screenshots.
- Active trace id and run checklist.
- Whether the user explicitly allowed the agent not to ask, not to disturb, to
  fill gaps, or to proceed with best judgment.

## Workflow

1. Create an assumptions file in the active trace:
   `work-trace/{trace-id}/assumptions/ASM-YYYYMMDDTHHMMSSZ-short-slug.md`.
2. Use a UTC timestamp and short slug for the filename.
3. Record confirmed facts separately from assumptions.
4. For each assumption, include:
   - stable id, such as `ASM-001`
   - assumption
   - why it matters
   - source or evidence
   - affected scope, story, PRD, or acceptance criteria
   - risk if wrong
   - proposed default only if the user allowed gap filling
   - reversibility
   - status: `Needs review`, `Confirmed`, `Rejected`, or `Deferred by user instruction`
5. Add open questions for assumptions that affect scope, behavior, user
   stories, PRD content, acceptance criteria, or implementation strategy.
6. Link the assumptions file from `trace.yaml` under `artifacts.assumptions`.
7. Pause the loop and review the assumptions with the user.
8. Continue only after the user confirms, corrects, rejects, or explicitly
   defers the assumptions.
9. If the user explicitly said not to ask, not to disturb, to fill gaps, or to
   proceed with best judgment, do not pause. Record that instruction in the
   assumptions file and mark the affected assumptions as
   `Deferred by user instruction`.
10. If an assumption changes after review, update downstream story, PRD, spec,
   ticket, and acceptance-criteria work before proceeding.

## Output

- Assumptions file linked from the active trace.
- Clear review status for every assumption.
- User corrections or explicit deferral recorded.
- A decision on whether story inventory or PRD work may start.

## Verification

- The assumptions file exists before user-story, spec, PRD, acceptance, or
  ticket work begins.
- Facts and assumptions are separated.
- Every product-shaping assumption has a review status.
- The loop paused for user review unless the user explicitly told the agent not
  to ask, not to disturb, to fill gaps, or to proceed with best judgment.
- `just turn-test` passes when repository files change.
