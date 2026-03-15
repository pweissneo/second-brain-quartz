---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
- seed-stress-test
- photography
- edge-case
- subjective-knowledge
---

# Stress Test: Diminishing Returns Rule in Photography Knowledge Base

## Seed Rule Being Tested
**Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility (improves vault answers), connection (links to 2+ existing naturally), uniqueness (adds new knowledge), effort (maintenance worth value).

**Test:** For the last 5 notes added to a mature topic: Do 3+ pass all four tests?

## Application to Photography Knowledge Base

### Where the Rule Works Well
- Camera gear notes (utility: high - helps users make purchasing decisions)
- Technical settings (utility: high - provides actionable information)
- Post-processing workflows (utility: high - enables reproducible results)

### Edge Case: Subjective Aesthetic Knowledge

**Problem:** In photography, much knowledge is about aesthetics and personal style:
- "Golden hour photography"
- "Composition rules like rule of thirds"
- "Color grading styles"

These notes score HIGH on:
- **Connection:** Links to lighting, composition, color theory naturally
- **Uniqueness:** Each note adds distinct knowledge
- **Effort:** Low maintenance - static content

But they score LOW on:
- **Utility:** Highly subjective - what's "useful" depends entirely on the user's aesthetic goals. A note about "moody desaturated look" might be brilliant for one photographer and useless for another.

**The Test is Not Executable:** An AI cannot objectively determine whether a note "improves vault answers" for subjective aesthetic knowledge. The test assumes utility is measurable, but in photography:
- Portrait photographers need different knowledge than landscape photographers
- Commercial work needs different knowledge than artistic expression
- "Utility" depends on the question being asked, not the note content

### Proposed Refinement to Test

The current test: "Do 3+ pass all four tests?"

The problem: It assumes all four tests are equally objective and measurable.

**Proposed new test:**
1. For objective-knowledge notes (technical, factual): apply all four criteria strictly
2. For subjective-knowledge notes (aesthetic, stylistic): apply connection + uniqueness + effort only; skip utility test or replace with "applicability-scope" check

**Alternative:** Add a domain-specific override - for domains where subjective knowledge dominates (art, music, design, photography), the diminishing returns test should be relaxed or re-scoped.

## Related Notes
- [[Domain Gap - Music Composition Knowledge Capture]] - similar issue for subjective knowledge
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]
- [[Stress Test - Self-Contained Notes Rule Across Domains]] - for understanding note completeness
- [[Confidence Markers]] - for handling subjective knowledge