---
last-reviewed: 2026-03-23
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - verification-ratio
  - woodworking
  - craft-knowledge
  - temporal-constraints
domain: woodworking
---

# Seed Stress Test: Verification Ratio Rule in Woodworking

**Tested Rule:** Track vault growth velocity and maintain verification ratio — a healthy vault verifies at least 50% of new captures within 30 days.

**Date:** 2026-03-23

## Domain: Woodworking

Woodworking is a craft domain where:
- Projects take weeks to months (a dovetail joint box: 20+ hours over multiple sessions)
- Techniques require seasonal verification (outdoor finishing only viable in warm/dry weather)
- Material behavior varies by species, moisture content, and grain direction
- Tool performance changes as blades dull, bits burn, and machines wear

## Where the Rule Works

The verification ratio concept is sound:
- Capturing knowledge without testing = potential misinformation
- High-ratio vaults have higher-quality, actionable knowledge
- The rule prevents "note hoarding" in craft domains

## Edge Cases Discovered

### Edge Case 1: Project-Based Knowledge (Long Verification Cycles)

**Problem:** Many woodworking notes describe complete projects:
- "Build a Morris Chair" — 40+ hour project, verification takes months
- "Dovetail Joint Technique" — requires hundreds of joints to validate
- "Finish a Tabletop" — finishing only testable after full cure (2-4 weeks)

The 30-day window is unrealistic for project-based knowledge.

**Analysis:**
- A router technique learned today might not be fully verified until the next project uses it
- Finishing knowledge can only be verified when weather conditions allow
- Joint fitting skills improve gradually over years, not weeks

**Recommendation:** Add `verification-cycle:` field with values:
- `immediate` — technique testable in same session
- `project-based` — verified within 1-3 projects
- `seasonal` — requires specific weather/season conditions
- `long-term` — requires months/years to validate

For `project-based` and `long-term`, the 30-day window should extend to:
- Project-based: 90 days (1-2 typical projects)
- Seasonal: next appropriate season (up to 12 months)
- Long-term: 365 days

### Edge Case 2: Material Variability

**Problem:** Wood behavior varies by species:
- Pine behaves differently than walnut
- Quarter-sawn oak different from flat-saw
- Green wood vs. kiln-dried vs. air-dried

A technique "verified" on pine may fail on walnut. The Seed doesn't address verification that is material-specific.

**Recommendation:** Add `verification-materials:` field listing what materials the note has been tested with. Notes should aim for 3+ material types before being considered "verified."

### Edge Case 3: Tool-Specific Knowledge

**Problem:** Woodworking tools vary widely:
- Table saw: different brands, blade types, fence systems
- Hand planes: vintage vs. new, different manufacturers
- Chisels: high-carbon steel vs. stainless vs. import

A technique verified on one tool may not transfer. Like material variability, tool verification should track scope.

**Recommendation:** Add `verification-tools:` field. Track tool brands/models tested. High-value techniques should be verified across 2+ tool types.

### Edge Case 4: Seasonal Knowledge

**Problem:** Some knowledge is only verifiable at certain times:
- Outdoor finishing (temperature/humidity dependent): spring-fall only in temperate climates
- Wood storage/conditioning: only testable over seasonal transitions
- Outdoor project assembly: weather-dependent

Capturing these in winter and expecting verification before spring is unrealistic.

**Recommendation:** Use existing `verification-season:` field. In Seed, add:
```yaml
verification-window: spring|summer|fall|winter|any
```

Notes with `verification-window: seasonal` are exempt from 30-day ratio calculation until appropriate season arrives.

### Edge Case 5: Skill Progression Verification

**Problem:** Some knowledge represents skill levels:
- "Basic Dovetail Technique" — can verify quickly (1-2 hours)
- "Advanced Dovetail Technique" — requires years of practice
- "Master-level Hand Fitting" — never fully "verified" as skill is infinite

The Seed treats all notes equally but verification difficulty varies by skill level.

**Recommendation:** Differentiate verification expectations by skill-level notes:
- `skill-level: beginner` — 30-day verification
- `skill-level: intermediate` — 90-day verification  
- `skill-level: advanced` — 180-day verification
- `skill-level: master` — ongoing, mark as `verification-status: asymptotic`

## Proposed Seed Update

Add to the verification ratio rule:

```yaml
verification-modifiers:
  cycle-type: immediate|project-based|seasonal|long-term
  cycle-duration-days: 30|90|180|365
  materials-tested: [list of material types]
  tools-tested: [list of tool types/brands]
  skill-level: beginner|intermediate|advanced|master
  verification-window: spring|summer|fall|winter|any
```

For woodworking notes, calculate verification ratio using:
- 30 days for `immediate` cycle
- 90 days for `project-based`
- Up to 365 days for `seasonal`
- 180 days for `long-term`

## Test for AI Agents

Pick 10 woodworking notes:
1. Does each have a `verification-cycle:` or `verification-window:` field?
2. Is the 30-day requirement adjusted based on cycle type?
3. Does material/tool specificity affect verification status?
4. Can you identify notes where seasonal constraints apply?

## Conclusion

The verification ratio rule needs adaptation for craft domains with long project cycles, seasonal constraints, and material-specific knowledge. The concept (verify what you capture) remains valid, but the 30-day window is too rigid for woodworking.

---
See also:
- [[AI-Assisted Knowledge Management Seed]] — Source rule
- [[Seed Stress Test - Knowledge Debt Rule in Woodworking]] — Overlapping content on verification timing for craft domains (covers debt calculation; related edge cases)
- [[Frontier Exploration - Woodworking Knowledge Bases]] — Domain exploration
- [[Stress Test - Note Lifecycle Rule Across Domains]] — Lifecycle considerations
