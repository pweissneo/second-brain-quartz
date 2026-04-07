---
last-updated: 2026-03-28
last-reviewed: 2026-03-28
author-type: ai-assisted
lifecycle: resolved
verification-status: unverified
confidence: emerging
evidence-tier: established-convention
knowledge-source-type: analysis
analysis-type: deductive
applicability: universal
recurring: false
utility-type: potential
tags: [seed-gap, knowledge-sensitivity, frontier]
seealso: [[AI-Assisted Knowledge Management Seed]]
gap-status: resolved
gap-priority: n/a
gap-phase: resolved
resolved: 2026-04-02
resolution: "Rule added to Seed section 11 (Analysis-Sensitive Knowledge)"
---

# Seed Gap - Analysis-Sensitive Knowledge

> Knowledge that loses value when fully articulated or analyzed — distinct from tacit knowledge.

## The Gap

The Seed currently addresses:
- **Tacit knowledge** — knowledge that CANNOT be fully articulated (physical skills, intuitions)
- **Analysis-sensitive knowledge** — mentioned in the context of humor/comedy but not as a core principle

The gap: There's no formal Seed rule for knowledge that CAN be fully articulated but LOSES VALUE when analyzed or explained. This is distinct from tacit knowledge:

| Type | Can Be Articulated | Value When Articulated | Example |
|------|-------------------|------------------------|---------|
| Explicit knowledge | Yes | Retains value | Facts, procedures |
| Tacit knowledge | No | Cannot capture | "Feel" of a skill |
| Analysis-sensitive | Yes | DESTROYS value | Jokes, magic tricks |

## Why This Matters

1. **Prevents value destruction** — Capturing analysis-sensitive knowledge literally kills its value
2. **Separation principle** — Need explicit rules for what NOT to capture vs. what to capture
3. **Domain coverage** — Affects humor, magic, mystery, aesthetic appreciation, persuasion, some forms of creativity
4. **Testable** — This gap CAN produce a testable Seed rule

## Proposed Rule

**Rule:** For domains where analysis destroys value (humor, magic, mystery, aesthetic appreciation), separate principles from instances.
- Capture the PRINCIPLE (general theory of why humor works)
- EXCLUDE instances (specific jokes, punchlines, trick secrets)
- Mark analysis-sensitive notes with `sensitivity-type: analysis-destroyes-value` and `capture-principle-only: true`

**Why:** The moment you fully explain a joke, it stops being funny. The moment you reveal a magic trick, it loses its wonder. But the underlying principles (incongruity theory, misdirection techniques) retain value and can be captured. The rule must distinguish between what's worth capturing and what's value-destroying.

**Test:** 
1. Does this knowledge domain have instances where explaining kills the value?
2. If yes, can you separate the principle from the instance?
3. Have you marked the note with `capture-principle-only: true`?

## Edge Cases

- **Partial sensitivity** — Some knowledge is partially sensitive (explaining reduces but doesn't destroy value). Use `sensitivity-degree: high|medium|low`
- **Educational context** — Analysis-sensitive knowledge in educational contexts may be appropriate if the learner explicitly wants the analysis
- **Reversibility** — Once a joke is explained, it cannot be "un-explained"

## Related Seed Rules

- [[Frontier Exploration - Humor and Comedy Knowledge]] — Already captures this distinction but not as a core Seed rule
- Tacit knowledge rules — Related but distinct category
- Analysis-sensitive knowledge is mentioned in Seed under humor/comedy edge cases

## Status

This gap could produce a testable Seed rule with clear Yes/No test.

---

**Action:** If this gap is validated, incorporate rule into Seed with Rule/Why/Test format.
