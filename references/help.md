# Help

Show the user what Work can do without executing another command.

## No command argument

Render this compact menu:

```markdown
## Work

| Command | What it does |
|---|---|
| `$work boss <task>` | Execute a clear vision through lean, bounded agents |
| `$work help [command]` | Show all commands or explain one |
| `$work open` | Open the installed Work skill and its core files |

Try: `$work boss implement <your task and constraints>`
```

Keep the ordering above so the primary workflow appears first. Do not add generic introductory prose.

## Command argument

For `help boss`, `help open`, or `help help`:

1. Read the target command's directly linked reference when needed.
2. Return its syntax, purpose, behavior, and one short realistic example.
3. State material constraints that affect how it runs.
4. Keep the response under 180 words.
5. Do not execute the target command.

For an unknown help topic, name it and render the no-argument menu.
