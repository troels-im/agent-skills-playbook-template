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
2. Identify the domain, subdomain, and vertical outcome involved.
3. Map current modules, interfaces, traits, ports, adapters, services, views,
   APIs, and ownership boundaries.
4. Look for deep modules: simple interface, meaningful behavior behind it.
5. Identify shallow abstractions, duplicated decisions, and hard-to-test seams.
6. Use `code-organization.md` when structure changes affect production code.
7. Propose changes tied to requirements and verification.
8. Record accepted design decisions as ADRs when durable.

## Anti-Patterns

Avoid:

- refactoring without a requirement or design problem
- optimizing aesthetics over behavior
- changing interfaces without trace-linked tests or review
- adding interfaces or traits where no stable seam exists
