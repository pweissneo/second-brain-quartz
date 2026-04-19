---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-03
lifecycle: draft
confidence: emerging
tags:
  - seed-refinement
  - verification-ratio
  - creative-writing
  - domain-adaptation
---

# Seed Refinement: Verification Ratio Adaptation for Creative Writing

> Documenting a gap found during frontier exploration: the Seed's verification-ratio rule (50% within 30 days) fails in creative writing domains due to inherently long feedback cycles and subjective verification criteria.

## Finding

During FRONTIER_EXPLORATION on 2026-04-03, I examined the Creative Writing Knowledge Base gaps and found that the [[Seed Gap - Verification Ratio in Creative Writing Domain]] remains unresolved. The core issue:

**Current Seed Rule:**
> "Track vault growth velocity and maintain verification ratio — a healthy vault verifies at least 50% of new captures within 30 days."

**Why This Fails for Creative Writing:**
1. Feedback cycles exceed 30 days by nature (beta readers: 2-8 weeks, workshop: monthly, publication: weeks to months)
2. "Verified" is ambiguous — craft advice is subjective, there's no objective pass/fail
3. Different verification pathways exist: source, empirical, social, publication — all slow

## Insight Gained

The Seed has creative-specific rules:
- Line 108: Creative composition as principles + examples
- Line 113: Creative project phase structure
- Line 1010: Subjective domains use modified utility test
- Line 1148: A/B testing as experimental proxy

BUT the verification-ratio rule hasn't been adapted for creative writing. This creates:
- False negatives (vault marked "unhealthy" when it's actually slow-but-valid)
- Incorrect responses (pause exploration when creative exploration should continue)

## Proposed Seed Rule Addition

Add to verification-ratio section:

> **Rule (NEW - 2026-04-03):** For knowledge domains where verification cycles exceed 30 days OR verification is inherently subjective, apply domain-aware verification ratios.
>
> **Why:** The 30-day verification window assumes verification is possible within 30 days with objective pass/fail criteria. Creative writing, academic research, and other slow-feedback domains violate these assumptions. Applying standard ratios creates false negatives.
>
> **Test:** For domains with long verification cycles:
> 1. Identify verification cycle duration (typical time to receive feedback)
> 2. Identify verification objectivity (objective pass/fail vs. subjective judgment)
> 3. If cycle >30 days OR subjective: apply modified ratio
> 4. Modified ratio: (verified OR in-progress) / added in last 90 days ≥0.5
> 5. Track verification-mode separately from verification-status

**Implementation for creative writing:**
```yaml
verification-mode: craft-practice|workshop|beta-reader|publication
verification-cycle: short|medium|long|long-horizon
verification-status: practice-validated|workshop-validated|beta-validated|published-validated
```

## Related

- [[Seed Gap - Verification Ratio in Creative Writing Domain]] — original gap note
- [[Frontier Exploration - Creative Writing Knowledge Base Gaps]] — comprehensive gaps
- [[Seed Refinement - Social Verification Mode for Creative Knowledge]] — social verification approach
- [[Seed Stress Test - Verification Ratio in Creative Writing Domain]] — stress test evidence