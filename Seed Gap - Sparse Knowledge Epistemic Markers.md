---
last-reviewed: 2026-03-31
lifecycle: deprecated
confidence: high
author-type: ai-assisted
schema-version: "1.0"
gap-status: deprecated
gap-priority: high
gap-source: frontier-exploration
discovered: 2026-03-31
resolved: 2026-03-31
merged-into: [[Seed Refinement - Sparse Knowledge Epistemic Markers]]
tags:
  - seed-gap
  - sparse-knowledge
  - epistemic-markers
  - merged
---

# Seed Gap - Sparse Knowledge Epistemic Markers

> ⚠️ **DEPRECATED — Content merged into [[Seed Refinement - Sparse Knowledge Epistemic Markers]]**
> 
> This gap has been resolved. The refinement note includes the test case and full implementation guidance.

> ~~Gap: The Seed lacks guidance on marking epistemic type (direct, interpolated, extrapolated, analogical) to help users calibrate trust when reasoning with partial vault coverage.~~

## The Gap

The Seed has robust confidence markers (high/medium/low/speculative) and verification-status tracking, but it doesn't address **epistemic type** — how the vault knows what it knows:

- **Direct evidence**: Multiple specific notes support the claim
- **Interpolated inference**: Vault has adjacent data points; user can infer the middle
- **Extrapolated projection**: Vault has partial range; user projects beyond known bounds
- **Analogical transfer**: Vault has related domain knowledge that transfers with adaptation

A claim with "confidence: high" from 20 direct examples is fundamentally different from "confidence: high" from interpolating between 2 sparse data points. The Seed treats both the same.

## Test Domain: Music Composition Knowledge Base

An AI building a music composition knowledge base using current Seed rules would:

1. ✓ Track confidence levels for composition techniques
2. ✓ Verify techniques against multiple sources
3. ✗ Not help users distinguish "this chord progression works (5 direct examples)" from "this chord progression should work (interpolated from pop and jazz, never tested in classical)"
4. ✗ Not communicate that a technique is being extrapolated beyond its known domain
5. ✗ Not assess transferability before presenting cross-genre advice

**Example scenario:**
- User asks: "What chord progression works for emotional climaxes in film scores?"
- Vault has: 3 notes on orchestral climaxes, 2 on pop verse-chorus transitions
- Current Seed response: Presents advice with standard confidence
- Needed response: "I have direct evidence for orchestral climaxes (3 examples). For pop transitions, I'm interpolating. Cross-genre transfer is untested — analogical transfer from different structural paradigms."

## Proposed Rule: Sparse Knowledge Epistemic Markers

**Rule:** For any knowledge claim used in decisions, explicitly mark the epistemic type: direct, interpolated, extrapolated, or analogical. Present the epistemic type alongside confidence to help users calibrate trust.

**Why:** Confidence markers alone don't communicate HOW the vault knows. A "confidence: high" claim backed by 20 direct examples warrants different trust than "confidence: high" backed by interpolating between 2 examples from adjacent domains. Without epistemic type markers, users cannot distinguish solid knowledge from reasonable guesses.

**Test:** For any knowledge used in a decision: (1) Is the epistemic type marked (direct/interpolated/extrapolated/analogical)? (2) Is the evidence basis documented (number of examples, adjacency, analogical source)? (3) Can a user determine how much confidence is warranted given both confidence level AND epistemic type?

## Implementation

### Frontmatter Extension

```yaml
epistemic-type: direct|interpolated|extrapolated|analogical
evidence-basis:
  direct-examples: 5
  adjacent-notes: 2
  analogical-source: [[Domain Note]]
  projection-range: [A, B]  # for extrapolation
interpolation-valid: true|false  # some domains don't interpolate smoothly
transferability-assessment: high|medium|low
applicability-boundary: "Known valid range: X to Y"
```

### Epistemic Type Definitions

| Type | Definition | Trust Calibration |
|------|------------|-------------------|
| Direct | 5+ examples in same category | Standard confidence |
| Interpolated | 2-4 examples, inferring middle | Reduce confidence 1 level |
| Extrapolated | projecting beyond known range | Mark with explicit warning |
| Analogical | Cross-domain transfer | Assess transferability, reduce confidence |

### Communication Templates

When presenting knowledge:
- Direct: "Based on [N] examples in [topic], ..."
- Interpolated: "Available data points at [A] and [C] suggest [B]; verify for edge cases"
- Extrapolated: "Projecting beyond observed range [A-B] to [C]; high uncertainty"
- Analogical: "[Domain X] shows pattern; similar structure in [Domain Y] suggests..."

## Why This Is a Seed Gap

The Seed covers:
- Confidence levels (high/medium/low/speculative)
- Verification status (verified/unverified/drill-verified)
- Source quality tracking

The Seed misses:
- Distinguishing evidence density (20 examples vs 2)
- Marking inference type (interpolation vs extrapolation)
- Assessing cross-domain transferability
- Communicating applicability boundaries

This is distinct from existing confidence markers because it's about **how** knowledge was derived, not **how much** the vault trusts it.

## Related Seed Rules

- [[Confidence Markers]] — Extend with epistemic type
- [[Frontier Exploration - Sparse Knowledge Reasoning]] — Frontier exploration this gap emerged from
- [[Seed Gap - Distributed Understanding Threshold]] — Related to coverage awareness
- [[Frontier Exploration - Cross-Domain Knowledge Synthesis]] — Analogical transfer context
