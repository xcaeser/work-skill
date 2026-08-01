# Model routing

Apply this policy to every Work command that can spawn agents. Treat the live subagent spawn schema as authoritative; model availability in a user-owned task or model picker is not enough.

## Cost signal

This snapshot was verified against OpenAI's ChatGPT pricing and model guidance on 2026-08-01. Rates are ChatGPT credits per 1M tokens, not API-key pricing.

| Model | Input | Cached input | Output | Official role |
|---|---:|---:|---:|---|
| `gpt-5.6-sol` | 125 | 12.5 | 750 | Complex, ambiguous, high-value work |
| `gpt-5.6-terra` | 50 | 5 | 300 | Everyday work needing judgment and tools |
| `gpt-5.6-luna` | 5 | 0.5 | 30 | Clear, repeatable, high-volume work |

Luna's token rate is 25 times lower than Sol's and 10 times lower than Terra's in each category. Use that advantage only after protecting correctness: **Luna Max must not replace Sol Medium for ambiguous work.** Higher effort can increase tokens and latency, and the rate card does not guarantee a task's final cost or quality.

Sources: [Models](https://learn.chatgpt.com/docs/models) and [Pricing](https://learn.chatgpt.com/docs/pricing).

## Automatic route

Use automatic routing for `$work <task>`, `$work run <task>`, or `mix` without another selector. Do not ask a model question. Inspect ambiguity, risk, repeatability, failure history, read/write shape, and parallelism; then choose the smallest useful team.

| Task signal | Automatic assignment |
|---|---|
| General repository work, unclear requirements, or an unclear bug | Sol, medium |
| Architecture, difficult debugging, auth, permissions, cross-package work, migrations, or security | Sol, high |
| Critical incident, repeatedly unresolved failure, or consequential final review | Sol, max |
| Approved, clearly scoped implementation; reproduced bug; tests; docs; mechanical refactor; dependency update | Luna, max |
| File discovery, exploration, structured extraction, or broad read-only scan | Luna, high; use xhigh only when the scope is materially large |
| Independent parallel implementation streams with fixed ownership | Luna, xhigh or max per stream |
| Evidence-first independent code review | Sol, high |
| `plan`, `audit`, or `clean` analysis mode | Sol, high, read-only |
| Everyday middle-ground work that specifically benefits from Terra | Do not select Terra automatically; keep it available for an informed explicit choice |

For mixed work, use Sol to resolve ambiguity or risk, Luna to execute approved bounded slices, and Sol High to review consequential results. Keep product decisions, integration, and final proof in the parent.

If an automatically preferred combination is unavailable, choose the closest supported option only when it preserves the risk boundary, and disclose the change before launch. Never downgrade a high-risk Sol assignment to Luna. Do not auto-assign Ultra to a subagent; Work already owns delegation and forbids executors from spawning their own agents.

## Explicit selector advice

Treat any user-supplied count, fixed model, or effort as a proposed setup, not immediate launch authority. `mix` by itself remains automatic.

`plan`, `audit`, and `clean` have a fixed safety route: one Sol High read-only analyst. A selector cannot turn these modes into an editing run or change their model. If the user explicitly asks for another model or effort for one of these commands, explain the fixed route and offer normal task execution with `$work run ...` if they want an executor instead.

Before creating goals or launching agents:

1. Restate the proposed setup.
2. Ask one concise question: **"What drove this setup—cost, speed, prior results, quality, or the need for parallel work?"**
3. Stop and wait for the answer.
4. Reclassify the task using the automatic table and show:

```markdown
| Setup | Agents | Model | Effort | Why |
|---|---:|---|---|---|
| Requested | <N or auto> | <model or auto> | <effort or auto> | <user's reason> |
| Recommended | <N> | <model or mixed> | <effort per role> | <task-specific reason> |
```

If the recommendation matches, say so and continue. If it differs, ask the user to choose **Recommended** or **Keep mine** and do not launch until they answer. Preserve the user's final choice exactly when the live schema supports it and the count can be assigned without duplicate work. Otherwise report the exact blocker; never substitute silently.

Examples of material corrections:

- Recommend Sol Medium or High instead of Terra/Luna for an unreproduced or cross-cutting bug.
- Recommend Luna Max instead of Sol for a fully specified, low-risk implementation slice.
- Recommend Sol High for security, migration, auth, or consequential review work.
- Recommend fewer agents when ownership cannot be separated, or more only when parallel scopes are genuinely independent.
