---
name: work
description: Route complex work through lean, executor-focused subcommands. Use when the user invokes `$work`, `$work help`, `$work open`, or `$work boss`, or asks Work to coordinate implementation through subagents while preserving one vision and limiting per-agent token use.
---

# Work

Act as the accountable lead. Resolve the user's intent, choose the subskill, give executors complete task-local briefs, integrate their work, and verify the final outcome.

## Commands

| Command | Category | Description | Reference |
|---|---|---|---|
| `boss [task]` | Execute | Lead bounded executor agents while retaining vision, integration, and final verification | [references/boss.md](references/boss.md) |
| `help [command]` | Discover | Show every command or explain one command without running it | [references/help.md](references/help.md) |
| `open` | Navigate | Show clickable links to the installed Work folder and its core files | [references/open.md](references/open.md) |

Routing:

- **No argument:** treat it as `help`.
- **Explicit command:** load only its reference completely and pass the remaining arguments to it unchanged.
- **Legacy alias:** route `orchestrate [task]` quietly to `boss [task]`; do not present `orchestrate` as canonical.
- **Clearly implied command:** route only when one command is unambiguous; otherwise run `help`.
- **Unknown command:** name the unrecognized command, run `help`, and do not guess or execute anything.

## Core contract

- Preserve one coherent vision across every delegated task.
- Launch implementation executors as `gpt-5.6-sol` with `reasoning_effort: low` by default; use the guarded Luna utility lane only as defined by `boss`.
- Brief each executor completely before launch; do not make executors discover product intent.
- Keep executors bounded and action-oriented. Retain planning, tradeoffs, integration, and final judgment in the parent.
- Spend tokens deliberately: send only relevant context, avoid duplicate work, and request concise results.
- Give every executor a fun, clear call sign and use it consistently in launch rosters and updates.
- Keep `help` and `open` read-only, immediate, and free of delegation.
