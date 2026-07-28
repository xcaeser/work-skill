# Status

Show a read-only snapshot of the current Work run.

1. Call `get_goal` when available.
2. Call `list_agents` when available.
3. Reconcile tool results with the launch roster and handoffs already visible in the current thread.
4. Use established call signs. If only a task ID is available, show it without inventing a new call sign.
5. Summarize only plan state visible in the thread; do not invent unavailable plan data.
6. Do not wait, steer, interrupt, spawn, create or update a goal, change a plan, edit files, or run validation.

Return:

```markdown
## Work status

**Goal:** <objective or "No Work goal in this task">
**State:** <active, complete, blocked, or unavailable>

| Agent | State | Assignment | Last evidence or blocker |
|---|---|---|---|
| <call sign (`task_id`)> | <state> | <assignment> | <concise evidence> |

**Current step:** <visible in-progress step or "Unavailable">
**Next parent action:** <one concrete action or "None">
```

Omit the agent table when no Work agents exist. Distinguish **unavailable** from **none** and **not yet verified** from **failed**.
