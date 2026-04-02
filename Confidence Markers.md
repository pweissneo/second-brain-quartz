---
last-reviewed: 2026-03-25
last-updated: 2026-03-25
lifecycle: seed-extension
confidence: high
author-type: ai-assisted
schema-version: "1.0"
foundational: true
tags:
  - metadata
  - confidence
  - verification
---

# Confidence Markers and Verification Status

> How to signal certainty levels and verification state in knowledge notes.

Knowledge quality requires two complementary metadata dimensions: how certain the knowledge is (confidence) and whether it's been verified (verification status).

## Part 1: Confidence Markers

Confidence markers help readers (and AI agents) assess how certain the knowledge is. They enable appropriate skepticism and guide verification effort.

### Frontmatter Field

```yaml
confidence: high
```

### Levels

- **high**: Well-verified, multiple sources, strong evidence
- **emerging**: Some verification, reasonable confidence, but not fully established
- **speculative**: Knowledge that cannot be verified through any known verification pathway (future predictions, private subjective experience, philosophical claims)
- **disputed**: Known contradictions or unresolved debates about this knowledge

> **Note:** For knowledge that was previously correct but is now outdated, use `lifecycle: deprecated` or `correction-type: outdated` rather than a confidence level. Confidence describes certainty about correctness, not currency.

### Epistemic Type Markers (NEW)

Epistemic type tells you **how** the vault knows — distinguishing direct evidence from interpolated inference, extrapolated projection, and analogical transfer. Present epistemic type alongside confidence to help users calibrate trust appropriately.

| Type | Definition | Trust Calibration |
|------|------------|-------------------|
| **direct** | 5+ examples in same category | Standard confidence level |
| **interpolated** | 2-4 examples, inferring middle values | Reduce confidence 1 level |
| **extrapolated** | Projecting beyond known range | Mark with explicit warning |
| **analogical** | Cross-domain transfer | Assess transferability, reduce confidence |

#### Frontmatter Extension

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

#### Why Epistemic Type Matters

A "confidence: high" claim backed by 20 direct examples warrants different trust than "confidence: high" from interpolating between 2 sparse data points. Without epistemic type markers, users cannot distinguish solid knowledge from reasonable inferences.

**Test:** For any knowledge used in a decision: (1) Is the epistemic type marked (direct/interpolated/extrapolated/analogical)? (2) Is the evidence basis documented (number of examples, adjacency, analogical source)? (3) Can a user determine how much confidence is warranted given both confidence level AND epistemic type?

> **Integration note:** Epistemic type is orthogonal to confidence — it adds a second dimension. A note can have `confidence: high` with `epistemic-type: direct` (solid knowledge) OR `confidence: high` with `epistemic-type: interpolated` (overconfident inference).

### Usage

Add `confidence:` to frontmatter for any note where certainty matters. Default to `emerging` when uncertain.

## Part 2: Verification Status

Verification status tracks whether knowledge has been checked for accuracy.

### Frontmatter Field

```yaml
verification-status: unverified|verified|pending|disputed
```

### Values

- **unverified**: Captured but not yet verified
- **verified**: Checked and confirmed accurate
- **pending**: Awaiting verification
- **disputed**: Known contradiction or unresolved conflict
- **testing**: Actively being experimentally verified (for experiential domains)
- **failed**: Tested but did not work (also valuable — document what didn't work)
- **blocked**: Cannot test due to constraints (add `blocker:` field)
- **multi-year-pending**: Verification requires multi-year cycle (gardening, perennials)

### Verification Ratio

The Seed requires maintaining a verification ratio:
> A healthy vault verifies at least 50% of new captures within 30 days.

When unverified notes exceed 40% of total vault, pause exploration and prioritize verification.

## When to Use Which

| Scenario | Confidence | Verification Status |
|----------|------------|---------------------|
| Personal experience, not yet fact-checked | emerging | unverified |
| Multiple reputable sources confirm | high | verified |
| Known controversy in field | disputed | disputed |
| Knowledge that cannot be verified (future, philosophical) | speculative | verification-pathway: none |
| Old information that may be outdated | emerging | pending review (then lifecycle: deprecated when confirmed) |

## Related Concepts

This note connects to [[Note Types and Templates]], [[Knowledge Graph Structure]], [[Atomic Note Principle]], and [[Note Lifecycle Management]] for how confidence and verification fit into note design.

## Related
- [[Graph Maintenance]] — Regular health checks
- [[Self-Improvement Cycle]] — Review and improvement workflow
- [[_root]] — Vault root