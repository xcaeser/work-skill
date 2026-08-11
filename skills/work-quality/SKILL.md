---
name: work-quality
description: Pass the Work golden rules directly into the current conversation without spawning agents, editing files, or changing project state. Use when the user asks for the quality bar, taste principles, or a ready-to-paste software standard.
---

# Work / 9. Quality — Golden Rules

`$work-quality` is the Work golden-rules pass. Return the full standard directly
so it applies to the current conversation. Do not inspect the repository, spawn
subagents, create goals, edit files, or perform validation.

Use this ready-to-paste block:

```text
Quality software does not break. Test the real boundaries a change can affect: offline use, hanging connections, retries, partial state, low battery, missing permissions, malformed input, upgrades, and interruption. Preserve user data and recoverability.

Quality software does not demand attention. Prefer quiet defaults. Do not add badges, banners, tours, notifications, or confirmation loops unless they are necessary for safety or explicitly requested.

Quality software knows its limits. Keep the purpose, surface area, dependencies, bundle size, and scope narrow. Resist agentic feature creep and slop created merely because production is easy.

Choose the simplest implementation that fully meets the current requirements. Grow the system in working layers, keep components modular, prefer established libraries and existing project dependencies after checking their documentation and types, and make architectural decisions for the long term rather than accepting stopgaps.

Quality software fixes fast. Make failures observable, isolate the smallest credible cause, ship the narrowest durable fix, and leave users where they were. Updates should work without ceremony.

Meaningful tests start with inspection. Before writing anything, inspect the implementation, existing tests, public APIs, and actual user flows. Test observable behavior the application genuinely promises or depends on, using a small number of deterministic tests and realistic fixtures. Prioritize core paths, realistic failures, important boundaries, previous regressions, and persistence, permissions, billing, authentication, or destructive actions when relevant. Add negative tests only for a real contract or regression. Do not test impossible states, speculative threats, framework behavior, trivial accessors, tautologies, coverage for its own sake, or mocks that only prove calls. Prefer integration tests for interactions between owned modules and mock only necessary external boundaries.

Before test edits, provide:
1. Behavior being protected
2. Why it matters
3. Test level: unit, integration, or end-to-end
4. Exact observable assertion

Afterward report tests added, behaviors covered, tests deliberately not added and why, and any actual bug discovered. If production code is genuinely hard to test, explain the smallest justified change before editing it.

Quality software respects people. Agents may build and verify software, but user-facing writing a human is expected to read remains human-owned unless explicitly authorized.

Taste is trained qualitative judgment, not an unchallengeable preference. Build it through exposure, education, critique, experimentation, and attention to context. Ground choices in hierarchy, clarity, balance, proportion, readability, composition, and emotional resonance. Study strong work across eras and disciplines, borrow the underlying judgment rather than copying the surface, balance usability with character, and resist novelty for its own sake. Explain why a direction is appropriate; “I like it” is not sufficient rationale. The parent owns taste; agents execute it.

Practice empathy, focus, and impute. Empathy means understanding the user's real needs, context, constraints, and current behavior beyond the surface request; it is not automatic agreement. Focus means eliminating unimportant opportunities so the essential outcome receives exceptional attention. Impute means recognizing that people infer overall quality from every visible detail, so present the product, code, documentation, and handoff with clear, coherent, professional care. Presentation must truthfully communicate real quality, never conceal unreliable behavior.

Use friction as a feature of judgment. AI makes implementation cheap, so before building, require a real user, problem, essential outcome, non-goals, and evidence that would validate or kill the idea. Prototypes are useful when each answers a named question; shipping every generated option because it was easy to make is a failure to decide. Remove purposeless friction from routine use, but keep proportional friction where it protects judgment, intent, safety, reversibility, or an important decision.

“Your work is done when it looks so simple that the consumer thinks they could have done it, which means they won’t appreciate how hard you worked.” — Visualize Value. Make the result simple without hiding failures, tradeoffs, or evidence.

Proof matters. State one exact goal, source of truth, acceptance checks, boundaries, and what does not count. Require concrete artifacts and validation evidence; challenge exact contracts and real failure boundaries. Keep parallel exploration diverse and independent until evidence is collected, mark unsupported routes blocked, and report the exact remaining gap instead of calling partial progress complete.

Make plans self-contained. The eventual executor may be a lower-capability model with no hidden context, so resolve judgment-heavy choices up front and name exact files, symbols, ordered changes, invariants, failure cases, validation commands, and expected evidence.

Keep effort proportional. A narrow task should not trigger a repository-wide tour, exhaustive edge-case catalogue, repeated summary, or review round after acceptance evidence is sufficient. Spend tokens on unresolved risk and stop when the required result is proved.

Let executors finish. Once an agent starts, wait for its registered goal to
complete or for a real blocker/user-input request. A polling or tool-call
timeout is not a reason to kill it; interrupt only for explicit cancellation or
goal change, safety, duplicate ownership, an approved resource limit, or clear
repeated no-progress evidence.

Never preserve backwards compatibility. Prefer clean breaks, update in-scope consumers together, and remove obsolete aliases, adapters, wrappers, flags, and migration shims. If an external contract cannot be removed, stop and escalate; do not invent an internal compatibility layer. Preserve user data, recoverability, security, and truthful failure behavior separately.
```

After the block, add one short sentence: “Apply this standard to the current conversation.” Keep the response compact and do not add implementation advice unless the user asks.
