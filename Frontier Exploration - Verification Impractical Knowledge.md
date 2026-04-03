---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: frontier-exploration
confidence: medium
gap-type: frontier-exploration
domain-applicability: universal
author-type: ai-assisted
tags:
  - frontier-exploration
  - verification
  - epistemic-uncertainty
---

# Frontier Exploration - Verification Impractical Knowledge

> When building a knowledge base in domains where verification is expensive, dangerous, or simply impractical, how should an AI agent decide what to capture and how to flag knowledge appropriately?

## The Problem

The Seed's verification rules assume verification is achievable:
- Check sources
- Cross-reference claims
- Seek multiple perspectives
- Verify through experimentation

But some knowledge domains make verification extremely impractical:

### Verification-Unfriendly Domains

1. **Long-horizon knowledge** - Effects that take decades to manifest (climate change, infrastructure lifespan, medical long-term drug trials)
2. **Expensive experimentation** - Fields requiring expensive equipment, rare materials, or specialized facilities
3. **Dangerous/harmful verification** - Would cause harm to verify (emergency procedures, safety-critical failures)
4. **Single-opportunity events** - Historical events that cannot be repeated
5. **Personal/subjective knowledge** - Where verification means personal experience
6. **Novel/emerging domains** - Where no verification methodology exists yet

## The Gap

The Seed covers "what to verify" but not:
- **When verification is impractical** - How to recognize verification-expensive knowledge
- **Alternative assurance mechanisms** - What to do when you cannot verify
- **Confidence calibration** - How to flag knowledge appropriately when verification is blocked
- **When to skip capture entirely** - When unverifiable knowledge creates more noise than value

## Research Questions

1. What alternative assurance mechanisms exist for verification-impractical knowledge?
   - Proportional verification (verify a sample rather than all)
   - Expert consensus proxies (what do experts trust without direct verification?)
   - Historical accuracy track records (has the source been reliable in verifiable areas?)
   - Structural reasonableness (does the claim contradict known frameworks?)
   - Source reputation and credentialing

2. How should confidence be calibrated for unverifiable knowledge?
   - Explicit confidence markers for unverifiable status
   - Provenance transparency (where did this come from?)
   - Epistemic humility (what would change this knowledge?)
   - Temporal bounds (how current is this?)

3. When should capture be skipped?
   - When unverifiable claims contradict verifiable ones
   - When unverifiable adds no value beyond verifiable
   - When unverifiable creates false confidence

## Seed Rule Proposal

**Rule:** For knowledge in verification-impractical domains, use alternative assurance mechanisms and explicit confidence calibration rather than treating unverifiable as equivalent to verified.

**Why:** Verification-impractical knowledge that pretends to be verified creates false confidence. Users treat uncalibrated knowledge as verified, leading to poor decisions. Alternative assurance (proportional verification, reputation tracking, structural reasonableness) provides useful signal without the cost of direct verification.

**Test:** For knowledge that cannot be directly verified:
1. Can you identify it as verification-impractical?
2. Has an alternative assurance mechanism been applied?
3. Is confidence explicitly calibrated to unverifiable status?
4. Is provenance documented (source, methodology, date)?
5. Are epistemic markers present (what would change this?)?

## Implementation

Frontmatter for verification-impractical knowledge:
```yaml
verification-status: impractical  # vs verified|pending|failed
verification-blocked-by: cost|danger|time-horizon|single-opportunity|no-methodology
alternative-assurance: proportional|consensus|reputation|structural-reasonableness
confidence: low|medium  # calibrated lower than verified
provenance:来源
last-verification-attempt: 2026-04-03
epistemic-markers:
  - what-would-change: "What experiment would validate this?"
  - reliability-history: "Has source been reliable in verifiable areas?"
  - expert-consensus: "Do experts in this domain trust this?"
```

## Related

- [[Seed Gap - Verification Timeline Management]]
- [[Seed Gap - Verification Mode Conflict Resolution]]
- [[Seed Stress Test - Verification Priority Hierarchy in Woodworking]]
- [[Frontier Exploration - Unverifiable Knowledge Handling]]
- [[Confidence Markers]]