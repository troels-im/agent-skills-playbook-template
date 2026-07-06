# Playbooks Index

Reusable workflows for AI coding agents.

## Read Order

1. Load root `index.md`.
2. Load this index.
3. Load the nearest domain index.
4. Load the smallest matching playbook.
5. Load only references named by that playbook.

## Documentation

Start at `documentation/index.md`.

- `documentation/document-generate.md`: Create or update durable docs from
  verified repository context.

## Engineering

Start at `engineering/index.md`.

- `engineering/debug-bug.md`: Diagnose and fix a bug with a
  reproduce-minimize-fix loop.
- `engineering/code-organization.md`: Organize code by domain, subdomain,
  vertical slices, and stable seams.
- `engineering/design-codebase.md`: Improve module, interface, and seam design.
- `engineering/model-domain.md`: Build shared domain language and decision
  records.
- `engineering/prototype.md`: Build a disposable prototype to answer a focused
  question.
- `engineering/research.md`: Research a question using high-trust sources and
  checked-in findings.
- `engineering/test-drive-change.md`: Use a red-green-refactor loop for
  trace-linked changes.

## Design

Start at `design/index.md`.

- `design/taste-calibration.md`: Establish the design read, aesthetic
  direction, design-system choice, and anti-default guardrails before UI work.
- `design/ui-taste-review.md`: Review UI for taste, clarity, states,
  accessibility, motion, content quality, and common AI-design defaults.

## Knowledge

Start at `knowledge/index.md`.

- `knowledge/continue-work-discovery.md`: Delegate resume discovery before
  continuing ticket, product, milestone, or trace work.
- `knowledge/context-restore.md`: Restore saved work context before continuing.
- `knowledge/context-save.md`: Save current work context for handoff or resume.
- `knowledge/learn.md`: Capture reusable project lessons without bloating root
  instructions.

## Planning

Start at `planning/index.md`.

- `planning/interview-requirements.md`: Interview the user until the
  requirement tree is clear enough to plan.
- `planning/plan-epics-milestones.md`: Group product tickets into epics and
  human-reviewable milestones.
- `planning/split-into-tickets.md`: Split a PRD, spec, or plan into GitHub,
  GitLab, Linear, or local repository tickets.
- `planning/spec.md`: Turn vague intent into an executable, testable spec.
- `planning/user-flow-mapping.md`: Capture end-to-end user and system flows
  that connect one-action stories into complete journeys.
- `planning/user-story-slicing.md`: Keep user stories to one user action and
  at most five Fibonacci story points.
- `planning/verify-assumptions.md`: Write assumptions to a trace file and
  review them with the user before story, PRD, spec, acceptance, or ticket
  work.
- `planning/write-adr.md`: Create a checked-in architecture decision record
  linked to requirements and tasks.
- `planning/write-prd.md`: Create a checked-in product requirements document
  linked to trace artifacts.

## Quality

Start at `quality/index.md`.

- `quality/health.md`: Run a language-neutral repository health pass.
- `quality/qa-only.md`: Perform report-only QA without fixing.
- `quality/qa.md`: QA and fix issues within accepted scope.

## Repository

Start at `repository/index.md`.

- `repository/agent-skill-authoring.md`: Create small SKILL.md entrypoints that
  route into progressive docs and playbooks.
- `repository/choose-workflow.md`: Route a user request to the smallest
  matching playbook or trace workflow.
- `repository/evaluation-playbook.md`: Design evidence-rich product or workflow
  evaluations.
- `repository/five-counsel-consultation.md`: Use five subagent lenses to
  generate questions, user transformations, user stories, and one concrete next
  step.
- `repository/implementation-playbook.md`: Move from idea to prototype to
  production work without assuming a stack.
- `repository/incident-retrospective.md`: Write evidence-based retrospectives.
- `repository/no-matching-playbook.md`: Work safely when no existing playbook
  matches.
- `repository/plan-issue.md`: Plan one small issue with checked-in trace
  artifacts.
- `repository/playbook-specification.md`: Define playbook metadata, indexing,
  progressive loading, and lifecycle rules.
- `repository/post-task-playbook-retrospective.md`: Feed task lessons back into
  the playbook system.
- `repository/prescribed-subagent-failure.md`: Stop a flow when a required
  subagent workflow cannot run and queue a retrospective.
- `repository/repository-policy-change.md`: Add or change repository policies.
- `repository/red-blue-judge-review.md`: Run a general subagent red-team,
  blue-team, judge review for artifacts, plans, stories, specs, PRDs, code, or
  QA results.
- `repository/review-turn.md`: Run a subagent red-team, blue-team, judge review
  against explicit acceptance criteria.
- `repository/setup-agent-playbooks.md`: Configure tracker, trace, docs, and
  review conventions for a consuming repository.
- `repository/task-risk-classification.md`: Choose verification depth.
- `repository/writing-playbooks-from-sessions.md`: Extract reusable playbooks
  from completed sessions.

## Safety

Start at `safety/index.md`.

- `safety/careful.md`: Extra care for destructive or broad file operations.
