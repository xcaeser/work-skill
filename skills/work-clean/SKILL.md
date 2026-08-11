---
name: work-clean
description: Read-only code-simplification analysis that always uses one gpt-5.6-sol xhigh analyst and returns a self-contained cleanup plan suitable for a lower-capability execution model. Use when the user asks to clean code, remove smells, reduce overengineering, refactor helpers, or assess package choices.
---

# Work / 8. Clean

Find defensible simplifications without letting an agent edit. The parent orchestrator owns the final decision and is the sole writer if cleanup is approved.

Read [../QUALITY.md](../QUALITY.md) first. Apply its quality bar, remove obsolete paths instead of preserving compatibility, keep user data safe, and require evidence for every deletion or abstraction change.

## Fixed route

- Launch exactly one `gpt-5.6-sol` subagent at `xhigh` effort with `fork_turns: none`.
- Give it a fun call sign, the exact task statement, exact scope, source of truth, behavior boundaries, package constraints, acceptance checks, and validation requirements.
- Require independent analysis and concrete evidence for every proposed deletion or shared component; do not accept a status report, speculative smell, or “routine” migration.
- Require it to register the exact goal before inspection and complete it only after its checks pass.
- Let the analyst run until it returns the cleanup plan, a real blocker, or a user-input request. Do not cancel it because a polling window or arbitrary wall-clock interval elapsed; a wait timeout is not a failure.
- The analyst must not edit, commit, deploy, spawn, or delegate.
- Report the successful launch as a compact table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model`.

## Analysis

1. Prefer an explicit path, subsystem, feature, or diff; otherwise use the smallest scope clearly implied by the request.
2. Inspect instructions, status, relevant diffs, consumers, registrations, generated outputs, existing tests, public APIs, and actual user flows.
3. Identify dead code, needless indirection, duplicate behavior, speculative abstractions, and unclear boundaries.
4. Keep helpers that communicate intent, isolate side effects, improve testing, or have genuine reuse. Simplify the consumer path; do not merely move complexity into a new wrapper or hide it behind a renamed abstraction.
5. Consider packages in this order: standard library/platform, an existing project dependency, a mature and battle-tested external package, then focused local code. Check existing dependency documentation and types before reimplementing functionality or adding a package. Choose a package only when its reliability, maintenance, license, runtime fit, and reduced complexity earn the dependency cost; record chosen and rejected options with reasons.
6. Challenge cleanup candidates against exact behavior, error paths, partial state, retries, interruption, permissions, upgrades, and recovery before recommending removal.
7. Preserve meaningful tests and remove only tests that are demonstrably obsolete, tautological, framework-level, or detached from a real contract. Do not add coverage-only tests.
8. Prefer durable architecture over a stopgap intended to be replaced later. Do not propose behavior, API, persistence, security, UX, test, or type weakening without explicit authorization.

## Handoff

Return a detailed, executor-agnostic cleanup plan:

```markdown
## Clean plan

**Scope:** <paths, symbols, or diff>
**Goal:** <one exact cleanup goal>

**Remove or simplify**
- <smell and concrete transformation>

**Preserve**
- <behavior, API, tests, helpers, or duplication intentionally retained>

**Evidence**
- <exact path, command, trace, or test supporting each change>

**Alternatives rejected**
- <approach and concrete reason, or "None">

**Executor assignments**
- <call sign> — working on <assignment>; Goal: <goal>; Ownership: <scope>

**Order:** <dependency-aware steps>
**Done when:** <observable criteria>
**Validation:** <commands and expected evidence>
**Does not count:** <format-only churn, hidden complexity, behavior changes, or unproven deletions>
**Packages considered:** <chosen/rejected package and one reason each, when relevant>

**Testing**
- **Behavior being protected:** <observed behavior or "No test change justified">
- **Why it matters:** <user or system consequence>
- **Test level:** <unit, integration, or end-to-end, or "None">
- **Exact observable assertion:** <assertion, or "None">
- **Tests deliberately not added or removed:** <scope and reason>
```

Assume the plan may be executed by a lower-capability model with no hidden context. Spell out exact files and symbols, ordered transformations, behavior to preserve, obsolete paths to remove, package decisions, validation commands, expected evidence, and choices the executor must not reinterpret. The parent orchestrator verifies the plan and is the only permitted writer. A smaller diff is not automatically a better result: reject cleanups that only move complexity, weaken behavior, or preserve obsolete paths through a new wrapper. If the route is blocked, state the exact gap and require a materially new mechanism before another round. Do not launch an executor or edit files from this skill. For execution, hand the verified plan to `work`.
