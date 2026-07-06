---
title: Continue Work
summary: Resume ticket, milestone, product, or trace work after delegated discovery.
created: 2026-07-06
last_updated: 2026-07-06
---

# Continue Work

Use for `/lets continue-work {ticket, trace, product, milestone, branch, or description}`.

## Loop

Pre-execute:

1. [ ] Loop setup - create or update a run checklist from
   `flows/_template.md`.
2. [ ] Read `AGENTS.md`, root `index.md`, and `flows/index.md`.
3. [ ] Spawn a subagent to run
   `playbooks/knowledge/continue-work-discovery.md` against the user's resume
   target. The main agent must not skip this delegated discovery step.
4. [ ] If the host cannot run the prescribed subagent, stop immediately and use
   `playbooks/repository/prescribed-subagent-failure.md`.
5. [ ] Wait for the subagent continuation report. The report must identify the
   ticket, product, milestone, or trace; relevant artifacts; current state;
   required playbooks; blockers; and recommended next action.
6. [ ] Main agent spot-checks the report against the referenced files before
   acting. Do not blindly trust stale or ambiguous resume context.
7. [ ] If the report identifies multiple plausible targets or a missing human
   gate, pause for user input before continuing.
8. [ ] Store the continuation report in
   `work-trace/{trace-id}/context/CONTINUE-YYYYMMDDTHHMMSSZ-short-slug.md`.
   If no trace is identified yet, store it under `work-queue/context/` and
   move it into the trace once the trace exists.
9. [ ] Update `trace.yaml` and the affected tracker ticket or local ticket with
   the continuation report reference.

Continue:

1. [ ] Load the flow or playbook stack named by the continuation report.
2. [ ] Resume at the smallest safe unit:
   - current milestone when product work is inside a milestone gate
   - current ticket when ticket work is already scoped
   - current task when a checked-in task is clearly active
   - assumption or user-input gate when the trace says the work is blocked
3. [ ] Update the run checklist with current phase, milestone, ticket, task,
   selected playbooks, and verification expectations.
4. [ ] Execute only the next action supported by the trace and user request.
5. [ ] Keep tracker tickets current as artifacts are created or changed.
6. [ ] Run `just turn-test` before every commit.
7. [ ] Commit completed coherent slices with trace trailers.

Finish:

1. [ ] Run the finish or QA steps from the resumed flow.
2. [ ] Run `just pr-test` before final handoff when the resumed work reaches a
   PR or flow-completion boundary.
3. [ ] Summarize what was resumed, what changed, what remains blocked, and
   which trace artifacts were updated.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
