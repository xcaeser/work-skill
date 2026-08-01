---
name: work-plan
description: Turn a task into a detailed, read-only execution plan by always launching one gpt-5.6-sol high analyst and addressing the handoff to gpt-5.6-luna max. Use when the user wants a plan before implementation.
---

# Work / Plan

Produce an implementation-ready plan without changing source files.

## Fixed route

- Launch exactly one `gpt-5.6-sol` subagent at `high` effort with `fork_turns: none`.
- Give it a fun call sign, complete task context, exact read-only ownership, constraints, and validation requirements.
- Require it to register the exact goal before inspection and complete it only after its evidence is collected.
- The analyst must not edit, commit, deploy, spawn, or delegate.
- Report the successful launch as a compact table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model`.

## Required plan

The parent defines the mission, then the analyst inspects only relevant context and resolves evidence-backed decisions. Verify the handoff independently and return:

```markdown
## Work plan

**Mission:** <one concrete outcome>

**Done when**
- <observable criterion>

**Does not count**
- <tempting partial result to reject>

**Decisions and constraints**
- <decision or boundary>

**Luna Max assignments**
- <call sign> — working on <assignment>; Goal: <goal>; Ownership: <scope>

**Order**
1. <dependency-aware execution order>

**Validation**
- <check and required evidence>

**Risks or material unknowns**
- <item, or "None">

**Ready:** Yes | No — <reason>
```

Address the plan to `gpt-5.6-luna` at `max` effort. Do not launch Luna Max or edit files from this skill. For execution, hand the verified plan to `work`.
