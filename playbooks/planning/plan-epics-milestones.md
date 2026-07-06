---
title: Plan Epics And Milestones
domain: planning
summary: Group product tickets into epics and human-reviewable milestones.
created: 2026-07-06
last_used: null
last_updated: 2026-07-06
---

# Plan Epics And Milestones

Use this playbook as the first phase of ticket planning after PRD creation for
product work, large features, or any effort that needs staged delivery.

## Vocabulary

- Epic: a coherent product outcome or domain area made of related tickets.
- Milestone: an ordered review gate containing tickets that can be verified
  together by a human before the next milestone starts.

## Goal

Turn the PRD, requirements, user stories, and user flows into epics and
milestones that make execution reviewable. Every ticket must belong to an epic
and milestone, unless it is explicitly deferred.

## Workflow

1. Load the PRD, assumptions, user flows, requirements, acceptance criteria,
   prior ADRs, and trace manifest.
2. Group requirements and user stories into epics around user outcomes,
   domain/subdomain boundaries, or operational capabilities.
3. Create milestone boundaries in the order a human should review the product.
   Prefer milestones that produce inspectable behavior, not internal-only
   progress.
4. For each milestone, define:
   - review goal
   - included epics or slices
   - included requirements, acceptance criteria, and user flows
   - expected tickets
   - evidence the human should review
   - explicit exit criteria
5. Add a human review gate to every milestone. The next milestone must not
   start until the user approves, defers, or changes the remaining scope.
6. Write epic files under
   `work-trace/{trace-id}/epics/EPIC-###-short-title.md`.
7. Write milestone files under
   `work-trace/{trace-id}/milestones/MS-###-short-title.md`.
8. Update `trace.yaml` with `artifacts.epics`, `artifacts.milestones`,
   top-level `epics`, top-level `milestones`, and the ticket-to-epic and
   ticket-to-milestone mapping.
9. Update each affected tracker ticket, or local ticket file, with links to
   the relevant PRD, requirements, acceptance criteria, user flows, epic,
   milestone, ADRs, reviews, tasks, and prototypes as those artifacts exist.
10. If a ticket cannot be assigned to a milestone, defer it explicitly and say
    why.

## Verification

- Every non-deferred ticket candidate belongs to exactly one epic and one
  milestone.
- Every requirement is represented in a milestone or explicit deferral.
- Every milestone has a human review gate, review evidence, and exit criteria.
- Every ticket links to its relevant trace artifacts as they are created.
- `trace.yaml` includes epics and milestones under artifacts and top-level
  roll-up sections.
- `just turn-test` passes when repository files change.
