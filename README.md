# Work

[![skills.sh](https://skills.sh/b/xcaeser/work-skill)](https://skills.sh/xcaeser/work-skill)
[![GitHub](https://img.shields.io/badge/GitHub-xcaeser%2Fwork--skill-181717?logo=github)](https://github.com/xcaeser/work-skill)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Quality-first orchestration for coding agents.

Work turns a request into one exact goal, gives specialists complete bounded
task packets, and keeps the parent responsible for integration and proof. It is
designed for Codex and requires its goal and multi-agent tools for orchestrated
modes. Conversation-only focused skills may still load in other compatible clients.

## Install

```bash
npx skills add xcaeser/work-skill --skill '*' --agent codex --global --yes --full-depth
```

This installs `$work` and all numbered focused skills. Each focused skill is
self-contained, so installing only one is also supported:

```bash
npx skills add xcaeser/work-skill --skill work-plan \
  --agent codex --global --yes --full-depth
```

## Use

```text
$work Fix the intermittent login failure and ship the smallest verified repair.
$work 2 sol xhigh Investigate the data-loss report and implement the durable fix.
```

If no team size is given, Work chooses the smallest useful team and defaults
ordinary work to Sol Low. Explicit model, effort, and count requests remain
under the user's control: Work explains its recommendation and waits for
confirmation before launch. It will not invent duplicate assignments to satisfy
an oversized count. Numbering affects picker order only; command IDs stay stable.

## Skills

| Skill | Purpose |
| --- | --- |
| `$work` | Implement a task with an accountable parent lead |
| `1. $work-init` | Start a project with a minimal verified setup |
| `2. $work-ideate` | Brainstorm, challenge assumptions, and shape a testable direction |
| `3. $work-plan` | Produce a detailed read-only implementation plan |
| `4. $work-test` | Add a few meaningful tests for real observable behavior |
| `5. $work-concern` | Surface concrete concerns in the current implementation |
| `6. $work-checklist` | Turn ideas, plans, requirements, or concerns into an actionable checklist |
| `7. $work-audit` | Audit code, diffs, or runtime flows |
| `8. $work-clean` | Find smells, overengineering, and package opportunities |
| `9. $work-quality` | Pass the Work golden rules into the conversation |
| `10. $work-status` | Show the current goal, agents, evidence, and blockers |
| `11. $work-help` | Show the available Work skills |

## Workflow

1. Define one goal, ownership boundary, done criteria, and validation path.
2. Launch the smallest useful team with complete, disjoint task packets.
   Executors receive `fork_turns: none` and inspect only owned paths and direct consumers.
3. Keep materially different approaches independent until their real strengths
   and gaps are visible; track the approach families explicitly.
4. Require concrete changes, tests, lemmas, or other evidence—not status or
   optimism. Agents work until they finish or report a real blocker.
5. Have the parent integrate and verify independently. Report exact remaining
   gaps and reopen a blocked route only for a genuinely new mechanism.

These principles are informed by [OpenAI's proof prompt](https://cdn.openai.com/pdf/04d1d1e4-bc75-476a-97cf-49055cd98d31/cdc_prompt.pdf): diverse exploration, explicit route tracking, adversarial review, concrete evidence, and no premature return. Work applies that discipline to coding tasks; the PDF is not a Work API or model-pricing specification.

## Quality bar

- Software should not break, demand attention, or exceed its purpose.
- Keep decisions human-owned and user-facing writing human-readable.
- Apply empathy, focus, and impute: understand the real user, eliminate
  unimportant opportunities, and present the result with care that truthfully
  reflects its quality.
- Treat [taste as trained judgment](https://www.raphaelsalaja.com/library/the-concept-of-taste):
  use enduring fundamentals, references, critique, and context rather than
  preference or novelty alone.
- Use [friction as a feature](https://emilkowal.ski/ui/friction-as-a-feature):
  require judgment and validation before cheap implementation becomes product
  surface.
- “Your work is done when it looks so simple that the consumer thinks they
  could have done it, which means they won’t appreciate how hard you worked.”
  — Visualize Value.
- Prefer the smallest reliable change and remove obsolete compatibility paths.
- Treat “done” as a claim that current evidence proves.

## Testing

Before writing tests, inspect the implementation, existing tests, public APIs,
and actual user flows. Protect observed behavior with a few deterministic,
high-value tests using the repository's conventions. Prefer integration tests
for interactions between owned modules; mock only necessary external
boundaries. Avoid coverage-only tests, framework assertions, speculative
threats, impossible states, and tautological mocks. State the behavior, why it
matters, test level, and exact observable assertion first; report omissions and
real bugs afterward.

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

Discovery is structural proof, not behavioral proof. After changing a workflow,
forward-test that skill in a disposable task using a realistic user request and
inspect its raw launch, goal, handoff, and no-edit behavior as applicable. Routing,
fixed-analyst, or goal-lifecycle changes require representative `$work`,
`$work-plan`, and `$work-checklist` smoke tests before release.

Each skill uses a standard `SKILL.md` directory with no runtime dependencies or
bundled services. Orchestrated behavior still depends on Codex goal and agent tools.

## License

MIT. See [LICENSE](LICENSE).
