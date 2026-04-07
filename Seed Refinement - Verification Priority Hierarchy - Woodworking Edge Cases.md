---
last-reviewed: 2026-04-01
lifecycle: draft
confidence: emerging
author-type: ai-assisted
knowledge-type: seed-refinement
tags:
  - seed-refinement
  - verification-priority
  - woodworking-domain
  - edge-case
  - multi-priority
  - embodied-verification
  - long-horizon-verification
  - source-quality
  - authority-tier
  - safety-type
  - verification-cost
  - seasonal-verification
---

# Seed Refinement: Verification Priority Hierarchy — Woodworking Domain Edge Cases

> **Status:** Draft — edge cases identified for Seed incorporation
> **Date:** 2026-04-01

## Background

The verification priority hierarchy rule was added to the Seed on 2026-04-01 with this structure:

- **Level 1 (Critical):** Safety-critical knowledge (could cause harm if wrong)
- **Level 2 (High):** Hub notes, core principles, foundational definitions
- **Level 3 (Medium):** Frequently-searched notes, entry points
- **Level 4 (Low):** Expensive-to-verify knowledge, redundant notes

Stress testing this rule against the woodworking domain reveals significant edge cases that are not addressed by the current rule.

## Edge Cases Discovered

### 1. Multi-Priority Notes (CRITICAL GAP)

**Problem:** Some notes fall into multiple priority levels. Current rule provides no guidance.

**Example:** A "Table Saw Tune-Up" note is BOTH:
- Safety-critical (improperly tuned saw = kickback risk = serious injury)
- Frequently-referenced (tune-ups done annually or when problems arise)

**Current gap:** No guidance for notes that belong in multiple priority levels.

**Proposed resolution:**
```yaml
multi-priority: true
priority-levels:
  - safety-critical
  - frequently-referenced
# Default to higher priority level for verification
```

**Impact:** High — this affects tool tuning, sharpening, and other routine maintenance notes across many domains.

---

### 2. Embodied Knowledge Verification Modality

**Problem:** The rule prioritizes WHAT to verify but not HOW. Many woodworking techniques are embodied — cannot be verified by reading sources; requires hands-on practice.

**Examples:**
- "How to tune a table saw" — can be source-verified (watch video, read article)
- "How a properly-fitted dovetail feels" — requires embodied verification (make dozens, develop feel)

**Current gap:** Verification modality (source vs drill vs embodied) not integrated with priority hierarchy.

**Proposed resolution:**
```yaml
verification_modality: source|drill|embodied
embodied_verification_timeframe: weeks|months
```

For embodied knowledge, prioritize verification based on project cycles, not arbitrary 30-day windows.

**Impact:** High — affects all craft and physical skill domains (cooking, music, sports, etc.)

---

### 3. Long-Horizon Verification (Finishing)

**Problem:** Wood finishing techniques may take 2-4 weeks to fully verify (finish cure time, color development, durability).

**Example:** "Oil finish application" — verified immediately, but long-term durability unknown after first application.

**Current gap:** 30-day verification window doesn't fit finishing knowledge.

**Proposed resolution:**
```yaml
verification_timeframe: short-term|medium-term|long-term
# short-term: 7 days
# medium-term: 30 days
# long-term: 90+ days (finishing, large projects)
```

**Impact:** Medium — applies to finishing, large projects, any domain with long validation cycles.

---

### 4. Source Quality Variance in Non-Academic Domains

**Problem:** In woodworking, "verified source" means something different than in academic domains:

| Source Type | Reliability | Notes |
|-------------|-------------|-------|
| Professional furniture maker (teaching) | High | Lost Art Press, Lie-Nielsen workshops |
| YouTuber with product sponsorship | Medium | May favor tools they sell |
| Magazine (published) | Medium | Editorial process, but may be legacy |
| Forum posts | Low-Variable | Anecdotal, skill-dependent |
| Historical (pre-1950) | Variable | Techniques valid, but lacks power tool safety |

**Current gap:** No source quality weighting for non-academic domains.

**Proposed resolution:**
```yaml
authority_tier: professional|experienced-hobbyist|popular|historical
source_quality: high|medium|low
```

For woodworking: "Source verified" from low-quality source ≠ adequate verification.

**Impact:** High — applies to all craft, hobby, and experiential domains.

---

### 5. Expert Verification Hierarchy

**Problem:** Who qualifies as an "expert" in woodworking?

**Current gap:** No guidance on what makes a source authoritative in craft domains.

**Proposed resolution:**
```yaml
authority_tier: professional|experienced_hobbyist|popular|historical
# professional: Makes furniture for sale/commission
# experienced_hobbyist: 10+ years, multiple projects
# popular: Large following, may have conflicts of interest
# historical: Pre-1950 sources lack modern safety
```

**Impact:** Medium — relevant to any domain where credentials are non-standard.

---

### 6. Safety-Critical Specificity

**Problem:** The rule mentions "safety-critical knowledge" but woodworking has multiple safety types:

- **Mechanical safety**: Kickback, entanglement, flying debris (immediate danger)
- **Respiratory safety**: Wood dust (especially hardwoods, MDF, exotic) (long-term danger)
- **Chemical safety**: Finish fumes, solvent exposure
- **Ergonomic safety**: Repetitive strain, lifting injuries
- **Noise safety**: Power tool hearing damage

