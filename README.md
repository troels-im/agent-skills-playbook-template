# Agent Skills Playbook Template

A progressive docs-as-code template for AI coding agents: `AGENTS.md`,
playbooks, trace files, and policy checks that make agent work reviewable.

Use this when you want AI-assisted development to behave like an engineering
workflow instead of a pile of prompts. It gives agents a small operating
contract, routing indexes, reusable playbooks, and deterministic checks through
`just turn-test`.

[Use this template](https://github.com/new?template_name=agent-skills-playbook-template&template_owner=troels-im)

This repository shows how to combine `AGENTS.md`, `CLAUDE.md`, small context
indexes, repository playbooks, work traces, and policy checks so coding agents
can discover the right workflow without loading a pile of irrelevant context.

## Five-Command Quick Start

```sh
gh repo create OWNER/REPO --template troels-im/agent-skills-playbook-template --public --clone
cd REPO
$EDITOR index.md AGENTS.md
just turn-test
git commit -am "Adapt agent playbook template"
```

## What This Template Gives You

- `AGENTS.md` as the agent-facing operating contract.
- `CLAUDE.md` that points Claude Code back to `AGENTS.md`.
- Progressive `index.md` files that route agents through the repo.
- A tiny `.agents/skills/playbook-system/SKILL.md` discovery hook for agents
  that support Agent Skills.
- A tiny `.agents/skills/lets/SKILL.md` discovery hook for long-running
  development flows.
- `flows/` loops for creating products, prototypes, continuing work, bug
  fixes, research-backed decisions, documentation, and codebase improvements.
- Playbooks for planning, reviews, retrospectives, traceable ticket work,
  context save/restore, safety, documentation, and quality.
- `work-trace/{issue-id}/` conventions for checked-in planning artifacts.
- `work-queue/` for repo-local pre-trace flow runs and review queue items.
- `tickets/` as the repository-local tracker when GitHub, GitLab, or Linear is
  not configured.
- Reviewed assumption files before user stories, PRDs, acceptance criteria, or
  tickets.
- Language-neutral turn checks run through `just turn-test`.
- Per-language linting and documentation policy hooks that pass when a
  language is not used.
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

## Setup Notes

1. Copy this template into a repository.
2. Edit `index.md` and `AGENTS.md` to describe the real project.
3. Choose a tracker provider. If none is configured, keep `tickets/` as the
   local tracker.
4. Keep only the playbooks that apply.
5. Preserve the `just turn-test` and `just pr-test` entrypoints.
6. Add project-specific checks behind `just turn-test` or `just pr-test`
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

## License

Licensed under MIT. See `LICENSE`.

---

More on the workflow: [start.troels.im?utm_source=gh](https://start.troels.im?utm_source=gh)
