# Audit

Run an evidence-first, read-only audit and return a detailed fix plan for a future Luna Max execution.

## Fixed model and role

- Always launch one `gpt-5.6-sol` agent at `high` effort with `fork_turns: none`.
- The auditor never edits source files, applies fixes, commits, deploys, or spawns another agent.
- Give the auditor a fun call sign, exact read-only ownership, source of truth, risk axes, and exclusions before launch.
- Require the auditor to register the exact goal before inspection and complete it only after its checks pass.

## Audit method

1. Resolve the exact target: working tree, commit, branch comparison, artifact, runtime flow, or named files.
2. Identify the source of truth and the risks that matter: correctness, regressions, security, data loss, accessibility, performance, or missing validation.
3. Inspect independently and collect concrete evidence, reproductions, and exact locations.
4. Reject style preferences, unsupported suspicion, and findings without a material impact.
5. Verify surviving findings in the parent; an auditor handoff is not proof by itself.

## Required handoff

Return findings ordered by severity, followed by a detailed Luna Max fix plan:

```markdown
## Audit

**Scope:** <target>
**Source of truth:** <request, plan, spec, tests, or behavior>

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

If no findings survive verification, say so directly and list the scope, checks, and remaining gaps. The parent orchestrator owns any later edits; this command never edits and does not launch Luna Max itself.
