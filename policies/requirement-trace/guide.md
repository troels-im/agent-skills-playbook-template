# Requirement Trace Policy

Every trace requirement must be mappable to code through a commit.

For each `REQ-###`, `trace.yaml` must provide:

- a `requirements[].code` path
- a matching `code_refs` entry
- a commit entry with a conventional commit `subject`
- a `Trace-Req` trailer for that requirement
- `Trace-Task` and `Trace-Test` trailers on the same commit

Commit subjects use:

```text
type(scope): message
```

Example:

```yaml
commits:
  - hash: abc123
    subject: "feat(github-123): add generated artifact policy"
    trailers:
      Trace-Ticket: github:owner/repo#123
      Trace-Task: TASK-001
      Trace-Req: REQ-001
      Trace-AC: AC-001
      Trace-Test: just turn-test
```
