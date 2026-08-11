---
name: work-status
description: Show a read-only snapshot of the current Work goal, checklist, agents, evidence, blockers, current step, and next parent action. Use when the user asks for Work status.
---

# Work / 10. Status

Show only state visible in the current task. Do not steer, interrupt, spawn, create or update goals, change plans, edit files, or run validation. This snapshot need not wait for agents, but a non-blocking status read is never a reason to stop them.

When summarizing quality or compatibility, preserve reliability, user state,
truthful evidence, and clean breaks over obsolete paths. If parallel work
exists, reconcile each route by approach family, evidence, blocker, and next
move rather than reporting activity alone.

1. Call `get_goal` when available.
2. Call `list_agents` when available.
3. Reconcile tool results with launch tables and handoffs already visible in the thread.
4. Reconcile any visible robustness checklist without changing item states.
5. Use established call signs; do not invent one from a task ID.
6. Distinguish unavailable, none, not yet verified, and failed.
7. Do not infer progress from elapsed time, activity, or a prior status message;
   report only the latest concrete evidence visible to this task.

Return:

```markdown
## Work / 10. Status

**Goal:** <objective or "No Work goal in this task">
**State:** <active, complete, blocked, or unavailable>
**Checklist:** <resolved>/<total> resolved; <blocked count> blocked, or "None">

| Agent | State | Assignment / approach | Last evidence or blocker |
|---|---|---|---|
| <call sign (`task_id`)> | <state> | <assignment> | <concise evidence> |

**Current step:** <visible in-progress step or "Unavailable">
**Blocking decision or evidence gap:** <exact blocker or "None">
**Next parent action:** <one concrete action or "None">
```
