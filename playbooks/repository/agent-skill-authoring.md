---
title: Agent Skill Authoring
domain: repository
summary: Create small SKILL.md entrypoints that route into progressive docs and playbooks.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Agent Skill Authoring

Use this playbook when adding or updating an Agent Skill entrypoint such as
`.agents/skills/{skill-name}/SKILL.md`.

## Goal

Make skill discovery automatic without loading the whole repository into
context. The skill should act as a small router into `AGENTS.md`, indexes,
playbooks, references, scripts, or assets.

## Skill Shape

Each skill folder should contain a required `SKILL.md`:

```text
.agents/skills/{skill-name}/
  SKILL.md
```

`SKILL.md` needs YAML front matter:

- `name`
- `description`

The description is the trigger surface. Make it explicit about when the skill
should be used.

## Workflow

1. Name the skill with lowercase letters, digits, and hyphens.
2. Keep `SKILL.md` concise.
3. Put only essential workflow and routing instructions in `SKILL.md`.
4. Point to playbooks, indexes, scripts, references, or assets for details.
5. Avoid duplicating large instructions already present elsewhere.
6. Run `just turn-test` after adding or changing the skill.

## Quality Bar

A good skill:

- has a specific trigger description
- is short enough to load cheaply
- routes to the smallest next context file
- does not assume a language stack unless the skill is explicitly stack-specific
- keeps durable details in playbooks or references

## Anti-Patterns

Avoid:

- turning `SKILL.md` into a full manual
- hiding important resources without naming when to read them
- using vague descriptions such as "helps with development"
- adding README, changelog, or install docs inside the skill folder unless the
  skill genuinely needs them as resources
