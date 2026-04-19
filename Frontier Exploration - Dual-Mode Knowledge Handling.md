---
last-reviewed: 2026-04-08
lifecycle: emerging
confidence: low
author-type: ai-assisted
knowledge-type: conceptual
tags:
  - frontier-exploration
  - knowledge-type-boundary
  - multi-type-knowledge
---

# Frontier Exploration: Dual-Mode Knowledge Handling

## The Problem

Many knowledge domains contain concepts that exist in **two modes simultaneously**:

- **Mathematics:** A proof is both a procedural "how to solve this" AND a conceptual "why this is true"
- **Cooking:** A recipe is procedural, but understanding *why* the technique works is conceptual
- **Programming:** Code is procedural, but design patterns are conceptual
- **Legal:** Precedents are factual, but the reasoning is conceptual

The current Knowledge Type Taxonomy classifies notes by **primary type**, but some knowledge genuinely operates in both modes at once.

## Where the Seed Falls Short

1. **Classification forces single-type:** The taxonomy labels notes as procedural OR conceptual OR factual, but dual-mode knowledge resists single-type classification.

2. **Retrieval assumes single-mode:** If a user wants "how to prove the Pythagorean theorem" (procedural), the note should be displayed differently than if they want "why the Pythagorean theorem is true" (conceptual). Current Seed doesn't address dual-retrieval.

3. **Verification approaches conflict:** Procedural verification is empirical ("does it work?"), conceptual verification is logical ("is it consistent?"). How do you verify dual-mode knowledge?

## Edge Cases This Creates

- **Mathematics knowledge base:** Every theorem note is both "how to apply" and "why it's true"
- **Physics knowledge base:** Laws are both predictive tools (procedural) and explanatory frameworks (conceptual)
- **Philosophy knowledge base:** Arguments are both positions to evaluate and reasoning to understand

## Questions for Seed Development

1. Should the Seed allow multi-type classification (primary + secondary)?
2. Should dual-mode notes have TWO retrieval paths optimized for different query intents?
3. Should verification require BOTH empirical AND logical checks?
4. How do you handle knowledge that transitions from primarily procedural to primarily conceptual as understanding deepens?

## Proposed Seed Rule Addition

**Rule:** For knowledge domains where concepts naturally operate in dual modes (procedural + conceptual), use `knowledge-mode: dual` tagging with explicit `mode-balance:` indicating which mode dominates.

**Why:** Without explicit dual-mode tagging, AI agents default to one mode, missing the other. Mathematics, physics, cooking, and many other domains contain knowledge that genuinely serves both purposes. The Seed's current single-type classification works for single-purpose knowledge but fails for dual-mode knowledge.

**Test:** (1) Can you identify domains where most notes are dual-mode? (2) Do those notes have knowledge-mode: dual tagging? (3) Does mode-balance indicate procedural vs conceptual emphasis? (4) Are retrieval paths optimized for both modes?

**Implementation:**
```yaml
knowledge-mode: procedural|conceptual|dual
mode-balance: 0.7  # 0.7 = 70% procedural, 0.3 = conceptual
# Dual-mode notes have two sections:
# - procedural: "how to apply X"
# - conceptual: "why X works"
```

## Related Notes

- [[Seed Refinement - Knowledge Type Taxonomy Complete]] — current taxonomy
- [[Frontier Exploration - Knowledge Type and Process Type Taxonomy Interaction]] — type interaction
- [[Seed Stress Test - Mathematics Knowledge Base]] — domain stress test
- [[Seed Stress Test - Physics Knowledge Base]] — domain stress test