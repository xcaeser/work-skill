# Run

Define the result, start focused agents, integrate their work, and verify completion.

## Choose the team and agent profile

Syntax:

```text
$work run [N] [sol|terra|mix] [effort] <task>
```

`N` is an optional positive integer immediately after `run`. It is the exact number of new Work subagents to launch for this run; it does not include the parent or agents that were already live. Reject zero, negative, fractional, or non-numeric counts. When `N` is omitted, let the orchestrator choose the smallest useful team from the task, ownership boundaries, token cost, and live capacity.

The profile and effort are optional reserved tokens after `N`, or immediately after `run` when `N` is omitted. If the next token is not a recognized profile, treat it and the full remainder as the task and use the default profile. If selectors are present without a task, use the single unambiguous current task or approved `$work plan` in the thread. If none exists, ask what to run and do not start agents.

| Profile | Default | Behavior |
|---|---|---|
| omitted or `sol` | `gpt-5.6-sol`, low | Use Sol for every agent |
| `terra` | `gpt-5.6-terra`, low | Use lightweight Terra for every agent |
| `mix` | selected per assignment | Let the parent choose Sol or Terra and the lowest sufficient effort for each agent |

Examples:

```text
$work run implement the settings screen
$work run 3 implement the settings screen
$work run sol implement the settings screen
$work run 2 sol implement the settings screen
$work run terra update the generated fixtures
$work run terra medium inspect and fix the failing tests
$work run mix build the feature
$work run 3 mix medium build the feature
```

For `sol` or `terra`, a supported effort immediately after the profile overrides its default and applies to every spawned agent. Honor it exactly; do not raise, lower, or normalize it.

For `mix`, an effort immediately after the profile is a maximum. Choose per assignment:

- prefer Sol low for implementation and the default path
- prefer Terra low for deterministic, low-risk mechanical work such as formatting, rote renames, fixture updates, bounded file moves, and generated metadata
- prefer Terra medium for read-heavy exploration, large scans, tests, logs, and supporting documents
- use a higher-effort Sol agent only when the task requires it and the user's maximum allows it

The count and profile control spawned Work agents, not the parent. Before launch, state the resolved team size and whether it was user-requested or Work-chosen, plus the resolved fixed profile or `mix` limit. Every roster row must show the actual model and effort.

Treat the live `spawn_agent` schema as authoritative:

- If an explicit count cannot be honored safely, stop before launching and report the exact conflict. Never silently reduce, increase, or pad the team with duplicate work.
- If a user-selected fixed model or effort is unavailable, stop and report the exact mismatch. Never substitute.
- In `mix`, choose only supported Sol or Terra combinations. If a preferred combination is unavailable, select the best supported listed option within the user's effort limit and disclose it before launch.
- With no profile, always retain Sol low. Never switch models merely because another might be cheaper or faster.

## Contents

1. Define the result
2. Set the goal and plan
3. Split the work
4. Write agent instructions
5. Start agents
6. Coordinate
7. Verify and finish

## 1. Define the result

Before delegation:

1. Inspect the relevant workspace, instructions, current implementation, and dirty worktree.
2. Convert the request into one concrete outcome.
3. Write observable **Done when** criteria and an explicit **Does not count** list for tempting partial results.
4. Resolve architectural, product, and design choices in the parent. Ask the user only when a missing choice would materially change the outcome.
5. Identify the smallest useful execution units. Prefer one agent for tightly coupled work.
6. Keep integration, cross-cutting decisions, and final validation with the parent.

Do not delegate vague exploration such as "figure out the best design." Resolve the intended result first, use `$work plan` when a written plan would help, then delegate execution.

## 2. Set the goal and plan

Before launch:

