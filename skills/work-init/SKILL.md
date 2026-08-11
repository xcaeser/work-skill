---
name: work-init
description: Guide and verify the smallest useful new-project foundation by resolving essential product, platform, toolchain, dependency, and validation choices. Use when the user wants to initialize, scaffold, or start a project.
---

# Work / 1. Init

Create the smallest project foundation that builds and runs. Preserve
reliability, user state, simplicity, and clean breaks. Do not add product
features, speculative packages, compatibility scaffolding, or infrastructure
the foundation does not yet need.

## Resolve only essential choices

Inspect the destination and conversation before asking anything. Reuse answers already given. If the request is sufficient, proceed without an interview.

Ask no more than three short questions at a time, in this order:

1. What is being built, where should it live, and which platform must it run on?
2. Which language, runtime or toolchain, and minimum supported version are required?
3. Which packages, services, storage, authentication, and quality commands are genuinely required now?

Offer sensible defaults when local conventions or the ecosystem make them clear. Explain only choices with a meaningful tradeoff.

Before writing, state:

- **Foundation goal:** one end-to-end capability the scaffold must prove.
- **Ready when:** build, run, and relevant quality checks succeed.
- **Does not count:** an empty or unexecuted scaffold.
- **Deferred:** product features and infrastructure intentionally excluded.

## Build in working layers

1. Read local instructions and inspect the destination for unrelated files.
2. Create an idiomatic scaffold with native metadata and one obvious entry point.
3. Add only approved dependencies; prefer platform and existing workspace tooling.
4. Format or lint, run focused tests when behavior exists, and perform a clean build.
5. Start the project locally when safe and useful.
6. Exercise one relevant failure boundary, such as invalid configuration or a missing required dependency.
7. Inspect generated files and lockfiles. Report exact commands and evidence.

Do not invent tests for an empty entry point. When the scaffold establishes real
behavior, state the behavior being protected, why it matters, the test level,
and the exact observable assertion before test edits.

Do not spawn agents for the setup interview. If the work expands into product implementation, stop at the verified foundation and hand the scoped task to `$work`.

## Return

```markdown
## Work / 1. Init

**Goal:** <proved end-to-end capability>
**Created:** <important paths and dependencies>
**Run:** <command>
**Validation:** <commands and exact results>
**Failure boundary checked:** <check and result>
**Deferred:** <intentional non-goals>
**State:** complete / partial / blocked
```
