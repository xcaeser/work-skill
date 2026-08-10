# Quality Software Standard

Apply this standard to every Work decision, plan, implementation, and review.

## The bar

1. **Do not break.** Exercise the real boundaries: offline use, hanging connections, retries, partial state, low battery, missing permissions, malformed input, upgrades, and interrupted work. Preserve user data and recoverability. A polished surface cannot compensate for unreliable behavior.
2. **Do not demand attention.** Prefer quiet, calm defaults. Do not add badges, banners, tours, notifications, or confirmation loops unless the user asked for them or the product cannot be safe without them.
3. **Know the limits.** Keep the purpose, surface area, dependencies, bundle size, and scope narrow. Resist agentic feature creep, speculative abstractions, and slop created merely because production is easy.
4. **Fix fast.** Make failures observable, isolate the smallest credible cause, ship the narrowest durable fix, and leave users where they were. Updates should do their work without ceremony or needless re-onboarding.
5. **Respect people.** Agents may build and verify software, but user-facing words a human is expected to read require human taste and authorization. Do not fill products with generated copy, tours, or explanations just because they are easy to produce.
6. **Use taste.** When metrics do not decide, choose the restrained, coherent, legible option. Consistency, hierarchy, wording, defaults, and details should feel intentional. The parent owns qualitative judgment; agents execute it.
7. **Make the hard work disappear.**

   > “Your work is done when it looks so simple that the consumer thinks they could have done it, which means they won’t appreciate how hard you worked.”
   > — Visualize Value

   Use simplicity as a craft constraint: remove unnecessary surface area and
   keep the result obvious without hiding failures, tradeoffs, or evidence.

## Taste as trained judgment

Treat taste as a cultivated skill, not an unchallengeable personal preference,
following Raphael Salaja's [The Concept of Taste](https://www.raphaelsalaja.com/library/the-concept-of-taste).
It grows through exposure, education, critique, experimentation, and attention
to cultural context.

- Ground qualitative choices in enduring fundamentals: hierarchy, clarity,
  balance, proportion, readability, composition, and emotional resonance.
- Use principles as tools for directing attention, not rigid rules that erase
  character or context.
- Study strong work across eras, disciplines, and cultures. Keep references,
  identify what makes them work, and borrow the underlying judgment rather than
  copying the visible surface.
- Distinguish a durable direction from a trend amplified by platforms or
  algorithms. Balance usability with character and resist novelty for its own
  sake.
- Train taste by making alternatives, articulating why one succeeds, inviting
  critique, and revisiting the result with fresh eyes.
- Explain important qualitative decisions. “I like it” is a preference, not a
  sufficient design rationale.

The goal is work that channels personal intuition through durable principles:
appropriate to its moment without becoming disposable when the trend passes.

## Empathy, focus, and impute

Apply Mike Markkula's 1977 Apple philosophy as an operating discipline:

- **Empathy.** Understand the user's real needs, context, constraints, and
  current behavior better than the surface request alone reveals. Listen before
  proposing, inspect the actual workflow, and distinguish evidence from
  assumption. Empathy is understanding, not automatic agreement.
- **Focus.** To do the chosen work exceptionally well, eliminate unimportant
  opportunities. State the essential outcome and non-goals, protect the few
  things that matter, and remove features, options, and branches that dilute
  them. A good idea can still be wrong for this product or this moment.
- **Impute.** People infer the quality of the whole from every visible detail.
  Present the product, code, documentation, and handoff with clarity,
  coherence, and professional care. Names, defaults, errors, layout, and
  wording must truthfully communicate the quality already present; polish must
  never conceal unreliable behavior.

## Friction as a feature

Use deliberate creation friction as a filter for judgment, following Emil
Kowalski's [Friction as a Feature](https://emilkowal.ski/ui/friction-as-a-feature).
AI makes implementation cheap, so effort no longer filters weak ideas for us.
Replace that lost constraint with explicit decisions:

- Before building, identify the real user, problem, evidence, essential outcome,
  non-goals, and why the idea deserves to exist now.
