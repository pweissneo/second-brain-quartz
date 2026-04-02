---
last-reviewed: 2026-03-28
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-type: seed-missing
gap-status: superseded
gap-priority: medium
gap-phase: discovery
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-03-27
deprecated-date: 2026-03-28
deprecated-reason: superseded
replaced-by: [[Seed Gap - Compound Gap Pattern - Domain-Velocity and Dual-Nature Intersection]]
compound-gap: true
intersects-with:
  - [[Seed Gap - Domain-Velocity Confidence Decay]]
  - [[Seed Gap - Dual-Nature Domain Handling]]
---

# Seed Gap: Technology-Heavy Dual-Nature Domain Handling

> ⚠️ **DEPRECATED**: This gap has been superseded by [[Seed Gap - Compound Gap Pattern - Domain-Velocity and Dual-Nature Intersection]]. The compound gap note synthesizes this gap with Dual-Nature Domain Handling into a unified solution.

## Gap Identification

**What was explored:** Running FRONTIER_EXPLORATION to identify what the Seed is missing when applied to technology-heavy creative domains like photography, videography, and digital art.

**Key insight:** Two existing Seed Gaps (Domain-Velocity Confidence Decay and Dual-Nature Domain Handling) intersect in ways that create a compound gap not addressed by either alone.

## The Compound Problem

Technology-heavy dual-nature domains (photography, videography, digital audio, graphic design) face both challenges simultaneously:

1. **Domain velocity challenge:** Technology changes rapidly — camera firmware updates, software versions, new lens releases — creating fast confidence decay
2. **Dual-nature challenge:** Each note contains both technical (objective, testable) and aesthetic (subjective, experiential) elements

When these intersect, the Seed fails in compound ways:

| Scenario | Domain-Velocity Gap | Dual-Nature Gap | Compound Failure |
|----------|---------------------|-----------------|------------------|
| Camera menu settings note | Fast decay needed, but Seed uses uniform 30-day | Purely technical — wrong verification pathway | Confidence stays high despite rapid obsolescence |
| Composition principle note | Slow decay (aesthetic is stable) | Purely aesthetic — missing experiential tagging | Treated as technical when it's subjective |
| Lightroom workflow note | Software updates change workflow | Hybrid — needs both technical AND aesthetic verification | Technical verification passes but aesthetic judgment untested |

## Current Seed Gaps (Existing)

1. **Domain-Velocity Confidence Decay** (gap-status: identified, discovered 2026-03-27): Proposes domain-specific review intervals but doesn't account for dual-nature within domains
2. **Dual-Nature Domain Handling** (gap-status: identified, discovered 2026-03-26): Proposes knowledge-type tagging but doesn't account for velocity differences within types

## What Both Gaps Miss

Neither gap addresses:
- **Technical elements in dual-nature domains have different velocity than aesthetic elements** — Camera menus change faster than composition principles
- **Velocity affects which verification pathway is appropriate** — A fast-changing technical note needs different verification than a slow-changing aesthetic note
- **Compound confidence decay** — A hybrid note needs compound confidence (technical confidence AND aesthetic confidence separately)

## Proposed Compound Solution

### Rule: Technology-Heavy Dual-Nature Domain Structure

```yaml
# Note-level frontmatter for tech-heavy dual-nature notes
knowledge-type: technical|aesthetic|hybrid
technical-elements: [list]
aesthetic-elements: [list]

# Compound confidence (separate tracks)
confidence:
  technical: high|emerging|disputed|obsolete
  aesthetic: high|emerging|disputed|obsolete
  last-reviewed-technical: YYYY-MM-DD
  last-reviewed-aesthetic: YYYY-MM-DD

# Domain-velocity aware decay
decay-rate:
  technical: 30-90 days  # fast for technology
  aesthetic: 180-365 days  # slow for aesthetic principles
```

**Why:** Separate confidence tracking allows:
- Technical confidence decays faster (technology changes)
- Aesthetic confidence decays slower (principles stable)
- Different verification pathways for each element
- Accurate representation of knowledge state

**Test:** For a photography note about "camera menu navigation for bird photography":
1. Can you separate technical elements (menu structure, custom settings) from aesthetic elements (composition approach for birds)?
2. Does technical confidence decay faster than aesthetic confidence?
3. Are different verification methods applied to each element?

### Alternative: Simplified Approach

If compound confidence is too complex, at minimum:

```yaml
# For dual-nature domains, apply velocity-based verification priority
verification-priority: technical|aesthetic|both
technical-review-interval: 30-90 days
aesthetic-review-interval: 180-365 days
```

The element that changes faster (technical in tech-heavy domains) gets more frequent review.

## Related Seed Rules and Gaps

- [[Seed Gap - Domain-Velocity Confidence Decay]] — First intersection gap
- [[Seed Gap - Dual-Nature Domain Handling]] — Second intersection gap
- [[Seed Stress Test - Photography Knowledge Base]] — Source of many insights
- [[Seed Stress Test - Audio Engineering Knowledge Base]] — Related tech-heavy domain
- [[AI-Assisted Knowledge Management Seed]] — Primary Seed (lines 553, 715-719 for experiential; lines 1606, 2047 for domain velocity)

## Gap-to-Seed Pathway

This gap should be resolved AFTER both Domain-Velocity and Dual-Nature gaps are resolved, as it builds on both. The compound solution requires:
1. Domain-velocity rules to be mature
2. Dual-nature handling to be mature
3. Then their intersection can be properly addressed

**This note serves as documentation of the intersection problem for future Seed development.**