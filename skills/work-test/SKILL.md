---
name: work-test
description: Inspect a codebase and write a small number of high-value tests for real, observable behavior using the repository's existing framework and conventions. Use when the user asks to add, improve, or write meaningful tests without optimizing for coverage.
---

# Work / 4. Test

Write meaningful tests for behavior the product genuinely promises or currently depends on. Read [../QUALITY.md](../QUALITY.md#meaningful-testing) before acting; its testing standard is binding.

Work directly in the parent conversation. Do not spawn agents or register a goal unless the user explicitly asks. Testing is implementation work: inspect first, show the plan, make the smallest justified edits, run the tests, and report the evidence.

## Inspect before writing

Read the applicable project instructions, repository status and diff, implementation, existing tests and helpers, public APIs, consumers, and actual user flows. Identify the behavior users or current callers rely on. Do not invent requirements, hypothetical threats, or unrealistic edge cases.

If the user did not name a target, choose the smallest coherent feature or current change that can be understood and tested safely. State the scope. If no meaningful behavior is worth testing, stop and explain why; never add a test only to increase coverage.

## Publish the test plan

Before editing, provide one entry per justified behavior in this exact format:

1. **Behavior being protected**
2. **Why it matters**
3. **Test level:** unit, integration, or end-to-end
4. **Exact observable assertion**

Keep the plan short. Prefer a small number of high-value tests in this order:

1. Core happy paths.
2. Realistic failure paths.
3. Important boundaries.
4. Previously broken behavior.
5. Data persistence, permissions, billing, authentication, or destructive actions when relevant.

## Select meaningful tests

- Test observable behavior, not internal implementation details.
- Test negative behavior only when a real contract or regression needs protection.
- Prefer integration tests for interactions between modules owned by the project.
- Mock external boundaries only when necessary: network APIs, time, randomness, queues, email, payment providers, or databases.
- Use realistic inputs and fixtures. Keep tests deterministic and independent of execution order.
- Assert the actual result, persisted state, returned error, emitted event, or externally visible side effect.
- Keep each test focused on one behavior without splitting a simple workflow into redundant cases.

Do not test unrelated non-events, impossible states the code does not handle, speculative attack surfaces, framework or language behavior, trivial accessors, or library behavior. Do not reproduce the implementation inside the assertion. Do not mock the whole system and merely verify calls.

## Implement

Use the repository's existing test framework, conventions, helpers, fixtures, and directory structure. Update obsolete tests when the current owned contract changed; do not retain compatibility tests for a superseded path.

Do not modify production code to satisfy an artificial test. If real behavior is difficult to test, explain the smallest justified production change before making it. Pause for user direction if that change alters public behavior or expands the requested scope.

When a justified test exposes a production bug, preserve and report the evidence. Fix it only when the request clearly includes the repair; otherwise do not silently broaden test work into product changes.

## Validate

Run the narrowest relevant test command first, then the appropriate broader suite. Re-run failures when useful and distinguish failures caused by this work from established or unrelated baseline failures. Do not claim the suite is green unless the command proves it.

Do not optimize for coverage percentage. Report coverage only when the user explicitly asks, and never use it as a substitute for confidence in real behavior.

## Return

Use this compact handoff:

```markdown
## Work / 4. Test

**Scope:** <implementation and behavior inspected>

### Test plan
| Behavior | Why it matters | Level | Observable assertion |
|---|---|---|---|
| ... | ... | ... | ... |

**Tests added:** <files and cases>
**Behaviors covered:** <real contracts protected>
**Tests deliberately not added:** <omissions and why>
**Actual bugs discovered:** <bugs or none>
**Validation:** <commands and exact results>
**Remaining gap:** <none or the precise unproved boundary>
```

Say `complete`, `partial`, or `blocked` plainly. Completion means the justified tests were implemented and the reported validation actually ran.
