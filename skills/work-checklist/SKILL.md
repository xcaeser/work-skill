---
name: work-checklist
description: Turn the current implementation concerns into a prioritized checklist, register one concrete goal, and work through every item until it has a proven disposition. Use when the user wants to convert concerns into an execution checklist and make the application more robust.
---

# Work / 6. Checklist

Convert concerns into accountable robustness work. Read
[../QUALITY.md](../QUALITY.md) first and preserve its reliability, meaningful
testing, simplicity, and clean-break rules.

Use concerns already visible in the conversation, especially the latest
`$work-concern` or `$work-audit` result. If none exist, inspect the smallest
relevant implementation using the `$work-concern` standard before creating the
checklist. Never invent concerns to make the list look complete.

Do not spawn agents. The parent owns verification, edits, integration, and
proof. If the scope genuinely requires orchestration, preserve the checklist
and hand it unchanged to `$work` rather than silently changing workflows.

## 1. Build the checklist

Recheck each concern against the current implementation and actual user flow.
Merge duplicates, discard unsupported concerns with evidence, and order the
survivors by likely user impact, data or security risk, and dependency order.

For every item, define:

```markdown
- [ ] C<number> — <concise concern>
  - Evidence: <exact path, symbol, behavior, test, or observation>
  - Why it matters: <realistic consequence>
  - Verify: <smallest decisive reproduction or check>
  - Done when: <observable robust behavior and validation evidence>
```

Allowed states are `pending`, `verified`, `resolving`, `resolved`, `disproved`,
`blocked`, and `accepted risk`. `Accepted risk` requires explicit user approval
and must remain visible in the final robustness caveats.

## 2. Register one goal

After the checklist is defined and before editing, call the available goal tool:

- Prefer `create_goal`; use `define_goal` only when that is the client-provided
  equivalent.
- Reuse a matching active goal. Never overwrite an unrelated active goal.
- Do not set a token budget unless the user supplied one.

Use this objective:

```text
Resolve or conclusively disprove every verified concern in <scope>, validate the
affected real user flows, and leave no hidden robustness gap in the checklist.
```

If no goal tool is available, state the exact objective and say that it could
not be registered. Do not pretend the goal exists.

## 3. Work every item

Process one item at a time unless independent items can be safely verified in
parallel without agents or overlapping edits:

1. Reproduce or decisively verify the concern. If it is false, mark it
   `disproved` with evidence and do not change production code.
2. Identify the real contract and the smallest durable correction. Do not add a
   compatibility layer, speculative abstraction, or unrelated cleanup.
3. Before adding tests, provide the four-line meaningful test plan: behavior,
   why it matters, test level, and exact observable assertion.
4. Implement the correction and update all in-scope consumers together.
5. Run the focused test, relevant regression checks, and the actual user flow
   when practical. Verify persisted state and side effects when relevant.
6. Mark the item `resolved` only when its `Done when` evidence exists. Record
   changed paths, commands, and results immediately.

Do not mark a concern resolved because code changed, a test was written, or the
implementation looks plausible. A blocked item remains open with the exact
missing evidence or decision.

## 4. Complete honestly

Call `update_goal` with `complete` only when every checklist item is `resolved`,
`disproved`, or explicitly `accepted risk`, and all shared validation passes.
Do not complete the goal while any item is `pending`, `verified`, `resolving`,
or `blocked`.

Return:

```markdown
## Robustness checklist

**Goal:** <registered objective>
**Scope:** <implementation covered>

| Item | Concern | Disposition | Change or reason | Evidence |
|---|---|---|---|---|
| C1 | <concern> | resolved / disproved / blocked / accepted risk | <change or reason> | <command, test, path, or observation> |

**Tests added:** <tests, or "None">
**Behaviors covered:** <real contracts protected>
**Tests deliberately not added:** <scope and reason>
**Actual bugs discovered:** <bugs, or "None">
**Robustness caveats:** <accepted risks, blockers, or "None">
**Goal state:** complete / active / blocked
```

Keep the checklist current throughout the work. The final table must reconcile
every original concern; silently dropping an item does not count as completion.
