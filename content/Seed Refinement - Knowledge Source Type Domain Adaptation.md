---
last-reviewed: 2026-03-28
last-updated: 2026-03-28
lifecycle: seed-extension
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - knowledge-source-type
  - domain-adaptation
  - cooking
schema-version: "1.0"
related-seed-rules:
  - knowledge-source-type
  - evidence-tier
---

# Seed Refinement: Knowledge Source Type Domain Adaptation

> Proposed refinements to the "knowledge source type" rule based on stress testing in cooking domain.
> Date: 2026-03-28

## Summary

Stress testing the knowledge source type rule in the cooking domain revealed that the rule's categories (intuition, analysis, authority, experiment) don't adequately handle cooking-specific knowledge patterns. Six refinements are proposed.

## The Seed Rule Under Refinement

**Rule:** Track knowledge source type to enable source-appropriate verification and weighting — distinguish knowledge derived from intuition (pattern recognition, expert tacit), analysis (statistical, deductive), authority (trusted sources), and direct experiment.

**Test:** For key knowledge notes used in decisions: (1) Can you identify the source type? (2) Is the source type appropriate for the domain? (3) Does verification method match the source type?

## Stress Test Results

The rule was applied to a cooking knowledge base in `Seed Stress Test - Knowledge Source Type Rule in Cooking.md`. Six edge cases were identified that the rule doesn't handle:

### 1. Authority Subtype Gap

**Problem:** In cooking, "authority" often means traditional (generational wisdom, classical techniques) rather than scientific/evidence-based. The rule assumes authority = credible institutional source.

**Proposed refinement:** Add `authority-subtype:` field:
```yaml
authority-subtype: traditional|evidence-based|scientific
# traditional = handed down through generations
# evidence-based = verified through modern testing
# scientific = peer-reviewed or experimentally validated
```

### 2. Uncontrolled Experiment Gap

**Problem:** Home cooking "experimentation" is ad-hoc trial-and-error, not controlled/field/observational research. The experiment-context values assume rigor that cooking doesn't have.

**Proposed refinement:** Add `experiment-context: uncontrolled`:
```yaml
experiment-context: uncontrolled
experiment-notes: "Single trial, no comparison, subjective assessment"
```

### 3. Sensory-Trained Intuition Gap

**Problem:** Professional tasters, sommeliers, food critics have trained sensory expertise — distinct from pattern recognition or gut feeling but not a separate category.

**Proposed refinement:** Add `intuition-type: sensory-trained`:
```yaml
intuition-type: sensory-trained
# Distinguishes trained palate from general intuition
```

### 4. Authority Provenance Gap

**Problem:** Recipes attributed to chefs (Julia Child's Beef Bourguignon) — is authority the person or the tradition? Authority-type doesn't capture "provenance."

**Proposed refinement:** Add `authority-provenance:`:
```yaml
authority-provenance: personal-collection|adapted|from-source
# personal-collection = your family recipes
# adapted = modified from another source
# from-source = directly from originator
```

### 5. Traditional Knowledge Gap

**Problem:** "Grandmother knowledge" — oral tradition passed through generations without written source. Neither authority (no publication) nor intuition (not individual pattern recognition).

**Proposed refinement:** Add new source type:
```yaml
knowledge-source-type: traditional
traditional-source: family|cultural|regional
provenance: oral-history
```

### 6. Preference vs. Knowledge Gap

**Problem:** Cooking contains significant "knowledge" that's actually personal preference ("I prefer lemon over lime"). Not really verifiable knowledge but captured anyway.

**Proposed refinement:** Add `knowledge-category:`:
```yaml
knowledge-category: preference|fact|technique|preference-calibration
# preference = "I like X"
# fact = "X is Y" (verifiable)
# technique = "how to do X"
# preference-calibration = "X is too salty for most people"
```

## Revised Test for the Seed

The test should be expanded to:
1. Can you identify the source type?
2. Is the appropriate sub-type included?
3. Does verification method match source type?
4. For "experiment" notes, is experiment context realistic (not overclaiming rigor)?
5. Is this really "knowledge" or preference?

## Cross-Domain Applicability

These refinements likely apply to other experiential/traditional domains:
- **Gardening:** Traditional knowledge from generations of gardeners
- **Crafts (woodworking, sewing):** Guild-style traditional knowledge
- **Home repair:** DIY community "what worked for me" experiments
- **Pet care:** Veterinary advice vs. breeder wisdom vs. personal experience

The key insight: Many practical domains have weak evidence bases and rely on traditional/experiential authority, not scientific authority. The Seed should accommodate this.

## Recommendation

These six refinements should be added to the Seed rule "Track knowledge source type" as domain-specific edge cases or as expanded base categories.

## Related Notes

- [[Seed Stress Test - Knowledge Source Type Rule in Cooking]]
- [[Seed Stress Test - Knowledge Source Type Rule in Medical Domain]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Domain-Specific Knowledge Bases]]