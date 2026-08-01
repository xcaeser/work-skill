---
name: work-status
description: Show a read-only snapshot of the current Work goal, agents, evidence, blockers, current step, and next parent action. Use when the user asks for Work status.
---

# Work / Status

Show only state visible in the current task. Do not steer, interrupt, spawn, create or update goals, change plans, edit files, or run validation. This snapshot need not wait for agents, but a non-blocking status read is never a reason to stop them.

Read [../QUALITY.md](../QUALITY.md) when summarizing the quality bar or a compatibility decision. If parallel work exists, reconcile each route by approach family, evidence, blocker, and next move rather than reporting activity alone.

1. Call `get_goal` when available.
2. Call `list_agents` when available.
3. Reconcile tool results with launch tables and handoffs already visible in the thread.
4. Use established call signs; do not invent one from a task ID.
5. Distinguish unavailable, none, not yet verified, and failed.

Return:

```markdown
## Work status

**Goal:** <objective or "No Work goal in this task">
**State:** <active, complete, blocked, or unavailable>

| Agent | State | Assignment / approach | Last evidence or blocker |
|---|---|---|---|
| <call sign (`task_id`)> | <state> | <assignment> | <concise evidence> |

**Current step:** <visible in-progress step or "Unavailable">
**Next parent action:** <one concrete action or "None">
```
