---
name: work-audit
description: Evidence-first, read-only audits that always use one gpt-5.6-sol high analyst and return a detailed Luna Max fix plan. Use when the user asks to audit code, a diff, a branch, an artifact, or a runtime flow.
---

# Work / Audit

Audit without changing source files. Keep the parent orchestrator accountable for scope, verification, decisions, and any later edits.

## Fixed route

- Launch exactly one `gpt-5.6-sol` subagent at `high` effort with `fork_turns: none`.
- Give it a fun call sign, a complete read-only brief, exact ownership, source of truth, risk axes, exclusions, and validation requirements.
- Require it to register the exact goal before inspection and complete it only after its checks pass.
- The analyst must not edit, commit, deploy, spawn, or delegate.
- Report the successful launch as a compact table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model`.

## Audit

1. Resolve the target: working tree, commit, branch comparison, artifact, runtime flow, or named files.
2. Identify the source of truth and material risk axes: correctness, regressions, security, data loss, accessibility, performance, or missing validation.
3. Inspect independently and collect concrete evidence, exact locations, and the smallest credible reproduction.
4. Reject style preferences, unsupported suspicion, and findings without material impact.
5. Verify the handoff in the parent; an analyst summary is not proof.

## Handoff

Return findings ordered by severity, followed by a detailed execution plan addressed to `gpt-5.6-luna` at `max` effort:

```markdown
## Audit

**Scope:** <target>
**Source of truth:** <request, plan, specification, tests, or behavior>

### Findings
- **[severity] <title>** — impact; evidence; exact location; smallest credible reproduction.

### Luna Max fix plan
**Goal:** <one exact execution goal>
**Ownership:** <disjoint paths or symbols>
**Order:** <dependency-aware steps>
**Done when:** <observable criteria>
**Validation:** <commands and expected evidence>
**Does not count:** <shortcuts to reject>
**Packages considered:** <chosen/rejected package and one reason each, when relevant>
```

If no findings survive verification, say so directly and list the scope, checks, and remaining gaps. Do not launch Luna Max or edit files from this skill. If the user wants implementation, hand the verified plan to `work`.
