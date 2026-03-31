---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: archived
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - verification
  - pottery
  - ceramics
  - iterative-verification
  - domain-specific
  - superseded
gap-type: seed-missing
gap-status: superseded
gap-source: stress-test
discovered: 2026-03-25
superseded-date: 2026-03-29
superseded-reason: "Content merged into [[Seed Gap - Verification Timeline Management]] — pottery/ceramics multi-context verification integrated into unified timeline framework"
merged-into: [[Seed Gap - Verification Timeline Management]]
---

# Seed Gap - Verification Timeline for High-Iteration Domains

## Identified Gap

The Seed's verification timeline assumes standard cycles (30 days), but domains like pottery and ceramics require fundamentally different verification approaches due to inherent iteration constraints.

## The Problem

**Seed assumption:** Verification can be completed within 30 days
**Reality for pottery/ceramics:** 
- Single firing cycle takes 2-4 weeks (clay → dry → bisque → glaze → final)
- Same glaze fires differently in electric vs gas vs wood-fired kilns
- Multiple atmosphere types must be tested for complete verification
- Complete verification requires 3+ firing cycles minimum

## Evidence from Existing Stress Test

The note [[Seed Stress Test - Pottery and Ceramics Knowledge Base]] (2026-03-25) already documents this:

> **Issue Found:** The Seed's verification timeline assumes days-to-months, but pottery verification requires:
> 1. Multi-week cycles — clay → dry → bisque fire → glaze → glaze fire → final result (2-4 weeks minimum)
> 2. Context-dependent results — same glaze fires differently in electric vs gas vs wood kiln
> 3. Iteration required — single test is insufficient (need multiple firings to confirm)

## Proposed Seed Update

Add to the verification ratio rule (or create new rule):

**Rule:** For high-iteration verification domains (pottery, ceramics, metallurgy, materials science), adjust verification timelines to account for inherent iteration constraints.

**Test:** For verification-dependent notes in iteration-heavy domains: (1) Can verification be completed in <30 days? (2) Does the note account for multi-context testing (different equipment, atmospheres, conditions)? (3) Is verification-iteration-required marked appropriately?

**Implementation:**
```yaml
verification-iteration-required: true
verification-cycles-expected: 3-5
verification-cycle-duration: 2-4weeks
verification-contexts-required:
  - electric-kiln
  - gas-kiln-reduction
  - wood-kiln
```

**Distinction:** This is different from the seasonal verification edge case - seasonal is about *when* verification is possible (time of year), this is about *how many iterations* are needed (inherent to the domain).

## Related

- [[Seed Stress Test - Pottery and Ceramics Knowledge Base]] - Documents the specific issues
- [[Seed Stress Test - Cooking Knowledge Base]] - May have similar iteration issues (taste testing)
- [[Verification Ratio Rule]] - The rule being extended
- [[Embodied Knowledge Rule]] - Related to why verification differs- [[_root]]
