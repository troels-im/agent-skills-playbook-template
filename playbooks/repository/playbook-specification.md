---
title: Playbook Specification
domain: repository
summary: Define playbook metadata, indexing, progressive loading, and lifecycle rules.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Playbook Specification

Use this playbook when creating, updating, sorting, selecting, or validating
repository playbooks.

## Goal

Keep playbooks easy to find, cheap to load, and continuously improved by the
work they guide.

Every playbook should tell a future agent:

- when to use it
- which domain owns it
- when it was created, last used, and last updated
- which context to load first
- which outputs and checks prove the workflow was followed

## Required Front Matter

Every playbook markdown file under `playbooks/` must begin with YAML front
matter. Navigation files named `index.md` are not playbooks and do not need
playbook metadata.

Required fields:

| Field | Requirement |
| --- | --- |
| `title` | Human-readable playbook title. |
| `domain` | Lowercase domain key, such as `repository`, `planning`, or `quality`. |
| `summary` | One short sentence used by playbook indexes. |
| `created` | ISO date, `YYYY-MM-DD`. |
| `last_used` | ISO date for the last task that followed the playbook, or `null`. |
| `last_updated` | ISO date for the last content or metadata update. |

## Progressive Loading

Playbooks are context routers, not archives.

Load context in this order:

1. Root `index.md`.
2. `playbooks/index.md`.
3. The nearest domain or child `index.md`.
4. The smallest playbook that matches the task.
5. Only references named by that playbook and needed now.

## Lifecycle Rules

At task start:

- classify the task with `task-risk-classification.md`
- select the smallest matching playbook
- use `no-matching-playbook.md` when no playbook fits
- note every playbook actually used

During the task:

- update `last_used` for playbooks actually followed when repository changes
  are made
- leave `last_used` unchanged for read-only inspection
- update `last_updated` when playbook content or metadata changes
- create or update playbooks only when work produced a reusable lesson

At task finish:

- follow `post-task-playbook-retrospective.md` at the depth required by the task
  risk class
- run `just turn-test` when required by the accepted scope
- avoid recursively running another retrospective for the retrospective itself

## Quality Bar

A good playbook is:

- discoverable from the root playbook index
- concise enough to load before doing work
- explicit about inputs, outputs, and verification
- honest about assumptions and optional subagent use
- updated from real task evidence, not speculation

## Anti-Patterns

Avoid:

- playbooks without front matter
- indexes that duplicate full playbook bodies
- loading every playbook before starting
- updating `last_used` for files merely inspected
- creating a new playbook for a one-off task with no repeatable workflow
