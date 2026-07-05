# Agent Skills Playbook Template

A progressive docs-as-code template for AI coding agents.

This repository shows how to combine `AGENTS.md`, `CLAUDE.md`, small context
indexes, repository playbooks, work traces, and policy checks so coding agents
can discover the right workflow without loading a pile of irrelevant context.

## What This Template Gives You

- `AGENTS.md` as the agent-facing operating contract.
- `CLAUDE.md` that points Claude Code back to `AGENTS.md`.
- Progressive `index.md` files that route agents through the repo.
- A tiny `.agents/skills/playbook-system/SKILL.md` discovery hook for agents
  that support Agent Skills.
- A tiny `.agents/skills/lets/SKILL.md` discovery hook for long-running
  development flows.
- `flows/` loops for creating products, prototypes, bug fixes, research-backed
  decisions, documentation, and codebase improvements.
- Playbooks for planning, reviews, retrospectives, traceable issue work,
  context save/restore, safety, documentation, and quality.
- `work-trace/{issue-id}/` conventions for checked-in planning artifacts.
- Language-neutral turn checks run through `just turn-test`.
- PR traceability checks run through `just pr-test`.

## Search Terms

This project is designed for people looking for:

- agent skills template
- AI agent skills
- SKILL.md workflows
- AGENTS.md template
- AI coding agent playbooks
- progressive disclosure for agents
- docs-as-code for AI agents
- context engineering repository template
- AI development workflow template
- agentic development flows

## Quick Start

1. Copy this template into a repository.
2. Edit `index.md` and `AGENTS.md` to describe the real project.
3. Keep only the playbooks that apply.
4. Preserve the `just turn-test` and `just pr-test` entrypoints.
5. Add project-specific checks behind `just turn-test` or `just pr-test`
   without assuming they exist in the template itself.

## Verification

Run:

```sh
just turn-test
just pr-test
```

The template assumes `just` is available. It does not assume any other language,
runtime, build system, or package manager. `just test` remains as a
compatibility alias for `just turn-test`.
