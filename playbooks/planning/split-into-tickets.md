---
title: Split Into Tickets
domain: planning
summary: Split a PRD, spec, or plan into GitHub, GitLab, Linear, or local repository tickets.
created: 2026-07-04
last_used: null
last_updated: 2026-07-06
---

# Split Into Tickets

Use this playbook when a PRD, spec, bug, prototype, or plan needs to become
GitHub, GitLab, Linear, or local repository tickets.

## Vocabulary

- Ticket: tracker-facing unit of work. It can live in GitHub, GitLab, Linear,
  or `tickets/` for the local repository tracker.
- Task: checked-in local implementation chunk inside a work trace.

## Goal

Create small, independently reviewable tickets that preserve trace links back
to the checked-in plan. Do not skip ticket creation. If no external tracker is
specified, use the repository-local tracker in `tickets/`.

For product work, tickets must be planned inside epics and milestones before
execution begins. Each milestone is a human review gate.

## Workflow

1. Load the source PRD, spec, or work trace.
2. Confirm assumptions that shape ticket boundaries were reviewed or explicitly
   deferred with `playbooks/planning/verify-assumptions.md`.
3. Select the tracker provider:
   - `github`
   - `gitlab`
   - `linear`
   - `local`
4. If the user did not specify GitHub, GitLab, or Linear, use `local`.
5. Identify vertical slices with independent value and verification.
6. For product or larger work, run
   `playbooks/planning/plan-epics-milestones.md` before finalizing tickets.
   Every non-deferred ticket must have an epic id and milestone id.
7. For each ticket, include:
   - source trace id
   - epic id
   - milestone id
   - requirements and acceptance criteria
   - linked user flows
   - linked artifact paths that already exist
   - dependencies
   - out-of-scope notes
   - verification expectation
8. For external providers, create or update tracker tickets in GitHub, GitLab,
   or Linear.
9. For the local provider, create one file per ticket under `tickets/` using
   `TICKET-YYYYMMDDTHHMMSSZ-short-slug.md`.
10. Record ticket ids, provider refs, local file paths, epic ids, milestone
    ids, and artifact links in `trace.yaml`.
11. Whenever a PRD, requirement, acceptance criterion, user flow, epic,
    milestone, ADR, review, prototype, or task is created or changed, update
    the affected external tracker ticket or local ticket file with the
    relevant reference.
12. Create local implementation tasks only after ticket boundaries are accepted.

## Verification

- Every created ticket links back to the checked-in trace.
- Assumption review status is clear before ticket boundaries are created.
- Every requirement is mapped to a ticket or explicit deferral.
- Every non-deferred product ticket is mapped to an epic and milestone.
- Every ticket has current references to relevant artifacts that exist.
- Local provider tickets exist under `tickets/` and are linked from
  `trace.yaml`.
- `just turn-test` passes when repository files change.
