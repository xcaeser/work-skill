# Work

[![skills.sh](https://skills.sh/b/xcaeser/work-skill)](https://skills.sh/xcaeser/work-skill)
[![GitHub](https://img.shields.io/badge/GitHub-xcaeser%2Fwork--skill-181717?logo=github)](https://github.com/xcaeser/work-skill)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Quality-first orchestration for coding agents.

Work turns a free-form request into one exact goal, gives bounded agents a
complete executor brief, keeps them running until they finish or hit a real
blocker, integrates the result in the parent thread, and proves the outcome
with evidence. It is designed for Codex and follows the portable Agent Skills
format used across modern coding agents.

## Install

Install the lead skill for Codex with the open skills CLI:

```bash
npx skills add xcaeser/work-skill --skill work --agent codex --global --yes
```

Install the complete Work family:

```bash
npx skills add xcaeser/work-skill --skill "*" --agent codex --global --yes
```

The same commands work with other supported agents by changing `--agent`
(for example, `claude-code`, `cursor`, or `opencode`). Browse the package at
[skills.sh](https://skills.sh/xcaeser/work-skill).

## Use it

Invoke Work in your agent conversation:

```text
$work Fix the intermittent login failure and ship the smallest verified repair.
```

Advanced execution controls stay explicit when you need them:

```text
$work 2 sol xhigh Investigate the data-loss report and implement the durable fix.
```

If you do not specify a team size, Work chooses the smallest useful team. If
you specify a model, effort, or count, Work asks what drove that choice and
recommends a better fit when the task calls for one.

## The Work family

| Skill | Use it for | Default behavior |
| --- | --- | --- |
| `$work` | Build, fix, or change a task | Accountable parent lead; bounded executors; independent verification |
| `$work-init` | Start a new project | Essential setup questions, minimal scaffold, real build proof |
| `$work-plan` | Plan before implementation | One read-only Sol xhigh analyst; Luna Max execution handoff |
| `$work-audit` | Audit code, diffs, or runtime flows | Evidence-first Sol xhigh review; Luna Max fix plan |
| `$work-clean` | Remove smells and overengineering | Read-only Sol xhigh simplification plan; package judgment included |
| `$work-quality` | Pass the quality bar into a conversation | No agents, edits, or project-state changes |
| `$work-status` | See current Work state | Read-only goal, agent, evidence, and blocker snapshot |
| `$work-help` | Remember the available skills | Compact map of the Work family |

These are separate skills, not subcommands. Some clients render them as
`Work / Audit` or `/work audit`; the canonical skill IDs are the hyphenated
names above.

## What Work protects

- **The parent owns the vision.** Agents receive the complete goal, source of
  truth, ownership, done criteria, non-goals, and validation commands. They
  execute; the parent decides, integrates, and verifies.
- **Agents finish their work.** A polling or tool-call timeout is not an agent
  failure. Work waits for `complete`, `blocked`, or a user-input request and
  interrupts only for an explicit cancellation or goal change, safety risk,
  duplicate ownership, an approved resource limit, or repeated no progress.
- **Evidence beats status.** Every handoff names concrete artifacts, exact
  locations, checks, and remaining gaps. Partial progress is not completion.
- **Explore without premature convergence.** Parallel work uses the smallest
  useful team, diverse approach families, adversarial checks, and explicit
  blocker tracking.
- **Quality is quiet and restrained.** Software should not break, demand
  attention, exceed its purpose, or preserve obsolete compatibility paths.

## Model routing

Automatic routing keeps ordinary work inexpensive and reserves deeper effort
for tasks that need it:

| Task shape | Route |
| --- | --- |
| Ordinary or unclear work | Sol Low |
| Unreproduced bug | Sol Medium |
| Architecture, difficult debugging, auth, migrations, or security | Sol xhigh |
| Critical or repeatedly unresolved failure | Sol Max |
| Approved implementation or mechanical refactor | Luna Max |
| Exploration or structured extraction | Luna High |

No model or effort is silently substituted when an explicitly requested setup
is unavailable.

## Repository layout

```text
SKILL.md                  # Root Work lead
skills/work-*/SKILL.md    # Dedicated Work modes
skills/QUALITY.md         # Shared quality and compatibility standard
agents/openai.yaml        # Codex UI metadata
skills.sh.json            # skills.sh grouping metadata
```

Every skill is a portable directory with `SKILL.md` YAML frontmatter. The
repository contains no runtime dependencies or bundled scripts.

## Validate locally

List the package with the skills CLI before publishing a change:

```bash
npx skills add . --list --full-depth
git diff --check
```

Then run the skill validator available in your Codex installation and verify
the relevant agent metadata. Keep each `SKILL.md` focused; move large,
conditional reference material into a directly linked resource.

## Contributing

Open an issue or pull request with a concrete task, evidence, and the smallest
focused change. Preserve the Work contract: bounded ownership, human-owned
decisions and copy, explicit validation, no silent compatibility layers, and no
claims of completion without proof.

## License

MIT. See [LICENSE](LICENSE).
