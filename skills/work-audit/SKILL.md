---
name: work-audit
description: Evidence-first, read-only audits that always use one gpt-5.6-sol xhigh analyst and return a self-contained fix plan suitable for a lower-capability execution model. Use when the user asks to audit code, a diff, a branch, an artifact, or a runtime flow.
---

# Work / 7. Audit

Audit without changing source files. Keep the parent orchestrator accountable for scope, verification, decisions, and any later edits.

Read [../QUALITY.md](../QUALITY.md) first. Apply its quality bar, never preserve backwards compatibility, and treat concrete evidence as the handoff requirement.

## Fixed route

- If the exact subagent model, effort, or goal tools are unavailable, return `blocked` with the missing capability. Do not substitute a model or perform the audit in the parent.
- Launch exactly one `gpt-5.6-sol` subagent at `xhigh` effort with `fork_turns: none`.
- Give it a fun call sign and a complete read-only task packet: exact task statement, ownership, source of truth, risk axes, exclusions, acceptance checks, and validation requirements.
- Keep early hypotheses independent and require concrete locations, reproductions, traces, or commands; reject status reports and unsupported “routine” conclusions.
- Require it to call `create_goal` with the exact audit goal before inspection and `update_goal complete` only after the required checks pass.
- Let the analyst run until it returns findings, a real blocker, or a user-input request. Do not cancel it because a polling window or arbitrary wall-clock interval elapsed; a wait timeout is not a failure.
- The analyst must not edit, commit, deploy, spawn, or delegate.
- Scale depth to the target and risk. Inspect only relevant paths, direct consumers, and evidence needed to verify findings; return the audit without process narration and stop when every material risk axis has a supported disposition.
- Report the successful launch as a compact table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model`.

## Work / 7. Audit

1. Resolve the target: working tree, commit, branch comparison, artifact, runtime flow, or named files.
2. Identify the source of truth and material risk axes: correctness, regressions, security, data loss, accessibility, performance, or missing validation.
3. Before recommending tests, inspect the implementation, existing tests, public APIs, and actual user flows. Add test findings only for observed contracts, real regressions, or meaningful boundaries.
4. Inspect independently and collect concrete evidence, exact locations, and the smallest credible reproduction.
5. Challenge the happy path and the exact contract at the boundaries the task can affect: malformed input, offline or hanging work, retries, partial state, interruption, permissions, upgrades, and recovery.
6. Check the architecture against the simplest complete implementation, modular concerns, existing dependencies and their documentation/types, and long-term decisions rather than stopgaps.
7. Reject style preferences, unsupported suspicion, findings without material impact, and reductions that merely restate the original problem.
8. Verify the handoff in the parent; an analyst summary is not proof. If the route is blocked, record the exact gap and do not keep repeating it without a materially new mechanism.

Calibrate severity by user impact and reach: `critical` for imminent data loss,
security compromise, or systemic outage; `high` for a broken core contract;
`medium` for a bounded but material failure; `low` only for a real, actionable
issue worth fixing. Do not use severity to make a thin audit look substantial.

## Handoff

Return findings ordered by severity, followed by a detailed, executor-agnostic implementation plan:

```markdown
## Audit

**Scope:** <target>
**Source of truth:** <request, plan, specification, tests, or behavior>

### Findings
- **[severity] <title>** — impact; evidence; exact location; smallest credible reproduction.

### Rejected candidates
- <suspected issue and why it did not survive verification, or "None">

### Evidence and gaps
**Evidence:** <commands, traces, fixtures, screenshots, or exact paths>
**Remaining gap:** <exact missing proof, or "None">

### Fix plan
**Goal:** <one exact execution goal>
**Invariants and non-goals:** <behavior to preserve and excluded scope>

| Step | File / symbol | Exact change | Reason / invariant |
|---|---|---|---|
| 1 | <path and symbol> | <implementation-complete instruction> | <why and what must remain true> |

**Ownership:** <one executor or disjoint assignments>
**Done when:** <observable criteria>
**Does not count:** <shortcuts to reject>
**Packages considered:** <chosen/rejected package and one reason each, when relevant>

| Validation command or flow | Expected evidence | Proves |
|---|---|---|
| <exact check> | <expected result or artifact> | <acceptance criterion> |

### Testing plan
**Behavior being protected:** <observed behavior or "No test change justified">
**Why it matters:** <user or system consequence>
**Test level:** <unit, integration, or end-to-end, or "None">
**Exact observable assertion:** <assertion, or "None">
**Tests deliberately not added:** <scope and reason>
```

Assume the plan may be executed by a lower-capability model with no hidden context. Specify exact files and symbols, ordered edits, invariants, failure paths, tests, validation commands, expected evidence, and decisions the executor must not reopen. If no findings survive verification, say so directly and list the scope, checks, and remaining gaps. Do not call a partial result complete. Do not launch an executor or edit files from this skill. If the user wants implementation, hand the verified plan to `work`.
