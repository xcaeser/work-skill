# Plan

Turn a task into a detailed, implementation-ready plan. This is a read-only analysis mode for source files.

## Fixed model and role

- Always launch one `gpt-5.6-sol` agent at `high` effort with `fork_turns: none`.
- The analyst is read-only: it may inspect files and run non-mutating checks, but must not edit, spawn, delegate, commit, or deploy.
- Give the analyst a fun call sign, exact ownership, and a complete executor brief before launch.
- Require the analyst to register the exact goal before inspection and complete it only after its evidence is collected.

## Analysis

1. Define one concrete mission from the user's task.
2. Inspect only the relevant workspace, instructions, current state, and existing constraints.
3. Resolve decisions that evidence can settle; identify assumptions that need user input.
4. Design the fewest non-overlapping Luna Max execution units, with exact paths, symbols, ownership, order, and dependencies.
5. Specify behavior boundaries, package choices when relevant, and validation that proves the whole result.
6. Verify the analyst's evidence in the parent. Never treat its confidence as proof.

## Required handoff

Return a detailed plan addressed to a future `gpt-5.6-luna`, `max` effort execution. Include:

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

The parent orchestrator owns the final decision and any edits. Do not launch Luna Max from `plan`; hand off the plan for a later execution choice.
