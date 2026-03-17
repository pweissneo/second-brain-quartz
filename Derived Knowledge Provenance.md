---
last-reviewed: 2026-03-17
lifecycle: active
confidence: emerging
author-type: ai-assisted
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

## Seed Rules Related

The Seed covers:
- [[Handling Contradictory Sources]] - When sources disagree
- [[Frontier Exploration - Knowledge Synthesis Quality Assessment]] - Evaluating synthesis value

## When Provenance Matters

### For Hub Notes
Hub notes that synthesize multiple atomic notes should link to their sources.

### For Analysis Notes
Notes that analyze, interpret, or transform source material should cite origins.

### For Opinion Notes
Notes expressing viewpoints should distinguish personal synthesis from source material.

## Frontmatter for Provenance

```yaml
derived-from-vault: true
sources:
  - [[Note Name 1]]
  - [[Note Name 2]]
transformation: synthesis | analysis | interpretation
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

1. **Synthesis Test**: For hub notes combining 3+ sources, does frontmatter list `derived-from-vault: true` with `sources:`?
2. **Analysis Test**: For analysis notes, is there a `transformation:` field indicating what was done?
3. **Opinion Test**: For opinion notes, can you distinguish personal synthesis from source material?

## Related

- [[Frontier Exploration - Knowledge Synthesis Quality Assessment]]
- [[Handling Contradictory Sources]]
- [[AI-Assisted Knowledge Management Seed]]
