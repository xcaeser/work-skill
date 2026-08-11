---
name: work-clean
description: Read-only code-simplification analysis that always uses one gpt-5.6-sol xhigh analyst and returns a self-contained cleanup plan suitable for a lower-capability execution model. Use when the user asks to clean code, remove smells, reduce overengineering, refactor helpers, or assess package choices.
---

# Work / 8. Clean

Find defensible simplifications without editing. The Sol xhigh analyst remains read-only; the parent owns every cleanup decision and any later execution route.

Read [../QUALITY.md](../QUALITY.md) first. Apply its quality bar, remove obsolete paths instead of preserving compatibility, keep user data safe, and require evidence for every deletion or abstraction change.

## Fixed route

- If the exact subagent model, effort, or goal tools are unavailable, return `blocked` with the missing capability. Do not substitute a model or perform the cleanup analysis in the parent.
- Launch exactly one `gpt-5.6-sol` subagent at `xhigh` effort with `fork_turns: none`.
- Give it a fun call sign, the exact task statement, exact scope, source of truth, behavior boundaries, package constraints, acceptance checks, and validation requirements.
- Require independent analysis and concrete evidence for every proposed deletion or shared component; do not accept a status report, speculative smell, or “routine” migration.
- Require it to call `create_goal` with the exact cleanup-analysis goal before inspection and `update_goal complete` only after the required checks pass.
- Let the analyst run until it returns the cleanup plan, a real blocker, or a user-input request. Do not cancel it because a polling window or arbitrary wall-clock interval elapsed; a wait timeout is not a failure.
- The analyst must not edit, commit, deploy, spawn, or delegate.
- Scale depth to the scope. Inspect only relevant paths, direct consumers, and evidence needed to prove each simplification; return the plan without process narration and stop when every candidate has a supported disposition.
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

Require every cleanup candidate to remove a real cost: a duplicate behavior,
branch, dependency, concept, indirection, or unclear ownership boundary. Do not
extract a shared component until multiple consumers share a stable behavior,
not merely similar markup or coincidental syntax.

## Handoff

Return a detailed, executor-agnostic cleanup plan:

```markdown
## Work / 8. Clean

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

### Cleanup map
| Step | File / symbol | Exact transformation | Cost removed | Invariant |
|---|---|---|---|---|
| 1 | <path and symbol> | <implementation-complete change> | <branch, concept, dependency, duplication, or indirection> | <behavior that must remain true> |

**Executor assignments:** <call sign, assignment, goal, and ownership, or "One executor">
**Done when:** <observable criteria>
**Does not count:** <format-only churn, hidden complexity, behavior changes, or unproven deletions>
**Packages considered:** <chosen/rejected package and one reason each, when relevant>

| Validation command or flow | Expected evidence | Proves |
|---|---|---|
| <exact check> | <expected result or artifact> | <preserved behavior or reduced cost> |

**Testing**
- **Behavior being protected:** <observed behavior or "No test change justified">
- **Why it matters:** <user or system consequence>
- **Test level:** <unit, integration, or end-to-end, or "None">
- **Exact observable assertion:** <assertion, or "None">
- **Tests deliberately not added or removed:** <scope and reason>
```

Assume the plan may be executed by a lower-capability model with no hidden context. Spell out exact files and symbols, ordered transformations, behavior to preserve, obsolete paths to remove, package decisions, validation commands, expected evidence, and choices the executor must not reinterpret. The parent verifies the plan before approving any execution route. A smaller diff is not automatically a better result: reject cleanups that only move complexity, weaken behavior, or preserve obsolete paths through a new wrapper. If the route is blocked, state the exact gap and require a materially new mechanism before another round. Do not launch an executor or edit files from this skill. For execution, hand the verified plan to `$work`.
