---
last-reviewed: 2026-04-03
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
knowledge-type: seed-refinement
verification-status: verified
tags:
  - seed-refinement
  - verification-priority
  - cross-domain
---

# Seed Refinement: Verification Priority Hierarchy Cross-Domain Synthesis

> Synthesizing verification priority refinements from physics, woodworking, and cooking domain stress tests.
> Date: 2026-04-03
> Status: Consolidated from domain-specific stress tests

## Source Materials

This synthesis consolidates insights from:
- [[Seed Refinement - Verification Priority Adaptations]] (Physics domain)
- [[Seed Refinement - Verification Priority Hierarchy Edge Cases]] (Woodworking domain)
- [[Seed Refinement - Verification Priority in Cooking Domain]] (Cooking domain - already merged into Seed)

## Core Problem

The original verification priority hierarchy rule (Level 1: safety-critical → Level 4: cost-effective) has test executability gaps:

1. **Assumes frontmatter exists** — Test expects `safety-critical: true` but domain knowledge often lacks these tags
2. **Conflates foundational with hub** — "Frequently-referenced" mixes notes everything builds FROM with notes everything connects TO
3. **Ignores verification modality** — Source vs. drill vs. embodied verification require different approaches
4. **Wrong timeframes for some domains** — 30-day default doesn't fit finishing (woodworking) or seasonal (gardening) knowledge
5. **Wrong source quality for craft domains** — Academic hierarchies don't apply to YouTubers, forums, historical texts

## Consolidated Refinements

### 1. Detection: Frontmatter + Content Scanning

**Rule:** Supplement frontmatter-based detection with content-based safety keyword scanning for domains with implicit criticality.

**Test:** Can you identify notes with explicit `safety-critical: true` OR domain-specific safety keywords in content?

```yaml
# Domain safety keywords
physics: [radiation, voltage, laser, magnetic-field, cryogenic]
chemistry: [toxic, flammable, corrosive, reactive, explosive]
cooking: [temperature-control, cross-contamination, allergen, toxicity]
woodworking: [kickback, entanglement, respiratory, chemical-finish]
```

### 2. Category: Distinguish Foundational from Hub

**Rule:** Verify foundational notes (core equations, fundamental laws) using correctness checks; verify hub notes using completeness checks.

**Test:** Are foundational notes verified separately from hub notes with appropriate approaches?

```yaml
note-category: foundational|hub|applied|reference
verification-approach: correctness|completeness|application|accuracy
```

### 3. Modality: Source vs. Drill vs. Embodied

**Rule:** Tag verification modality — source (reading), drill (hands-on practice), embodied (requires extensive experience).

**Test:** For embodied knowledge, does verification status reflect actual practice, not just source reading?

```yaml
verification-modality: source|drill|embodied
embodied-verification-timeframe: weeks|months
```

### 4. Timeframe: Domain-Aware Windows

**Rule:** Apply domain-specific verification timeframes that override the default 30-day window.

**Test:** Can you identify notes with non-default timeframes appropriate to their domain?

```yaml
verification-timeframe: short-term|medium-term|long-term
# Domain defaults:
# - cooking: medium-term (recipes testable quickly)
# - woodworking: long-term (finishing, large projects)
# - gardening: long-term (seasonal)
# - academic: short-term (literature)
```

### 5. Source: Authority Tier for Craft Domains

**Rule:** Weight source verification by authority tier before counting toward verification status.

**Test:** For craft domain notes, does source quality get assessed before verification status?

```yaml
authority-tier: professional|experienced-hobbyist|popular|historical
# Weight: professional (high) → historical (variable, needs safety review)
```

### 6. Safety: Type Distinction

**Rule:** Distinguish safety types — mechanical (immediate), respiratory/chemical (long-term), ergonomic (cumulative).

**Test:** Can you identify safety type? Are verification priorities appropriate?

```yaml
safety-type: mechanical|respiratory|chemical|ergonomic|noise
safety-priority: immediate|long-term|ergonomic
```

### 7. Cost: ROI Framework

**Rule:** Calculate verification ROI: (note_impact × confidence) / verification_cost_hours.

**Test:** Does verification history prioritize high-ROI items?

```yaml
verification-cost-hours: number
verification-roi: calculated
```

### 8. Constraints: Seasonal/Environmental

**Rule:** Tag knowledge requiring specific conditions for verification with seasonal status.

**Test:** Are seasonally-constrained notes appropriately tracked?

```yaml
verification-season: spring|summer|fall|winter|any
verification-status: seasonal-pending
```

## Cross-Domain Test

1. Do notes with explicit `safety-critical: true` have verification-status: verified?
2. For notes WITHOUT frontmatter: Does content contain domain-specific safety keywords?
3. Are foundational notes verified with correctness approach, hubs with completeness?
4. Are verification timeframes appropriate to domain (cooking=short, woodworking=long)?
5. For craft domains: Is authority tier assessed before verification status?
6. For safety-critical notes: Is safety type distinguished (immediate vs long-term)?
7. Is verification ROI calculated for expensive-to-verify knowledge?
8. Are seasonal constraints tracked for environment-dependent knowledge?

## Related

- [[AI-Assisted Knowledge Management Seed]] — Original rule
- [[Seed Stress Test - Verification Priority in Physics]]
- [[Seed Stress Test - Verification Priority Hierarchy in Woodworking]]
- [[Seed Refinement - Verification Priority in Cooking Domain]] (merged into Seed)