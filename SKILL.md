---
name: work
description: Explicitly invoked command router for planning, auditing, cleaning, and completing work with focused agents. Use when the user invokes `$work` with a task, `$work init`, `$work plan`, `$work audit`, `$work clean`, `$work run`, `$work status`, or `$work help`.
---

# Work

Act as the accountable lead. Keep requirements, decisions, integration, and proof of completion in the main thread. Use agents as bounded executors or independent auditors, never as substitute bosses.

## Commands

| Command | Category | Description | Reference |
|---|---|---|---|
| `init [path]` | Create | Ask the essential setup questions, then create and verify a minimal new project | [references/init.md](references/init.md) |
| `plan [task]` | Analyze | Use Sol High to produce a detailed, read-only execution plan for Luna Max | [references/plan.md](references/plan.md) |
| `[N] [profile] [effort] <task>` | Execute | Automatically choose the team, models, and effort, then complete the task | [references/run.md](references/run.md) |
| `audit [target]` | Analyze | Use Sol High to find evidence-backed risks and produce a detailed Luna Max fix plan | [references/audit.md](references/audit.md) |
| `clean [scope]` | Simplify | Use Sol High to identify code smells, then let the parent apply the approved cleanup | [references/clean.md](references/clean.md) |
| `status` | Observe | Show the current goal, agents, blockers, evidence, and next action | [references/status.md](references/status.md) |
| `help [command]` | Discover | Show every command or explain one command without running it | [references/help.md](references/help.md) |

Routing:

- **No argument:** treat it as `help`.
- **Direct task:** route `$work <task>` to execution with automatic model assignment.
- **Selector-first task:** route `$work [N] [profile] [effort] <task>` to execution with the selectors preserved for the advisory checkpoint.
- **Optional run spelling:** route `$work run ...` to the same execution path; keep `run` out of the main menu for a smaller surface.
- **Analysis modes:** route `plan`, `audit`, and `clean` to their references. These modes always launch Sol High read-only analysis and require a detailed Luna Max execution plan; their agents never edit.
- **Explicit command:** load that command's reference completely and pass the remaining arguments to it unchanged.
- **Spawning command:** also load [references/models.md](references/models.md) completely before choosing or launching agents.
- **Clearly implied command:** route only when one command is unambiguous; otherwise run `help`.
- **Command-like typo:** when a single leading token closely resembles a command or alias, name it and run `help` instead of treating it as a task.

## Core contract

- Preserve one coherent vision across every delegated task.
- Treat the live tool schemas, permissions, concurrency, and workspace topology as authoritative. Never invent a capability, model, isolation boundary, launch, or state.
- Use subagent tools for subtasks. Never create user-owned tasks or threads as a substitute for subagents.
- Automatically select the smallest useful team and task-appropriate Sol, Terra, or Luna configuration using the model policy.
- When the user supplies a count, model, or effort, ask what drove that choice, recommend the task-appropriate setup, and let the user decide before launching.
- Give every Work agent an exact goal to register before work and complete only after its checks pass.
- Give each agent complete instructions before launch; do not make agents discover product intent.
- Keep agents bounded and action-oriented. Retain planning, tradeoffs, integration, and final judgment in the parent.
- Spend tokens deliberately: use the fewest useful agents, send only task-local context, avoid duplicate approaches, and require concise evidence.
- Assume parallel agents may share permissions and a filesystem unless the live harness proves isolation. Never give concurrent writers overlapping ownership.
- Give every agent a fun, clear call sign and use it consistently in launch rosters and updates.
- Present every successful launch as a compact Markdown table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model` columns. Put the tool-safe task ID beside the call sign in the `Agent` cell.
- Keep `status` and `help` read-only and free of delegation. `plan` is read-only toward source files but may launch its one Sol High analyst.
- For `plan`, `audit`, and `clean`, Sol High agents are read-only analysts. Only the parent orchestrator may edit; do not let these agents write, spawn, or delegate.
- For normal task execution, delegated agents are bounded executors and may edit only their assigned ownership; the parent integrates and proves the final result.
