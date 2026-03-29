---
last-reviewed: 2026-03-28
lifecycle: seed-gap
confidence: high
author-type: ai-assisted
gap-type: seed-missing
gap-status: in-progress
gap-priority: medium
gap-phase: analysis
gap-severity: useful
gap-source: redundancy-scan
discovered: 2026-03-28
tags:
  - seed-gap
  - compound-gap
  - dual-nature-domain
  - domain-velocity
  - methodology
---

# Seed Gap: Compound Gap Pattern - Intersection of Domain-Velocity and Dual-Nature

## Gap Identification

**What was found:** REDUNDANCY_SCAN revealed two Seed Gap notes covering related territory with significant content overlap:
- `Seed Gap - Dual-Nature Domain Handling` (discovered 2026-03-26)
- `Seed Gap - Technology-Heavy Dual-Nature Domain Handling` (discovered 2026-03-27)

**Key insight:** These represent a compound gap pattern — two existing Seed Gaps intersect in ways that create failure modes neither addresses alone.

## The Compound Problem

When **Domain-Velocity Confidence Decay** and **Dual-Nature Domain Handling** intersect:

| Scenario | Domain-Velocity Gap Fails | Dual-Nature Gap Fails | Compound Failure |
|----------|--------------------------|----------------------|------------------|
| Camera firmware update changes menu structure | Domain-velocity says "review annually" but menus changed monthly | Dual-nature says "tag technical/aesthetic" but doesn't address velocity differences within types | Technical elements in dual-nature domains have different velocity than aesthetic elements |
| New lens release | Domain-velocity doesn't distinguish within-domain variation | Dual-nature doesn't account for knowledge obsolescence within types | Lens specs (technical) decay faster than composition (aesthetic) |
| Software version update | Domain-velocity applies uniform interval | Dual-nature treats all technical equally | UI changes (technical) vs. principles (aesthetic) decay at different rates |
| Equipment model cycle | Domain-velocity assumes uniform domain velocity | Dual-nature doesn't distinguish equipment from principles | Equipment knowledge expires in 1-3 years; principles last decades |

**Root cause:** The Seed Gap Analysis Methodology treats gaps as independent. But domains like photography, videography, digital audio, and graphic design expose compound gaps where:
1. Domain-velocity says "apply review interval X"
2. Dual-nature says "tag as technical/aesthetic/hybrid"
3. Neither addresses: **technical elements decay faster than aesthetic elements within the same domain**

## Why Current Rules Fall Short

### Domain-Velocity Confidence Decay (existing gap)
- **Proposes:** Domain-specific review intervals based on knowledge decay rate
- **Gap:** Doesn't account for dual-nature within domains — assumes all technical knowledge decays uniformly

### Dual-Nature Domain Handling (existing gap)
- **Proposes:** Knowledge-type tagging (technical/aesthetic/hybrid) with different verification approaches
- **Gap:** Doesn't account for velocity differences within types — assumes technical knowledge has uniform velocity

### Compound Failure
- **Result:** An AI applying BOTH rules would correctly tag a photography note as "technical" and set "annual review," but would miss that the equipment-specific content (camera menus, lens specifications) needs quarterly review while the technical principles (exposure triangle, depth of field) are stable

## Proposed Seed Extension

### Rule: Velocity-Aware Dual-Nature Structure

**For dual-nature domains, apply velocity-based verification priority:**

```yaml
# For individual notes in tech-heavy dual-nature domains
knowledge-type: technical|aesthetic|hybrid
velocity-layer: equipment-specific|principle-based|contextual

# Velocity layer definitions:
# - equipment-specific: Product specifications, UI/menu knowledge, model-specific教程
#   → Review interval: quarterly (fast decay)
# - principle-based: Foundational concepts that transcend specific products
#   → Review interval: annual or longer (slow decay)
# - contextual: Knowledge that depends on user context but not equipment updates
#   → Review interval: biannual (moderate decay)
```

**Why:** Without velocity-layer tagging, AI agents can't distinguish:
- Which technical elements need frequent verification (equipment)
- Which technical elements are stable (principles)
- How to prioritize limited verification resources

**Test:** For technology-heavy dual-nature domain notes:
1. Can you identify velocity-layer for each technical element?
2. Are equipment-specific items tagged for quarterly review?
3. Are principle-based items tagged for annual+ review?
4. Does verification planning prioritize by velocity?

### Rule: Compound Gap Detection

**When identifying Seed Gaps, explicitly check for intersection patterns:**

```yaml
# In Seed Gap frontmatter
compound-gap: true
intersects-with:
  - [[Seed Gap - Domain-Velocity Confidence Decay]]
  - [[Seed Gap - Dual-Nature Domain Handling]]
compound-failure-mode: description of where both gaps fail together
```

**Why:** The Seed Gap Analysis Methodology currently treats gaps as independent. Without compound-gap detection, intersection patterns remain invisible and get documented as separate gaps that reference each other without synthesizing.

**Test:** When reviewing Seed Gaps:
1. Check existing gaps for potential intersection before creating new ones
2. For related gaps, document compound failure mode explicitly
3. Verify compound solutions address ALL intersection points

## Gap Type

**Meta-Methodology Gap** — The Seed Gap Analysis Methodology itself lacks rules for detecting and documenting compound gaps where multiple gaps interact.

## What the Seed Currently Covers

1. **Seed Gap Analysis Methodology** (Seed Gap Analysis Methodology.md): Framework for identifying domain-specific gaps
2. **Domain-Velocity Confidence Decay**: Gap about review intervals
3. **Dual-Nature Domain Handling**: Gap about technical/aesthetic knowledge types

**What's missing:** Rules for compound gap detection and resolution

## Resolution Path

This compound gap should be resolved AFTER both Domain-Velocity and Dual-Nature gaps reach resolution, as it builds on both. The compound solution requires:

1. Domain-velocity handling to include velocity-layer tagging
2. Dual-nature handling to account for within-type velocity differences
3. Gap Analysis Methodology to include compound-gap detection rules

**Interim action:** Merge the two overlapping notes into one compound-gap note, update both original notes to reference the merged version, and add compound-gap detection to the Gap Analysis Methodology.

## Related

- [[Seed Gap - Domain-Velocity Confidence Decay]] — First intersection gap
- [[Seed Gap - Dual-Nature Domain Handling]] — Second intersection gap
- [[Seed Gap Analysis Methodology]] — Needs compound-gap detection rule
- [[Seed Stress Test - Photography Knowledge Base]] — Domain where compound gap applies
- [[Seed Stress Test - Audio Engineering Knowledge Base]] — Domain where compound gap applies