1. Require `get_goal`, `create_goal`, and `update_goal`. If the goal lifecycle is unavailable, stop because Run cannot guarantee goal-backed execution.
2. Inspect the current goal with `get_goal`.
3. Reuse an active goal only when it matches or contains the mission. If no unfinished goal exists, call `create_goal` with the exact mission. If an unrelated goal is active, stop and report the conflict instead of replacing it.
4. Never set a token budget unless the user explicitly supplied one.
5. For work with more than one meaningful step, publish and maintain a short plan with at most one step in progress when a plan tool is available.
6. Inspect live agents and capacity with `list_agents` when available. Count the parent and already-live agents; never assume an advertised maximum is currently free.

The root goal tracks the overall result. Agent goals track their assigned work.

## 3. Split the work

Maintain a compact registry with:

- call sign and tool-safe task ID
- assignment, goal, and ownership
- dependencies and execution order
- state, returned evidence, and exact blocker

When `N` is omitted, launch one agent by default. Launch several only when their scopes are genuinely independent and the saved wall-clock time justifies the extra tokens. Do not fill every available slot merely because it exists.

When the user supplies `N`:

1. Define exactly `N` useful, bounded assignments before the first launch.
2. Count successful new `spawn_agent` calls for this run. Do not count the parent, pre-existing agents, failed launches, or follow-up turns on an existing agent.
3. Never launch more than `N` new agents. Use steering or follow-up turns for corrections after the requested team is full.
4. Launch in waves when `N` exceeds current free concurrency, preserving disjoint ownership within each wave.
5. Stop before launching if the task cannot support `N` non-duplicative assignments or the harness cannot eventually provide the required slots. Explain the constraint and ask for a smaller count or broader scope.

When the user omits `N`, choose the count. Start with the smallest team that can materially improve the outcome, then add an agent only when a newly discovered, non-overlapping assignment justifies its token cost.

Start in small groups:

1. Launch the smallest first wave that can produce implementation progress.
2. Integrate its evidence before deciding whether another wave is needed.
3. When a route stalls, record the exact blocker. Do not retry the same route unless new evidence, access, or a materially different mechanism exists.
4. Keep independent diagnostic or review agents unaware of each other's conclusions until their first handoffs when independence matters.

## 4. Write complete agent instructions

Give each agent complete, task-specific instructions. Include:

- **Call sign:** a short, fun display name used consistently in user-facing updates.
- **Assignment:** a plain-language phrase completing "`<Call sign>` — working on `<assignment>`."
- **Goal:** one concrete objective the agent must register before implementation.
- **Outcome:** one sentence defining the finished result.
- **Vision:** the product or technical intent and decisions already made.
- **Done when:** observable acceptance criteria.
- **Does not count:** plausible partial results or shortcuts that must be rejected.
- **Workspace:** exact repository and working directory.
- **Ownership:** exact files or subsystem the agent may change.
- **Relevant state:** current implementation facts, constraints, existing edits, applicable instructions, and dependencies.
- **Required work:** ordered implementation actions.
- **Out of scope:** decisions and files the executor must not alter.
- **Validation:** exact checks to run and evidence to return.
- **Escalation:** conditions that require stopping and reporting rather than guessing.
- **Handoff:** concise summary, changed files, validation evidence, goal status, and blockers.

Include decisions and evidence, not hidden reasoning or irrelevant conversation history. Prefer precise paths, symbols, and short excerpts over whole-file dumps. Make the instructions complete enough that the agent should not need a planning conversation.

The agent prompt must instruct it to:

1. Call `create_goal` or the available equivalent with the instructions' exact **Goal** before implementation.
2. Reuse an already-active matching goal rather than create a duplicate.
3. Omit a token budget unless the user explicitly supplied one.
4. Call `update_goal` with `complete` only after the **Done when** checks pass.
5. Return concrete artifacts and evidence, not a status narrative or confidence claim.

If no goal tool or equivalent is available to the agent, treat that as a task blocker; never imply that a goal was registered.

## 5. Start agents

For every actionable `$work run` request, launch at least one implementation agent when the Work contract is supported. Do not perform the entire implementation locally merely because it is small.

Use `spawn_agent` with the resolved profile:

