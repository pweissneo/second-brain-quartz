---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - verification
  - temporal-knowledge
  - workflow
gap-type: seed-missing
gap-phase: analysis
gap-status: proposed
gap-source: stress-test
discovered: 2026-03-28
proposed-date: 2026-03-29
merged-from: [[Seed Gap - Verification Timeline for High-Iteration Domains]]
---

# Seed Gap: Verification Timeline Management

This note documents a gap in the Seed's verification timeline management. Related notes:
- [[Seed Gap - Verification Timeline for High-Iteration Domains]]
- [[Note Lifecycle Management]]
- [[Seed Stress Test - Gardening Knowledge Base]] (multi-year verification example)
- [[Seed Stress Test - Cooking Knowledge Base]] (seasonal verification example)

## Gap Identification

**Problem:** The Seed contains verification rules for multiple timeline types but lacks a unified workflow for managing them.

### Existing Seed Rules (Fragmented)

1. **30-day standard verification** — "verify at least 50% of new captures within 30 days"
2. **Multi-year verification** — for gardening/perennials with `verification-completion-target`
3. **Seasonal verification** — for cooking/cyclical domains with `verification-cycle`
4. **Construction phase criteria** — verification ratio >50% for maturity transition
5. **Decay functions** — for time-sensitive knowledge with `review-trigger`
6. **Prediction verification** — with explicit verification windows

### The Gap

No consolidated **verification timeline management** workflow that tells an AI:
- How to track notes by verification timeline type
- How to prioritize which notes to verify next
- How to handle mixed timeline types in the same vault
- How to surface notes approaching their verification deadline

## Why This Matters

A vault with gardening notes (multi-year), cooking notes (seasonal), and general knowledge (30-day) needs a unified timeline management approach. Without it:
- An AI must understand 5+ different verification fields to manage verification
- There's no "upcoming verification" dashboard or query
- Notes with `verification-completion-target: 2029` vs `verification-cycle: seasonal` aren't handled systematically

## Proposed Rule

**Rule:** Implement unified verification timeline management — use a single `verification-timeline:` field to categorize notes by timeline type, with automated sorting for verification priority.

```yaml
# Timeline types
verification-timeline: standard|seasonal|multi-year|predictive|custom

# Related fields for each type
# standard: verification-status, last-reviewed (30-day cycle)
# seasonal: verification-cycle, verification-season, verification-window
# multi-year: verification-cycle, verification-completion-target, verification-years-completed
# predictive: verification-window, prediction-accuracy (tracked post-outcome)
# custom: verification-interval, next-review-date, review-trigger
```

**Why:** Different timeline types need different management approaches. Unified categorization enables AI to:
- Query "show all notes due for verification this month"
- Sort by urgency (predictive > standard > seasonal > multi-year)
- Set appropriate alerts for each type

**Test:** (1) Can you categorize every note by verification-timeline? (2) Can you query "notes due for verification in next 30 days"? (3) Is there a priority ordering for verification tasks?

## Alternative: Extend Existing Rule

Instead of new rule, extend the existing "verification ratio" rule to include timeline management:

> **Rule:** Track verification by timeline type — maintain separate ratios for standard (30-day), seasonal (next window), multi-year (annual check-in), and predictive (post-outcome) knowledge.

**Test:** Can you report verification ratio separately for each timeline type?

## Domain Testing

This gap appears when stress-testing:
- Gardening (multi-year timeline dominates)
- Cooking (mix of seasonal + standard)
- Historical research (predictive for predictions, standard for facts)
- Personal productivity (standard for methods, custom for goals)

---

*Identified during SEED_STRESS_TEST on 2026-03-28 — testing verification rules across domains revealed scattered timeline handling.*