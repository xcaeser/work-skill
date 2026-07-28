# Doctor

Check whether the live Codex harness can honor Work's contracts. Diagnose only; do not change configuration or probe by launching work.

## Checks

Inspect the tools and schemas actually exposed in the current task:

- a subagent spawn tool that accepts `gpt-5.6-sol`, `reasoning_effort: low`, and context-isolated spawning such as `fork_turns: none`
- agent listing, steering, follow-up, waiting, and interruption controls
- `create_goal`, `get_goal`, and `update_goal`, including their active-goal and completion rules
- current live agents and remaining concurrency when observable
- parent permissions inherited by subagents
- whether concurrent agents share a filesystem or have isolated worktrees
- optional `gpt-5.6-luna` medium/high support in the **subagent spawn tool**, checked separately from user-owned task creation

Do not infer support from documentation, another tool, a model picker, or remembered behavior when the live schema is available. Never print secrets while inspecting configuration.

## Verdicts

- **READY:** Boss can launch at least one Sol-low, goal-backed, context-isolated subagent.
- **DEGRADED:** Core Boss works, but an optional control such as Luna or precise capacity reporting is unavailable.
- **BLOCKED:** A required Boss contract is missing or no agent slot is available.

Return:

```markdown
## Work doctor

**Verdict:** READY | DEGRADED | BLOCKED

| Capability | Required contract | Observed | Result |
|---|---|---|---|
| Sol executor | Sol, low, isolated context | <fact> | Pass/Fail |

**Safe next action:** <one command or exact remediation>
```

Do not install tools, edit config, create tasks, create goals, spawn agents, or claim a model is callable merely because it exists elsewhere in Codex.
