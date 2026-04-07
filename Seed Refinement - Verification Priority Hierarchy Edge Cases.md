---
last-reviewed: 2026-04-03
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - verification-priority
  - edge-case
  - embodied-knowledge
  - craft-domains
---

# Seed Refinement: Verification Priority Hierarchy Edge Cases

> Refining the "Verification Priority Hierarchy" rule (added 2026-04-01) based on woodworking domain stress test.
> Date: 2026-04-03

## Original Rule

**Rule (NEW - 2026-04-01):** Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.

**Why:** The Seed enforces verification ratios but provides no guidance on *which* notes to verify first.

**Test:** For verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`? (3) Are hub notes verified before peripheral? (4) Does verification history prioritize in Level 1→4 order?

## Gap Identified

The original rule has multiple edge cases unaddressed:

1. **Multi-category notes** — Notes that fall into multiple priority levels (e.g., tool tuning is both safety-critical AND frequently-referenced)
2. **Verification modality** — No distinction between source verification, drill verification, and embodied verification
3. **Verification timeframes** — Default 30-day window doesn't fit long-horizon knowledge (finishing, large projects)
4. **Source quality in craft domains** — Academic source-quality assumptions don't apply to YouTubers, forums, historical texts
5. **Expert authority** — No guidance on what makes a source authoritative in craft domains
6. **Safety type specificity** — All safety knowledge grouped together, but mechanical vs respiratory vs chemical safety have different priority and timeframes
7. **Verification cost weighting** — No ROI calculation for expensive-to-verify knowledge
8. **Seasonal/environmental constraints** — Some knowledge can only be verified in specific conditions

## Proposed Refinements

### Refinement 1: Multi-Priority Tagging

**Rule:** For notes that fall into multiple verification priority levels, use multi-priority tagging and default to the higher priority level.

**Why:** A table saw tune-up is both safety-critical (kickback risk) AND frequently-referenced (annual task). Without explicit handling, these notes get verified last or not at all.

**Test:** Can you identify notes with multiple priority tags? Do they default to the higher priority level?

**Implementation:**
```yaml
multi-priority: true
priority-levels:
  - safety-critical
  - frequently-referenced
# Verification: default to safety-critical (Level 1)
```

### Refinement 2: Verification Modality Integration

**Rule:** Distinguish verification modality in frontmatter — source (reading/watching), drill (hands-on practice), or embodied (requires extensive experience to judge).

**Why:** "How to tune a table saw" can be source-verified (watch video). "How a properly-fitted dovetail feels" requires embodied verification (make dozens, develop feel). Treating embodied as source-verified creates false confidence.

**Test:** For notes tagged `knowledge-type: experiential` or `embodied: true`, does verification status reflect embodied verification progress? Are verification timeframes appropriate for modality?

**Implementation:**
```yaml
verification-modality: source|drill|embodied
embodied-verification-timeframe: weeks|months
# Embodied knowledge may need project-cycle-based verification, not calendar-based
```

### Refinement 3: Domain-Aware Verification Timeframes

**Rule:** Apply domain-specific verification timeframes that override the default 30-day window for domains where knowledge verification requires longer cycles.

**Why:** Woodworking finishing techniques may take 2-4 weeks to fully verify (finish cure time). Academic-style 30-day verification doesn't fit craft domains.

**Test:** Can you identify notes with non-default verification timeframes? Are verification expectations appropriate to the domain?

**Implementation:**
```yaml
verification-timeframe: short-term|medium-term|long-term
# short-term: 7 days (procedures, techniques)
# medium-term: 30 days (most knowledge)
# long-term: 90+ days (finishing, large projects, durability)

# Domain defaults:
# - cooking: medium-term (recipes can be tested quickly)
# - woodworking: medium-to-long-term (finishing, large projects)
# - gardening: long-term (seasonal growth verification)
# - academic: short-term (literature review)
```

### Refinement 4: Source Quality Weighting for Craft Domains

**Rule:** In craft/embodied domains, weight source verification by authority tier before counting toward verification status.

**Why:** A YouTuber with product sponsorship may have lower reliability than a professional furniture maker. "Source verified" from low-quality source ≠ adequate verification.

**Test:** For craft domain notes, does source quality get assessed before verification status is set? Do you track authority tier?

**Implementation:**
```yaml
authority-tier: professional|experienced-hobbyist|popular|historical
source-quality: high|medium|low

