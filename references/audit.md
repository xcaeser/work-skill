# Audit

Run an independent, evidence-first audit of existing work. Do not edit source files or implement fixes.

## 1. Define the audit contract

1. Resolve the exact target: working tree, commit, branch comparison, artifact, runtime flow, or named files.
2. Identify the source of truth: user request, brief, acceptance criteria, tests, specification, or established behavior.
3. State risk axes that matter, such as correctness, regressions, security, data loss, accessibility, performance, or missing validation.
4. State what does not count as a finding: style preference, unsupported suspicion, duplicate wording, or a claim without a concrete impact.

## 2. Register and staff the audit

Inspect the root goal. Reuse it only when it matches or contains the audit; otherwise create the exact audit goal when no unfinished goal exists. Stop on an unrelated active-goal conflict. Never set a token budget unless the user supplied one.

Launch one `gpt-5.6-sol` low-reasoning auditor by default with `fork_turns: none`. Use two or three only when the target has independent risk axes that materially benefit from separate review and live capacity permits it.

Before launch, inspect live agents with `list_agents` when available and do not exceed confirmed capacity. Use `spawn_agent` with a tool-safe task ID, `model: gpt-5.6-sol`, `reasoning_effort: low`, and `fork_turns: none`. If that exact contract is unsupported, stop and state the mismatch. Never use a user-owned task as a subagent substitute.

Every auditor must:

- receive a fun call sign, tool-safe task ID, exact scope, source of truth, exclusions, and evidence format
- register its exact goal before inspection and complete it only after its checks pass
- remain read-only toward source files
- inspect independently without seeing other auditors' conclusions during its first pass
- return only actionable findings with severity, impact, evidence, reproduction or failure path, and precise file or artifact references
- state the scope checked and tests run when it finds nothing
- keep the handoff under 250 words unless exact reproduction evidence requires more

After successful launches and before waiting, post:

```text
Launched N auditors:
- <call sign> (`<task_id>`) — auditing <scope>; Goal: <goal>; Model: gpt-5.6-sol, low
```

Never claim a launch before it succeeds. Wait with `wait_agent` or the live equivalent in bounded intervals, and use `send_message`, `followup_task`, or `interrupt_agent` only for concrete steering, correction, or safety needs.

## 3. Challenge and synthesize

1. Verify candidate findings against the actual source or runtime; an auditor summary is not proof.
2. Deduplicate by root cause, not wording.
3. Reject findings that cannot explain a concrete failure or material risk.
4. If a serious claim is uncertain, send one bounded reproduction request to a different auditor after its independent first pass.
5. Do not keep assigning agents to the same blocked theory unless new evidence or a materially different test exists.
6. Complete the root goal only after the requested audit scope is covered.

## Output

Lead with findings ordered by severity. For each finding include the impact, evidence, exact location, and smallest credible reproduction. Then list scope, validation performed, and residual uncertainty.

If no findings survive verification, say so directly and name the audited scope and remaining test gaps. Do not fix anything unless the user separately invokes `$work boss`.
