---
name: work-plan
description: Turn a task into a detailed, read-only execution plan by always launching one gpt-5.6-sol xhigh analyst and producing a self-contained handoff suitable for a lower-capability execution model. Use when the user wants a plan before implementation.
---

# Work / 3. Plan

Produce an implementation-ready plan without changing source files.

Read [../QUALITY.md](../QUALITY.md) first. Make the plan protect reliability, restraint, modular boundaries, the simplest complete implementation, human authorship, clean breaks over obsolete compatibility, meaningful tests, and proof over status reports. Prefer existing dependencies and durable architecture over speculative packages or stopgaps.

## Fixed route

- Launch exactly one `gpt-5.6-sol` subagent at `xhigh` effort with `fork_turns: none`.
- Give it a fun call sign, the exact task statement, source of truth, read-only ownership, constraints, acceptance checks, and validation requirements.
- Require it to inspect independently and return concrete evidence, not a status report or a claim that an unproved step is “routine.”
- Require it to register the exact goal before inspection and complete it only after its evidence is collected.
- Let the analyst run until it returns the plan, a real blocker, or a user-input request. Do not cancel it because a polling window or arbitrary wall-clock interval elapsed; a wait timeout is not a failure.
- The analyst must not edit, commit, deploy, spawn, or delegate.
- Report the successful launch as a compact table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model`.

## Required plan

The parent defines the mission, then the analyst inspects only relevant context and resolves evidence-backed decisions. Keep any early alternatives independent; do not let the first elegant reduction become the plan without checking it against the exact task. Verify the handoff independently and return:

For test work, inspect the implementation, existing tests, public APIs, and
actual user flows before proposing a test. Put the four-line test plan before
any test implementation assignment, and name tests deliberately omitted when
no real behavior justifies them.

Confirm that implementation serves a defined user outcome rather than merely
being cheap to generate. If the plan includes prototypes or variants, require
each to answer a named question and include the evidence, selection rule, or
kill criterion that determines what survives.

For qualitative decisions, record the fundamentals, references, context, and
tradeoffs that make the chosen direction appropriate. Do not use preference or
trend-following as the entire rationale.

```markdown
## Work plan

**Mission:** <one concrete outcome>

**Source of truth:** <request, specification, failing behavior, tests, or artifact>

**Done when**
- <observable criterion>

**Does not count**
- <tempting partial result to reject>

**Decisions and constraints**
- <decision or boundary>

**Taste rationale**
- <fundamental, reference, context, and tradeoff, or "Not applicable">

**Evidence**
- <exact path, command, observation, or artifact supporting the decision>

**Alternatives rejected**
- <approach and concrete reason, or "None">

**Executor assignments**
- <call sign> — working on <assignment>; Goal: <goal>; Ownership: <scope>

**Order**
1. <dependency-aware execution order>

**Validation**
- <check and required evidence>

**Testing**
- **Behavior being protected:** <behavior, or "No test change justified">
- **Why it matters:** <user or system consequence>
- **Test level:** <unit, integration, or end-to-end, or "None">
- **Exact observable assertion:** <assertion, or "None">
- **Tests deliberately not added:** <scope and reason>

**Risks or material unknowns**
- <item, or "None">

**Ready:** Yes | No — <reason>
```

Assume the plan may be executed by a lower-capability model with no access to hidden context. Make it self-contained and unusually explicit: name exact files and symbols, ordered edits, existing patterns to follow, invariants to preserve, edge and failure cases, acceptance evidence, and commands with expected results. Resolve judgment-heavy decisions in the plan instead of delegating them to the executor. A plan is not ready when it is only a reduction to an unproved assumption, omits a required acceptance check, or reports progress without evidence. If a route is blocked, state the exact gap and only propose a new round when there is a materially new mechanism. Do not launch an executor or edit files from this skill. For execution, hand the verified plan to `work`.
