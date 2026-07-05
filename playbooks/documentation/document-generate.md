---
title: Generate Documentation
domain: documentation
summary: Create or update durable docs from verified repository context.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Generate Documentation

Use this playbook when asked to write, update, or explain durable
documentation.

## Workflow

1. Identify audience and purpose.
2. Read relevant indexes and source files before drafting.
3. Decide whether the doc is:
   - tutorial
   - how-to
   - reference
   - explanation
4. Draft concise documentation with examples grounded in the repository.
5. Keep agent workflow instructions in `playbooks/`, not human docs.
6. Run focused checks and `just turn-test` when repository files change.

## Quality Bar

Good documentation:

- states who it is for
- avoids unsupported claims
- points to current files or commands
- separates how-to steps from conceptual explanation
- stays close to the code or workflow it describes
