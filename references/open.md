# Open

Show clickable local links to the installed Work skill.

1. Resolve the absolute Work root as the directory containing the loaded `SKILL.md`. Do not assume a fixed home directory.
2. Return the root first as a visible, clickable absolute path:

```markdown
[Open /absolute/path/to/work](/absolute/path/to/work)
```

3. Follow with compact links to `SKILL.md` and every Markdown file directly inside `references/`, using their filenames as labels.
4. Use ordinary Markdown links with absolute filesystem paths. Do not use `file://`, relative targets, backticks around links, or code fences in the response.
5. Do not inspect the user's project, delegate work, or add setup commentary.

If the app cannot open directory links, retain the folder link and mention that the `SKILL.md` link opens the skill contents directly.
