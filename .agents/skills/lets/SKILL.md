---
name: lets
description: Use when a user invokes /lets or asks to start, continue, or inspect a guided development flow such as create-product, create-prototype, work-on-bug, improve-codebase, research-decision, or write-docs in an agent-skills-playbook-template repository.
---

# Lets

Use this skill as the low-token command surface for repository flows.

## Workflow

1. Read `AGENTS.md`.
2. Read root `index.md`.
3. Read `flows/index.md`.
4. Select the smallest matching flow.
5. Load the selected flow file.
6. Create or update the flow run checklist named by that flow.
   Use UTC timestamped slugs for generated run names:
   `run-YYYYMMDDTHHMMSSZ-short-slug.md`.
7. Follow only the playbooks named by the flow and required by the current
   step.
8. Prefix progress updates with the format required by the flow:
   `XX% / YY% / ZZ%: message`.
9. Run `just turn-test` before every commit.
10. At the final step of a flow, run `just pr-test`, fix failing PR tests, and
    repeat until the PR tests pass or a real blocker is recorded.

## Prescribed Subagents

When a selected flow or playbook prescribes subagents, run it with subagents.
If the host cannot run the prescribed subagent workflow, stop the loop
immediately and follow
`playbooks/repository/prescribed-subagent-failure.md`. Do not replace a
prescribed subagent workflow with a sequential self-review unless the user
explicitly approves that degraded fallback after the retrospective is queued.

## User Input Gates

When a flow step needs user input, approval, a product decision, or feedback to
continue correctly, pause the loop and ask. Do not infer missing decisions or
continue on guessed requirements.

Before starting user-story inventory, specs, PRDs, acceptance criteria, or
tickets, write assumptions to an active trace file using
`playbooks/planning/verify-assumptions.md` and pause for user review.

Continue without asking only when the user explicitly says not to disturb them,
not to ask, to proceed with best judgment, or gives an equivalent instruction.
When doing so, record the assumption in the run checklist and keep it reversible
where possible.

If no flow matches, say that clearly and route through
`playbooks/repository/choose-workflow.md`.

Do not treat `/goal` or `/loop` as user commands for this template. Use `/lets`
as the user-facing command and `flows/` as the durable repository layer.