- Treat prototypes as instruments for thinking. Every variant must answer a
  named question and have a success signal, selection rule, or kill criterion.
- Building several options can create evidence; shipping all of them because
  they were cheap to make is a failure to decide.
- Do not mistake generated output for design. If no judgment shaped what was
  built, it merely exists.

Remove friction from routine use when it serves no purpose, but retain or add
friction where it protects judgment, user intent, safety, reversibility, or an
important decision. The burden must be proportional and explainable.

## Engineering discipline

- Choose the simplest implementation that fully meets the current
  requirements. Avoid speculative abstractions, configuration, and indirection.
- Grow the system in layers. Start from the smallest version that works end to
  end, and add each new capability on top of a product that already works.
  Never trade a working product for unfinished complexity.
- Keep components modular and concerns clearly separated.
- Prefer established, well-maintained libraries when they reduce overall
  complexity or improve reliability. Do not reimplement common functionality
  without a clear reason.
- Lean on project dependencies before writing new code or adding packages.
  Check documentation and types before assuming a capability is missing.
- Make architectural decisions for the long term; reject stopgaps intended to
  be replaced later.

## Meaningful testing

Before writing anything for a test task, inspect the implementation, existing
tests, public APIs, and actual user flows. Base every test on behavior the
application genuinely promises or currently depends on. Do not invent
requirements, hypothetical threats, or unrealistic edge cases.

- Test observable behavior, not internal implementation details.
- Prefer a small number of high-value tests over exhaustive low-value coverage.
- Prioritize core happy paths, realistic failures, important boundaries,
  previously broken behavior, and persistence, permissions, billing,
  authentication, or destructive actions when they are relevant.
- Add negative tests only for a real contract or regression, such as a
  documented validation error, private-data boundary, or transaction that must
  not partially persist.
- Do not test impossible states unless the code explicitly handles them.
- Do not add speculative security tests without a concrete attack surface.
- Do not assert framework, library, language, or trivial getter behavior.
- Do not reproduce the implementation in the test or mock the whole system and
  only verify calls. Mock external boundaries only when necessary: network,
  time, randomness, queues, email, payment providers, or databases.
- Prefer integration tests for interactions between owned modules.
- Use realistic inputs and fixtures. Keep tests deterministic and independent
  of execution order.
- Use the repository's existing framework, helpers, conventions, and layout.
- Do not change production code merely to satisfy an artificial test. If the
  code is genuinely hard to test, explain the smallest justified production
  change before making it.
- If a function has no meaningful behavior worth testing, do not create a test
  for coverage. Do not optimize for a coverage percentage.

Before implementing tests, provide this short plan:

1. **Behavior being protected**
2. **Why it matters**
3. **Test level:** unit, integration, or end-to-end
4. **Exact observable assertion**

Afterward, report tests added, behaviors covered, tests deliberately not added
and why, and any actual bug discovered. Assertions must verify the real result,
persisted state, returned error, emitted event, or externally visible side
effect.

Good candidates include creating an account that persists a normalized email,
rejecting a duplicate without a second record, making a webhook retry
idempotent, deleting one tenant's resources without affecting another, or
returning 401 for an expired session. Bad candidates include proving an
unrelated function does not delete users, checking a mocked function's return,
testing framework behavior, or asserting a call without checking what was
saved.

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
- Does the consumer experience the result as simple because complexity was
  removed, not merely moved or hidden?
- Is this the simplest implementation that fully meets the current requirements?
- Does each new layer sit on top of a product that already works?
- Are the boundaries modular, and did we check existing dependencies,
  documentation, and types before adding or reimplementing functionality?
- Is the architecture durable rather than a stopgap?
- Can a failure be found, fixed, and delivered quickly?
- Does the result show restraint and coherent human judgment?
- Is qualitative judgment grounded in fundamentals, references, critique, and
  context rather than personal preference or novelty alone?
- Did we understand the user's real situation, eliminate unimportant
  opportunities, and present the result with care that truthfully reflects its
  quality?
- Did deliberate friction force the decision and validation that cheap
  implementation no longer forces naturally?
- Did we remove obsolete paths instead of preserving them by habit?
