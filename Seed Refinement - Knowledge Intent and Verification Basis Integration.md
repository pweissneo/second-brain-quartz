---
last-reviewed: 2026-04-08
lifecycle: draft
confidence: emerging
author-type: ai-assisted
knowledge-type: seed-refinement
tags:
  - seed-refinement
  - knowledge-intent
  - verification-basis
---

# Seed Refinement: Knowledge Intent and Verification Basis Integration

> Refining the knowledge-intent rule to include verification-basis and linking requirements.
> Date: 2026-04-08

## Original Rule (2026-04-05)

The knowledge-intent rule introduced tagging for creative-aesthetic hybrid domains but lacked:
1. Verification methodology for aesthetic knowledge
2. Explicit linking requirements for hybrid notes

## Refinement: Expanded Test Criteria

**Updated Test:** (1) Can you filter notes by knowledge-intent (technical/aesthetic/hybrid)? (2) For aesthetic notes, does verification acknowledge subjectivity? (3) Do hybrid notes link to both technical basis and aesthetic rationale? (4) For notes with knowledge-intent, does verification-basis match the intent type?

## Refinement: Verification Basis Integration

For aesthetic and hybrid notes, use `verification-basis` to distinguish objective from subjective verification:

```yaml
knowledge-intent: technical|aesthetic|hybrid
verification-basis: objective|subjective|taste-based
```

**Verification basis meanings:**
- **objective**: Claims can be verified through measurement or external standards (technical correctness)
- **subjective**: Claims reflect personal judgment that varies by individual preference
- **taste-based**: Claims are tradition-dependent (what sounds "right" in Baroque vs Romantic)

**Verification outcomes by basis:**
- objective → verified/unverified
- subjective → aligned-with-preference/context-dependent  
- taste-based → aligned-with-tradition/not-aligned

## Refinement: Hybrid Linking Convention

Hybrid notes should explicitly link to both technical and aesthetic dimensions:

```yaml
technical-links: [[technical-note-1]], [[technical-note-2]]
aesthetic-links: [[aesthetic-note-1]], [[aesthetic-note-2]]
```

This enables navigation based on reader intent - they can access either dimension independently.

## Domain Examples

### Cooking
- Technical: "sear at 400°F for 2 minutes" → verification-basis: objective
- Aesthetic: "plate with the sauce artisticall draped" → verification-basis: subjective  
- Hybrid: "golden-brown crust providing textural contrast" → both technical (sear) AND aesthetic (contrast)

### Music Performance
- Technical: "correct left hand position" → verification-basis: objective
- Aesthetic: "emotionally engaging phrasing" → verification-basis: taste-based (tradition-dependent)
- Hybrid: "articulation that shapes the phrase meaningfully" → both technical (articulation) AND aesthetic (musical meaning)

### Photography
- Technical: "expose for the highlights" → verification-basis: objective
- Aesthetic: "moody, desaturated look" → verification-basis: subjective
- Hybrid: "use shallow depth of field to isolate subject" → both technical (DOF technique) AND aesthetic (isolation for impact)

## Compliance Check

To verify compliance with this refinement:
1. All notes in creative-aesthetic domains should have knowledge-intent
2. Aesthetic/hybrid notes should have verification-basis: subjective or taste-based
3. Hybrid notes should have both technical-links and aesthetic-links

## Related Notes

- [[Seed Stress Test - Knowledge Intent Rule in Cooking]] — Stress test that identified gaps
- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — Application example
- [[AI-Assisted Knowledge Management Seed]] — Original rule

## Summary

This refinement extends the knowledge-intent rule to include:
1. verification-basis field for distinguishing verification methodology
2. Explicit linking requirements for hybrid notes
3. Domain-specific examples for cooking, music, and photography
