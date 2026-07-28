# Help

Show the user what Work can do without executing another command.

## No command argument

Render this compact menu:

```markdown
## Work

| Command | What it does |
|---|---|
| `$work init [path]` | Set up a new project through a short guided flow |
| `$work plan <task>` | Define the result, boundaries, agents, order, and proof |
| `$work run <task>` | Complete a task through focused agents |
| `$work clean [scope]` (`$work cc`) | Simplify code without changing behavior |
| `$work review <target>` | Find evidence-backed risks without making changes |
| `$work status` | Show the current goal, agents, blockers, and next action |
| `$work check` | Check whether Work can run correctly here |
| `$work help [command]` | Show all commands or explain one |
| `$work open` | Open the Work skill and its files |

Start with `$work init`, `$work plan <task>`, or `$work run <task>`.
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
