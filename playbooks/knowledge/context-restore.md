---
title: Context Restore
domain: knowledge
summary: Restore saved work context before continuing.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Context Restore

Use this playbook when resuming work from a saved context, handoff, trace, or
previous session.

## Goal

Reconstruct enough state to continue safely without assuming the saved context
is still current.

## Workflow

1. Locate the requested saved context or work trace.
2. Read the root `index.md` and nearest relevant child indexes.
3. Compare saved context with current repository state.
4. Identify:
   - goal
   - files changed or expected
   - decisions already made
   - verification already run
   - blockers
   - next actions
5. Ask only when the resume target is ambiguous.
6. Do not modify code as part of restore unless the user asks to continue.

## Quality Bar

A restored context names files, decisions, blockers, next actions, and any
evidence that may have gone stale.
