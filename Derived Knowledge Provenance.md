---
last-reviewed: 2026-03-18
lifecycle: active
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: analysis
tags:
  - frontier-exploration
  - provenance
  - synthesis
  - derived
---

# Derived Knowledge Provenance

> Tracking the sources and transformation history of synthesized knowledge

## The Problem

When creating new notes from combining multiple sources (synthesis), it's important to track:
- Which sources were combined
- What transformation was applied
- How the new knowledge relates to its origins

Without provenance tracking, derived knowledge becomes unverifiable and hard to maintain.

## Seed Rule Reference

This note expands on the Seed rule:
> **Rule:** Track derived knowledge provenance for syntheses created from existing vault notes — when combining insights from multiple notes to create new understanding, document the derivation.

**Frontmatter format (Seed-compliant):**
```yaml
derived-from-vault: true
synthesis-type: pattern-discovery|principle-extraction|hub-creation|inference
synthesis-method: How this was derived (induction, analogy, deduction)
derived-date: YYYY-MM-DD
```

## When Provenance Matters

### For Hub Notes
Hub notes that synthesize multiple atomic notes should link to their sources.

### For Analysis Notes
Notes that analyze, interpret, or transform source material should cite origins.

### For Opinion Notes
Notes expressing viewpoints should distinguish personal synthesis from source material.

## Frontmatter for Provenance (Seed-Compliant Format)

```yaml
derived-from-vault: true
synthesis-type: pattern-discovery  # pattern-discovery|principle-extraction|hub-creation|inference
synthesis-method: How this was derived (induction, analogy, deduction)
derived-date: 2026-03-18
sources:
  - [[Note Name 1]]
  - [[Note Name 2]]
```

## Examples

### Synthesis Example
A hub note "Cooking Principles" combines:
- Heat and Maillard Reaction
- Protein Denaturation
- Sugar Caramelization

Provenance shows which atomic notes informed the hub.

### Analysis Example
A note "My Approach to French Cooking" analyzes:
- Classical French Technique
- Modernist Cuisine
- Personal experimentation

Provenance distinguishes external sources from personal synthesis.

## Test for Derived Knowledge Provenance

To verify derived knowledge has proper provenance:

1. **Synthesis Test**: For hub notes combining 3+ sources, does frontmatter include `derived-from-vault: true` with `synthesis-type:` and `synthesis-method:`?
2. **Date Test**: Is there a `derived-date:` field?
3. **Sources Test**: Are source notes listed?

## Related

- [[Frontier Exploration - Knowledge Synthesis Quality]]
- [[Handling Contradictory Sources]]
- [[AI-Assisted Knowledge Management Seed]]
