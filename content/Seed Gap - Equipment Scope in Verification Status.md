---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
schema-version: "2026-01"
tags:
  - seed-gap
  - verification
  - equipment-dependent
gap-status: identified
gap-priority: medium
gap-phase: proposed
gap-severity: useful
gap-source: seed-stress-test
discovered: 2026-03-29
integrated: false 
---

# Seed Gap: Equipment Scope in Verification Status

## Gap Description

The Seed has equipment-tier for craft domains (woodworking, metalworking) but lacks explicit equipment-scope for equipment-dependent domains like photography where brand/model specificity affects verification validity.

## Problem Statement

A photography technique tested on a Canon EOS R5 may not work identically on a Sony A7IV due to:
- Different autofocus systems
- Different color science
- Different menu systems
- Different IBIS implementation

The current verification-status lacks equipment scope to indicate:
- What brand was tested
- What specific models were verified
- What models remain untested

## Root Cause

The equipment-tier rule addresses craft domains (hand-tools-only, home-workshop, professional) but doesn't address brand/model specificity in technology domains where the same technique can produce different results on different manufacturers' equipment.

## Proposed Solution

Add equipment scope to verification-status frontmatter:

```yaml
# For equipment-dependent knowledge
verification-equipment:
  category: camera-body|lens|lighting|software|post-processing
  brand: Canon|Nikon|Sony|Fuji|Legacy|etc
  model-scope: "specific model, series (e.g., A7 series), or all"
  tested-models:
    - Canon EOS R5
    - Canon EOS R6
  untested-models:
    - Sony A7IV
    - Nikon Z8
```

## Test

Can a user determine if this technique applies to their specific gear?

## Related Seed Rules

- [[Seed Stress Test - Photography Knowledge Base]] — Stress test that identified this gap
- [[AI-Assisted Knowledge Management Seed]] — Primary Seed rules
- Equipment-tier rule for craft domains

---

**Status:** Under analysis — determining if this should be generalized to all equipment-dependent domains or photography-specific.
## Analysis: Generalization vs Domain-Specific

The gap currently frames this as photography-specific, but the problem is universal:

**Equipment-dependent domains with brand/model variation:**
- Photography (Canon vs Sony vs Nikon vs Fuji)
- Music production (UAD vs Focusrite vs universal)
- Computing (GPU vendors, CPU architectures)
- Automotive (OEM-specific procedures)
- Medical devices (brand-specific protocols)
- Software (Adobe vs Capture One vs DaVinci)

**Pattern:** When knowledge effectiveness depends on specific product implementations, not just product category or tier, the current equipment-tier rule fails because it only captures "hand-tools vs power-tools" granularity, not "which specific brand/model."

## Seed Rule Proposal

**Rule:** For knowledge in equipment-dependent domains where verification validity varies by brand, model, or implementation version, add equipment-scope tracking to verification frontmatter.
**Why:** A technique tested on Canon EOS R5 may not produce identical results on Sony A7IV even though both are "professional mirrorless cameras." Without explicit equipment-scope, readers cannot assess applicability to their specific gear, and verification claims are imprecise.
**Test:** For equipment-dependent notes: (1) Does frontmatter specify what brand/model was used for verification? (2) Can a reader determine if their gear is covered? (3) Are untested equivalents documented?

**Implementation:**
```yaml
verification-equipment:
  category: camera-body|lens|lighting|software|hardware|etc
  brand: Canon|Nikon|Sony|Fuji|Universal
  model-scope: specific-model|series|generation|all
  tested-models:
    - Canon EOS R5
    - Canon EOS R6
  untested-equivalents:
    - Sony A7IV
    - Nikon Z8
  version-sensitivity: high|medium|low
```

**Relationship to equipment-tier:** The equipment-tier rule handles tier classification (home-workshop vs professional). This rule handles brand/model specificity within tiers. Both can coexist — use equipment-tier for tier, equipment-scope for brand specificity.

**Test questions for equipment-dependent domains:**
1. Would the same technique produce different results on a competitor's product?
2. Does the domain have known interoperability issues between brands?
3. Are there manufacturer-specific conventions that affect knowledge application?

If yes to 2+, equipment-scope tracking is warranted.

## Gap Lifecycle Advancement

This gap is ready for advancement to **proposed** status with the rule above. The next step would be integration testing against multiple equipment-dependent domains (photography, audio, computing) before merging into the Seed.

**Recommendation:** Advance gap-phase to "proposed" and add `integrated: false` pending Seed integration.
