# Plan

Turn a task into a clear execution plan without launching agents or changing files.

## Method

1. Inspect only the context needed to understand the current state.
2. State one concrete mission in result-first language.
3. Separate **Done when** from **Does not count** so plausible partial work cannot masquerade as completion.
4. Resolve product, architecture, and design choices that can be decided from evidence.
5. Identify assumptions. Ask the user only when one unresolved choice would materially change the result.
6. Design the fewest non-overlapping execution units and their dependency order.
7. Give each proposed agent a fun call sign, plain-language assignment, exact ownership, and one-sentence goal.
8. Specify validation that proves the whole result, not merely each local edit.

## Output

Return:

```markdown
## Work plan

**Mission:** <one concrete outcome>

**Done when**
- <observable criterion>

**Does not count**
- <tempting partial result to reject>

**Decisions and constraints**
- <decision or boundary>

**Agents**
- <call sign> — working on <assignment>; Goal: <goal>; Ownership: <scope>

**Order**
1. <dependency-aware launch order>

**Validation**
- <check and required evidence>

**Risks or material unknowns**
- <item, or "None">

**Ready:** Yes | No — <reason>
```

Keep the plan proportional to the task and normally under 700 words. Do not create a goal, update the live task plan, spawn or steer agents, edit files, run destructive commands, or imply that proposed agents have launched.
