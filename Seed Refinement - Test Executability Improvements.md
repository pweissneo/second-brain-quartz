---
last-reviewed: 2026-04-03
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-refinement
  - stress-test
  - verification-mode
  - testing
---

# Seed Refinement - Test Executability Improvements

**Date:** 2026-04-03
**Method:** SEED_STRESS_TEST
**Status:** RESOLVED

## Summary

This Seed Refinement integrates findings from Seed Stress Tests about making Seed tests more executable and adding verification-mode trigger criteria. The core ideas from the analysis are now reflected in Seed rules.

## Resolution

### 1. Claim-Type Frontmatter (PARTIALLY INTEGRATED)

The Seed already has `claim-type: subjective` at line 3639. The proposed `claim-type: factual|procedural|opinion|preference` adds needed nuance for contradiction detection.

**Integration:** Added to Seed - claims with factual assertions should use `claim-type: factual` to enable automated contradiction detection.

**Test:** For notes with `knowledge-type: factual`: Does frontmatter include `claim-type:` (factual/procedural/opinion/preference)?

### 2. Consensus Determination Source (NEW RULE)

**Rule:** For knowledge claims that reference consensus levels (mainstream/debated/emerging/fringe), include `consensus-determination-source:` to clarify how consensus was determined.

**Why:** AI agents cannot determine consensus levels in unfamiliar domains without guidance. Adding explicit determination source makes verification process transparent and reproducible.

**Test:** For notes with `consensus-level:`, is `consensus-determination-source:` present with value `external-research|explicit-disagreement|human-review-required|domain-expertise`?

**Implementation:**
```yaml
consensus-determination-source: external-research  # How consensus was determined
consensus-level: mainstream  # The consensus level
```

### 3. Verification Mode Triggers (NEW RULE)

**Rule:** Run multiple verification modes (beyond source-only) when notes match specific trigger criteria.

**Why:** The current Seed tests whether conflicts are documented IF they occur, but doesn't guide WHEN to run multiple verification modes. Without triggers, agents default to single-mode verification and miss conflicts.

**When to run multiple verification modes:**
- Note has `knowledge-type: empirical` AND `confidence: high`
- Note claims universal rules (not domain-specific)
- Note contradicts existing verified note (claim vs claim detection)
- Note has `safety-critical: true`
- Note has `embodied-component: essential`

**Test:** For notes matching trigger criteria: (1) Have multiple verification modes been attempted? (2) Is conflict documented if results differ?

**Implementation:**
```yaml
verification-modes-run:
  - source
  - embodied  # if embodied-component: essential
verification-conflict:
  mode1: source
  mode1-result: pass
  mode2: embodied
  mode2-result: fail
  conflict-type: complementary
  resolution-methodology: integration
```

### 4. Sensory Interpretation (PARTIALLY INTEGRATED)

The Seed already has `verification-mode: embodied` (line 998) and `embodied-component:` frontmatter (line 997). This is sufficient for the proposed sensory-interpretation criteria.

**Enhancement:** Add optional `sensory-interpretation-criteria:` field for embodied notes:
```yaml
sensory-interpretation-criteria:
  - training-required: "What experience level can interpret this"
  - objective-correlates: "Temperature, color, sound, texture"
  - reliability: "high|medium|low"
```

### 5. Explicit Pass Criteria for Stress Tests

**Integration:** Each Seed Stress Test note should include explicit pass/fail criteria in its Test section.

**Example from Seed:**
- "Pass: Note covers (1) terminology, (2) technique steps, (3) common mistakes, (4) troubleshooting - OR - explicitly acknowledges limited scope"

## Validation

This refinement was verified through:
1. SEED_STRESS_TEST method on 2026-04-03
2. Cross-referenced with existing Seed rules (lines 997-1005 for embodied, 534-576 for verification conflict)
3. Confirmed gap between current practice and proposed refinements is bridgeable via frontmatter additions

## Related Notes

- [[Seed Refinement - Test Executability in Seed Stress Tests]] (original analysis)
- [[AI-Assisted Knowledge Management Seed]] (main Seed file)
- [[Seed Refinement - Verification Mode Conflict Resolution]]