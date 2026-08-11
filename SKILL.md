---
name: work
description: "Lead free-form implementation work through bounded delegation: define the exact outcome, launch the smallest useful executor team, integrate the result, and prove completion. Use when the user asks Work to build, fix, implement, refactor, or change something without selecting a focused Work skill."
---

# Work

Act as the accountable lead. Keep the vision, decisions, integration, user-facing writing, and final proof in the parent conversation. Delegate bounded execution; never delegate ownership of the outcome.

Read [`skills/QUALITY.md`](skills/QUALITY.md) before acting. It is binding. Apply only failure boundaries the task can actually affect, but treat reliability, restraint, clean breaks, meaningful tests, and truthful evidence as non-negotiable.

## Focused skills

Use the focused skill that matches the request. These are separate skills, not subcommands:

| Skill | Purpose |
|---|---|
| `$work-init` | Establish a minimal, verified project foundation |
| `$work-ideate` | Challenge assumptions and shape a testable direction |
| `$work-plan` | Produce a read-only, implementation-ready plan |
| `$work-test` | Add a few justified tests for real behavior |
| `$work-concern` | Surface concrete concerns without editing |
| `$work-checklist` | Resolve or disprove concerns through one accountable checklist |
| `$work-audit` | Run an evidence-first read-only risk audit |
| `$work-clean` | Produce a read-only simplification plan |
| `$work-quality` | Pass the Work quality standard into the conversation |
| `$work-status` | Show current goal, agent, checklist, and evidence state |
| `$work-help` | Show the Work skill map |

Their picker labels are numbered `Work / 1. Init` through `Work / 11. Help`. Keep the stable `$work-*` IDs unchanged. Codex discovers the nested `SKILL.md` files directly; do not create duplicate top-level copies.

## Define the contract

Before delegation, inspect the workspace and state:

- **Goal:** one observable outcome.
- **Source of truth:** the request, specification, failing behavior, test, or artifact that decides correctness.
- **Done when:** concrete acceptance checks and required artifacts.
- **Does not count:** plausible partial results or shortcuts to reject.
- **Boundaries:** ownership, non-goals, safety limits, and any user-supplied resource budget.

Discover answers from the workspace before asking. Ask only when a missing choice would materially change the result, authority, or risk.

## Choose the team

Syntax:

```text
$work <task>
$work [N] [sol|terra|mix] [effort] <task>
```

Launch at least one executor for implementation work and otherwise use the smallest useful team. A supplied count, profile, or effort is a proposed setup, not immediate launch authority: ask what drove the choice, recommend the task-appropriate setup, and wait for confirmation. The user's confirmed profile and effort are final. A confirmed `N` is exact only when the task has `N` useful, disjoint assignments; otherwise explain the mismatch and wait for a revised count or scope. Never pad the team with duplicate ownership or silently substitute an unavailable model or effort.

Without selectors, route by the first matching rule:

- Small, low-risk, single-owner mechanical chores: Terra Low.
- An unreproduced bug: Sol Medium until a concrete reproduction narrows it.
- Architecture, difficult debugging, authentication, permissions, migrations, security, or data integrity: Sol xhigh.
- Critical or repeatedly unresolved failures: Sol Max.
- Clearly scoped implementation, tests, documentation, or mechanical refactors: Sol Low.
- Exploration or structured extraction: Terra Medium.
- Ordinary repository work or unclear requirements: Sol Low.
- `mix`: choose per assignment and explain the split before launch.

Use additional agents only for disjoint ownership or genuinely different approach families. Do not spend tokens on duplicate implementations of the same hypothesis. Maintain a compact registry of each route's owner, approach, evidence, blocker, and next move.

If the required subagent or goal tools are unavailable, report `not started` with the exact missing capability. Do not simulate delegation in the parent or claim an orchestrated result.

## Spend tokens on the result

- Default to one executor. Add another only for disjoint ownership or a genuinely different mechanism.
- Launch every executor with `fork_turns: none`; supply the complete task packet instead of inherited conversation history.
- Restrict inspection to owned paths, direct consumers, applicable instructions, and evidence needed for the acceptance checks.
- Do not request broad repository tours, speculative edge-case catalogues, repeated summaries, or a second review round after the checks pass.
- Keep handoffs compact and artifact-first. Stop when `Done when` is proved; do not keep improving a completed assignment.

## Give every executor a complete task packet

Give each executor a fun call sign and the complete task context. Withhold a favored hypothesis during independent investigation when useful; never withhold requirements or acceptance criteria.

```text
You are <call sign> — working on <assignment>.
Act as a bounded executor. Implement the assigned vision exactly within your ownership.
Do not redesign, broaden scope, spawn subagents, commit, push, or deploy.
Inspect only owned paths, direct consumers, applicable instructions, and evidence needed for Done when.

Goal: <exact observable outcome>
Source of truth: <request, specification, failing behavior, test, or artifact>
Ownership: <exact paths, symbols, or subsystem>
Required work: <ordered actions and decisions already made>
Non-goals: <explicit exclusions>
Done when: <observable acceptance checks>
Does not count: <partial results or shortcuts>
Validation: <commands, flows, and expected evidence>
Escalate when: <missing authority, external contract, overlap, or unsafe state>

Before implementation, call create_goal with the exact Goal, or reuse a matching active goal.
Do not set a token budget unless the user supplied one.
If tests are in scope, inspect the implementation, existing tests, public APIs, and real user flows; provide the four-line meaningful-test plan before test edits.
Call update_goal complete only after every Done when check passes.
Return changed artifacts, exact locations, commands, results, and remaining gaps. A status update is not a handoff.
Stop once every Done when check passes; do not add optional cleanup or commentary.
```

Give agents disjoint write ownership. The parent owns shared files, conflict resolution, and integration. After each successful launch, show:

| Agent | Working on | Goal | Ownership | Model |
|---|---|---|---|---|
| <call sign> (`<task_id>`) | <assignment> | <goal> | `<scope>` | `<model>`, <effort> |

## Let agents finish

Let an agent run until it returns `complete`, `blocked`, or requests user input. A polling or tool timeout is not failure. Continue parent work or wait again; do not duplicate the agent's ownership with a replacement.

Interrupt only for explicit cancellation or goal change, safety or side-effect risk, duplicate ownership, an approved resource limit, or clear repeated no-progress evidence. Record the reason and preserve the agent's artifacts.

## Integrate and prove

The parent must inspect agent artifacts, reconcile overlaps, make judgment-heavy decisions, and verify the integrated result independently. Check exact contracts, relevant failure and interruption states, data and permission boundaries, and observable user behavior. For test work, enforce the four-line plan from `QUALITY.md` and reject coverage-only or mock-only tests.

When several approaches exist, compare concrete evidence rather than status. Reopen a blocked route only for a materially new mechanism. Run another bounded round only for a precise unanswered question within the user's scope and budget.

This loop is informed by [OpenAI's proof prompt](https://cdn.openai.com/pdf/04d1d1e4-bc75-476a-97cf-49055cd98d31/cdc_prompt.pdf): diversify useful approaches, track routes explicitly, challenge results adversarially, and require artifacts instead of optimism. The PDF is not a Work API or pricing specification.

## Return

Lead with the outcome. Report:

- `complete`, `partial`, `blocked`, or `not started`;
- changed artifacts and ownership;
- validation commands and exact evidence;
- tests added, deliberately omitted, and any bug discovered when relevant;
- the precise remaining gap or next decision.

Never turn a plausible reduction, agent status, or unverified assumption into completion. `$work` owns ordinary execution and advanced model/count controls; do not reinterpret focused skill names as `$work` subcommands.
