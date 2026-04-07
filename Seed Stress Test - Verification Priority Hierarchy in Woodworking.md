---
last-reviewed: 2026-04-01
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - verification-priority
  - woodworking-domain
  - edge-case
---

# Seed Stress Test: Verification Priority Hierarchy in Woodworking Domain

> Testing the "verification priority hierarchy" rule (added 2026-04-01) against the woodworking domain to identify edge cases and refinements.
> Date: 2026-04-01

## Rule Under Test

**Rule (NEW - 2026-04-01):** Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.

**Why:** The Seed enforces verification ratios (50%+ within 30 days) and ceilings (pause at 40% unverified) but provides no guidance on *which* notes to verify first.

**Test:** For verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`? (3) Are hub notes verified before peripheral? (4) Does verification history prioritize in Level 1→4 order?

---

## Domain: Woodworking Knowledge Base

### Analysis

Woodworking knowledge has unique verification characteristics:
- **Safety-critical**: Power tools can cause severe injury or death
- **Decision-critical**: Wood selection, joinery decisions affect project longevity
- **Experiential/embodied**: Many techniques require hands-on practice to verify
- **Long-horizon**: Finishing results may take weeks to fully assess
- **Source quality variance**: Professional furniture makers vs sponsored YouTubers vs historical texts

### Edge Cases Discovered

#### 1. Tool Tuning as Dual-Category

**Problem:** A table saw tune-up procedure is BOTH:
- **Safety-critical**: Improperly tuned saw = kickback risk = serious injury
- **Frequently-referenced**: Tune-ups are done annually or when problems arise

**Conflict:** Does this get prioritized as safety (Level 1) or frequency (Level 3)?

**Current rule gap:** No guidance for notes that fall into multiple priority levels.

**Recommendation:** Add `multi-priority: true` and default to the higher priority level. For tool tuning: treat as safety-critical (Level 1).

#### 2. Embodied Knowledge Verification Mode

**Problem:** The rule prioritizes WHAT to verify but not HOW. Many woodworking techniques are "embodied" — you cannot verify them by reading sources; you must do them.

**Current rule gap:** Verification modality (source vs drill vs embodied) not integrated with priority hierarchy.

**Example:**
- "How to tune a table saw" — can be source-verified (watch video, read article)
- "How a properly-fitted dovetail feels" — requires embodied verification (make dozens, develop feel)

**Recommendation:** Add to the rule:
```yaml
verification-modality: source|drill|embodied
embodied-verification-timeframe: weeks|months  # How long to develop judgment
```

For embodied knowledge, prioritize verification based on project cycles, not arbitrary 30-day windows.

#### 3. Long-Horizon Verification (Finishing)

**Problem:** Wood finishing techniques may take 2-4 weeks to fully verify (finish cure time, color development, durability).

**Current rule gap:** The 30-day verification window doesn't fit finishing knowledge.

**Example:**
- "Oil finish application" — verified immediately, but long-term durability unknown
- "French polish technique" — takes months to develop the skill to judge

**Recommendation:** Add to the rule:
```yaml
verification-timeframe: short-term|medium-term|long-term
# short-term: 7 days
# medium-term: 30 days  
# long-term: 90+ days (finishing, large projects)
```

Apply domain-aware verification windows: woodworking finishing = medium-to-long-term.

#### 4. Source Quality Variance in Verification

**Problem:** In woodworking, "verified source" means something different than in academic domains:

| Source Type | Reliability | Notes |
|-------------|-------------|-------|
| Professional furniture maker (teaching) | High | Lost Art Press, Lie-Nielsen workshops |
| YouTuber with product sponsorship | Medium | May favor tools they sell |
| Magazine (published) | Medium | Editorial process, but may be legacy |
| Forum posts | Low-Variable | Anecdotal, skill-dependent |
| Historical (pre-1950) | Variable | Techniques valid, but lacks power tool safety |

**Current rule gap:** No source quality weighting for non-academic domains.

**Recommendation:** For woodworking, verify source quality before counting toward verification:
- "Source verified" from low-quality source ≠ adequate verification
- Require `source-quality: high|medium|low` before verification status can be set

#### 5. Expert Verification Hierarchy

**Problem:** Who qualifies as an "expert" in woodworking?

**Current rule gap:** No guidance on what makes a source authoritative in craft domains.

**Questions:**
- Does a professional furniture maker count as expert? What about a hobbyist with 30 years experience?
- Do YouTubers count if they have no formal training but extensive showing history?
- What about historical texts from master woodworkers?

**Recommendation:** Add domain-specific authority guidance:
```yaml
authority-tier: professional|experienced-hobbyist|popular|historical
# professional: Makes furniture for sale/commission
# experienced-hobbyist: 10+ years, multiple projects
# popular: Large following, may have conflicts of interest
# historical: Pre-1950 sources lack modern safety
```

#### 6. Safety-Critical Specificity

**Problem:** The rule mentions "safety-critical knowledge" but woodworking has multiple safety types:

- **Mechanical safety**: Kickback, entanglement, flying debris
- **Respiratory safety**: Wood dust (especially hardwoods, MDF, exotic)
- **Chemical safety**: Finish fumes, solvent exposure
- **Ergonomic safety**: Repetitive strain, lifting injuries
- **Noise safety**: Power tool hearing damage

**Current rule gap:** All safety knowledge grouped together.

**Recommendation:** Distinguish in priority:
1. **Immediate danger** (mechanical): Highest priority
2. **Long-term danger** (respiratory, noise): High priority, but can be verified over longer timeframe
3. **Ergonomic**: Medium priority

#### 7. Verification ROI in Woodworking

**Problem:** The rule mentions "verification cost-effective knowledge" but verification cost varies dramatically in woodworking:

- **Low cost**: Watch YouTube video, read article (15 min)
- **Medium cost**: Try technique on scrap wood (1-2 hours)
- **High cost**: Full project to verify technique (weeks, expensive materials)
- **Very high cost**: Verify durability of finishing technique (months)

**Current rule gap:** No cost-weighted verification guidance.

**Recommendation:** Apply verification ROI in woodworking:
```
ROI = (note_impact × confidence_improvement) / verification_cost_hours