# Weight verification:
# - professional + high source = adequate verification
# - popular + medium source = partial verification (needs drill confirmation)
# - historical = requires safety review (may lack modern safety info)
# - forum posts = low reliability, verify before using
```

### Refinement 5: Expert Authority in Craft Domains

**Rule:** Define domain-specific authority tiers for craft/embodied knowledge domains where formal credentials don't exist.

**Why:** "Expert" means something different in woodworking than in academic medicine. No guidance on what makes a source authoritative in craft domains.

**Test:** Can you categorize sources by authority tier? Do verification expectations differ by tier?

**Implementation:**
```yaml
authority-tier-definitions:
  professional:
    description: "Makes furniture for sale/commission"
    verification-weight: high
  experienced-hobbyist:
    description: "10+ years, multiple completed projects"
    verification-weight: medium-high
  popular:
    description: "Large following, may have conflicts of interest"
    verification-weight: medium
    note: "Verify claims independently"
  historical:
    description: "Pre-1950 sources"
    verification-weight: variable
    note: "Lacks modern power tool safety"
```

### Refinement 6: Safety Type Distinction

**Rule:** Distinguish safety types in frontmatter — mechanical (immediate danger), respiratory/chemical (long-term danger), ergonomic (cumulative injury), noise (hearing damage).

**Why:** "Safety-critical" groups all safety together, but kickback (immediate death risk) vs wood dust (long-term respiratory damage) have different verification priorities and timeframes.

**Test:** For safety-critical notes, can you identify the safety type? Are verification priorities and timeframes appropriate to the danger type?

**Implementation:**
```yaml
safety-type: mechanical|respiratory|chemical|ergonomic|noise
safety-priority: immediate|long-term|ergonomic

# Priority order:
# 1. mechanical (immediate danger) → highest priority, quick verification
# 2. chemical/respiratory (long-term) → high priority, can verify over longer timeframe
# 3. ergonomic (cumulative) → medium priority
# 4. noise → medium priority
```

### Refinement 7: Verification ROI Framework

**Rule:** Calculate verification ROI to prioritize cost-effective verification: ROI = (note_impact × confidence_improvement) / verification_cost_hours.

**Why:** Verifying a finishing technique might take 1000 hours (waiting for finish to age). Verifying a tool technique might take 2 hours (test on scrap). Without ROI weighting, effort goes to low-value verifications.

**Test:** Can you calculate verification ROI? Does verification history prioritize high-ROI items?

**Implementation:**
```yaml
verification-cost-hours: number
# Examples:
# - source check: 0.25 hours
# - scrap test: 2 hours
# - project test: 20 hours
# - long-term durability: 1000+ hours

verification-roi: calculated
# Prioritize: High note impact + low verification cost
```

### Refinement 8: Seasonal/Environmental Constraints

**Rule:** Tag knowledge that requires specific environmental conditions for verification, with status tracking for seasonal constraints.

**Why:** Outdoor finishing can only be verified in summer (temperature dependent). Wood movement only verifiable across seasons (dry winter vs humid summer).

**Test:** Can you identify seasonally-constrained knowledge? Is verification status appropriately paused during off-seasons?

**Implementation:**
```yaml
verification-season: spring|summer|fall|winter|any
environmental-conditions-required: ["temperature > 50°F", "humidity < 60%"]
verification-status: seasonal-pending|verified-in-progress|verified-complete

# For seasonal-pending notes:
# - Don't count toward verification ratio during off-season
# - Set reminder for verification season
```

## Related Notes

- [[Seed Stress Test - Verification Priority Hierarchy in Woodworking]] — Original stress test
- [[Seed Refinement - Verification Priority in Cooking Domain]] — Similar domain analysis
- [[AI-Assisted Knowledge Management Seed]] — Original rule (lines 448-475)
- [[Seed Gap - Sensory Anchor Standardization]] — Embodied knowledge verification
- [[Seed Stress Test - Embodied Knowledge Rule]] — Related embodied knowledge testing

## Summary

The Verification Priority Hierarchy rule needs refinement to handle:
1. Multi-category notes (prioritize higher level by default)
2. Verification modality (source vs drill vs embodied)
3. Domain-aware timeframes (override 30-day default)
4. Source quality weighting (non-academic domains)
5. Expert authority tiers (craft-specific definitions)
6. Safety type distinction (immediate vs long-term danger)
7. Verification ROI (cost-weighted prioritization)
8. Seasonal constraints (environmental verification requirements)