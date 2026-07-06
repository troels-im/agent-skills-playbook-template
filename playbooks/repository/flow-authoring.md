---
title: Flow Authoring
domain: repository
summary: Create or update user-facing /lets flows that orchestrate playbooks.
created: 2026-07-06
last_used: 2026-07-06
last_updated: 2026-07-06
---

# Flow Authoring

Use this playbook when creating, updating, renaming, or reviewing a user-facing
flow under `flows/`.

## Goal

Create flows that are easy for users to invoke and cheap for agents to run.
Flows orchestrate playbooks; they should not duplicate the full details that
belong inside playbooks.

## Flow Or Playbook

Create a flow when the work is a long-running user journey with phases,
checklists, gates, progress reporting, tickets, trace artifacts, or repeated
user interaction.

Create or update a playbook instead when the work is a reusable task procedure
that can be called from multiple flows.

## Required Shape

Every flow file under `flows/`, except `flows/index.md`, must have front
matter:

```yaml
---
title: Human Name
summary: One short sentence.
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
---
```

Flow filenames should be short verb phrases, such as `create-product.md`,
`work-on-bug.md`, or `continue-work.md`.

## Workflow

1. Read `AGENTS.md`, root `index.md`, `flows/index.md`,
   `playbooks/index.md`, and the smallest relevant playbooks.
2. Decide whether a new flow is needed. If an existing flow can be extended
   without becoming confusing, update it instead.
3. Name the command using `/lets {verb-phrase}`. Do not use `/goal` or `/loop`.
4. Create the flow from `flows/_template.md`.
5. Keep flow steps high-level and link to playbooks for detailed work.
6. Include these sections when relevant:
   - `Pre-execute`
   - execution loop, such as per ticket or per milestone
   - user input gates
   - subagent requirements
   - QA or finish gates
   - progress rule
7. If a step requires user input, say that the loop must pause unless the user
   explicitly said not to ask, not to disturb, to fill gaps, or to proceed with
   best judgment.
8. If a step prescribes subagents, say that failure to run those subagents must
   stop the loop and use
   `playbooks/repository/prescribed-subagent-failure.md`.
9. Keep flow artifacts inside the repository:
   - run checklists in `work-trace/{trace-id}/runs/`
   - pre-trace run checklists in `work-queue/flows/`
   - continuation reports in `work-trace/{trace-id}/context/`
   - review queue items in `work-trace/{trace-id}/reviews/` or
     `work-queue/review-queue/`
10. Use UTC timestamped slugs for generated run, ticket, and trace names that
    could collide.
11. Update `flows/index.md` with the command and standard-flow description.
12. If the command surface changed, update `.agents/skills/lets/SKILL.md`.
13. If the flow introduces a new reusable procedure, create a playbook for that
    procedure instead of embedding all details in the flow.
14. Run `just turn-test`. Run `just pr-test` before final handoff when the
    change affects policy, routing, or flow completion behavior.

## Quality Bar

- The first screen of the flow tells agents when to use it.
- The flow can be discovered from `flows/index.md`.
- The flow names the playbooks it uses at the step where they are needed.
- The flow has clear pause points for user decisions and human review gates.
- The flow is executable without loading unrelated playbooks.
- The flow keeps durable artifacts in `work-trace/` or `work-queue/`, never
  `/tmp`.
- The flow preserves traceability from tickets to artifacts, requirements,
  reviews, code, commits, and tests when durable work is involved.

## Anti-Patterns

Avoid:

- putting detailed task procedure inside a flow when it belongs in a playbook
- creating a new flow for a one-off command
- adding a `/lets` command without updating `flows/index.md`
- silently degrading prescribed subagent work to single-agent work
- continuing past a required user or milestone gate by guessing
- storing flow run artifacts outside the repository
