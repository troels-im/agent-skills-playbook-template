# Trace Links Policy

Trace manifests should only reference files that exist.

This policy checks local trace-relative file links such as:

- `file: requirements/REQ-001-example.md`
- artifact list entries under `tickets`, `epics`, `milestones`,
  `requirements`, `acceptance`, `context`, `tasks`, `adrs`, `prototypes`, and
  `reviews`

It also checks repository-root code references under `code_refs`.
