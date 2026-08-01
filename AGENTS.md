# Work project rules

Read [`skills/QUALITY.md`](skills/QUALITY.md) before changing this project or any nested Work skill. Treat it as the project's quality bar.

- Quality software must not break at real boundaries, must not demand attention without a reason, must know its limits, fix failures quickly, and respect human attention and authorship.
- Never preserve backwards compatibility. Prefer a clean break, update all in-scope consumers together, and remove obsolete aliases, adapters, wrappers, flags, and migration shims. If an external contract cannot be removed, stop and escalate; do not invent an internal compatibility layer.
- Keep user data, recoverability, security, and truthful failure behavior safe; those are not compatibility shims.
- Keep agents bounded executors. The parent owns taste, decisions, integration, user-facing copy, and proof.
- Use `Work / Quality` when the standard should be passed into a conversation; it never spawns agents or edits files.
