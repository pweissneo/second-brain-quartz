---
last-reviewed: 2026-03-25
last-updated: 2026-03-25
lifecycle: historical
confidence: high
author-type: ai-assisted
verification-status: verified
tags:
  - seed-gap
  - verification
  - empirical-validation
  - resolved
schema-version: "1.0"
---

# Seed Gap - Empirically Validatable Knowledge (RESOLVED)

## Status: RESOLVED (2026-03-25)

This gap has been resolved through Seed rule additions on 2026-03-24:

1. **Added empirical validation rule** — Seed now includes:
   - Edge case for domains requiring empirical validation (game design, UX, teaching)
   - Rule: "Distinguish empirically validatable knowledge from source-verifiable knowledge"
   - Frontmatter fields: `validation-mode: empirical`, `empirical-evidence:`

2. **Verification workflow updates** — Added verification workflow for experiential domains with `verification-status: testing|verified|failed|blocked`

## Test for Gap Closure

✅ 1. Does the Seed have explicit guidance for empirically validatable knowledge? — **YES** (lines 244-256)

✅ 2. Does the Seed include `validation-mode:` and `empirical-evidence:` fields? — **YES**

✅ 3. Is there a verification workflow for experiential domains? — **YES**

## Resolution Note

The gap was discovered during a FLUFF_DETECTOR compliance audit and resolved before the next heartbeat cycle completed. This demonstrates the vault's self-improvement capability.

## Examples of Affected Domains

- **Game design:** "This mechanic is fun" - only verifiable through playtesting
- **UX design:** "This interface is intuitive" - only verifiable through user testing
- **Teaching:** "This explanation works" - only verifiable through student comprehension
- **Cooking:** "This technique produces good results" - only verifiable through making the dish
- **Fitness:** "This exercise is effective" - only verifiable through personal experience

## Why This Matters

Knowledge that requires empirical validation has different quality criteria:
- Source quality matters less than user testing results
- Confidence should be tied to testing evidence, not source credibility
- "Verification status" needs a new category: "empirically tested"

## Proposed Rule

**Rule:** Distinguish empirically validatable knowledge from source-verifiable knowledge.

**Why:** Knowledge that can only be validated through direct user experience (gameplay, UX testing, teaching) follows different quality rules than knowledge verifiable through sources. Applying source-verification rules to empirically-validatable knowledge creates false confidence (source looks good) or false doubt (no reliable sources exist for "this feels fun").

**Test:** For any knowledge claim about user experience, fun, difficulty, or intuition: (1) Is this empirically testable? (2) Has it been tested with actual users? (3) Is confidence tied to testing evidence rather than source quality?

**Implementation:** Add frontmatter field:
```yaml
validation-mode: source | empirical | both
empirical-evidence: playtest-results | user-testing | field-validation
```

## Related Notes

- [[Frontier Exploration - Game Design Knowledge Bases]]
- [[Frontier Gap - Embodied Knowledge]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Fitness Knowledge Base]]

## Discovery Note

This gap was discovered during: FLUFF_DETECTOR compliance audit (2026-03-25) - audit of random note "Frontier Exploration - Game Design Knowledge Bases" revealed the Seed lacks guidance for empirically validatable knowledge.