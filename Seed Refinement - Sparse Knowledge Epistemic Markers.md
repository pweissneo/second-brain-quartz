---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-31
lifecycle: seed-refinement
confidence: emerging
gap-status: deprecated
gap-priority: high
gap-source: frontier-exploration
discovered: 2026-03-31
resolved: 2026-03-31
resolved-by: [[Confidence Markers]]
tags:
  - seed-refinement
  - epistemic-markers
  - sparse-knowledge
  - confidence
  - trust-calibration
---

# Seed Refinement - Sparse Knowledge Epistemic Markers

> Refinement: Add epistemic type markers to help users calibrate trust when reasoning with partial vault coverage.

## Summary

This refinement adds **epistemic type** markers to complement existing confidence markers. While confidence tells users **how much** the vault trusts knowledge, epistemic type tells users **how** the vault knows — distinguishing direct evidence from interpolated inference, extrapolated projection, and analogical transfer.

## Proposed Seed Rule Addition

Add to the Confidence Markers section of the Seed:

**Rule:** For knowledge claims used in decisions, explicitly mark the epistemic type: direct, interpolated, extrapolated, or analogical. Present epistemic type alongside confidence to help users calibrate trust.

**Why:** A "confidence: high" claim backed by 20 direct examples warrants different trust than "confidence: high" from interpolating between 2 sparse data points. Without epistemic type markers, users cannot distinguish solid knowledge from reasonable inferences.

**Test:** For any knowledge used in a decision: (1) Is the epistemic type marked (direct/interpolated/extrapolated/analogical)? (2) Is the evidence basis documented (number of examples, adjacency, analogical source)? (3) Can a user determine how much confidence is warranted given both confidence level AND epistemic type?

### Epistemic Type Definitions

| Type | Definition | Trust Calibration |
|------|------------|-------------------|
| Direct | 5+ examples in same category | Standard confidence |
| Interpolated | 2-4 examples, inferring middle | Reduce confidence 1 level |
| Extrapolated | Projecting beyond known range | Mark with explicit warning |
| Analogical | Cross-domain transfer | Assess transferability, reduce confidence |

### Frontmatter Extension

```yaml
epistemic-type: direct|interpolated|extrapolated|analogical
evidence-basis:
  direct-examples: 5
  adjacent-notes: 2
  analogical-source: [[Domain Note]]
  projection-range: [A, B]
transferability-assessment: high|medium|low
applicability-boundary: "Known valid range: X to Y"
```

## Why This Belongs in the Seed

1. **Complements existing confidence markers** — Adds a dimension confidence alone doesn't capture
2. **Enables appropriate skepticism** — Users can distinguish solid knowledge from reasonable guesses
3. ** Guides verification effort** — Sparse epistemic types signal where verification would have highest impact
4. **Domain-agnostic** — Applies to any vault with partial coverage

## Integration Notes

This refinement extends [[Confidence Markers]] without replacing it. The existing confidence levels (high/medium/low/speculative) remain; epistemic type adds an orthogonal dimension.

## Related Seed Rules

- [[Confidence Markers]] — Extended by this refinement
- [[Frontier Exploration - Sparse Knowledge Reasoning]] — Frontier exploration that identified this gap
- [[Seed Gap - Sparse Knowledge Epistemic Markers]] — Original gap documentation (to be deprecated after integration)
