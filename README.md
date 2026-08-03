# Work

[![skills.sh](https://skills.sh/b/xcaeser/work-skill)](https://skills.sh/xcaeser/work-skill)
[![GitHub](https://img.shields.io/badge/GitHub-xcaeser%2Fwork--skill-181717?logo=github)](https://github.com/xcaeser/work-skill)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Quality-first orchestration for coding agents.

Work turns a request into one exact goal, gives specialists complete bounded
briefs, and keeps the parent responsible for integration and proof. It is a
portable Agent Skill for Codex and other compatible coding agents.

## Install

```bash
npx skills add xcaeser/work-skill --skill work --agent codex --global --yes
```

Install one focused mode by pointing the CLI at its folder:

```bash
npx skills add https://github.com/xcaeser/work-skill/tree/main/skills/work-plan \
  --agent codex --global --yes
```

## Use

```text
$work Fix the intermittent login failure and ship the smallest verified repair.
$work 2 sol xhigh Investigate the data-loss report and implement the durable fix.
```

If no team size is given, Work chooses the smallest useful team. Explicit
model, effort, and count requests remain under the user's control.

## Skills

| Skill | Purpose |
| --- | --- |
| `$work` | Implement a task with an accountable parent lead |
| `$work-init` | Start a project with a minimal verified setup |
| `$work-plan` | Produce a detailed read-only implementation plan |
| `$work-audit` | Audit code, diffs, or runtime flows |
| `$work-clean` | Find smells, overengineering, and package opportunities |
| `$work-quality` | Pass the Work golden rules into the conversation |
| `$work-status` | Show the current goal, agents, evidence, and blockers |
| `$work-help` | Show the available Work skills |

## Workflow

1. Define one goal, ownership boundary, done criteria, and validation path.
2. Launch the smallest useful team with complete executor briefs.
3. Keep materially different approaches independent until their real strengths
   and gaps are visible; track the approach families explicitly.
4. Require concrete changes, tests, lemmas, or other evidence—not status or
   optimism. Agents work until they finish or report a real blocker.
5. Use adversarial checks, then have the parent integrate, verify, and report
   remaining gaps. Reopen a blocked route only with a genuinely new mechanism.

These principles are informed by [OpenAI's proof prompt](https://cdn.openai.com/pdf/04d1d1e4-bc75-476a-97cf-49055cd98d31/cdc_prompt.pdf): diverse exploration, explicit route tracking, adversarial review, concrete evidence, and no premature return. Work applies that discipline to coding tasks; the PDF is not a Work API or model-pricing specification.

## Quality bar

- Software should not break, demand attention, or exceed its purpose.
- Keep decisions human-owned and user-facing writing human-readable.
- “Your work is done when it looks so simple that the consumer thinks they
  could have done it, which means they won’t appreciate how hard you worked.”
  — Visualize Value.
- Prefer the smallest reliable change and remove obsolete compatibility paths.
- Treat “done” as a claim that current evidence proves.

## Engineering discipline

- Choose the simplest implementation that fully meets current requirements.
- Grow in working layers; never trade a working product for unfinished
  complexity.
- Keep components modular and concerns clearly separated.
- Check existing dependencies, documentation, and types before reimplementing
  functionality or adding a package.
- Make architectural decisions for the long term, not as temporary stopgaps.

## Validate

```bash
npx skills add . --list --full-depth
git diff --check
```

Each skill is a portable directory with `SKILL.md` frontmatter. The package
has no runtime dependencies or bundled services.

## License

MIT. See [LICENSE](LICENSE).
