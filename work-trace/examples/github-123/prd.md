# PRD: Add Trace Policy Checks

## Problem

Tasks can be marked done without a commit that proves which requirement, code,
and verification closed the task.

## Requirements

- `REQ-001`: task completion commits include trace trailers.

## Acceptance Criteria

- `AC-001`: a commit that marks `TASK-001` validated includes `Trace-Task`,
  `Trace-Req`, `Trace-AC`, and `Trace-Test`.
