# Clean

Find and remove defensible code smells and overengineering without changing intended behavior. The analysis is always read-only and produces a detailed Luna Max execution plan before any cleanup is applied.

## Fixed model and role

- Always launch one `gpt-5.6-sol` agent at `high` effort with `fork_turns: none`.
- The analyst never edits source files, applies cleanup, commits, deploys, or spawns another agent.
- Give it a fun call sign, exact scope, behavior boundaries, package constraints, and validation requirements before launch.
- Require it to register the exact goal before inspection and complete it only after its checks pass.

## Analysis criteria

1. Prefer an explicit path, subsystem, feature, or diff; otherwise use the smallest scope clearly implied by the thread.
2. Inspect instructions, status, relevant diffs, consumers, registrations, generated outputs, and tests.
3. Identify dead code, needless indirection, duplicate behavior, speculative abstractions, and unclear boundaries.
4. Keep helpers that communicate intent, isolate side effects, improve testing, or have genuine reuse.
5. Consider packages in this order: standard library/platform, an existing project dependency, a mature external package, then focused local code. Record chosen and rejected options with reasons.
6. Do not propose behavior, API, persistence, security, UX, test, or type weakening without explicit authorization.

## Required handoff

Return a detailed Luna Max cleanup plan:

```markdown
## Clean plan

**Scope:** <paths, symbols, or diff>
**Goal:** <one exact cleanup goal>

**Remove or simplify**
- <smell and concrete transformation>

**Preserve**
- <behavior, API, tests, helpers, or duplication intentionally retained>

**Luna Max assignments**
- <call sign> — working on <assignment>; Goal: <goal>; Ownership: <scope>

**Order:** <dependency-aware steps>
**Done when:** <observable criteria>
**Validation:** <commands and expected evidence>
**Does not count:** <format-only churn, hidden complexity, behavior changes, or unproven deletions>
**Packages considered:** <chosen/rejected package and one reason each, when relevant>
```

The parent orchestrator verifies the plan and is the sole writer for cleanup. Do not let the Sol analyst or a Luna agent edit during this command. If the parent does not have clear evidence and authorization, return the plan without changing files.
