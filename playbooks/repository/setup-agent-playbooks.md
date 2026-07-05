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
5. Capture the architecture profile:
   - domains and known subdomains
   - preferred vertical slice layout
   - backend conventions for domain, services/use cases, interfaces or traits,
     repositories/adapters, API, views, and transport
   - frontend conventions for features/domains, routes/views, components,
     state/hooks, API clients, schemas, and adapters
   - where interfaces, traits, ports, repositories, and services are expected
     or discouraged
6. Confirm whether subagents are available for `review-turn` and flow reviews.
7. Remove playbooks that do not apply.
8. Add stack-specific checks behind `just turn-test` only after the project chooses
   them.

## Output

- tracker provider configuration
- trace layout decision
- architecture profile and code organization conventions
- review-turn subagent availability note
- updated indexes and policies

## Verification

- Run `just turn-test`.
