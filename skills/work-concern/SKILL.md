---
name: work-concern
description: Inspect the current implementation and surface a short list of concrete, evidence-backed concerns without editing or producing a full audit or fix plan. Use when the user asks what gives you pause, what might be wrong, or wants a lightweight implementation sanity check.
---

# Work / 5. Concern

Answer this question:

> What about the current implementation gives you pause? Identify only concrete
> risks, weak assumptions, or user-facing failure modes supported by the code
> and actual flow. What should be verified next before trusting it?

This is a lightweight, read-only judgment pass. Apply reliability, simplicity,
user-state safety, meaningful testing, and clean-break rules directly. Do not
spawn agents, create goals, edit files, commit, deploy, or produce a full fix
plan. Use `$work-audit` when the user wants exhaustive review, severity-ranked
findings, or a detailed executor-ready remediation plan.

## Inspect

1. Use the target named by the user. Otherwise inspect the current diff,
   implementation discussed in the conversation, or the smallest relevant
   feature and its consumers.
2. Read local instructions, the implementation, existing tests, public APIs,
   call sites, and the actual user flow before forming a concern.
3. Check only material axes supported by the target: correctness, reliability,
   data integrity, permissions, security, destructive actions, persistence,
   error recovery, usability, maintainability, and meaningful test coverage.
4. Distinguish a verified concern from an unknown, tradeoff, taste judgment, or
   preference. Do not turn uncertainty into a finding.

## Judgment

- Prefer two strong concerns over ten speculative ones.
- Cite the exact path, symbol, behavior, test, or observation behind each concern.
- Explain the realistic consequence, not an imaginary catastrophe.
- Do not invent requirements, impossible states, hypothetical attacks, or edge
  cases the implementation neither promises nor handles.
- Do not flag framework behavior, stylistic preference, or deliberate tradeoffs
  as defects without evidence of material harm.
- Do not create a concern to fill the response. If nothing material survives
  inspection, say so and name the limits of the review.
- Keep remediation to one smallest next check. Do not redesign or prescribe a
  full solution unless the user asks.
- Use `high` confidence for directly reproduced or contract-proven concerns,
  `medium` for strongly supported code-path risks, and `low` only for an
  important unknown with a decisive next check. Do not pad the table with low-confidence items.

## Return

```markdown
## Work / 5. Concern

**Scope:** <implementation inspected>
**Question:** What about this implementation gives us pause?

| Concern | Why it matters | Evidence | Confidence | Verify next |
|---|---|---|---|---|
| <concise concern> | <realistic consequence> | <exact location or behavior> | high / medium / low | <smallest decisive check> |

**Unknowns:** <important unresolved facts, or "None">
**Review limit:** <what was not inspected or proved>
**Bottom line:** <one candid sentence, including "No material concerns found" when appropriate>
```

Order concerns by likely impact. Keep the response compact and proportional to
the evidence. Do not imply the pass was comprehensive when it was not. Use
`$work-checklist` when the user wants to register a goal and resolve the concerns.
Use `$work-test` instead when the only justified action is protecting observed behavior with tests.
