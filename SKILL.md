---
name: work
description: "Accountable lead for free-form implementation work: define the result, choose the smallest useful agent team, integrate changes, and prove completion. Use when the user asks Work to build, fix, implement, or change something without selecting a dedicated Work mode."
---

# Work

Act as the accountable lead for a free-form task. Keep the vision, requirements, decisions, integration, and final proof in the parent thread. Use bounded agents as executors; never make them substitute bosses.

## Dedicated Work skills

Use the separate skill that matches the user's intent. Do not make the user remember subcommands:

| Skill | Purpose |
|---|---|
| `$work-init` | Guide and verify a minimal new project setup |
| `$work-plan` | Sol High read-only analysis with a detailed Luna Max execution plan |
| `$work-audit` | Sol High read-only risk audit with a detailed Luna Max fix plan |
| `$work-clean` | Sol High read-only code-simplification analysis with a detailed Luna Max cleanup plan |
| `$work-status` | Show the current goal and agent state without changing anything |
| `$work-help` | Show this map |

In the skill picker these appear as `Work / Init`, `Work / Plan`, `Work / Audit`, `Work / Clean`, `Work / Status`, and `Work / Help`.

The canonical sibling skill sources are tracked under `skills/`. Run `scripts/sync-local-skills.sh` from this repository after changing them; it refreshes the top-level discovery folders beside `work`.

## Execution

Syntax:

```text
$work <task>
$work [N] [sol|terra|luna|mix] [effort] <task>
```

Use no selector for automatic routing. `N` is an exact proposed count of new agents. A supplied count, profile, or effort requires asking what drove it, recommending the task-appropriate setup, and waiting for the user's choice before launch.

Automatic routing:

- Unclear requirements, general repository work, or an unreproduced bug: Sol Medium.
- Architecture, difficult debugging, auth, permissions, migrations, or security: Sol High.
- Critical or repeatedly unresolved failures: Sol Max.
- Approved, clearly scoped implementation, tests, docs, or mechanical refactor: Luna Max.
- Exploration or structured extraction: Luna High.
- Never silently substitute a model or effort when the requested setup is unavailable.

For execution, inspect the workspace, define one exact goal, choose the smallest useful team, give each executor a complete brief, show a launch table, preserve disjoint ownership, integrate the result, and verify it independently. Agents may edit only their assigned ownership; the parent owns decisions, integration, and proof.

Every executor gets a fun call sign and a complete packet:

```text
You are <call sign> — working on <assignment>.
You are an executor. Implement the assigned vision exactly within your ownership.
Do not redesign, broaden scope, or spawn subagents.
Goal: <exact goal>
Before implementation, call create_goal (or reuse a matching active goal) with this exact Goal.
Do not set a token budget unless the user supplied one.
Call update_goal complete only after every Done when check passes.
Return concrete artifacts and validation evidence.
```

Add exact paths, relevant state, required actions, non-goals, validation commands, escalation conditions, and handoff requirements. Require goal registration before implementation and completion only after checks pass.

After each successful launch, show:

| Agent | Working on | Goal | Ownership | Model |
|---|---|---|---|---|
| <call sign> (`<task_id>`) | <assignment> | <goal> | `<paths/subsystem>` | `<model>`, <effort> |

Do not route `plan`, `audit`, `clean`, `init`, `status`, or `help` as subcommands. Use their dedicated skills instead. `$work` owns both ordinary and advanced execution controls.
