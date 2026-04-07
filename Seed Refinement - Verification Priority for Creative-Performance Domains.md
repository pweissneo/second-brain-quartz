---
last-reviewed: 2026-04-06
lifecycle: draft
confidence: emerging
author-type: ai-assisted
knowledge-type: seed-refinement
tags:
  - seed-refinement
  - verification-priority
  - music-domain
  - artistic-safety
  - embodied-knowledge
---

# Seed Refinement: Verification Priority for Creative-Performance Domains

> Refining the Verification Priority Hierarchy rule for music, performance, and creative-aesthetic domains.
> Date: 2026-04-06

## Original Rule

**Rule:** Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.

**Test:** For verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`?

## Gap: Creative-Performance Domains

The original rule assumes "safety-critical" maps to physical safety. In music, dance, theater, and other creative-performance domains, there's a distinct category: **artistic safety** — the risk of developing habits that damage long-term artistic development without causing physical injury.

### Edge Cases from Music Domain Stress Test

**1. Artistic Safety Distinction**

Knowledge about technique and practice methods may risk:
- Physical injury (repetitive strain, hearing damage) — traditional safety-critical
- **Artistic damage** (bad habits requiring years to unlearn) — distinct category
- Both (correct bow hold prevents strain AND bad technique)

A note about "correct bow hold" is both physical-safety AND artistic-safety. Without distinction, verification priority is unclear.

**2. Verification Modality Gap**

Current modalities: source, drill, embodied. Music requires a fourth: **interpretive verification** — whether a musical choice is appropriate, expressive, and stylistically correct. This cannot be verified alone (requires teacher or audience feedback).

```yaml
# Current: source | drill | embodied
# Music needs: source | drill | embodied | interpretive
verification_modality: source|drill|embodied|interpretive
interpretive_verification_requires: teacher-feedback|audience-response|performance-context
```

**3. Authority Structure Different**

Academic credentials don't convey authority in music performance. The authority structure is based on **pedagogical lineage** — who you studied with and what tradition you represent.

```yaml
authority_structure: performer-lineage|pedagogue-lineage|historical-tradition|contemporary-school
lineage_verified: true  # traces back to recognized tradition
```

**4. Verification Timeframes: Skill-Level-Dependent**

Musical technique needs re-verification as skill level changes. What felt correct at beginner level may need adjustment at advanced level.

```yaml
verification_timeframe: skill-level-dependent
verification_levels:
  beginner: verified
  intermediate: verified
  advanced: needs-verification
```

**5. Taste-Based Verification**

"Correct" is often tradition-dependent in music. Baroque ornamentation that sounds "right" in Bach sounds wrong in Brahms. Verification cannot be binary — use alignment rather than correctness.

```yaml
verification_basis: objective|subjective|taste-based
verification_outcome: verified|aligned|context-dependent
aligned_with_tradition: baroque|classical|romantic|modern
```

**6. Decision-Critical: Opportunity Cost**

Music decisions often have temporal opportunity costs — choosing to spend a year on technique means not spending that year on repertoire. Capture this in decision-critical tagging.

```yaml
decision_critical_type: irreversible|temporal-opportunity-cost|artistic-direction
```

## Refined Rule

**Rule (REFINED - 2026-04-06):** Apply verification priority hierarchy in creative-performance domains with expanded safety categories and specialized verification modalities.

**Why:** The original rule assumes physical safety as the only safety category and standard verification modalities (source, drill, embodied). Creative-performance domains have distinct needs: artistic safety (bad habits as distinct from physical danger), interpretive verification (requires external aesthetic judgment), authority based on lineage, skill-level-dependent verification timeframes, and taste-based verification (alignment over correctness).

**Test:** For music/performance notes: (1) Can you distinguish physical-safety from artistic-safety knowledge? (2) Does verification_modality capture interpretive requirements? (3) Does authority structure reflect pedagogical lineage? (4) Can you track verification status per skill level? (5) Does verification_outcome handle alignment vs. correctness?

**Implementation:**

```yaml
# Expanded safety types for creative-performance domains
safety_type: physical|artistic|both

# Additional verification modality
verification_modality: source|drill|embodied|interpretive

# Musical authority structure
authority_structure: performer-lineage|pedagogue-lineage|historical-tradition|contemporary-school|forum
lineage_verified: true|false

# Skill-level-dependent verification
verification_levels:
  beginner: verified|pending|not-applicable
  intermediate: verified|pending|not-applicable
  advanced: verified|pending|not-applicable

# Taste-based verification outcomes
verification_basis: objective|subjective|taste-based
verification_outcome: verified|aligned|context-dependent
aligned_with_tradition: tradition-name

# Decision criticality in creative domains
decision_critical_type: irreversible|temporal-opportunity-cost|artistic-direction|equipment
opportunity_cost_impact: high|medium|low
```

**Priority adaptation for creative-performance:**

- **Level 1 (Critical):** Physical safety + artistic safety (bad habits that require years to unlearn)
- **Level 2 (High):** Foundational technique (low backlinks, high forward references) + decision-critical (opportunity cost)
- **Level 3 (Medium):** Hub notes, frequently-referenced interpretations
- **Level 4 (Low):** Taste-based knowledge (alignment, not verification), deprecated styles

## Related Notes

- [[Seed Stress Test - Verification Priority Rule in Music Performance]] — Original stress test
- [[Seed Refinement - Technical vs Aesthetic Knowledge in Creative Domains]] — Related creative domain guidance
- [[AI-Assisted Knowledge Management Seed]] — Original verification priority rule

## Summary

The Verification Priority Hierarchy rule needs creative-performance-specific refinements to handle:
1. Artistic safety (bad habits as distinct from physical danger)
2. Interpretive verification (requires external aesthetic judgment)
3. Authority based on pedagogical lineage, not credentials
4. Skill-level-dependent and cyclical verification timeframes
5. Taste-based verification (alignment over correctness)
6. Decision-critical opportunity costs in creative domains