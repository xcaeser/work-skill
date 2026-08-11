---
name: work-help
description: Show the separate Work skills and their purpose without running a task. Use when the user wants to remember how Work is organized or asks what Work skills are available.
---

# Work / 11. Help

Show the Work skill family directly. Do not inspect the repository, spawn
agents, create goals, or run a task. Do not make the user remember subcommands.

When explaining the shared standard, use the `$work-quality` description below;
do not resolve or read files outside this skill folder.

## Work skills

| Skill | Use it for |
|---|---|
| `$work` | Delegate and integrate a free-form implementation task |
| `1. $work-init` | Start and verify a new project |
| `2. $work-ideate` | Brainstorm with a rigorous, question-by-question creative sparring partner |
| `3. $work-plan` | Build a detailed read-only plan with Sol xhigh |
| `4. $work-test` | Inspect real behavior, add justified tests, and report omissions and bugs |
| `5. $work-concern` | Surface evidence-backed concerns in the current implementation without editing |
| `6. $work-checklist` | Register a goal and resolve every concern through a verified checklist |
| `7. $work-audit` | Audit risks with Sol xhigh and produce an executor-ready fix plan |
| `8. $work-clean` | Analyze code smells with Sol xhigh and produce an executor-ready cleanup plan |
| `9. $work-quality` | Pass the Work golden rules directly into the conversation |
| `10. $work-status` | Show the current goal, agents, evidence, and next action |
| `11. $work-help` | Show this map |

## Model shorthand

- `Work / 2. Ideate`: interactive conversation; no agents or model selection.
- `Work / 4. Test`: parent-led test implementation; no agents or coverage target.
- `Work / 5. Concern`: lightweight read-only inspection; no agents or fix plan.
- `Work / 6. Checklist`: parent-led execution with one registered goal; no agents.
- `Work / 3. Plan`, `7. Audit`, and `8. Clean`: one read-only Sol xhigh analyst; no edits.
- Plans are executor-agnostic and detailed enough for a lower-capability model with no hidden context.
- Terra Low handles small mechanical chores; Terra Medium handles structured exploration or extraction.
- `mix` lets the parent choose Sol or Terra per assignment and explain the split before launch.
- Executors use `fork_turns: none`, narrow ownership, and compact artifact-first handoffs to control token use.
- `$work`: automatic routing (Sol Low for ordinary work) unless the user proposes a count, profile, or effort. Advanced form: `$work [N] [sol|terra|mix] [effort] <task>`. Work explains its recommendation and waits for confirmation; it never invents assignments to satisfy an oversized count.

## Orchestration shorthand

- Every executor receives the exact goal, source of truth, ownership, acceptance
  checks, non-goals, and validation commands before launch.
- Let a launched executor work until it finishes or reports a real blocker; a
  polling timeout is not a reason to kill it.
- The parent keeps the smallest useful team, diversifies parallel exploration by
  approach family, tracks evidence and blockers, and owns integration and proof.
- Analysts must return concrete artifacts and exact gaps. Adversarial checks and
  another bounded round are preferred to an unsupported “routine” conclusion.

These are separate skills, not subcommands. Their stable IDs use hyphens (`$work-ideate`, `$work-plan`, `$work-test`, `$work-concern`, `$work-checklist`, `$work-audit`); the skill picker adds numeric workflow labels such as `Work / 2. Ideate`, `Work / 3. Plan`, and `Work / 4. Test`. Some clients render the stable IDs as `/work ideate`, `/work plan`, and `/work test`.
