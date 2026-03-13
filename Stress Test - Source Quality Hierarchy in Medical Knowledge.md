---
author-type: ai-assisted
last-reviewed: 2026-03-10
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- medical-domain
- source-quality
- evidence-hierarchy
---
author-type: ai-assisted

# Stress Test: Source Quality Hierarchy in Medical Knowledge

## Seed Rule Being Tested
**Rule:** For knowledge domains with established evidence hierarchies (medicine, law, science), capture source quality tier in addition to confidence levels.
**Test:** For notes in medicine, law, or science: (1) Does each major claim cite a source? (2) Is there source-tier metadata (systematic-review/rct/observational/case-study/expert-opinion/anecdote)? (3) Do claims from higher-tier sources receive higher confidence markers?

## Application to Medical Knowledge Base

### Where the Rule Works Well

Medical knowledge has well-established evidence hierarchies:
- **Systematic reviews** (highest quality)
- **Randomized controlled trials (RCTs)**
- **Observational studies**
- **Case reports**
- **Expert opinion**
- **Anecdote** (lowest quality)

The rule correctly identifies that source quality is different from confidence:
- A systematic review might show "confidence: high" 
- Expert opinion might show "confidence: emerging"

### Edge Case: Conflicting Source Tiers

**Problem:** What happens when a lower-tier source contradicts a higher-tier source?

> **Illustrative example** (hypothetical): Note says "Vitamin C cures common cold" with:
> - Source: "A doctor mentioned this in a podcast" (expert opinion)
> - Confidence: high (because the author believes it)
> 
> Contradicted by: Systematic review showing no evidence

**Test Question:** Should confidence reflect the source quality or the author's belief?

**Analysis:** The rule says source quality IN ADDITION to confidence. But it doesn't specify what to do when they conflict.

**Verdict:** The Seed should clarify: when lower-tier sources contradict higher-tier sources, the note should present the conflict explicitly and default to higher-tier evidence.

### Edge Case: Compound Claims

**Problem:** A note may contain multiple claims from different source tiers.

> **Illustrative example** (hypothetical): Note on "Heart Disease Prevention" contains:
> - Claim A: "Statins reduce mortality" - Source: RCT (high quality)
> - Claim B: "Meditation reduces stress" - Source: observational study (medium)
> - Claim C: "Green tea helps" - Source: anecdote (low)

**Test Question:** Should the note have one source-tier, or per-claim source tiers?

**Analysis:** The current rule says "each major claim" should have source tier. But notes often don't explicitly mark claims.

**Verdict:** The Seed should require: for multi-claim notes, either (1) split into atomic notes per source tier, or (2) clearly mark each claim with its source tier inline.

### Edge Case: Clinical Guidelines

**Problem:** Clinical guidelines (e.g., from AHA, WHO) are important but not the same as primary research.

> **Illustrative example** (hypothetical): A note cites "American Heart Association Guidelines 2023"
> - Is this systematic review? Expert opinion? Something else?

**Test Question:** How should clinical guidelines be categorized in the source tier system?

**Analysis:** Guidelines are synthesized evidence - they're between RCTs and systematic reviews in reliability. They're not primary research but they're not mere opinion either.

**Verdict:** Add "guideline" as a source tier, or clarify that guidelines count as systematic-level evidence when from reputable bodies.

### Edge Case: Medical Education vs. Clinical Practice

**Problem:** Medical textbooks present "accepted knowledge" but the source tier is unclear.

> **Illustrative example** (hypothetical): A note on "Diabetes Management" cites "Harrison's Principles of Internal Medicine"
> - This is a textbook, not a primary source
> - But it's considered authoritative in medical education

**Test Question:** What's the source tier for textbook knowledge that's generally accepted but not directly cited to primary sources?

**Analysis:** This is a common problem - medical knowledge is often taught from textbooks that synthesize many sources without citing them.

**Verdict:** The Seed should add "textbook/educational" as a source tier, or require notes to distinguish between (a) directly cited sources and (b) "background knowledge" that's generally accepted but not specifically sourced.

### Edge Case: Outdated Sources

**Problem:** Medical knowledge changes rapidly. A source from 1990 might be systematically wrong by today's standards.

> **Illustrative example** (hypothetical): Note cites "1985 study on hormone replacement therapy"
> - At the time, it was high-quality evidence
> - Later RCTs showed it was harmful
> - Source tier: RCT (high) but confidence should reflect updates

**Test Question:** How to handle high-quality sources that have been superseded?

**Analysis:** This is a temporal knowledge problem. The source tier is about methodological quality, not current validity.

**Verdict:** The Seed should clarify: source tier = methodological quality. Confidence = current validity. A high-tier source that's been contradicted should show "confidence: disputed" or "confidence: obsolete."

### Edge Case: AI-Generated Medical Advice

**Problem:** Many knowledge bases may contain AI-generated content that cites sources.

> **Illustrative example** (hypothetical): AI generates "Aspirin prevents heart attacks" and cites a study
> - But the AI might hallucinate the citation
> - Or cite a study that doesn't say what the note claims

**Test Question:** How to verify AI-cited sources?

**Analysis:** This is a growing problem. The rule assumes human-authored notes with verifiable sources.

**Verdict:** The Seed should add a verification requirement: for AI-generated notes, mark with `author: AI` and verify at least one random source citation before publishing.

## Recommendations

### For the Seed Rule (Source Quality Hierarchy):

The rule is sound but needs refinement:

**Refined Rule:** For domains with evidence hierarchies, capture source tier AND require:
1. When lower-tier sources contradict higher-tier sources, present the conflict and default to higher-tier
2. For multi-claim notes, either split by source tier OR mark each claim inline
3. Add "guideline" and "textbook" as recognized source tiers
4. Source tier = methodological quality; confidence = current validity (may differ)
5. For AI-authored notes, verify at least one citation and mark with `author: AI`

**Test:** For a medical note:
1. Can you identify the source tier of each major claim?
2. If lower-tier contradicts higher-tier, is the conflict acknowledged?
3. Is there a distinction between source quality and current confidence?

### For Medical Domain Notes:

1. **Add source verification workflow** - verify URLs work and citations are accurate
2. **Add temporal tracking** - mark when sources were published and when last verified
3. **Distinguish primary vs. secondary sources** - primary = original research, secondary = reviews/guidelines
4. **Create guideline hub note** - link to major medical guidelines with source tier标注
5. **Flag AI-generated content** - mark with author type for credibility assessment

## Related
- [[Confidence Markers]]
- [[Source Validation Over Time]]
- [[Frontier Exploration - Professional Credentialing Requirements]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
- [[Handling Contradictory Sources]]
- [[Seed Stress Test - Experiential Knowledge in Clinical Practice]]
