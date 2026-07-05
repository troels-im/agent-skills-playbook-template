# Commit Trailers Policy

When a commit marks a task `Done` or `Validated`, or includes any `Trace-*`
trailer, the commit message must use a conventional commit subject and carry
trace trailers.

Required trailers for completion commits:

- `Trace-Task`
- `Trace-Req`
- `Trace-Test`

Recommended trailers:

- `Trace-Ticket`
- `Trace-AC`

Subject format:

```text
type(scope): message
```

The check defaults to the latest commit. Set `TRACE_BASE_REF` to check every
commit after a base ref.
