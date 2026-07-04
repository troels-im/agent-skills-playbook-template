---
title: Design Codebase
domain: engineering
summary: Improve module, interface, and seam design.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Design Codebase

Use this playbook when code structure, module boundaries, interfaces, or seams
need design attention.

## Workflow

1. Identify the behavior and requirements the design must support.
2. Map current modules, interfaces, and ownership boundaries.
3. Look for deep modules: simple interface, meaningful behavior behind it.
4. Identify shallow abstractions, duplicated decisions, and hard-to-test seams.
5. Propose changes tied to requirements and verification.
6. Record accepted design decisions as ADRs when durable.

## Anti-Patterns

Avoid:

- refactoring without a requirement or design problem
- optimizing aesthetics over behavior
- changing interfaces without trace-linked tests or review
