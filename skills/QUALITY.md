# Quality Software Standard

Apply this standard to every Work decision, plan, implementation, and review.

## The bar

1. **Do not break.** Exercise the real boundaries: offline use, hanging connections, retries, partial state, low battery, missing permissions, malformed input, upgrades, and interrupted work. Preserve user data and recoverability. A polished surface cannot compensate for unreliable behavior.
2. **Do not demand attention.** Prefer quiet, calm defaults. Do not add badges, banners, tours, notifications, or confirmation loops unless the user asked for them or the product cannot be safe without them.
3. **Know the limits.** Keep the purpose, surface area, dependencies, bundle size, and scope narrow. Resist agentic feature creep, speculative abstractions, and slop created merely because production is easy.
4. **Fix fast.** Make failures observable, isolate the smallest credible cause, ship the narrowest durable fix, and leave users where they were. Updates should do their work without ceremony or needless re-onboarding.
5. **Respect people.** Agents may build and verify software, but user-facing words a human is expected to read require human taste and authorization. Do not fill products with generated copy, tours, or explanations just because they are easy to produce.
6. **Use taste.** When metrics do not decide, choose the restrained, coherent, legible option. Consistency, hierarchy, wording, defaults, and details should feel intentional. The parent owns qualitative judgment; agents execute it.

## Proof and exploration

State one exact goal, source of truth, acceptance checks, boundaries, and what
does not count before work begins. Completion requires concrete artifacts and
validation evidence; a progress report, elegant reduction, or “routine” claim
is not proof.

When parallel investigation is justified, keep the first round diverse by
approach family, preserve independent hypotheses until they have evidence, and
track each route's state, evidence, blocker, and next move. Challenge results
against exact contracts and the real failure boundaries the task can affect,
including malformed input, offline or hanging work, retries, partial state,
interruption, permissions, upgrades, and recovery. Mark a route blocked when it
depends on a missing assumption or merely restates the original problem; reopen
it only for a materially new mechanism. Keep rounds bounded by the user's
scope, time, and token budget, and report the exact remaining gap instead of
pretending partial progress is complete.

Agent persistence is part of proof: once an executor starts, let it finish its
registered goal or report a real blocker. A polling or tool-call timeout is not
an agent failure. Interrupt only for explicit cancellation or goal change,
safety, duplicate ownership, an approved resource limit, or clear repeated
no-progress evidence; preserve and report the resulting partial state.

## Compatibility rule

**Never preserve backwards compatibility.** Prefer a clean break over obsolete aliases, adapters, wrappers, flags, duplicate routes, legacy formats, or migration shims. Update every in-scope consumer in one coherent change and delete the superseded path. If an external contract cannot be removed, stop and escalate; do not invent an internal compatibility layer.

Do not confuse compatibility with safety: preserve user data, recoverability, security, and truthful failure behavior unless the user explicitly asks for a destructive change.

## Decision test

Before accepting a result, ask:

- Does it keep working when the happy path disappears?
- Does it leave the user alone when nothing needs attention?
- Is every surface, dependency, and abstraction earning its cost?
- Can a failure be found, fixed, and delivered quickly?
- Does the result show restraint and coherent human judgment?
- Did we remove obsolete paths instead of preserving them by habit?
