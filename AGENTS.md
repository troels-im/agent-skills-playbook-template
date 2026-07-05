# AGENTS

This repository is a template for progressive docs-as-code workflows for AI
coding agents. It teaches agents to start from small indexes, load only the
playbook needed for the task, keep traceable planning artifacts, and verify work
through `just turn-test` and `just pr-test`.

## Mandatory Context Loading

1. Read this file first.
2. Read `index.md`.
3. When work enters a folder, read the nearest child `index.md`.
4. For repeated work, read `playbooks/index.md`, then the smallest matching
   playbook.
5. If no playbook matches, follow
   `playbooks/repository/no-matching-playbook.md`.

Do not bulk-load the repository. Indexes are routers; playbooks hold durable
workflow detail.

## Working Rules

- Use `just turn-test` before every commit.
- Use `just pr-test` before PR handoff or final `/lets` flow completion.
- `just test` is a compatibility alias for `just turn-test`.
- Do not assume a programming language, build system, package manager, test
  framework, cloud, database, or deployment platform.
- For production code, prefer domain/subdomain/vertical organization where
  practical, and use interfaces, traits, ports, repositories, services, views,
  or APIs only where they clarify stable seams.
- Keep instructions and examples tool-neutral unless a file is explicitly about
  a named agent surface such as Codex, Claude Code, Copilot, or Cursor.
- Track the exact playbooks actually followed.
- Classify task risk with
  `playbooks/repository/task-risk-classification.md` before choosing
  verification depth.
- Do not run `playbooks/repository/review-turn.md` automatically. When the user
  explicitly asks for a review and clear acceptance criteria exist, run it as a
  three-subagent red team, blue team, and judge workflow whenever the host
  supports subagents. If subagents are unavailable, record that fallback before
  performing a single-agent review.
- Commit a checkpoint after a coherent slice when more than 500 lines have
  changed locally.
- Keep files at or below 1500 lines.
- `TODO` and `FIXME` markers must have an associated ticket and use
  `TODO(ticket_id): description` or `FIXME(ticket_id): description`.
- Never store secrets, private keys, tokens, credentials, or raw private
  customer data in playbooks, indexes, traces, or examples.
- Treat generated artifacts, build outputs, dependency folders, coverage
  reports, caches, and local databases as non-source files that should not be
  committed.

## Task Risk Classes

Use the smallest class that fits the accepted scope. Escalate when the blast
radius is unclear.

| Class | Scope | Required Verification |
| --- | --- | --- |
| Class 0 | Conversation, analysis, planning, or read-only inspection with no file changes. | No repository verification. Mention relevant playbooks when useful. |
| Class 1 | Docs, indexes, playbooks, trace files, or markdown metadata only. | Run focused checks, then `just turn-test` before commit when practical. |
| Class 2 | Repository governance, policies, AGENTS or CLAUDE instructions, scripts, CI, or shared workflow tooling. | Run focused checks and `just turn-test` before commit. |
| Class 3 | Consumer project production code, release behavior, security-sensitive workflow, migrations, dependencies, or user-facing behavior. | Run focused checks, `just turn-test` before commit, `just pr-test` before PR handoff, and any domain-specific verification named by the relevant playbook or consuming repo. |

## Repository Layout

- `index.md`: root context map for agents and humans.
- `flows/`: user-facing multi-step development loops.
- `playbooks/`: reusable workflows with progressive loading.
- `policies/`: repository checks run by `just turn-test` and `just pr-test`.
- `work-trace/`: issue-backed planning artifacts for non-trivial work.
- `docs/`: human-facing explanatory documentation.

## Build And Test Workflow

- `just turn-test`: run deterministic checks before every commit.
- `just pr-test`: run turn checks plus PR traceability gates.
- `just test`: compatibility alias for `just turn-test`.
- `just policies`: run `just turn-test`.

If this template is copied into another repository, preserve the `just
turn-test` and `just pr-test` contracts before adding language-specific
commands.
