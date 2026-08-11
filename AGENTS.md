# Work project rules

Read [`skills/QUALITY.md`](skills/QUALITY.md) before changing this project or any nested Work skill. Treat it as the project's quality bar.

- Quality software must not break at real boundaries, must not demand attention without a reason, must know its limits, fix failures quickly, and respect human attention and authorship.
- Practice empathy, focus, and impute: understand the user's real context, eliminate unimportant opportunities, and present every surface and handoff with care that truthfully reflects the quality underneath.
- Treat taste as trained judgment: study references, use enduring fundamentals, invite critique, balance usability with character, and explain qualitative decisions beyond personal preference or current trends.
- Restore deliberate friction where cheap implementation would bypass judgment: require a real problem, user, validation question, and kill or selection criterion before turning generated options into product surface.
- Never preserve backwards compatibility. Prefer a clean break, update all in-scope consumers together, and remove obsolete aliases, adapters, wrappers, flags, and migration shims. If an external contract cannot be removed, stop and escalate; do not invent an internal compatibility layer.
- Choose the simplest implementation that fully meets the current requirements. Avoid speculative abstractions, configuration, and indirection.
- Grow the system in layers. Start from the smallest version that works end to end, and add each new capability on top of a product that already works. Never trade a working product for unfinished complexity.
- Keep components modular and concerns clearly separated.
- Prefer established, well-maintained libraries when they reduce overall complexity or improve reliability. Do not reimplement common functionality without a clear reason.
- Lean on the dependencies already in the project before writing your own implementation or adding packages. Do not assume a library lacks a capability without checking its documentation and types.
- Make architectural decisions for the long term. Do not accept a stopgap that only works for now and is meant to be replaced later.
- Keep user data, recoverability, security, and truthful failure behavior safe; those are not compatibility shims.
- Keep agents bounded executors. The parent owns taste, decisions, integration, user-facing copy, and proof.
- Before work begins, state the exact goal, source of truth, acceptance checks, boundaries, and what does not count. Treat concrete artifacts and validation evidence as the only completion proof.
- Make plans self-contained for a lower-capability executor with no hidden context: resolve judgment-heavy choices and name exact files, symbols, ordered changes, invariants, failure cases, validation commands, and expected evidence.
- For test work, inspect implementation, existing tests, public APIs, and actual user flows before writing anything. Add only deterministic tests for observed behavior, provide the four-line test plan first, and report tests deliberately omitted and any real bug discovered.
- For parallel investigation, diversify by approach family, preserve independent hypotheses early, track evidence and blockers, and challenge exact contracts and failure boundaries. Reopen blocked routes only for a materially new mechanism, within the user's scope and token budget.
- Once an agent starts, let it run until it reports `complete`, `blocked`, or needs user input. Never kill it just because a poll, tool call, or arbitrary wall-clock interval elapsed; interrupt only for explicit cancellation/goal change, safety, duplicate ownership, an approved resource limit, or clear repeated no-progress evidence, and record the reason.
- Treat discovery validation as structural only. After changing workflow behavior, forward-test the affected skill with a realistic request in a disposable task and inspect its raw launch, goal, handoff, and read-only boundaries; routing or goal-lifecycle changes require representative `$work`, `$work-plan`, and `$work-checklist` smoke tests before release.
- Use `Work / 2. Ideate` for an interactive, question-by-question sparring session; it does not spawn agents or edit files, and it must end in a sharper decision or test rather than an idea dump.
- Use `Work / 4. Test` for direct meaningful-test implementation: inspect real behavior first, publish the four-line test plan, add only justified deterministic tests, and optimize for confidence rather than coverage; it does not spawn agents.
- Use `Work / 5. Concern` for a compact, read-only implementation sanity check; it reports only evidence-backed concerns and unknowns, never edits or a full fix plan.
- Use `Work / 6. Checklist` to convert concerns into one registered robustness goal and resolve or disprove every checklist item with evidence; it does not spawn agents.
- Use `Work / 9. Quality` when the standard should be passed into a conversation; it never spawns agents or edits files.
