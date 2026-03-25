---
last-reviewed: 2026-03-20
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - verification
  - quality-control
  - knowledge-validation
---

# Frontier Exploration - Verification Hierarchy

> Exploring whether the Seed needs explicit guidance on verification priority — which types of verification matter most for different knowledge types.

## The Gap

The Seed covers verification extensively:
- Verification status tracking
- Verification workflows
- Domain-specific verification (experiential, long-horizon, seasonal)
- Source reliability vs verification status

But it does NOT address: **which verification methods should take priority** when resources are limited. If you can only verify one thing, what should you verify first?

## The Problem

Different knowledge types have different verification needs:
- Factual claims need source verification
- Procedural knowledge needs execution verification  
- Taste/preference knowledge needs personal testing
- Expert judgment needs consensus verification

Without a hierarchy, AI agents might spend verification effort on low-value items while high-value items remain unverified.

## Proposed Hierarchy

### Level 1: Safety-Critical (Verify First)
Knowledge that could cause harm if wrong:
- Medical advice
- Safety procedures
- Legal guidance
- Financial decisions
- Technical configurations that could cause damage

**Priority**: Verify before any other type. Require human expert review for high-stakes.

### Level 2: Decision-Critical (Verify Soon)
Knowledge used for important decisions:
- Core principles that many other notes depend on
- Hub notes that inform navigation
- Foundational definitions

**Priority**: Verify before building on them. One error can propagate widely.

### Level 3: Frequently-Referenced (Verify Often)
Knowledge accessed frequently:
- Commonly searched notes
- High-backlink notes
- Entry point notes

**Priority**: Verify based on access frequency. High-traffic notes have outsized impact.

### Level 4: Expensive-to-Verify (Verify Last)
Knowledge requiring significant effort:
- Long-horizon knowledge (gardening, building)
- Experiential knowledge requiring specific conditions
- Domain expertise required

**Priority**: Verify last, or accept lower confidence. Cost-benefit often unfavorable.

### Level 5: Low-Value to Verify (Skip)
Knowledge where verification cost exceeds value:
- Already redundant notes (delete instead)
- Notes near deprecation
- Transient knowledge about events past

**Priority**: Skip verification. Delete or deprecate instead.

## Verification ROI Calculation

```
ROI = (impact × confidence_change) / verification_cost

Where:
- impact = number of notes depending on this knowledge
- confidence_change = expected improvement in confidence
- verification_cost = time/effort required to verify
```

Prioritize high-ROI verifications. Skip low-ROI.

## Test

**Test:** List your top 10 most-verified notes. Do they match Level 1-3 priority? If your most-verified notes are Level 4-5, you're optimizing wrong.

**Test:** For notes marked `criticality: high`, do they all have `verification-status: verified`?

## Rule Proposal (Draft)

**Rule:** Apply verification hierarchy when resources are limited — prioritize safety-critical > decision-critical > frequently-referenced > expensive-to-verify > low-value.
**Why:** Verification effort is finite. Without explicit prioritization, AI agents either verify randomly or default to easiest, missing high-value opportunities.
**Test:** Can you rank your verification backlog by this hierarchy? Does your verification history match Level 1→5 priority?

## Questions for Seed Incorporation

1. Should the Seed include explicit verification priority guidance?
2. Should verification ROI be a required calculation for verification planning?
3. How should this interact with existing verification-ratio rules?

## Related Notes

- [[Stress Test - Confidence Markers Rule Across Domains]] — confidence markers that enable verification prioritization
- [[[Frontier Exploration - Knowledge Maintenance]]] — debt tracking that affects verification priority
- [[AI-Assisted Knowledge Management Seed]] — current verification guidance
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — prioritization frameworks that interact with verification priority
- [[Frontier Exploration - Safety-Critical Knowledge Thresholds]] — safety-critical knowledge handling

## Status

This is frontier exploration — the hierarchy proposed here is preliminary and needs testing across different vault types.

---

**Note written during heartbeat 2026-03-20**
