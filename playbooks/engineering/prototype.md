---
title: Prototype
domain: engineering
summary: Build a disposable prototype to answer a focused question.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
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
5. Build the smallest artifact that answers the question.
6. Record what was learned in the work trace.
7. Decide whether to discard, iterate, or translate into tickets.

## Anti-Patterns

Avoid:

- promoting prototype code without review
- using prototype success as production verification
- answering multiple unrelated questions in one prototype
- placing prototypes in untracked scratch folders when they inform a durable
  ticket, requirement, ADR, or task