Where verification_cost_hours:
- Source check: 0.25 hours
- Scrap test: 2 hours
- Project test: 20 hours
- Long-term durability: 1000 hours (waiting for finish to age)
```

Prioritize source checks (Level 4) for finishing techniques; accept medium-cost verification for core techniques.

#### 8. Seasonal Verification Constraints

**Problem:** Some woodworking knowledge can only be verified in certain conditions:

- **Outdoor finishing**: Temperature/humidity dependent (summer only in cold climates)
- **Wood movement**: Only verifiable in different seasons (dry winter vs humid summer)
- **Outdoor projects**: Can only verify durability after exposure to elements (years)

**Current rule gap:** No seasonal/environmental verification guidance.

**Recommendation:** Add:
```yaml
verification-season: spring|summer|fall|winter|any
environmental-conditions-required: ["temperature > 50°F", "humidity < 60%"]
verification-timeframe: multi-year  # for outdoor exposure testing
```

For knowledge requiring seasonal verification, set `verification-status: seasonal-pending` and don't count toward verification ratio during off-season.

---

## Proposed Rule Refinements

### 1. Multi-Priority Tagging

```yaml
# For notes that fall into multiple priority levels:
multi-priority: true
priority-levels:
  - safety-critical
  - frequently-referenced
# Default to higher priority level for verification
```

### 2. Verification Modality Integration

```yaml
verification-modality: source|drill|embodied
embodied-verification-timeframe: weeks|months
```

### 3. Domain-Aware Verification Windows

```yaml
verification-timeframe: short-term|medium-term|long-term
# Override default 30-day window for domains that need it
```

### 4. Source Quality Weighting (Non-Academic Domains)

```yaml
authority-tier: professional|experienced-hobbyist|popular|historical
source-quality: high|medium|low
```

### 5. Safety Type Distinction

```yaml
safety-type: mechanical|respiratory|chemical|ergonomic|noise
safety-priority: immediate|long-term|ergonomic
```

### 6. Verification ROI Framework

```yaml
verification-cost-hours: number
verification-roi: calculated
```

### 7. Seasonal/Environmental Constraints

```yaml
verification-season: spring|summer|fall|winter|any
environmental-conditions-required: [list]
```

---

## Summary

| Issue | Current Gap | Proposed Solution |
|-------|-------------|-------------------|
| Multi-category notes | No guidance | multi-priority tag, default to higher |
| Embodied knowledge | Modality not integrated | verification-modality field |
| Long-horizon verification | 30-day window doesn't fit | verification-timeframe field |
| Source quality variance | Academic assumption | authority-tier for craft domains |
| Expert definition | No guidance | Domain-specific authority tiers |
| Safety specificity | All grouped together | safety-type distinction |
| Verification cost | Not weighted | verification-cost-hours + ROI |
| Seasonal constraints | Not addressed | verification-season field |

---

## Test for Verification Priority in Woodworking

Applying the test to woodworking:

1. **Can you identify notes tagged `criticality: high` or `safety-critical: true`?**
   - YES: Many tool safety notes have these tags

2. **Do these have `verification-status: verified`?**
   - PARTIAL: Safety notes often have `verification-status: unverified` because source verification is insufficient — need DRILL verification (actual practice under controlled conditions)

3. **Are hub notes verified before peripheral?**
   - PARTIAL: Hub notes (joinery techniques, tool usage) often have lower verification status than peripheral notes (specific project plans)

4. **Does verification history prioritize in Level 1→4 order?**
   - NO: Current verification appears random, not prioritized

---

## Related

- [[AI-Assisted Knowledge Management Seed]] — Original rule (lines 356-383)
- [[Seed Stress Test - Woodworking Knowledge Base]] — Domain stress test
- [[Seed Refinement - Verification Priority in Cooking Domain]] — Similar domain analysis
- [[Seed Stress Test - Verification Ratio Rule in Woodworking]] — Related verification rule
