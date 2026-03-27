---
last-reviewed: 2026-03-25
last-updated: 2026-03-25
confidence: emerging
author-type: ai-assisted
lifecycle: seed-gap
meta-type: capture-process
schema-version: "1.0"
level: frontier
tags:
  - frontier-exploration
  - temporal-knowledge
  - expiration
  - gap-identified
---

# Seed Gap - Knowledge with Inherent Expiration Windows

## The Identified Gap

The Seed has rules for several temporal knowledge types:

| Type | Seed Coverage | Example |
|------|---------------|---------|
| Time-sensitive data | ✅ Rule about utility-expiry | Stock prices, weather |
| Outdated knowledge | ✅ correction-type: outdated | Was correct, now wrong |
| Deadline-driven | ✅ expiration-interval, deadline categories | Filing dates, discounts |
| Ephemeral knowledge | ✅ capture-method metadata | Live events, performances |
| Slow evolution | ✅ evolution-pattern: slow | Best practices drift |

**Missing:** Knowledge with **inherent built-in expiration** — knowledge captured at a specific moment that becomes "no longer applicable" (not wrong, just no longer relevant) after a predetermined time window passes.

## What Makes This Different

This is distinct from all existing categories:

- **Not time-sensitive data** — can't be "looked up" after expiration (the event happened)
- **Not outdated** — wasn't "correct then, wrong now" (just context-dependent)
- **Not deadline-driven** — no action required, just context that expired
- **Not ephemeral** — the recording/artifacts exist, but the knowledge about "this specific instance" is no longer useful

## Examples

### Example 1: Event-Specific Knowledge
- "The conference is March 25-27" → After March 27, this is historical, not useful
- "Speaker X is presenting at 3pm" → After the talk, timing info irrelevant
- "Early bird registration ends Friday" → After Friday, price no longer applies

### Example 2: Seasonal Knowledge Used Out of Season
- "Plant tomatoes after last frost" → Useful in spring, just context-dependent in fall
- "Pumpkin season starts September" → True year-round, but only actionable seasonally

### Example 3: Time-Limited Opportunity Context
- "This sale runs through March" → After March, just historical
- "Current promotion: 50% off" → After promotion ends, no longer actionable

### Example 4: One-Time State Knowledge
- "Server is down" → After server is fixed, this is just log
- "Team meeting at 2pm" → After meeting, just historical record

## Core Distinction

The key insight: This knowledge was **never wrong** — it's just that the **validity window has closed**. The difference between:

- **Outdated**: "I believed X, but X turned out to be false"
- **Inherent expiration**: "X was true and useful, but the context it applied to has passed"

Both result in "not currently useful" but the *reason* is different, and the handling should be different.

## Proposed Seed Rule

### Rule: Tag knowledge with inherent expiration windows using validity-period metadata

**Why:** Knowledge with built-in expiration windows (events, seasonal, time-limited) requires different handling than outdated or time-sensitive data. The AI needs to know: (1) This knowledge has a specific applicability window, (2) After the window closes, it's not "wrong" just "no longer applicable," (3) It should be archived rather than corrected.

**Test:** Pick 10 notes containing time-specific information (event details, seasonal guidance, promotional context). (1) Can you identify which have inherent expiration vs. general applicability? (2) Do they have metadata distinguishing "window has closed" from "knowledge is wrong"?

**Implementation:**
```yaml
expiration-type: inherent  # distinct from utility-expiry (time-sensitive)
validity-period:
  start: 2026-03-25  # when this knowledge became applicable
  end: 2026-03-27   # when applicability ends
applicability-status: active|expired|archived
post-expiration-handling: historical-archive|delete|review
```

**Distinction from existing fields:**
- `expiration-interval`: How often to REVIEW (deadline-driven)
- `utility-expiry`: When utility expires (time-sensitive data)
- `validity-period`: When the knowledge WAS applicable (inherent expiration)
- `was-valid-until`: For outdated/incorrect knowledge

## Why This Matters

Without this distinction:
1. AI treats expired event knowledge as "potentially still useful" 
2. No differentiation between "wrong" and "no longer applicable"
3. Archives fill with context that's no longer actionable
4. Verification gets confused about what "expired" means

## Related Notes

- [[Frontier Exploration - Ephemeral and Event-Based Knowledge]] — related but covers capture, not expiration
- [[Handling Temporal Knowledge]] — covers related temporal aspects
- [[Seed Gap - Recurring and Periodic Knowledge]] — similar but for recurring patterns
- [[Knowledge Aging and Review Cycle Management]] — aging but not expiration windows

---

*This gap was identified during frontier exploration on 2026-03-25. The rule needs testing across domains to validate applicability.*
