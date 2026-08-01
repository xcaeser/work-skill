---
name: work-clean
description: Read-only code-simplification analysis that always uses one gpt-5.6-sol high analyst and returns a detailed Luna Max cleanup plan. Use when the user asks to clean code, remove smells, reduce overengineering, refactor helpers, or assess package choices.
---

# Work / Clean

Find defensible simplifications without letting an agent edit. The parent orchestrator owns the final decision and is the sole writer if cleanup is approved.

## Fixed route

- Launch exactly one `gpt-5.6-sol` subagent at `high` effort with `fork_turns: none`.
- Give it a fun call sign, exact scope, behavior boundaries, package constraints, and validation requirements.
- Require it to register the exact goal before inspection and complete it only after its checks pass.
- The analyst must not edit, commit, deploy, spawn, or delegate.
- Report the successful launch as a compact table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model`.

## Analysis

1. Prefer an explicit path, subsystem, feature, or diff; otherwise use the smallest scope clearly implied by the request.
2. Inspect instructions, status, relevant diffs, consumers, registrations, generated outputs, and tests.
3. Identify dead code, needless indirection, duplicate behavior, speculative abstractions, and unclear boundaries.
4. Keep helpers that communicate intent, isolate side effects, improve testing, or have genuine reuse.
5. Consider packages in this order: standard library/platform, an existing project dependency, a mature external package, then focused local code. Record chosen and rejected options with reasons.
6. Do not propose behavior, API, persistence, security, UX, test, or type weakening without explicit authorization.

## Handoff

Return a detailed plan addressed to `gpt-5.6-luna` at `max` effort:

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

The parent orchestrator verifies the plan and is the only permitted writer. Do not launch Luna Max or edit files from this skill. For execution, hand the verified plan to `work`.
