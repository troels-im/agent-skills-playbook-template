# Subagent Trace Review Policy

PR tests require a subagent review when traced requirements, acceptance
criteria, tasks, or referenced code paths change.

The subagent must check both directions:

- every requirement maps to code through a commit
- every referenced code path maps back to a requirement

The deterministic checks verify manifest structure. The subagent verifies the
semantic claim that the code actually satisfies the linked requirement.

After the subagent review passes, run one of:

```sh
SUBAGENT_TRACE_REVIEW=passed just pr-test
```

or:

```sh
SUBAGENT_TRACE_REVIEW_REPORT=work-trace/{trace-id}/reviews/{review}.md just pr-test
```

Report files must contain:

```text
Subagent: requirement-code-trace
Status: Passed
```
