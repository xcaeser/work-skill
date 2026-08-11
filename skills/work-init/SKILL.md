---
name: work-init
description: Guide and verify a minimal new project setup by asking only essential questions about project type, language, runtime, platforms, packages, and validation. Use when the user wants to start a new project.
---

# Work / 1. Init

Create the smallest useful project foundation through a short guided flow.

Read [../QUALITY.md](../QUALITY.md) first. Keep the scaffold focused, reliable at real boundaries, and free of compatibility scaffolding. Define proof before adding surface area.

## Ask first

Ask no more than three setup questions at a time, progressively:

1. Project name, destination, type, language/runtime, target platform, and minimum version.
2. Required packages, services, storage, authentication, and integrations.
3. Preferred test, lint, format, build, and run commands.

Use sensible defaults when the answer is discoverable from the workspace. Do not add speculative packages or infrastructure.

Before writing, state the exact foundation goal, source of truth, what “ready” means,
and what does not count (for example, an empty scaffold that has never built or
run). Keep the first setup intentionally narrow; defer product features until
the foundation proves itself. Grow in working layers: start with the smallest
end-to-end version and add each capability only after the product already works.
Never trade a working foundation for unfinished complexity.

If setup includes tests, inspect the implementation, existing tests, public
APIs, and actual user flows before writing them. State the four-line meaningful
test plan from [QUALITY.md](../QUALITY.md#meaningful-testing), use the native
framework and conventions, and add only tests that protect observed behavior.

## Build and verify

1. Inspect the destination and local instructions before creating files.
2. Create a minimal, idiomatic scaffold with native project metadata and one obvious entry point.
3. Install only approved dependencies.
4. Run formatting or linting, focused tests, and a clean build or equivalent.
5. Start the project locally when safe and useful.
6. Exercise the real boundary that the scaffold establishes: invalid configuration,
   missing dependencies, interrupted commands, or another relevant failure mode.
7. Inspect generated files and lockfiles, preserve unrelated files, and report exact commands and evidence. Do not call setup complete from a status message alone.

Do not launch agents for the setup interview. If the project becomes a substantial implementation, hand the scoped work to `work`.
