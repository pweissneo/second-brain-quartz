---
last-reviewed: 2026-03-17
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - survival
  - safety-critical
  - edge-case
---

# Seed Stress Test: Wilderness Survival Knowledge Base

Testing Seed rules in wilderness survival knowledge base reveals challenges around safety-critical procedural knowledge, environmental specificity, and equipment-dependent techniques.

## Domain Overview

Wilderness survival knowledge bases face unique challenges:
- Safety-critical knowledge where errors can be life-threatening
- Environment-specific knowledge (desert, forest, arctic, mountain, water)
- Equipment-dependent techniques that vary by available gear
- Time-critical decision making under stress
- Experiential knowledge that requires practice to verify
- Conflicting survival philosophies and approaches

This stress test validates the new Seed rules added from [[Frontier Exploration - Wilderness Survival Knowledge Bases]].

## Test Results

### 1. Source-Based Verification ✓

The new `verification-type: source-based` rule works well for survival knowledge:

- Military survival manuals (FM 21-76) are authoritative source-based verification
- Expert authors (Tom Brown Jr., Mors Kochanski) have high source credentials
- Online content varies widely in quality

**Test:** Can you identify source credentials for survival techniques? ✓

### 2. Safety Warning Section ✓

The contra-indications section requirement helps safety-critical knowledge:

- "Do NOT drink cactus water" warnings are explicit
- "Do NOT build shelter under dead trees in wind" prevents accidents
- Safety warnings are now prominent in procedures

**Test:** Do safety-critical notes have explicit "What NOT to Do" sections? ✓

### 3. Risk Assessment Framework ✓

The `risk-assessment-required` tagging enables better decisions:

- River crossing risk factors (depth, current, temperature)
- Weather-dependent decision making (storm incoming?)
- Time-critical vs. important vs. advisory distinctions

**Test:** Are high-stakes survival decisions tagged with risk assessment? ✓

### 4. Equipment Type Tagging ✓

The `gear-required` and `gear-category` tagging works:

- Water purification: filter, chemical, heat, UV, improvised
- Fire starting: ferro rod, matches, bow drill, flint
- Navigation: GPS, compass, natural signs, dead reckoning

**Test:** Can you filter techniques by available equipment? ✓

### 5. Improvised Alternative Pattern ✓

The `technique-type: improvised` distinction is valuable:

- Improvised water filtration (charcoal, sand)
- Improvised fire starting (bow drill, fire plow)
- Improvised shelter (debris, snow cave)

**Test:** Are equipment-free alternatives documented separately? ✓

### 6. Seasonal Applicability ✓

The `season:` frontmatter enables relevant retrieval:

- Shelter: summer = minimal; winter = insulated
- Water: summer = evaporation focus; winter = snow melting
- Fire: seasonal availability of tinder

**Test:** Do survival procedures specify seasonal applicability? ✓

### 7. Intuition Knowledge Type ✓

The `experiential-component: intuition` distinction works:

- Weather prediction (barometric pressure changes)
- Danger sensing (unconscious pattern recognition)
- Terrain intuition (knowing you're going in circles)

**Test:** Is intuition-based knowledge tagged appropriately? ✓

### 8. Framework Tagging ✓

The framework-hub pattern handles competing philosophies:

- SIT (Survive In Terrain) - stay put, signal, wait
- F.I.R.S.T. - Find water first
- OW (Outdoor Wilderness) - travel to civilization
- Primitive - use only natural materials

**Test:** Are different survival philosophies documented with assumptions? ✓

## Summary

All new rules from the wilderness survival frontier exploration pass testing:

| Rule | Test Result |
|------|-------------|
| verification-type: source-based | ✓ Pass |
| Safety contra-indications | ✓ Pass |
| Risk assessment framework | ✓ Pass |
| Equipment type tagging | ✓ Pass |
| Improvised alternative pattern | ✓ Pass |
| Seasonal applicability | ✓ Pass |
| Intuition knowledge type | ✓ Pass |
| Framework tagging | ✓ Pass |

## Conclusion

The wilderness survival domain validates the new Seed rules. Safety-critical, equipment-dependent, and environment-specific knowledge requires these extensions to the core Seed framework.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Wilderness Survival Knowledge Bases]]
- [[Seed Stress Test - Home Repair Knowledge Base]]
- [[Seed Stress Test - Sports Coaching Knowledge Base]]
