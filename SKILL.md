---
name: work
description: Explicitly invoked command router for creating, planning, running, cleaning, reviewing, and tracking agent work. Use when the user invokes `$work`, `$work init`, `$work plan`, `$work run`, `$work clean`, `$work cc`, `$work review`, `$work status`, `$work check`, `$work help`, or `$work open`.
---

# Work

Act as the accountable lead. Keep requirements, decisions, integration, and proof of completion in the main thread. Use agents as bounded executors or independent auditors, never as substitute bosses.

## Commands

| Command | Category | Description | Reference |
|---|---|---|---|
| `init [path]` | Create | Ask the essential setup questions, then create and verify a minimal new project | [references/init.md](references/init.md) |
| `plan [task]` | Prepare | Define the result, boundaries, agent assignments, order, and proof without making changes | [references/plan.md](references/plan.md) |
| `run [N] [profile] [effort] [task]` | Execute | Complete a task with an explicit or orchestrator-selected team and agent models | [references/run.md](references/run.md) |
| `clean [scope]` | Execute | Remove proven code smells and overengineering while preserving behavior | [references/clean.md](references/clean.md) |
| `review [target]` | Verify | Find evidence-backed risks without changing source files | [references/review.md](references/review.md) |
| `status` | Observe | Show the current goal, agents, blockers, evidence, and next action | [references/status.md](references/status.md) |
| `check` | Diagnose | Check whether the current Codex setup can run Work correctly | [references/check.md](references/check.md) |
| `help [command]` | Discover | Show every command or explain one command without running it | [references/help.md](references/help.md) |
| `open` | Navigate | Show clickable links to the installed Work folder and its core files | [references/open.md](references/open.md) |

Routing:

- **No argument:** treat it as `help`.
- **Explicit command:** load only its reference completely and pass the remaining arguments to it unchanged.
- **Short alias:** route `cc [scope]` to `clean [scope]` and show it beside the canonical command in help.
- **Compatibility aliases:** route `boss` and `orchestrate` to `run`, `brief` to `plan`, `clean-code` to `clean`, `audit` to `review`, and `doctor` to `check`. Keep these aliases out of the main help menu.
- **Clearly implied command:** route only when one command is unambiguous; otherwise run `help`.
- **Unknown command:** name the unrecognized command, run `help`, and do not guess or execute anything.

## Core contract

- Preserve one coherent vision across every delegated task.
- Treat the live tool schemas, permissions, concurrency, and workspace topology as authoritative. Never invent a capability, model, isolation boundary, launch, or state.
- Use subagent tools for subtasks. Never create user-owned tasks or threads as a substitute for subagents.
- Default `run` agents to `gpt-5.6-sol` with `reasoning_effort: low` and `fork_turns: none`. Honor an explicit `run` count, profile, and effort exactly as defined by `run`; otherwise choose the smallest useful team.
- Give every Work agent an exact goal to register before work and complete only after its checks pass.
- Give each agent complete instructions before launch; do not make agents discover product intent.
- Keep agents bounded and action-oriented. Retain planning, tradeoffs, integration, and final judgment in the parent.
- Spend tokens deliberately: use the fewest useful agents, send only task-local context, avoid duplicate approaches, and require concise evidence.
- Assume parallel agents may share permissions and a filesystem unless the live harness proves isolation. Never give concurrent writers overlapping ownership.
- Give every agent a fun, clear call sign and use it consistently in launch rosters and updates.
- Present every successful launch as a compact Markdown table with `Agent`, `Working on`, `Goal`, `Ownership`, and `Model` columns. Put the tool-safe task ID beside the call sign in the `Agent` cell.
- Keep `plan`, `status`, `check`, `help`, and `open` read-only and free of delegation. Keep `review` free of source edits.
