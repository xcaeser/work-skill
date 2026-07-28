# Help

Show the user what Work can do without executing another command.

## No command argument

Render this compact menu:

```markdown
## Work

| Command | What it does |
|---|---|
| `$work boss <task>` | Execute a clear vision through lean, bounded agents |
| `$work brief <task>` | Prepare the exact outcome, crew, waves, and proof before launch |
| `$work audit <target>` | Independently challenge existing work with evidence |
| `$work status` | Show the live Work goal, crew, blockers, and next action |
| `$work doctor` | Check whether this Codex harness can honor Work's contracts |
| `$work help [command]` | Show all commands or explain one |
| `$work open` | Open the installed Work skill and its core files |

Try: `$work brief <task>`, then `$work boss use that brief`.
```

Keep the ordering above. Do not add generic introductory prose.

## Command argument

For a canonical command:

1. Read the target command's directly linked reference when needed.
2. Return its syntax, purpose, behavior, and one short realistic example.
3. State material constraints that affect how it runs.
4. Keep the response under 180 words.
5. Do not execute the target command.

For an unknown help topic, name it and render the no-argument menu.
