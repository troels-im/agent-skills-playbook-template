---
title: Prototype
domain: engineering
summary: Build a disposable prototype to answer a focused question.
created: 2026-07-04
last_used: null
last_updated: 2026-07-05
---

# Prototype

Use this playbook when a design, workflow, API, or UI question needs concrete
evidence before production implementation.

## Workflow

1. State the question the prototype must answer.
2. Create the prototype under
   `work-trace/{trace-id}/prototypes/{prototype-slug}/` unless the consuming
   repository has a different checked-in trace convention.
3. Link the prototype from `work-trace/{trace-id}/trace.yaml`.
4. Keep the prototype outside production code.
5. If the prototype has UI, calibrate taste with
   `playbooks/design/taste-calibration.md`.
6. Build the smallest artifact that answers the question.
7. If the prototype has UI, review taste with
   `playbooks/design/ui-taste-review.md`.
8. Record what was learned in the work trace.
9. Decide whether to discard, iterate, or translate into tickets.

## Anti-Patterns

Avoid:

- promoting prototype code without review
- using prototype success as production verification
- answering multiple unrelated questions in one prototype
- placing prototypes in untracked scratch folders when they inform a durable
  ticket, requirement, ADR, or task
