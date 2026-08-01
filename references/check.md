# Check

Check whether the live Codex harness can honor Work's contracts. Diagnose only; do not change configuration or probe by launching work.

## Checks

Inspect the tools and schemas actually exposed in the current task:

- a subagent spawn tool that accepts `gpt-5.6-sol` medium/high/max and context-isolated spawning such as `fork_turns: none`
- cost-focused worker support for `gpt-5.6-luna` high/xhigh/max
- optional fixed-profile support for `gpt-5.6-terra`, including its accepted reasoning efforts
- agent listing, steering, follow-up, waiting, and interruption controls
- `create_goal`, `get_goal`, and `update_goal`, including their active-goal and completion rules
- current live agents and remaining concurrency when observable
- whether an explicit requested count can run now or must be scheduled in waves
- parent permissions inherited by subagents
- whether concurrent agents share a filesystem or have isolated worktrees
- model availability in the **subagent spawn tool**, checked separately from user-owned task creation

Do not infer support from documentation, another tool, a model picker, or remembered behavior when the live schema is available. Never print secrets while inspecting configuration.

## Results

- **Ready:** Run can launch goal-backed, context-isolated Sol Medium/High and Luna Max agents.
- **Limited:** Run can execute safely, but a cost lane, optional Terra control, higher effort, or precise capacity reporting is unavailable.
- **Blocked:** No safe Sol Medium execution path, goal lifecycle, context-isolated spawn, or agent slot is available.

Return:

```markdown
## Work check

**Result:** Ready | Limited | Blocked

| Capability | Required contract | Observed | Result |
|---|---|---|---|
| Capacity | One free slot minimum; report visible free/total slots | <fact> | Pass/Fail |
| Sol assurance lane | Medium, high, max | <fact> | Pass/Fail |
| Luna value lane | High, xhigh, max | <fact> | Pass/Fail |
| Terra profile | Requested efforts | <fact> | Pass/Fail |

**Next action:** <one command or exact remediation>
```

Do not install tools, edit config, create tasks, create goals, spawn agents, or claim a model is callable merely because it exists elsewhere in Codex.
