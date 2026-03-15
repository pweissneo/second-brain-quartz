---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - equipment-dependencies
  - music-production
  - domain-agnostic
domain: music production
---

# Stress Test: Equipment Dependencies Rule in Music Production

## The Rule Under Test

> **Rule:** Document physical equipment dependencies for procedural knowledge — include what tools are required, which are optional, and what alternatives exist.
> 
> **Test:** For procedural notes (recipes, crafts, repairs, techniques): (1) Is there an `equipment:` field in frontmatter? (2) Does it list required vs. optional tools? (3) Are alternatives documented for optional equipment? (4) For safety-critical equipment, is safety guidance included?

## Why Music Production?

Music production is an excellent stress test because:
- Equipment ranges from free (GarageBand) to $100k+ studios
- Many techniques have multiple valid approaches at different price points
- Software is integral but different from physical equipment
- "Safety" includes hearing protection, not just physical injury

## Key Findings

### Software as Equipment

The Seed rule says "physical equipment," but music production relies heavily on software (DAWs, plugins, virtual instruments).

- DAW (Digital Audio Workstation) is functionally a tool — you can't produce music without one
- Plugins are consumables — you might need specific plugins for techniques
- Virtual instruments require the software to run them

**Proposed Refinement:** Create separate `software:` and `equipment:` fields, or use `equipment:` for all tools (physical AND software) with a `type: physical|software` sub-field.

**Test for AI:** Can an AI agent determine whether this note requires software, physical equipment, or both?

### Quality Spectrum

"Required" equipment in music often exists on a quality spectrum:
- "Record vocals" can use: smartphone → USB microphone ($50) → XLR microphone + interface ($500) → professional studio
- "Mix a track" can be done in: GarageBand (free) → Reaper ($60) → Pro Tools ($30/month)
- "Master a song" can use: free online limiters → iZotope Ozone ($250) → analog mastering chain ($50k+)

**Proposed Refinement:** Add `min-quality:` or `entry-level-alternative:` to each equipment item. Distinguish "works acceptably" from "optimal" equipment.

**Test for AI:** Can a beginner determine what equipment they can START with, not just what professionals use?

### Other Edge Cases Identified

1. **Hearing Safety** — Non-physical "safety" (hearing damage from loud volumes)
2. **Shared Equipment** — Access vs. ownership (studios, rehearsal rooms)
3. **Skill Level** — Equipment needs vary by expertise
4. **Geographic Availability** — Equipment varies by region

## Proposed Rule Refinement

The equipment dependencies rule needs sub-fields addressing:
- Software vs. physical equipment distinction
- Quality tiers (entry-level to professional)
- Safety types (physical, hearing, cumulative)
- Ownership models (required, access-required, service-required)

## Conclusion

The equipment dependencies rule is valuable but needs refinement for domains where:
1. Software is as critical as hardware
2. Quality spectrum is enormous (free to $100k+)
3. Safety includes hearing (not just physical injury)

## Related
- [[Frontier Exploration - Equipment and Tool Dependencies]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Framework-Dependent Knowledge]]
- [[Domain-Specific Knowledge Bases]]
