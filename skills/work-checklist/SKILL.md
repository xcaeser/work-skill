---
name: work-checklist
description: Turn the current conversation into a concise, source-traceable checklist of deliverables, decisions, experiments, guardrails, or concerns, then optionally register one goal and execute every item. Use when the user wants to capture an ideated direction, plan, requirements, discussion, or implementation concerns as an actionable checklist, or wants to work through that checklist to completion.
---

# Work / 6. Checklist

Turn conversation into accountable next steps. Preserve reliability, meaningful testing, simplicity, user state, and clean breaks. Do not flatten an idea into a defect list or invent work to make the checklist look complete.

Use the strongest current source, in this order:

1. The user's latest explicit decisions and constraints.
2. A `$work-ideate` decision, `$work-plan` output, or named requirements.
3. A `$work-concern` or `$work-audit` result.
4. The smallest coherent outcome supported by the current conversation.

Preserve open questions as open questions. Distinguish evidence, assumptions, preferences, commitments, and rejected directions.

## Choose the mode

- **Capture:** When the user asks to make, save, organize, or turn the conversation into a checklist without asking for execution, return the checklist only. Do not create a goal, inspect unrelated files, or edit anything.
- **Execute:** When the user asks to implement, do, resolve, go through, or complete the checklist, register one goal and work every item.

If intent is ambiguous, default to Capture and end with the exact command or sentence that would start execution. Do not silently turn planning into implementation.

Do not spawn agents. The parent owns verification, edits, integration, and proof. If execution genuinely requires orchestration, preserve the approved checklist and hand it unchanged to `$work`.

## Build the checklist

Merge duplicates and order items by dependency first, then user value and risk. Use one of these types:

- `deliverable`: something that must exist or change;
- `decision`: a choice that must be resolved;
- `experiment`: evidence needed before committing to a direction;
- `guardrail`: a boundary or non-goal that must remain true;
- `concern`: a suspected implementation problem to verify and resolve or disprove.

Keep Capture mode to at most 10 items unless the user explicitly asks for an
exhaustive breakdown. Every item must trace directly to the conversation. Do
not invent architecture, screens, features, edge cases, research sample sizes,
success thresholds, or implementation chores. If a necessary detail is
unknown, create one `decision` item instead of choosing it for the user.

For every item, define:

```markdown
- [ ] I<number> — <one observable outcome>
  - Type: deliverable / decision / experiment / guardrail / concern
  - Source: <user decision, requirement, evidence, or exact conversation outcome>
  - Depends on: <item IDs or "None">
  - Why it matters: <real consequence or decision enabled>
  - Done when: <observable completion condition>
  - Validate: <smallest decisive check or evidence>
```

For a concern, include the concrete evidence and smallest reproduction. For a decision or experiment, include the success signal and kill or selection criterion. For a deliverable, name the affected user flow or owned surface when known.

Reject vague items such as “research options,” “improve UX,” or “handle edge cases.” Rewrite them as a named question, decision, behavior, or artifact. Do not add speculative features, compatibility work, or generic best-practice chores unsupported by the conversation.

Allowed states are `pending`, `in progress`, `complete`, `disproved`, `rejected`, `blocked`, and `accepted risk`. Use `disproved` only for concerns, `rejected` only for decisions or experiments, and `accepted risk` only with explicit user approval.

### Capture return

In Capture mode, use this exact shape and stop:

```markdown
## Work / 6. Checklist

**Mode:** Capture
**Outcome:** <the conversation outcome being carried forward>

| Item | Type | Action or outcome | Source | Depends on | Done when / validate |
|---|---|---|---|---|---|
| I1 | deliverable / decision / experiment / guardrail / concern | <one observable result> | <exact conversation decision, requirement, or assumption> | <item IDs or "None"> | <observable check> |

**Open decisions:** <items or "None">
**Next action:** Review this checklist, then say “execute this checklist” to register one goal and begin.
**Checklist state:** ready
```

Do not add prose sections, nested sub-checklists, goal state, implementation
details, or validation claims in Capture mode.

## Register one execution goal

In Execute mode, call `get_goal` when available, then reuse a matching active goal or call `create_goal`. Never overwrite an unrelated active goal. Do not set a token budget unless the user supplied one.

Use this objective:

```text
Complete every required checklist item for <outcome>, validate each observable
result, and leave every original item with an explicit evidence-backed disposition.
```

If `create_goal` is unavailable, state the objective and say it could not be registered. Do not invent a fallback tool or pretend the goal exists.

## Execute every item

Work in dependency order:

1. Recheck the item's source and real contract. If a concern is false, mark it `disproved` with evidence and do not edit production code.
2. Resolve any decision with the smallest sufficient evidence. Record why alternatives were rejected.
3. Implement deliverables and verified corrections with the smallest durable change. Update all in-scope consumers and remove obsolete paths.
4. Before test edits, state the behavior being protected, why it matters, test level, and exact observable assertion.
5. Run the item's validation and relevant user flow. Verify persisted state and side effects when applicable.
6. Mark an item `complete` only when its `Done when` evidence exists. Record changed paths, commands, and results immediately.

Do not mark an item complete because code changed, a test exists, or an answer sounds plausible. Keep blocked items open with the exact missing evidence, decision, or authority.

## Complete honestly

If a goal was registered, call `update_goal` with `complete` only when every item is `complete`, `disproved`, `rejected`, or explicitly `accepted risk`, and shared validation passes. Do not complete while any item is `pending`, `in progress`, or `blocked`.

Return this reconciliation in Execute mode:

```markdown
## Work / 6. Checklist

**Mode:** Execute
**Outcome:** <the conversation outcome being carried forward>
**Goal:** <registered objective, "Not registered", or "Not requested">

| Item | Type | Outcome | State | Change or decision | Evidence |
|---|---|---|---|---|---|
| I1 | deliverable / decision / experiment / guardrail / concern | <observable result> | <state> | <change, choice, or reason> | <validation or source> |

**Tests added:** <tests, "None", or "Not applicable in Capture mode">
**Tests deliberately not added:** <scope and reason>
**Bugs discovered:** <bugs or "None">
**Open decisions or blockers:** <items or "None">
**Next action:** <first executable item, `$work` handoff, or "None">
**Checklist state:** ready / active / complete / blocked
```

Keep the checklist current throughout execution. Reconcile every original item in the final table; silently dropping or renaming an uncomfortable item does not count as completion.
