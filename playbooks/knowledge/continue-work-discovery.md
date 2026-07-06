---
title: Continue Work Discovery
domain: knowledge
summary: Delegate resume discovery before continuing ticket, product, milestone, or trace work.
created: 2026-07-06
last_used: null
last_updated: 2026-07-06
---

# Continue Work Discovery

Use this playbook as the mandatory delegated discovery pass for
`flows/continue-work.md`.

## Prescribed Subagent

This playbook must be run by a subagent. The subagent performs read-only
discovery and returns a report to the main agent. If the host cannot run a
subagent, stop the loop and use
`playbooks/repository/prescribed-subagent-failure.md`.

The subagent must not edit files, commit, push, or change tracker state.

## Goal

Identify exactly where to resume work and which flow or playbooks the main
agent should load next.

## Workflow

1. Interpret the user's resume target: ticket id, trace id, product name,
   milestone, branch, issue URL, local ticket, or natural-language
   description.
2. Inspect repository state with read-only commands such as `git status`,
   `git branch`, `git log`, `rg`, and directory listings.
3. Search tracker files and traces:
   - `tickets/`
   - `work-trace/`
   - `work-queue/`
   - relevant `trace.yaml` files
   - run checklists
   - milestone, epic, PRD, requirement, acceptance, user-flow, task, review,
     ADR, and context artifacts
4. Identify candidate matches and choose the best match with evidence. If more
   than one target is plausible, report the ambiguity instead of guessing.
5. Study `AGENTS.md`, root `index.md`, `flows/index.md`, `playbooks/index.md`,
   and the smallest relevant child indexes.
6. Determine the flow or playbook stack needed to continue. Prefer resuming
   the original flow when the trace names one.
7. Determine current state:
   - completed milestones, tickets, tasks, requirements, and acceptance
     criteria
   - open milestone gates or user-input gates
   - current blockers and risks
   - verification already run and verification that may be stale
8. Return a continuation report to the main agent.

## Continuation Report

The report must include:

- interpreted user target
- selected trace, ticket, product, milestone, or branch
- confidence level and evidence
- candidate matches considered
- relevant artifact paths
- current phase, milestone, ticket, task, and status
- completed work and remaining work
- required flow and playbooks in read order
- user-input gates or human milestone gates that must be respected
- risks, blockers, and stale assumptions
- recommended next action for the main agent
- verification commands expected before commit or handoff

## Quality Bar

- The report is evidence-backed with concrete file paths or tracker refs.
- The report distinguishes facts from inferences.
- The report says when the main agent must pause for user input.
- The report names the smallest safe next action.
- The report is specific enough that the main agent can continue without
  rediscovering the whole repository.