```yaml
task_name: <tool_safe_task_id>
model: <resolved_model>
reasoning_effort: <resolved_effort>
fork_turns: none
```

`fork_turns: none` is part of the cost and correctness contract: it avoids leaking the whole parent thread and permits an explicit model configuration in harnesses where full-history forks inherit the parent model.

Give every agent two names:

- A short, fun, memorable **call sign** for people, such as `Bob`, `Pixel Pete`, or `Schema Sally`. Keep it friendly, unique within the launch batch, and easy to pair with its assignment. Light wordplay is welcome, but clarity wins over the joke.
- A tool-safe **task ID** for `spawn_agent`, derived from the call sign and scope, such as `bob_settings_ui` or `pixel_pete_assets`. Use only lowercase letters, digits, and underscores.

Never use opaque display names such as `agent_1` or `exec_settings_ui`. Reuse the same call sign in the packet, launch roster, follow-ups, waits, and result summaries.

Start the message with:

```text
You are <call sign> — working on <plain-language assignment>.
You are an executor. Implement the assigned vision exactly within your ownership.
Do not redesign the solution, broaden scope, or spawn subagents.
Goal: <exact goal>
Before implementation, call create_goal (or the available equivalent) with this exact Goal.
If an already-active goal matches, reuse it instead of creating a duplicate.
Do not set a token budget unless the user explicitly supplied one.
Call update_goal complete only after every Done when check passes.
Return concrete evidence, not a status report.
```

Then provide the complete instructions.

Do not silently substitute another model, role, tool, or reasoning effort. Model availability in a user-owned task-creation tool does not qualify, and creating another task is not a substitute.

After each launch wave, and before any wait, post this concise roster in commentary. Use `agent` for one launch and `agents` otherwise. When `N` was explicit and a later wave remains, use `Launched X of N requested agents:`:

```markdown
Launched N agent(s):

| Agent | Working on | Goal | Ownership | Model |
|---|---|---|---|---|
| <call sign> (`<task_id>`) | <assignment> | <goal> | `<files/subsystem>` | `<model>`, <effort> |
```

Include one row per successful launch. Never claim an agent launched before its spawn call succeeds. List failed launches separately with their exact blockers.

## 6. Coordinate

- Treat the shared workspace as shared mutable state. Give simultaneous writers disjoint ownership; sequence unavoidable overlap.
- Continue useful parent-side inspection or integration while agents work.
- Use `send_message` or the live equivalent for immediate steering while an agent runs. Use `followup_task` or the live equivalent only to start another turn on an idle agent for a concrete correction or failed criterion.
- Wait with `wait_agent` or the live equivalent in bounded intervals of at most 60 seconds. Do not busy-poll or narrate unchanged snapshots.
- Keep the user informed during long work without repeating the roster.
- Request handoffs under 250 words unless a blocker needs exact evidence. Do not request pasted diffs or long narratives.
- Inspect evidence before retrying. Retry once only when the miss is recoverable and the instructions can be narrowed.
- Use `interrupt_agent` or the live equivalent when work becomes obsolete or unsafe; do not let stale agents keep editing.

## 7. Verify and finish

After agents finish:

1. Inspect their actual changes and preserve unrelated user work.
2. Reconcile integration issues and ensure the combined result matches the mission.
3. Run validation proportional to the claim, including broader checks the agents could not own.
4. Reject effort, confidence, or partial progress as completion evidence.
5. Fix a narrow integration miss directly or send one targeted follow-up to the responsible executor.
6. Use an independent read-only review when the change is high-risk or the user requests `$work review`.
7. Call `update_goal` with `complete` only after the root **Done when** criteria pass and no required work remains.
8. Mark a goal blocked only when the live goal-tool rules permit it; difficulty, uncertainty, or a first blocker is not enough.
9. Report the unified outcome, validation evidence, remaining caveats, and concise agent outcomes.

Never treat an agent handoff as proof. Verify the workspace and relevant runtime behavior yourself.
