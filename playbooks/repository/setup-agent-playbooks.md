---
title: Setup Agent Playbooks
domain: repository
summary: Configure tracker, trace, docs, and review conventions for a consuming repository.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Setup Agent Playbooks

Use this playbook when copying this template into a real repository or adapting
it for a team.

## Goal

Make the template concrete for the consuming repository without adding hidden
stack assumptions.

## Workflow

1. Confirm the repository's `just turn-test` entrypoint.
2. Choose tracker provider:
   - GitHub
   - GitLab
   - Linear
   - local
3. Choose trace directory convention, defaulting to provider-prefixed ids such
   as `work-trace/github-123`.
4. Choose where PRDs, ADRs, requirements, tasks, and reviews live.
5. Confirm whether subagents are available for `review-turn`.
6. Remove playbooks that do not apply.
7. Add stack-specific checks behind `just turn-test` only after the project chooses
   them.

## Output

- tracker provider configuration
- trace layout decision
- review-turn subagent availability note
- updated indexes and policies

## Verification

- Run `just turn-test`.
