---
name: work
description: Explicitly invoked command router for planning, executing, auditing, and tracking bounded agent work. Use when the user invokes `$work`, `$work boss`, `$work brief`, `$work audit`, `$work status`, `$work doctor`, `$work help`, or `$work open`.
---

# Work

Act as the accountable lead. Keep requirements, decisions, integration, and proof of completion in the main thread. Use agents as bounded executors or independent auditors, never as substitute bosses.

## Commands

| Command | Category | Description | Reference |
|---|---|---|---|
| `boss [task]` | Execute | Lead bounded executor agents while retaining vision, integration, and final verification | [references/boss.md](references/boss.md) |
| `brief [task]` | Prepare | Produce a no-write execution contract and lean crew design before launch | [references/brief.md](references/brief.md) |
| `audit [target]` | Verify | Run evidence-first, adversarial review without changing source files | [references/audit.md](references/audit.md) |
| `status` | Observe | Show the current goal, crew, blockers, evidence, and next action | [references/status.md](references/status.md) |
| `doctor` | Diagnose | Check whether the live harness can honor Work's model, goal, and agent contracts | [references/doctor.md](references/doctor.md) |
| `help [command]` | Discover | Show every command or explain one command without running it | [references/help.md](references/help.md) |
| `open` | Navigate | Show clickable links to the installed Work folder and its core files | [references/open.md](references/open.md) |

Routing:

- **No argument:** treat it as `help`.
- **Explicit command:** load only its reference completely and pass the remaining arguments to it unchanged.
- **Legacy alias:** route `orchestrate [task]` quietly to `boss [task]`; do not present `orchestrate` as canonical.
- **Convenience aliases:** route `plan [task]` to `brief [task]` and `review [target]` to `audit [target]`; present only the canonical names.
- **Clearly implied command:** route only when one command is unambiguous; otherwise run `help`.
- **Unknown command:** name the unrecognized command, run `help`, and do not guess or execute anything.

## Core contract

- Preserve one coherent vision across every delegated task.
- Treat the live tool schemas, permissions, concurrency, and workspace topology as authoritative. Never invent a capability, model, isolation boundary, launch, or state.
- Use subagent tools for subtasks. Never create user-owned tasks or threads as a substitute for subagents.
- Launch Work agents as `gpt-5.6-sol` with `reasoning_effort: low` and `fork_turns: none` by default; use the guarded Luna utility lane only as defined by `boss`.
- Give every Work agent an exact goal to register before work and complete only after its checks pass.
- Brief each executor completely before launch; do not make executors discover product intent.
- Keep executors bounded and action-oriented. Retain planning, tradeoffs, integration, and final judgment in the parent.
- Spend tokens deliberately: use the fewest useful agents, send only task-local context, avoid duplicate approaches, and require concise evidence.
- Assume parallel agents may share permissions and a filesystem unless the live harness proves isolation. Never give concurrent writers overlapping ownership.
- Give every executor a fun, clear call sign and use it consistently in launch rosters and updates.
- Keep `brief`, `status`, `doctor`, `help`, and `open` read-only and free of delegation. Keep `audit` free of source edits.
