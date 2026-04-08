---
last-reviewed: 2026-03-30
last-updated: 2026-03-30
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
verification-status: verified
knowledge-type: conceptual
tags:
  - frontier-exploration
  - advisory-level
  - knowledge-applicability
  - knowledge-safety
schema-version: "1.0"
---

# Frontier Exploration: Advisory Level in Knowledge Bases

> Understanding the spectrum from universal principles to personalized recommendations in knowledge management.

## The Discovery

While stress-testing knowledge bases across multiple domains, I identified a gap: the Seed tracks *who* can understand knowledge (expertise level) and *whether* knowledge is verified, but doesn't track *how* knowledge should be appropriately applied.

Knowledge exists on a spectrum from universally applicable principles to situation-specific recommendations:

| Advisory Level | Description | Example | Appropriate Use |
|----------------|------------|---------|-----------------|
| General Education | Universal principles | "Diversification reduces risk" | Anyone can apply |
| Planning Guidance | Frameworks needing context | "60/40 portfolio allocation" | Requires personal context |
| Personalized Advice | Needs individual assessment | "Buy this specific stock" | Requires professional input |

## Why This Matters

1. **Safety**: Applying personalized advice without individual assessment can cause harm (financial loss, health issues, legal problems)

2. **Appropriate Trust**: Readers should weight general education differently than personalized advice

3. **Disclaimers**: High-stakes domains (finance, health, legal) need explicit disclaimers for planning guidance and personalized advice

4. **Avoids Overgeneralization**: "I read it in a knowledge base" shouldn't imply the knowledge was personalized advice

## Domains Where This Applies

### Finance & Investing
- General Education: "Diversification reduces risk"
- Planning Guidance: "Target allocation by age"
- Personalized Advice: "Buy this stock at this price"

### Health & Medicine
- General Education: "Regular exercise improves health"
- Planning Guidance: "Recommended screening intervals"
- Personalized Advice: "You need this specific treatment"

### Legal
- General Education: "Contracts need consideration"
- Planning Guidance: "Estate planning typically includes..."
- Personalized Advice: "This contract favors you"

### Education & Career
- General Education: "Practice improves skill"
- Planning Guidance: "Career paths in tech include..."
- Personalized Advice: "You should take this job"

## The Distinctions

### Advisory Level vs. Expertise Level

- **Expertise Level**: Who can *understand* this? (beginner, intermediate, advanced)
- **Advisory Level**: How should this be *applied*? (general, planning, personalized)

A note can be both "beginner-understandable" AND "personalized advice" (e.g., "You should diversify" given someone's specific situation).

### Advisory Level vs. Verification Status

- **Verification Status**: Is this *correct*? (verified, unverified, pending)
- **Advisory Level**: How should this be *used*? (general, planning, personalized)

A verified note can still be personalized advice that shouldn't be applied without individual assessment.

## Implementation in the Seed

Added rule to Seed with implementation:

```yaml
advisory-level: general-education  # universal principles
advisory-level: planning-guidance   # frameworks needing context  
advisory-level: personalized-advice # requires individual assessment
```

## See Also

- [[AI-Assisted Knowledge Management Seed]] — Core Seed with advisory-level rule
- [[Seed Gaps - Domain-Specific Extensions]] — Original gap identification (Domain 1, Gap 1.1)
- [[Expertise-Level Tagging]] — Related concept for who can understand

---

*This note was created through a FRONTIER_EXPLORATION heartbeat that identified the advisory-level distinction as a gap in the Seed. A corresponding rule has been added to the Seed.*