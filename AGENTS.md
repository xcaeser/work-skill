# Work project rules

Read [`skills/QUALITY.md`](skills/QUALITY.md) before changing this project or any nested Work skill. Treat it as the project's quality bar.

- Quality software must not break at real boundaries, must not demand attention without a reason, must know its limits, fix failures quickly, and respect human attention and authorship.
- Never preserve backwards compatibility. Prefer a clean break, update all in-scope consumers together, and remove obsolete aliases, adapters, wrappers, flags, and migration shims. If an external contract cannot be removed, stop and escalate; do not invent an internal compatibility layer.
- Keep user data, recoverability, security, and truthful failure behavior safe; those are not compatibility shims.
- Keep agents bounded executors. The parent owns taste, decisions, integration, user-facing copy, and proof.
- Before work begins, state the exact goal, source of truth, acceptance checks, boundaries, and what does not count. Treat concrete artifacts and validation evidence as the only completion proof.
- For parallel investigation, diversify by approach family, preserve independent hypotheses early, track evidence and blockers, and challenge exact contracts and failure boundaries. Reopen blocked routes only for a materially new mechanism, within the user's scope and token budget.
- Use `Work / Quality` when the standard should be passed into a conversation; it never spawns agents or edits files.
