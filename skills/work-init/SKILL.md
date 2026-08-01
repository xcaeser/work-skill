---
name: work-init
description: Guide and verify a minimal new project setup by asking only essential questions about project type, language, runtime, platforms, packages, and validation. Use when the user wants to start a new project.
---

# Work / Init

Create the smallest useful project foundation through a short guided flow.

## Ask first

Ask no more than three setup questions at a time, progressively:

1. Project name, destination, type, language/runtime, target platform, and minimum version.
2. Required packages, services, storage, authentication, and integrations.
3. Preferred test, lint, format, build, and run commands.

Use sensible defaults when the answer is discoverable from the workspace. Do not add speculative packages or infrastructure.

## Build and verify

1. Inspect the destination and local instructions before creating files.
2. Create a minimal, idiomatic scaffold with native project metadata and one obvious entry point.
3. Install only approved dependencies.
4. Run formatting or linting, focused tests, and a clean build or equivalent.
5. Start the project locally when safe and useful.
6. Inspect generated files and lockfiles, preserve unrelated files, and report exact commands and evidence.

Do not launch agents for the setup interview. If the project becomes a substantial implementation, hand the scoped work to `work`.
