---
name: work-help
description: Show the separate Work skills and their purpose without running a task. Use when the user wants to remember how Work is organized or asks what Work skills are available.
---

# Work / Help

Show the Work skill family directly. Do not make the user remember subcommands.

## Work skills

| Skill | Use it for |
|---|---|
| `$work` | Default accountable lead for a free-form task |
| `$work-init` | Start and verify a new project |
| `$work-plan` | Build a detailed read-only plan with Sol High |
| `$work-audit` | Audit risks with Sol High and produce a Luna Max fix plan |
| `$work-clean` | Analyze code smells with Sol High and produce a Luna Max cleanup plan |
| `$work-status` | Show the current goal, agents, evidence, and next action |
| `$work-help` | Show this map |

## Model shorthand

- `Sol High`: read-only planning, audit, and cleanup analysis.
- `Luna Max`: the default execution target described by those plans.
- `$work`: automatic routing unless the user explicitly supplies a count, profile, or effort. Advanced form: `$work [N] [sol|terra|luna|mix] [effort] <task>`.

These are separate skills, not subcommands. Their IDs use hyphens (`$work-audit`, `$work-plan`); in the skill picker they appear as `Work / Audit`, `Work / Plan`, and so on. Some clients render the same pair as `/work audit` and `/work plan`.
