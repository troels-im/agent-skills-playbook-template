# Work Queue

Use this repo-local holding area only before a durable `work-trace/{trace-id}/`
exists.

Allowed uses:

- `flows/run-YYYYMMDDTHHMMSSZ-short-slug.md` for flow run checklists created
  before tracker and trace setup is complete.
- `review-queue/REVIEW-QUEUE-YYYYMMDDTHHMMSSZ-short-slug.md` for required
  retrospectives created before a trace exists.
- `context/CONTINUE-YYYYMMDDTHHMMSSZ-short-slug.md` for continuation discovery
  reports created before the correct trace is known.

Rules:

- Do not put workflow artifacts in `/tmp`.
- Do not use this folder as a substitute for `work-trace/`.
- Move queued files into `work-trace/{trace-id}/runs/`,
  `work-trace/{trace-id}/reviews/`, or `work-trace/{trace-id}/context/` as
  soon as the durable trace exists.
- Keep secrets and raw private data out of queued files.
