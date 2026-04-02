---
last-reviewed: 2026-03-23
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - option-value
  - cooking-domain
  - utility-classification
---

# Seed Stress Test: Option Value Rule in Cooking Domain

**Tested Rule:** Distinguish immediate utility from potential utility (option value) — apply different capture criteria for knowledge that might matter someday.

**Rule from Seed (2026-03-23):**
> Why: The Seed's diminishing returns test optimizes for immediate utility, but systematically under-captures knowledge with potential future value. Knowledge that enables future capabilities, handles rare-but-critical scenarios, or opens unexpected paths has "option value" that the standard utility test misses.

> Test: Can you identify notes tagged with `utility-type: potential`? Do they have documented future scenarios and likelihood assessments? Is there an option value tracking mechanism?

## Domain Analysis: Cooking Knowledge Base

### Where the Rule Works Well

1. **Ingredient Expansion**: Capturing knowledge about unfamiliar cuisines or ingredients that aren't currently cooked but might be relevant in the future (moving to a new region, trying a new cuisine, seasonal availability changes)

2. **Technique Versatility**: Recording cooking techniques that aren't immediately useful but could apply in unexpected situations (emergency food preservation, improvising with limited ingredients)

3. **Historical Recipes**: Preserving historical cooking methods that might become relevant (fermentation revival, ancient grains, heritage recipes)

4. **Foraging and Wild Foods**: Knowledge that's rarely needed but critical when encountered (identifying edible wild plants, seasonal forages)

### Edge Case 1: Perishable Option Value

**Problem:** Some cooking knowledge has option value BUT decays rapidly. Ingredients go out of season, techniques become obsolete, and regional dishes spread globally.

Examples:
- Local seasonal ingredients (-available 2 months/year)
- Trend-sensitive techniques (currently popular but fading)
- Regional specialty ingredients (may become globally available or disappear)

**The Test Fails:** The option value framework assumes knowledge retains value over time. But in cooking, "future use" might mean "next autumn" not "indefinitely."

**Recommendation:** Add `option-value-duration` field:
```yaml
utility-type: potential
option-value-duration: seasonal  # returns annually
option-value-duration: fading    # decreasing
option-value-duration: stable    #長期価値
```

### Edge Case 2: Ingredient Availability Uncertainty

**Problem:** Option value in cooking often depends on ingredient availability, which is highly uncertain.

Examples:
- Specialty imports may become unavailable
- Local sourcing varies by season/region
- Climate change affects crop availability

**The Test Fails:** Capturing a recipe with "option value" requires assuming ingredients will be available when needed.

**Recommendation:** Add `ingredient-availability` tracking:
```yaml
utility-type: potential
ingredient-scope: local-available  # easily sourced
ingredient-scope: seasonal-only    # limited window
ingredient-scope: import-dependent # may be unavailable
```

### Edge Case 3: Low-Probability but High-Impact Scenarios

**Problem:** Some cooking knowledge has extreme option value for rare scenarios (emergency food prep, disaster cooking, surviving on limited supplies).

Examples:
- Wild edible identification (low probability, high stakes if needed)
- Food preservation techniques (rarely needed, critical when applicable)
- Substitution knowledge (rarely needed, valuable when standard ingredients unavailable)

**The Test Fails:** The standard "capture if cost_of_missing = high OR (future_paths >= 2 AND capture_cost = low)" doesn't capture extremely rare but critical knowledge.

**Recommendation:** Add a category for rare-but-critical:
```yaml
utility-type: potential
option-category: rare-critical  # very low probability, very high impact
capture-urgency: defer  # capture when convenient, but track
```

### Edge Case 4: Cultural Heritage vs. Personal Option Value

**Problem:** In cooking, there's a distinction between:
- Personal option value: Techniques and recipes you might use
- Cultural heritage value: Knowledge worth preserving even if you won't use it

Example: A historical recipe from your grandmother's generation may have no personal utility but high cultural preservation value.

**The Test Fails:** The rule treats all potential utility the same. Cultural preservation knowledge isn't about "future use" - it's about preserving knowledge.

**Recommendation:** Distinguish utility types:
```yaml
utility-type: potential
option-category: personal-future  # you might use this
option-category: cultural-preservation  # worth preserving
option-category: capability-building  # expands your cooking range
```

### Edge Case 5: Cuisine Migration Patterns

**Problem:** As people move or as food trends spread, knowledge about cuisines outside your current cooking repertoire can have option value. But predicting which cuisines will become relevant is difficult.

Examples:
- Partner's cultural background may bring new cuisine needs
- Travel may create interest in explored cuisines  
- Regional food trends migrate globally

**The Test Fails:** The rule assumes you can predict future needs. But cuisine option value is often unknowable in advance.

**Recommendation:** Use broader cuisine scope capture:
```yaml
utility-type: potential
cuisine-scope: adjacent  # similar to current cooking
cuisine-scope: stretch  # significantly different from current
cuisine-scope: unknown-future  # may become relevant unpredictably
```

## Modified Test for Cooking Domain

For cooking notes with potential utility:

1. **Does this have seasonal or temporal constraints?** If yes, add option-value-duration
2. **Does this depend on specific ingredients being available?** Document ingredient-scope
3. **Is this rare-but-critical (emergency, survival)?** Tag as rare-critical option
4. **Is this cultural heritage worth preserving?** Tag as cultural-preservation
5. **Could this become relevant through unknown future events?** Tag appropriately

The modified test: Can you categorize potential utility notes by their temporal characteristics and capture urgency?

## Summary of Additions for Cooking

```yaml
utility-type: potential  # immediate | potential | deferred
option-value-duration: seasonal | fading | stable
ingredient-scope: local-available | seasonal-only | import-dependent
option-category: personal-future | cultural-preservation | capability-building | rare-critical
capture-urgency: now | when_convenient | defer
cuisine-scope: adjacent | stretch | unknown-future
```

## Core Insight

The option value rule needs expansion for cooking because:
1. Many cooking knowledge types are seasonally bounded
2. Ingredient availability is a hidden dependency
3. Some cooking knowledge is rare-but-critical (emergency)
4. Cultural preservation value differs from personal utility
5. Cuisine relevance is often unpredictable

The current rule captures the concept but doesn't account for cooking's specific temporal and availability dynamics.

## Related Notes
- [[Frontier Exploration - Knowledge Option Value]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Gap - Sensory Anchor Standardization]]
- [[Embodied Knowledge in Cooking]]