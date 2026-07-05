---
title: Research Decision
summary: Research a question and turn the conclusion into a decision, spec, or tickets.
created: 2026-07-05
last_updated: 2026-07-05
---

# Research Decision

Use for `/lets research-decision {question}`.

## Loop

Pre-execute:

1. [ ] Loop setup - create a run checklist from `flows/_template.md`.
2. [ ] State the research question.
3. [ ] Research with `playbooks/engineering/research.md`.
4. [ ] Separate evidence, recommendation, and uncertainty.
5. [ ] Record the decision with `playbooks/planning/write-adr.md` when durable.

If the decision creates implementation work:

1. [ ] Write a spec with `playbooks/planning/spec.md`.
2. [ ] Create issues with `playbooks/planning/split-into-tickets.md`.
3. [ ] Execute each issue with `playbooks/repository/implementation-playbook.md`.
4. [ ] Run focused checks and `just turn-test`.
5. [ ] Run `just turn-test`.
6. [ ] Commit with trace trailers.
7. [ ] Run `just pr-test`.
8. [ ] Fix failing PR tests and rerun until passing or blocked.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
