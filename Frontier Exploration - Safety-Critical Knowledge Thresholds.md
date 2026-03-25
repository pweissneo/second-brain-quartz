---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - safety
  - thresholds
  - quality
related-seed-rules:
  - verification-ratio
  - high-stakes-domains
  - confidence-calibration
---

# Frontier Exploration: Safety-Critical Knowledge Thresholds

> How should a knowledge base handle knowledge where incorrect application can cause real-world harm?

This frontier exploration connects to [[AI-Assisted Knowledge Management Seed]] and relates to [[Stress Test - Confidence Markers Rule Across Domains]], [[Frontier Exploration - Verification Hierarchy]], [[Frontier Exploration - Decision Threshold Knowledge]], and the high-stakes domains edge cases in the Seed.

## The Problem

Some knowledge has **critical thresholds** where crossing a boundary changes the answer from "safe" to "dangerous." Unlike general knowledge where confidence is about source reliability, safety-critical knowledge has objective danger zones:

- **Food safety**: "Keep below 40°F" vs "OK at 41°F" — but 40°F is safe, 140°F is safe, the danger zone 41°F-139°F is not
- **Electrical work**: "Use GFCI in wet locations" — not a suggestion, a safety requirement
- **Chemical handling**: "Wear gloves" — some chemicals cause immediate damage
- **Structural load**: "Max 50 lbs" — exceeding causes failure

The current Seed handles high-stakes domains with elevated verification ratios, but doesn't address **how to explicitly capture and flag threshold-based safety knowledge** where:
1. The threshold itself is the critical information
2. Crossing the threshold has binary outcomes (safe/dangerous)
3. Interpolation or approximation is NOT acceptable

## Why This Matters for the Seed

An AI building a knowledge base about cooking, home improvement, electronics, or any domain with safety implications needs guidance on:
- How to identify safety-critical thresholds
- How to verify threshold accuracy (not just "is this true" but "is this threshold correct")
- How to present thresholds to prevent dangerous interpolation
- How to handle knowledge where "mostly correct" = "potentially harmful"

## Edge Cases to Consider

### Temperature Thresholds
- Food safety temperatures (refrigeration, cooking, holding)
- Chemical storage temperatures
- Equipment operating temperatures

### Quantitative Limits
- Load-bearing limits
- Electrical ratings
- Pressure limits
- Exposure time limits

### Material Compatibility
- Chemical mixing contraindications
- Material ratings (food-safe, fire-rated, etc.)
- Allergen thresholds

### The Interpolation Problem

Safety thresholds should never be presented as "between X and Y." A note saying "cook to 160-165°F" is dangerous if someone interprets 155°F as "close enough." The Seed needs guidance on:
- Presenting thresholds as explicit boundaries, not ranges
- Flagging knowledge where interpolation is dangerous
- Including safety margins in threshold documentation

## Proposed Seed Rule

**Rule:** For knowledge domains with safety implications, explicitly identify and flag critical thresholds where crossing the boundary changes the answer from safe to dangerous.

**Why:** Safety-critical knowledge requires different treatment than general knowledge. Users need to know: (1) What the exact threshold is, (2) What happens when crossed, (3) That interpolation/approximation is unacceptable.

**Test:** For notes in safety-related domains:
1. Can you identify any numerical thresholds where safety depends on meeting or exceeding?
2. Does the note present thresholds as exact boundaries, not ranges?
3. Is there explicit warning when interpolation would be dangerous?
4. Is the verification standard higher than general knowledge (expert source, authoritative standard)?

**Implementation:**
```yaml
safety-critical: true
threshold-type: temperature|load|exposure|chemical|electrical
exact-threshold: "40°F or below"
safety-margin: "Add 5°F buffer for uncertainty"
interpolation-acceptable: false
verification-standard: authoritative-source  # vs general-source
danger-consequence: "foodborne-illness"
```

## Distinction from Existing Rules

This is different from:
- **High-stakes domains** (Rule: maintain >70% verification) — focuses on verification ratio
- **Confidence calibration** (Rule: set initial confidence, adjust over time) — focuses on source reliability
- **Embodied knowledge** (Rule: acknowledge sensory component) — focuses on physical experience
- **Deadline-driven knowledge** (Rule: handle time-sensitive decisions) — focuses on temporal deadlines, not safety boundaries

Safety-critical threshold knowledge is about **the nature of the knowledge itself** — specific boundaries where correctness is binary, not probabilistic.

## Related Notes

- [[Frontier Exploration - Context-Gated Knowledge]] — Knowledge that only applies in specific contexts
- [[Seed Gap - Recurring and Periodic Knowledge]] — consolidated temporal knowledge
- [[AI-Assisted Knowledge Management Seed#embodied-knowledge]] — Knowledge requiring physical experience (covered in Seed)
- [[Handling Temporal Knowledge]] — Knowledge that changes over time

## Questions for Further Exploration

1. Should safety-critical knowledge have automatic elevation to `confidence: high` regardless of source?
2. How to handle knowledge where safety standards vary by jurisdiction?
3. Should safety-critical notes have different presentation requirements (bold warnings, explicit boundaries)?
4. How to verify threshold accuracy without access to authoritative standards bodies?

---

**This is a frontier note** — it explores an area where the Seed has limited guidance. The concept may develop into a full Seed rule, merge with existing rules, or remain as advisory guidance for specific domains.
