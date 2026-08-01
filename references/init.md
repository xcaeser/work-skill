# Init

Create a minimal new project through a short guided setup. Ask only questions that change the result, recommend sensible defaults, and do not write files until the user confirms the setup.

## 1. Ask

Use the host's structured input UI when available; otherwise ask conversationally. Never ask more than three questions in one response, and do not re-ask facts the user already supplied.

Ask in three stages:

1. **Basics:** project name and folder; project type; language, runtime, target platforms, and minimum versions.
2. **Setup:** framework, build system, and package manager; capabilities needed now; required or forbidden packages and whether Work should recommend a minimal set.
3. **Repository:** Git initialization, license, and whether to create `AGENTS.md`.

Offer project types as a short list: mobile, desktop, web app, API or service, CLI, library or package, data or automation, or another named type. Ask about capabilities such as UI, storage, networking, authentication, database, observability, tests, formatting, linting, or CI only after the basics are known.

When the user is unsure, present a recommended choice first with a one-sentence reason and at most two credible alternatives. Ask about capabilities before listing packages; users should not need to know package names to get a good setup.

## 2. Choose packages carefully

Prefer, in order:

1. the standard library and platform frameworks
2. packages already required by the selected project generator
3. mature, focused packages that remove meaningful implementation or security risk
4. small local code for trivial or project-specific needs

Verify current package facts against official documentation and the authoritative registry. Check maintenance, stable releases, target compatibility, license, security advisories, transitive dependencies, size, and ecosystem adoption. Do not recommend a package from memory when this information may have changed.

Avoid overlapping packages, speculative infrastructure, large dependency bundles for one small feature, and tools without an immediate configured use. Every selected package must have a named purpose.

## 3. Confirm

Before creating files, show:

```markdown
## New project

**Name:** <name>
**Location:** <absolute path>
**Type:** <project type>
**Language:** <language and version>
**Framework:** <framework or "None">
**Package manager:** <manager>
**Packages:** <package — purpose, or "None">
**Tooling:** <tests, formatter, lint, build>
**Targets:** <platforms and minimum versions>
**Git:** <Yes/No>
**AGENTS.md:** <Yes/No>
**Not included:** <explicit exclusions>

Create this project? Yes/No
```

If the user says to use defaults, select the smallest stable setup, show it, and proceed without another question unless an irreversible or externally visible action is involved.

## 4. Create

After confirmation:

1. Inspect the target. Never overwrite a non-empty folder or unrelated files.
2. Register the exact root goal. Stop on an unrelated active-goal conflict.
3. Route the confirmed setup through the automatic model policy. Prefer one Luna Max executor when the specification is complete; use Sol Medium when material setup ambiguity remains.
4. Give the agent the confirmed setup as a fixed specification. Require its own exact goal before implementation.
5. Prefer the ecosystem's official generator when it produces the confirmed minimal structure. Do not accept unwanted sample screens, packages, telemetry, or deployment configuration; remove generator extras safely.
6. Create only the selected source structure, package manifest, build configuration, focused starter test, ignore rules, and confirmed repository guidance.
7. Install only approved dependencies. Do not create a remote repository, publish a package, deploy, add credentials, or enable paid services unless explicitly requested.
8. After successful launches and before waiting, post this table. Use `agent` for one launch and `agents` otherwise:

```markdown
Launched N agent(s):

| Agent | Working on | Goal | Ownership | Model |
|---|---|---|---|---|
| <call sign> (`<task_id>`) | Create <confirmed setup slice> | <goal> | `<paths/subsystem>` | `<model>`, <effort> |
```

Include one row per successful launch. Never claim a launch before it succeeds; list failed launches separately with their exact blockers.

## 5. Verify

Run dependency installation, formatting or linting, focused tests, and a clean build or equivalent. Start the project locally when that proves the scaffold works and can be done safely. Inspect generated files and lockfiles, then report:

- what was created
- commands to run, test, and build it
- packages selected and why
- validation results
- anything intentionally deferred

Complete the root goal only after the confirmed setup works.
