---
name: work-quality
description: Pass the shared Work quality standard directly into the current conversation without spawning agents, editing files, or changing project state. Use when the user asks for the quality bar, taste principles, or a ready-to-paste software standard.
---

# Work / Quality

Return the quality standard directly. Do not inspect the repository, spawn subagents, create goals, edit files, or perform validation.

Use this ready-to-paste block:

```text
Quality software does not break. Test real boundaries: offline use, hanging connections, retries, partial state, low battery, missing permissions, malformed input, upgrades, and interruption. Preserve user data and recoverability.

Quality software does not demand attention. Prefer quiet defaults. Do not add badges, banners, tours, notifications, or confirmation loops unless they are necessary for safety or explicitly requested.

Quality software knows its limits. Keep the purpose, surface area, dependencies, bundle size, and scope narrow. Resist agentic feature creep and slop created merely because production is easy.

Quality software fixes fast. Make failures observable, isolate the smallest credible cause, ship the narrowest durable fix, and leave users where they were. Updates should work without ceremony.

Quality software respects people. Agents may build and verify software, but user-facing writing a human is expected to read remains human-owned unless explicitly authorized.

Taste is consistent qualitative judgment. Choose the restrained, coherent, intentional option when metrics do not decide. The parent owns taste; agents execute it.

Never preserve backwards compatibility. Prefer clean breaks, update in-scope consumers together, and remove obsolete aliases, adapters, wrappers, flags, and migration shims. If an external contract cannot be removed, stop and escalate; do not invent an internal compatibility layer. Preserve user data, recoverability, security, and truthful failure behavior separately.
```

After the block, add one short sentence: “Apply this standard to the current conversation.” Keep the response compact and do not add implementation advice unless the user asks.
