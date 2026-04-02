---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - verification
  - quality-control
  - knowledge-validation
  - seed-gap
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

**Rule:** Apply verification priority hierarchy when resources are limited — prioritize safety-critical > decision-critical > frequently-referenced > expensive-to-verify > low-value.
**Why:** Verification effort is finite. Without explicit prioritization, AI agents either verify randomly or default to easiest, missing high-value opportunities.
**Test:** Can you rank your verification backlog by this hierarchy? Does your verification history match Level 1→5 priority?

---

**UPDATED PROPOSAL (2026-04-01):**

The Seed covers verification extensively but lacks explicit *prioritization guidance* — which verification to do first when you can't verify everything. This gap was identified in the original frontier exploration.

**Rule (NEW - 2026-04-01):** Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.
**Why:** The Seed enforces verification ratios (50%+ within 30 days) and ceilings (pause at 40% unverified) but provides no guidance on *which* notes to verify first. Without priority hierarchy, AI agents verify randomly or default to easiest, wasting effort on low-value items while high-impact items remain unverified.
**Test:** For your verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`? (3) Are hub notes (high backlink count) verified before peripheral notes? (4) Does your verification history prioritize in Level 1→4 order?

**Implementation:**
```yaml
verification-priority: critical|high|medium|low
# critical = safety-critical (could cause harm if wrong)
# high = decision-critical (foundational, many dependents)
# medium = frequently-referenced (high traffic)
# low = verification cost exceeds value
```

**Priority categories:**
- **Level 1 (Critical):** Knowledge that could cause harm if wrong — medical advice, safety procedures, legal guidance, financial decisions, technical configurations. Requires `criticality: high` AND human expert review before marking verified.
- **Level 2 (High):** Hub notes, core principles, foundational definitions — errors propagate widely. Requires verification before building dependent notes.
- **Level 3 (Medium):** Frequently-searched notes, entry points, high-backlink notes — high traffic means outsized impact from errors.
- **Level 4 (Low):** Expensive-to-verify knowledge (long-horizon, experiential requiring specific conditions), redundant notes (delete instead), deprecated knowledge (skip).

**Verification ROI calculation:**
```
ROI = (note_impact × confidence_improvement) / verification_cost

Where:
- note_impact = backlinks + search_frequency + criticality_weight
- confidence_improvement = expected confidence change if verified
- verification_cost = time/effort required

Prioritize high-ROI verifications.
```

**Interaction with existing Seed rules:**
- This rule complements (does not replace) existing verification-ratio and verification-ceiling rules
- When deciding what to verify next, use this priority hierarchy
- When deciding whether to pause capture (40% ceiling), the priority of what's unverified still matters

**Seed integration target:** Section on verification workflows (around line 340-360), as a complement to the verification-ratio rule.

## Questions for Seed Incorporation

1. Should the Seed include explicit verification priority guidance?
2. Should verification ROI be a required calculation for verification planning?
3. How should this interact with existing verification-ratio rules?

## Related Notes

- [[Seed Stress Test - Confidence Markers Rule Across Domains]] — confidence markers that enable verification prioritization
- [[Frontier Exploration - Verification Method Unavailability]] — when verification tools/processes are inaccessible
- [[Frontier Exploration - Knowledge Maintenance]] — debt tracking that affects verification priority
- [[AI-Assisted Knowledge Management Seed]] — current verification guidance
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — prioritization frameworks that interact with verification priority
- [[Frontier Exploration - Safety-Critical Knowledge Thresholds]] — safety-critical knowledge handling

## Status

This frontier exploration identified a gap in the Seed — verification priority guidance. The proposed rule is ready for Seed integration.

**Update 2026-04-01:** Expanded from 5-level hierarchy to 4-level with ROI calculation, clarified implementation, added interaction with existing Seed rules.

---

**Note written during heartbeat 2026-03-20**
**Updated 2026-04-01** — Expanded proposal with implementation details
