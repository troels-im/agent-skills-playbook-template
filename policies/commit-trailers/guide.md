# Commit Trailers Policy

When a commit marks a task `Done` or `Validated`, the commit message must carry
trace trailers.

Required trailers for completion commits:

- `Trace-Task`
- `Trace-Req`
- `Trace-Test`

Recommended trailers:

- `Trace-Ticket`
- `Trace-AC`

The check defaults to the latest commit. Set `TRACE_BASE_REF` to check every
commit after a base ref.
