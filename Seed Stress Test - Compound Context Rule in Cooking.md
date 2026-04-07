---
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: meta
access-pattern: decision
tags:
  - seed-stress-test
  - compound-context
  - cooking-domain
  - edge-case
---

# Seed Stress Test: Compound Context Rule in Cooking

> Testing the compound context knowledge rule in the cooking domain — where many "rules" depend on multiple simultaneous conditions.

## Rule Under Test

**Rule (NEW - 2026-03-22):** For knowledge that depends on multiple conditions being true simultaneously, explicitly document each condition with `compound-conditions:` frontmatter listing all dependencies and verify applicability by checking ALL conditions, not just the primary one.

**Why:** Compound context knowledge fails silently when any single condition is missed. Without explicit compound documentation, AI agents and users cannot assess whether the knowledge actually applies to their situation.

**Test:** Pick 10 notes with contextual claims (advice, recommendations, procedures). For each: (1) Can you identify all conditions that must be true for this to apply? (2) Does the note explicitly list these conditions? (3) Would missing any single condition make the advice inapplicable or incorrect?

## Domain Context: Cooking

Cooking is RICH in compound context knowledge:
- Recipes depend on equipment, ingredients, altitude, humidity
- Technique advice depends on tool availability, skill level, ingredient properties
- Food safety depends on temperature, time, ingredient type, storage conditions

## Stress Test Questions

### 1. Does the rule make sense for cooking?

**Yes, absolutely.** Cooking advice is almost NEVER universally applicable. "Sear at high heat" depends on:
- Type of protein (thin vs thick cuts)
- Desired outcome (crust only vs fully cooked)
- Equipment (cast iron vs stainless to nonstick)
- Starting temperature (frozen vs thawed)

### 2. Is the Test executable by an AI?

**Partially.** The test asks whether conditions are documented. An AI can check for `compound-conditions:` frontmatter, but judging whether ALL necessary conditions are captured requires domain knowledge.

### 3. Edge Cases Found

#### Edge Case 1: Ingredient Substitution Complexity

**Problem:** "Use olive oil for high-heat cooking"

**Actual conditions:**
- Type of olive oil (extra virgin smokes at lower temp than refined)
- Type of cooking (deep frying vs sautéing)
- Smoke point of specific brand

**Recommendation:** Add `compound-conditions:` to cooking technique notes with ingredient dependencies explicitly listed.

```yaml
compound-conditions: true
conditions:
  - condition: "High-heat cooking method"
    category: technique
    required: true
  - condition: "Oil smoke point above cooking temperature"
    category: ingredient
    required: true
    verification: "Check specific oil brand smoke point"
```

#### Edge Case 2: Altitude Dependencies

**Problem:** "Boil water at 212°F (100°C)"

**Actual conditions:**
- Sea level (212°F)
- Altitude (drops ~2°F per 1000 ft)
- Barometric pressure (weather, storm systems)

**Recommendation:** Add altitude/pressure dependencies to temperature-based cooking notes.

#### Edge Case 3: Equipment Tier Assumptions

**Problem:** "Use a Dutch oven" - what if they don't have one?

**Actual conditions:**
- Budget constraints (Dutch ovens cost $30-200)
- Storage space (large pot vs apartment storage)
- Alternative exists (heavy pot with lid)

**Recommendation:** For equipment-dependent recipes, document minimum equipment requirements AND alternatives.

#### Edge Case 4: Time-Temperature Food Safety

**Problem:** "Cook chicken to 165°F"

**Actual conditions:**
- Whole bird vs parts (parts can be lower)
- Carryover cooking (temperature rises after resting)
- Rest time (affects final internal temp)
- Previous handling (frozen/thawed, past sell-by)

**Recommendation:** Food safety notes should ALWAYS have compound conditions - missing any creates health risk.

#### Edge Case 5: Ingredient Quality/Type Dependencies

**Problem:** "Sugar dissolves at 320°F"

**Actual conditions:**
- Type of sugar (granulated vs caster vs powdered vs honey)
- Altitude (affects boiling points)
- Moisture content of sugar

**Recommendation:** Document ingredient-specific variations explicitly.

#### Edge Case 6: Skill Level Dependencies

**Problem:** "Fold the egg whites gently"

**Actual conditions:**
- Cook's experience level
- Speed of folding
- Temperature of eggs (colder whites hold volume better)

**Recommendation:** Technique notes should specify skill level requirements or provide alternatives for different levels.

#### Edge Case 7: Seasonal/Environmental Dependencies

**Problem:** "Let dough rise for 1 hour"

**Actual conditions:**
- Kitchen temperature (winter vs summer, AC on/off)
- Yeast freshness
- Flour type
- Humidity

**Recommendation:** Time-based instructions should document environmental dependencies.

#### Edge Case 8: Recipe-Specific Dependencies

**Problem:** A specific recipe's "success" depends on:
- Following exact order of operations
- Specific ingredient brands/types
- Specific equipment
- Environmental conditions at time of making

**Recommendation:** Each recipe note should document what makes it work - the "secret" that differentiates success from failure.

## Gap Analysis

An AI building a cooking knowledge base using only current Seed compound context rules would:

1. ✓ Know to document multiple conditions
2. ✓ Know failure modes differ from single-condition knowledge
3. ✗ Not know cooking-specific condition categories (equipment, altitude, ingredient type, skill level, environment)
4. ✗ Not know food safety requires mandatory compound documentation
5. ✗ Not know time-based instructions have environmental dependencies
6. ✗ Not know ingredient substitution complexity

## Recommendations

### Enhancement 1: Cooking-Specific Condition Categories

Add to Seed:
```yaml
conditions:
  - condition: "Equipment availability"
    category: equipment
  - condition: "Ingredient type/variety"
    category: ingredient  
  - condition: "Environmental conditions"
    category: environment
  - condition: "Skill level"
    category: user-capability
  - condition: "Altitude/pressure"
    category: location
```

### Enhancement 2: Food Safety Mandatory Tagging

**Rule:** Food safety knowledge MUST have compound conditions documented because missing any single condition can cause harm.

**Why:** Unlike other knowledge domains where compound failure is inconvenient, food safety compound failure can cause illness.

### Enhancement 3: Recipe Success Factors

**Rule:** For recipe notes, document the key factors that determine success - what makes this recipe work.

**Why:** Many recipes fail not because of major errors but because minor factors weren't captured.

## Conclusion

The compound context rule is highly applicable to cooking but needs domain-specific enhancements for:
- Cooking-specific condition categories
- Food safety mandatory compound documentation
- Environmental/time dependencies
- Ingredient substitution complexity

The core rule is sound; these are implementation refinements for a domain rich in compound knowledge.

---

## Related Notes

- [[Frontier Exploration - Compound Context Knowledge]] — Source rule
- [[Seed Stress Test - Cooking Knowledge Base]] — General cooking stress test
- [[Frontier Exploration - Ingredient Substitution Knowledge]] — Related exploration
- [[Seed Gap - Recurring and Periodic Knowledge]] — consolidated cyclical knowledge guidance
