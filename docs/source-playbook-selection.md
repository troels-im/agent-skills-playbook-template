# Source Playbook Selection

This template adapts the generic parts of two source playbook systems:

- Wonop repository playbooks from `wonop-ng-2`.
- `safe-npx` repository playbooks, especially the checked-in
  `work-trace/{issue-id}/` planning pattern.

## Included

The template keeps playbooks that are broadly useful across repositories:

- progressive playbook specification
- no-matching-playbook fallback
- task risk classification
- issue-backed work traces
- subagent red-team, blue-team, judge review turns based on acceptance criteria
- post-task retrospectives
- playbook writing from sessions
- policy changes
- implementation workflow
- evaluations
- incident retrospectives
- context save and restore
- spec authoring
- QA and health checks
- documentation generation
- destructive-operation safety
- Agent Skill authoring
- Matt-style workflow coverage with clearer names such as
  `interview-requirements` and `split-into-tickets`

## Not Included By Default

Domain-specific playbooks were intentionally left out when they assumed a
particular product, language, framework, deployment system, browser tool, mobile
stack, cloud provider, or company workflow.

Copy those into a consuming repository only after adapting them to that
repository's actual tools and verification gates.
