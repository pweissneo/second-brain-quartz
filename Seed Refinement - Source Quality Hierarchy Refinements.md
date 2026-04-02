---
last-reviewed: 2026-03-31
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - source-quality
  - evidence-hierarchy
---

# Seed Refinement: Source Quality Hierarchy Refinements

> Refinements to the Source Quality Hierarchy rule based on stress testing in medical domain.

## Background

Stress tested the Seed rule "For knowledge domains with established evidence hierarchies, capture source quality tier" against medical domain knowledge bases. Found edge cases requiring clarification.

## Refinements

### Refinement 1: Source Tier vs Confidence Conflict Resolution

**Problem:** What happens when a lower-tier source (expert opinion) contradicts a higher-tier source (systematic review)?

**Rule Addition:** When lower-tier sources contradict higher-tier sources, the note must:
1. Present the conflict explicitly
2. Default to higher-tier evidence for claims
3. Mark lower-tier source as "contrary evidence"

**Test:** For a note with source conflict:
- Is the conflict explicitly documented?
- Does the confidence reflect the higher-tier source?
- Is contrary evidence preserved, not deleted?

### Refinement 2: Additional Source Tiers

**Problem:** Clinical guidelines and textbooks don't fit cleanly into existing tiers (systematic-review/rct/observational/case-study/expert-opinion/anecdote).

**Rule Addition:** Add these tiers:
- **guideline**: Professional body recommendations (AHA, WHO, etc.) — treat as systematic-level when from reputable bodies
- **textbook**: Educational reference — treat as between expert opinion and case study

**Test:** For medical notes: Can you categorize guidelines and textbooks appropriately?

### Refinement 3: Compound Claims

**Problem:** Notes contain multiple claims from different source tiers.

**Rule Addition:** For multi-claim notes, either:
1. Split into atomic notes per source tier, OR
2. Mark each claim inline with its source tier

**Test:** For notes with multiple source tiers:
- Are claims individually tagged, OR
- Are claims separated by source tier?

### Refinement 4: Temporal Validity

**Problem:** A high-quality source (RCT) may be contradicted by later evidence.

**Rule Addition:** Source tier = methodological quality; confidence = current validity. These may differ. Track:
- `source-tier-as-of`: When source was published
- `confidence-as-of`: When confidence was last assessed

**Test:** For older high-quality sources:
- Is there a mechanism to mark outdated confidence?
- Are superseded sources marked as such?

## Related

- [[Seed Stress Test - Source Quality Hierarchy in Medical Knowledge]]
- [[Seed Stress Test - Source Reliability vs Verification in Medical Domain]]
- [[AI-Assisted Knowledge Management Seed]]
