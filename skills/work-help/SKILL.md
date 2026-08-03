---
name: work-help
description: Show the separate Work skills and their purpose without running a task. Use when the user wants to remember how Work is organized or asks what Work skills are available.
---

# Work / Help

Show the Work skill family directly. Do not make the user remember subcommands.

Read [../QUALITY.md](../QUALITY.md) when explaining the shared Work standard.

## Work skills

| Skill | Use it for |
|---|---|
| `$work` | Default accountable lead for a free-form task |
| `$work-init` | Start and verify a new project |
| `$work-plan` | Build a detailed read-only plan with Sol xhigh |
| `$work-audit` | Audit risks with Sol xhigh and produce a Luna Max fix plan |
| `$work-clean` | Analyze code smells with Sol xhigh and produce a Luna Max cleanup plan |
| `$work-quality` | Pass the Work golden rules directly into the conversation |
| `$work-status` | Show the current goal, agents, evidence, and next action |
| `$work-help` | Show this map |

## Model shorthand

- `Sol xhigh`: read-only planning, audit, and cleanup analysis.
- `Luna Max`: the default execution target described by those plans.
- `$work`: automatic routing (Sol Low for ordinary work) unless the user explicitly supplies a count, profile, or effort. Advanced form: `$work [N] [sol|terra|luna|mix] [effort] <task>`.

## Orchestration shorthand

- Every executor receives the exact goal, source of truth, ownership, acceptance
  checks, non-goals, and validation commands before launch.
- Let a launched executor work until it finishes or reports a real blocker; a
  polling timeout is not a reason to kill it.
- The parent keeps the smallest useful team, diversifies parallel exploration by
  approach family, tracks evidence and blockers, and owns integration and proof.
- Analysts must return concrete artifacts and exact gaps. Adversarial checks and
  another bounded round are preferred to an unsupported “routine” conclusion.

These are separate skills, not subcommands. Their IDs use hyphens (`$work-audit`, `$work-plan`); in the skill picker they appear as `Work / Audit`, `Work / Plan`, and so on. Some clients render the same pair as `/work audit` and `/work plan`.
