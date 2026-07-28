# Review

Run an independent, evidence-first review of existing work. Do not edit source files or implement fixes.

## 1. Define the review

1. Resolve the exact target: working tree, commit, branch comparison, artifact, runtime flow, or named files.
2. Identify the source of truth: user request, plan, acceptance criteria, tests, specification, or established behavior.
3. State risk axes that matter, such as correctness, regressions, security, data loss, accessibility, performance, or missing validation.
4. State what does not count as a finding: style preference, unsupported suspicion, duplicate wording, or a claim without a concrete impact.

## 2. Set the goal and assign reviewers

Inspect the root goal. Reuse it only when it matches or contains the review; otherwise create the exact review goal when no unfinished goal exists. Stop on an unrelated active-goal conflict. Never set a token budget unless the user supplied one.

Launch one `gpt-5.6-sol` low-reasoning reviewer by default with `fork_turns: none`. Use two or three only when the target has independent risk axes that materially benefit from separate review and live capacity permits it.

Before launch, inspect live agents with `list_agents` when available and do not exceed confirmed capacity. Use `spawn_agent` with a tool-safe task ID, `model: gpt-5.6-sol`, `reasoning_effort: low`, and `fork_turns: none`. If that exact contract is unsupported, stop and state the mismatch. Never use a user-owned task as a subagent substitute.

Every reviewer must:

- receive a fun call sign, tool-safe task ID, exact scope, source of truth, exclusions, and evidence format
- register its exact goal before inspection and complete it only after its checks pass
- remain read-only toward source files
- inspect independently without seeing other reviewers' conclusions during its first pass
- return only actionable findings with severity, impact, evidence, reproduction or failure path, and precise file or artifact references
- state the scope checked and tests run when it finds nothing
- keep the handoff under 250 words unless exact reproduction evidence requires more

After successful launches and before waiting, post this table. Use `reviewer` for one launch and `reviewers` otherwise:

```markdown
Launched N reviewer(s):

| Agent | Working on | Goal | Ownership | Model |
|---|---|---|---|---|
| <call sign> (`<task_id>`) | Review <scope> | <goal> | `<read-only files/scope>` | `gpt-5.6-sol`, low |
```

Never claim a launch before it succeeds. Wait with `wait_agent` or the live equivalent in bounded intervals, and use `send_message`, `followup_task`, or `interrupt_agent` only for concrete steering, correction, or safety needs.

## 3. Challenge and synthesize

1. Verify candidate findings against the actual source or runtime; a reviewer summary is not proof.
2. Deduplicate by root cause, not wording.
3. Reject findings that cannot explain a concrete failure or material risk.
4. If a serious claim is uncertain, send one bounded reproduction request to a different reviewer after its independent first pass.
5. Do not keep assigning agents to the same blocked theory unless new evidence or a materially different test exists.
6. Complete the root goal only after the requested review scope is covered.

## Output

Lead with findings ordered by severity. For each finding include the impact, evidence, exact location, and smallest credible reproduction. Then list scope, validation performed, and residual uncertainty.

If no findings survive verification, say so directly and name the reviewed scope and remaining test gaps. Do not fix anything unless the user separately invokes `$work run`.
