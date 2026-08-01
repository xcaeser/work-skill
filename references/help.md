# Help

Show the user what Work can do without executing another command.

## No command argument

Render this compact menu:

```markdown
## Work

| Command | What it does |
|---|---|
| `$work init [path]` | Set up a new project through a short guided flow |
| `$work plan <task>` | Use Sol High to produce a detailed, read-only Luna Max execution plan |
| `$work [N] [profile] [effort] <task>` | Complete a task with a controlled team and agent models |
| `$work audit [target]` | Use Sol High to find risks and produce a detailed Luna Max fix plan |
| `$work clean [scope]` (`$work cc`) | Use Sol High to identify smells; the parent owns any cleanup edits |
| `$work status` | Show the current goal, agents, blockers, and next action |
| `$work help [command]` | Show all commands or explain one |

Start with `$work <task>`, `$work init`, or `$work plan <task>`. `$work run ...` is an optional explicit spelling for a task.

Automatic example: `$work fix the login bug`.

Guided example: `$work 1 terra medium fix the login bug`. Work asks what drove the setup, recommends the task-appropriate configuration, and lets you choose before launch.

Models: `sol`, `terra`, `luna`, or `mix`. Omit selectors and Work routes automatically.
```

Keep the ordering above. Do not add generic introductory prose.

## Command argument

For `init`, `plan`, `audit`, `clean`, `status`, `help`, `run`, or a task:

1. Read the directly linked reference when needed.
2. Return its syntax, purpose, behavior, and one short realistic example.
3. State material constraints that affect how it runs.
4. Keep the response under 180 words.
5. Do not execute the target command.

For an unknown help topic, name it and render the no-argument menu.
