# Traceability Model

This template is trace-first: durable planning and decision artifacts should be
checked in, cross-linked, and verifiable through `just turn-test` and
`just pr-test`.

## Vocabulary

- Ticket: external tracker-facing unit of work in GitHub, GitLab, Linear, or a
  local tracker.
- Trace: checked-in repository folder that records durable evidence for one
  ticket or local work item.
- Requirement: stable `REQ-###` statement of expected behavior or constraint.
- Acceptance criterion: stable `AC-###` pass/fail condition.
- Epic: product outcome or domain area that groups related tickets.
- Milestone: ordered human review gate made of one or more tickets.
- Task: stable `TASK-###` local implementation chunk.
- ADR: checked-in architecture decision record.
- Review: checked-in review record, commonly from `review-turn`.
- Prototype: checked-in disposable artifact that answers a focused question
  before production implementation.
- Run: checked-in flow checklist for a long-running `/lets` flow.

## Directory Convention

Use provider-prefixed trace ids:

```text
work-trace/github-123/
work-trace/gitlab-456/
work-trace/linear-ENG-123/
work-trace/local-short-slug/
```

Each trace should follow this shape:

```text
work-trace/{trace-id}/
  trace.yaml
  prd.md
  progress.md
  requirements/
  acceptance/
  epics/
  milestones/
  tasks/
  adrs/
  prototypes/
  runs/
  reviews/
  context/
  specs/
```

## Trace Manifest

`trace.yaml` is the roll-up ledger. It should be concise and machine-checkable.

It records:

- tracker provider and id
- checked-in artifacts
- requirements and acceptance criteria
- epics and milestones
- local tasks
- prototypes
- reviews
- commits
- code references
- test references

Every requirement must map to code through a commit. In practice, each
requirement needs a code reference and a commit entry with a `Trace-Req`
trailer.

Prototypes live under:

```text
work-trace/{trace-id}/prototypes/{prototype-slug}/
```

They are disposable, but not invisible: if a prototype informs a ticket,
requirement, ADR, or task, it should be checked in and linked from
`trace.yaml`.

Flow run checklists live under:

```text
work-trace/{trace-id}/runs/run-YYYYMMDDTHHMMSSZ-short-slug.md
```

Use UTC timestamped slugs for generated run names and local ids that could
collide.

## Bidirectional Links

Given a requirement, you should be able to find:

- the ticket or trace that introduced it
- the epic and milestone that scheduled it
- acceptance criteria
- local tasks
- code paths
- tests or verification commands
- commits

Given code or a commit, you should be able to find:

- the task that justified it
- the ticket, epic, and milestone that scheduled it
- the requirement and acceptance criteria it satisfies
- the ticket or trace that owns the work

Source comments are optional. The manifest is the primary trace surface.

## Commit Trailers

Use readable Conventional Commit subjects and machine-readable trailers:

```text
feat(GH-123): add policy runner

Trace-Ticket: github:owner/repo#123
Trace-Task: TASK-003
Trace-Req: REQ-008
Trace-AC: AC-012
Trace-Test: just turn-test
```

When a task moves to `Done` or `Validated`, the completion commit must include
trace trailers.
