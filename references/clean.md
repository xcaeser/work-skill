# Clean

Simplify a bounded code scope without changing intended behavior, public contracts, or product design.

## Establish the scope and baseline

1. Prefer an explicit path, subsystem, feature, or diff supplied by the user.
2. With no scope, use the current dirty diff and its directly affected symbols. If the tree is clean, use the smallest module clearly implied by the thread. Ask for scope rather than starting a whole-repository cleanup when neither exists.
3. Read applicable instructions, inspect `git status` and the relevant diff, and identify the real build and test commands.
4. Record existing failures before editing so they are not attributed to the cleanup.
5. Define observable **Done when** criteria and list tempting changes that **Do not count**.

Preserve unrelated user edits. Do not turn a scoped cleanup into a repository-wide rewrite.

## Select only defensible transformations

Prefer changes that reduce concepts, indirection, or duplicated behavior:

- delete dead, unreachable, obsolete, or duplicate code only after checking references, generated consumers, runtime registration, and tests
- inline or remove one-use helpers, pass-through wrappers, flag funnels, and abstractions whose names or contracts add no useful information
- simplify nested branching, state transitions, data flow, and error handling without weakening correctness
- remove speculative protocols, factories, generics, configuration layers, or dependencies that support no real variation
- consolidate repeated behavior into a shared component only when at least two real consumers have the same semantics and a stable, cohesive interface
- split an oversized mixed-responsibility unit into focused components when the new boundaries are independently usable or testable
- remove stale comments and replace misleading cleverness with direct code

Keep a focused helper when it communicates intent, isolates a side effect, improves testing, or has genuine reuse. Do not optimize for the fewest functions or lines.

**Does not count:**

- formatting, renaming, or moving code without reducing complexity
- hiding complexity behind a new utility, manager, base class, or generic wrapper
- extracting a "shared" component with one consumer or incompatible consumers
- applying DRY mechanically when duplication is clearer than coupling
- changing behavior, API shape, persistence, schema, security posture, or UX without explicit authorization
- deleting tests, weakening types, swallowing errors, or silencing warnings to make the result look cleaner
- adding a dependency for a cleanup the existing stack can express

## Use proven packages with judgment

Before writing or keeping homegrown infrastructure, compare these options in order:

1. the language or platform standard library
2. a suitable package already used by the project
3. a mature external package
4. focused local code when the need is small or domain-specific

Prefer a package only when it reduces total complexity, defect risk, and maintenance cost. Popularity alone is not enough. Check current official documentation and the authoritative package registry when package facts may have changed.

For every new or replacement package, verify:

- active maintenance, stable releases, and support for the project's target versions
- license fit, security history, and unresolved advisories
- API quality, testability, documentation, and ecosystem adoption
- transitive dependencies, binary or bundle cost, runtime impact, and lock-in
- a clear migration path that preserves behavior and removes enough local code to justify the dependency

Do not add a package for a trivial helper, a single call site, or functionality the platform already handles well. Keep or improve local code when the package adds more surface area than it removes. Record packages considered, chosen, and rejected with one concrete reason each.

## Execute with focused agents

Keep candidate selection and architectural judgment in the parent. For an actionable scope:

1. Require `get_goal`, `create_goal`, and `update_goal`. Reuse a matching active goal, create the exact cleanup goal when no unfinished goal exists, and stop on an unrelated active-goal conflict.
2. Use one executor by default. Add another only for a disjoint module with no shared write ownership.
3. Launch each executor with `gpt-5.6-sol`, `reasoning_effort: low`, and `fork_turns: none`.
4. Give it a fun call sign, exact goal, paths and symbols it owns, approved transformations, behavior boundaries, validation commands, and explicit non-goals.
5. Require it to register its exact goal before editing, work in small coherent batches, and mark the goal complete only after its checks pass.
6. Post this roster after successful spawns and before waiting:

```text
Launched N agents:
- <call sign> (`<task_id>`) — cleaning <scope>; Goal: <goal>; Ownership: <paths/symbols>; Model: gpt-5.6-sol, low
```

If the exact goal or spawn contract is unavailable, report the blocker. Do not silently substitute a model, perform the whole cleanup locally, or create a user-owned task as a fake subagent.

Do not delegate an open-ended request to "clean everything." Agents implement approved cleanup slices; the parent owns what should exist afterward.

## Verify behavior and simplification

After each coherent batch:

1. Compile or run the narrowest relevant static checks.
2. Run focused tests, then broader checks proportional to the affected surface.
3. Search for stale references, registrations, imports, fixtures, and documentation.
4. Inspect the actual diff for accidental behavior or API changes and unrelated churn.
5. Run repository hygiene checks such as `git diff --check`.
6. Confirm the result reduced real complexity instead of relocating it.

The parent integrates all slices, verifies the final workspace independently, and completes the root goal only when every criterion passes.

## Report

Lead with the behavioral outcome. Then list:

- code removed, simplified, or consolidated, with the affected symbols
- shared components created and their real consumers
- validation results and intentionally retained helpers or duplication with the reason
- pre-existing failures, residual smells, or boundaries not touched
