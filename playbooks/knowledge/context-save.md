---
title: Context Save
domain: knowledge
summary: Save current work context for handoff or resume.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Context Save

Use this playbook when the user asks to save progress, preserve context, create
a handoff, or pause work that another session may resume.

## Goal

Capture the current state without secrets or stale assumptions.

## Workflow

1. Inspect current repository status.
2. Record the accepted goal and scope.
3. List playbooks used.
4. Summarize files changed, commands run, and verification outcomes.
5. Capture decisions, blockers, open questions, and next actions.
6. Save the context in the location requested by the user, or under
   `work-trace/{issue-id}/context/` when issue-backed.
7. Read the saved context back to verify it is useful.

## Quality Bar

A saved context:

- names exact files, commands, and outcomes
- separates confirmed facts from assumptions
- avoids secrets and raw private data
- gives the next agent enough information to continue without rediscovery
