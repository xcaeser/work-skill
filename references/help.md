# Help

Show the user what Work can do without executing another command.

## No command argument

Render this compact menu:

```markdown
## Work

| Command | What it does |
|---|---|
| `$work <task>` | Automatically choose the team, models, and effort, then complete the task |
| `$work [N] [model] [effort] <task>` | Explain your proposed setup, receive a recommendation, then choose |
| `$work init [path]` | Set up a new project through a short guided flow |
| `$work plan <task>` | Define the result, boundaries, agents, order, and proof |
| `$work run [N] [profile] [effort] <task>` | Complete a task with a controlled team and agent models |
| `$work clean [scope]` (`$work cc`) | Simplify code without changing behavior |
| `$work review <target>` | Find evidence-backed risks without making changes |
| `$work status` | Show the current goal, agents, blockers, and next action |
| `$work check` | Check whether Work can run correctly here |
| `$work help [command]` | Show all commands or explain one |
| `$work open` | Open the Work skill and its files |

Start with `$work <task>`, `$work init`, or `$work plan <task>`.

Automatic example: `$work fix the login bug`.

Guided example: `$work 1 terra medium fix the login bug`. Work asks what drove the setup, recommends the task-appropriate configuration, and lets you choose before launch.

Models: `sol`, `terra`, `luna`, or `mix`. Omit selectors and Work routes automatically.
```

Keep the ordering above. Do not add generic introductory prose.

## Command argument

For a canonical command or `cc`:

1. Resolve `cc` to `clean`, then read the target command's directly linked reference when needed.
2. Return its syntax, purpose, behavior, and one short realistic example.
3. State material constraints that affect how it runs.
4. Keep the response under 180 words.
5. Do not execute the target command.

For an unknown help topic, name it and render the no-argument menu.
