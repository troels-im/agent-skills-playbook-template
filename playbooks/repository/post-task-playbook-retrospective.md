---
title: Post-Task Playbook Retrospective
domain: repository
summary: Feed task lessons back into playbooks at the right depth.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Post-Task Playbook Retrospective

Use this playbook at the end of a task after implementation and verification.

## Goal

Turn completed work into a small feedback loop for the playbook system without
turning every task into a documentation project.

The retrospective should answer:

- which playbooks were used
- whether their metadata should change
- whether the task revealed a reusable workflow
- whether an existing playbook should be updated
- whether a new playbook is justified

## Depth By Risk Class

- Class 0: no retrospective file; mention useful playbook notes inline.
- Class 1: inline note is usually enough unless the task itself creates durable
  workflow knowledge.
- Class 2: update affected playbooks or policies when evidence supports it.
- Class 3: write a durable retrospective when production or high-risk lessons
  should affect future work.

## Workflow

1. Capture task summary, risk class, playbooks used, files changed, and
   verification results.
2. Identify surprises, blockers, missing instructions, or reusable decisions.
3. Decide whether to update an existing playbook, create a new playbook, or do
   nothing.
4. If playbooks changed, run `just turn-test`.
5. Report updates made or explicitly skipped.

## Anti-Patterns

Avoid:

- updating playbooks from speculation
- accepting every suggestion without judgment
- creating a playbook before the reusable pattern is clear
- recursively running a retrospective for the retrospective itself
