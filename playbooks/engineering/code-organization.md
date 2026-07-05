---
title: Code Organization
domain: engineering
summary: Organize code by domain, subdomain, vertical slices, and stable seams.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# Code Organization

Use this playbook when setting up or changing production code structure.

## Goal

Make code easy for humans and agents to navigate from a user story or
requirement to the implementation that delivers it.

## Default Shape

Prefer organizing product code around:

```text
domain/subdomain/.../vertical
```

Use verticals for user-facing outcomes or coherent business capabilities. Keep
technical layers inside the vertical unless the consuming repository has a
stronger existing convention.

## Backend Guidance

For backend code, prefer this conceptual shape when it fits the stack:

- domain model and rules
- application services or use cases
- ports, interfaces, or traits at stable seams
- adapters and repositories for persistence or external systems
- API, controller, view, or transport layer

Use interfaces, traits, or ports for:

- persistence boundaries
- external services
- cross-domain boundaries
- replaceable infrastructure
- test seams that protect user-visible behavior

Avoid interfaces or traits for:

- one-off internal helpers
- speculative future implementations
- code with one implementation and no real boundary
- abstractions that merely rename a concrete type

## Frontend Guidance

For frontend code, prefer this conceptual shape when it fits the stack:

- domains or features
- routes, pages, or views
- components close to the feature that owns them
- hooks, state, commands, or use cases
- API clients and adapters
- schemas, validation, and mapping at boundaries

Keep generic shared UI small. Promote shared components only after a second real
use proves the shape.

## Workflow

1. Load the active PRD, user stories, requirements, and trace.
2. Identify the domain, subdomain, and vertical outcome being changed.
3. Inspect existing project conventions before proposing structure.
4. Place new code in the nearest domain/subdomain/vertical location.
5. Introduce interfaces, traits, ports, repositories, services, views, or API
   boundaries only where they protect a stable seam.
6. Link code references back to requirements in the trace.
7. Record durable architecture choices as ADRs.

## Anti-Patterns

Avoid:

- organizing new product work primarily by technical layer when a vertical
  product slice is clearer
- creating generic shared modules before there are multiple real uses
- hiding domain behavior behind thin pass-through services
- using interfaces or traits to create fake flexibility
- scattering one user story across unrelated folders without trace links
