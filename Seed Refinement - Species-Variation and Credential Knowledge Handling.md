---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
lifecycle: emerging
confidence: emerging
tags:
  - seed-refinement
  - stress-test
  - veterinary-medicine
  - domain-specific
  - species-variation
---

# Seed Refinement - Species-Variation and Credential Knowledge Handling

**Date:** 2026-04-04
**Method:** SEED_STRESS_TEST
**Domain Analyzed:** Veterinary Medicine

---

## Finding: Seed Lacks Species-Variation-Aware Scope Handling

The veterinary medicine stress test revealed that the Seed's generic scope metadata doesn't handle the critical species-variation problem in multi-species domains.

### Current Issue:
The Seed has `scope:` field but doesn't address:
- Same knowledge applying differently to different species
- Cross-species transferability dangers (toxicity, procedure differences)
- Species-specific knowledge hub patterns

### Proposed Refinement - Add Species-Scope Fields:

```yaml
species-scope: [canine|feline|equine|bovine|avian|exotic]
species-caveat: "NOT applicable to: [list species]"
cross-species-transferability: none|low|medium|high|universal
species-warning: "Dangerous for [species] - verify before applying"
```

**Test:** Can you identify notes where knowledge from one species was incorrectly applied to another?

---

## Finding: Credential-Based Expertise Levels Not Addressed

### Current Issue:
The Seed uses beginner/intermediate/advanced for expertise levels, but veterinary medicine uses credential-based levels (DVM, board-certified specialist, etc.).

### Proposed Refinement - Add Credential Requirements:

```yaml
expertise-level: credentialed
credential-requirements:
  - "Graduate of accredited veterinary school"
  - "Species-specific handling training"
  - "Procedure-specific experience hours"
```

**Test:** Does your note about "emergency procedures" specify credential requirements?

---

## Finding: Multi-Modal Dependencies Can Be Mandatory

### Current Issue:
The Seed distinguishes text-sufficient vs. media-essential, but in veterinary medicine, visual/audio/tactile modalities are not optional enhancements—they are essential for competency.

### Proposed Refinement - Add Modal Dependency Level:

```yaml
knowledge-modalities: [text, visual, audio, tactile]
modal-dependency: optional|recommended|mandatory
modal-verification: "Cannot verify without [modality]"
```

**Test for Veterinary Domain:** Can a student learn to interpret radiographs from text alone? No—visual modality is mandatory.

---

## Finding: Owner-Compliance Factor Missing

### Current Issue:
Veterinary treatment success depends on owner compliance (patient can't self-report), but the Seed doesn't track this factor.

### Proposed Refinement - Add Compliance Tracking:

```yaml
owner-compliance-critical: true
compliance-difficulty: easy|medium|hard|impossible
home-care-requirements:
  - "Administer medication twice daily"
  - "Monitor surgical site daily"
compliance-alternatives: "Hospitalization if home care impossible"
```

**Why:** A technically correct treatment fails if owners can't administer it.

---

## Summary of Recommended Seed Updates

1. **Add species-scope fields** for multi-species domains
2. **Add credential-requirements** for expertise levels that require formal credentials
3. **Add modal-dependency** to distinguish optional from mandatory media
4. **Add owner-compliance tracking** for domains where treatment depends on caretaker ability

---

## Related Notes

- [[Seed Stress Test - Veterinary Medicine Knowledge Base]]
- [[Seed Refinement - Species-Variation and Compliance Knowledge Handling]]