**Current gap:** All safety knowledge grouped together.

**Proposed resolution:**
```yaml
safety_type: mechanical|respiratory|chemical|ergonomic|noise
safety_priority: immediate|long_term|ergonomic
```

Priority order: Mechanical (Level 1) → Respiratory/Noise (Level 2) → Chemical (Level 2) → Ergonomic (Level 3)

**Impact:** High — applies to all domains with multiple safety types.

---

### 7. Verification Cost Weighting

**Problem:** Verification cost varies dramatically in woodworking:

- **Low cost**: Watch YouTube video, read article (15 min)
- **Medium cost**: Try technique on scrap wood (1-2 hours)
- **High cost**: Full project to verify technique (weeks, expensive materials)
- **Very high cost**: Verify durability of finishing technique (months)

**Current gap:** No cost-weighted verification guidance.

**Proposed resolution:**
```yaml
verification_cost_hours: number
# ROI = (note_impact × confidence_improvement) / verification_cost_hours
```

Apply verification ROI: prioritize source checks (Level 4) for finishing techniques; accept medium-cost verification for core techniques.

**Impact:** Medium — applies to domains with variable verification costs.

---

### 8. Seasonal Verification Constraints

**Problem:** Some woodworking knowledge can only be verified in certain conditions:

- **Outdoor finishing**: Temperature/humidity dependent (summer only in cold climates)
- **Wood movement**: Only verifiable in different seasons (dry winter vs humid summer)
- **Outdoor projects**: Can only verify durability after exposure to elements (years)

**Current gap:** No seasonal/environmental verification guidance.

**Proposed resolution:**
```yaml
verification_season: spring|summer|fall|winter|any
environmental_conditions_required: ["temperature > 50°F", "humidity < 60%"]
verification_timeframe: multi_year
```

For knowledge requiring seasonal verification, set `verification_status: seasonal_pending` and don't count toward verification ratio during off-season.

**Impact:** Low-Medium — applies to outdoor, seasonal, and climate-dependent domains.

---

## Proposed Seed Rule Update

Add these sections to the verification priority hierarchy rule:

### Integration of Multi-Priority Tagging

> **Edge case (NEW - 2026-04-01):** Some notes belong to multiple priority levels. When a note is both safety-critical AND frequently-referenced (e.g., tool maintenance procedures), apply `multi_priority: true` and default to the higher priority level.

### Embodied Knowledge Verification Modality

> **Edge case (NEW - 2026-04-01):** For embodied knowledge (crafts, physical skills, sensory evaluation), verification modality affects priority. Add `verification_modality: source|drill|embodied` and recognize that embodied knowledge requires project-cycle timeframes, not arbitrary 30-day windows.

### Long-Horizon Verification Windows

> **Edge case (NEW - 2026-04-01):** Domains with long verification cycles (finishing, large projects, empirical validation) need `verification_timeframe: short_term|medium_term|long_term` to override default 30-day windows.

### Source Quality in Non-Academic Domains

> **Edge case (NEW - 2026-04-01):** In craft and experiential domains, source quality varies by authority type. Add `authority_tier: professional|experienced_hobbyist|popular|historical` and weight verification accordingly.

### Safety Type Distinction

> **Edge case (NEW - 2026-04-01):** Safety-critical knowledge has multiple types with different priority levels. Distinguish: mechanical (highest), respiratory/noise (high), chemical (high), ergonomic (medium).

### Verification Cost ROI

> **Edge case (NEW - 2026-04-01):** Verification cost varies by domain. Apply ROI weighting: `ROI = (note_impact × confidence_improvement) / verification_cost_hours`.

### Seasonal Verification Constraints

> **Edge case (NEW - 2026-04-01):** For knowledge requiring specific seasonal or environmental conditions to verify, use `verification_season` and `verification_status: seasonal_pending` during off-seasons.

---

## Summary Table

| Edge Case | Gap | Proposed Solution | Domains Affected |
|-----------|-----|-------------------|------------------|
| Multi-priority | No guidance for dual-category notes | multi_priority tag | All |
| Embodied modality | HOW not integrated with WHAT | verification_modality field | Craft, physical skills |
| Long-horizon | 30-day window too short | verification_timeframe | Finishing, large projects |
| Source quality | Academic assumption | authority_tier | Craft, hobby |
| Expert definition | No guidance | authority_tier tiers | Non-credentialed domains |
| Safety specificity | All grouped | safety_type distinction | All with safety content |
| Verification cost | Not weighted | verification_cost_hours | Variable cost domains |
| Seasonal constraints | Not addressed | verification_season | Outdoor, climate-dependent |

---

## Related Seed Notes

- [[AI-Assisted Knowledge Management Seed]] — Original rule (lines 369-383)
- [[Seed Stress Test - Verification Priority Hierarchy in Woodworking]] — Full stress test
- [[Seed Refinement - Verification Priority in Cooking Domain]] — Cooking domain edge case (already merged)
- [[Seed Stress Test - Woodworking Knowledge Base]] — Domain stress test
