---
last-reviewed: 2026-03-09
lifecycle: emerging
confidence: emerging
tags:
- seed-stress-test
- cooking-domain
- edge-case
---

# Stress Test: Word Count Rule in Cooking Domain

## Seed Rule Being Tested
**Rule:** Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas.
**Test:** Count words. Flag notes outside the 100-300 range for review.

## Application to Cooking Knowledge Base

### Where the Rule Works Well
- **Ingredient notes**: "Shallots" (~150 words covering flavor profile, substitutes, storage)
- **Technique notes**: "Searing" (~200 words covering temperature, pan selection, common mistakes)
- **Equipment notes**: "Cast Iron Pan" (~180 words covering seasoning, maintenance, cooking tips)

### Edge Case 1: Comprehensive Recipes

**Problem:** A complete recipe for a complex dish (beef bourguignon, paella, biryani) naturally exceeds 300 words including:
- Ingredient list with quantities
- Step-by-step instructions
- Timing and temperature guidance
- Serving suggestions
- Variations

**Real Example:** A detailed coq au vin recipe might be 800+ words. Splitting it into "Coq au Vin - Ingredients" and "Coq au Vin - Method" would make it harder to use.

**The Test Fails:** An AI strictly enforcing 100-300 words would either:
- Break usable recipes into fragmented notes
- Or mark excellent recipes as "violations" needing fixing

### Edge Case 2: Educational Technique Explanations

**Problem:** Explaining the science behind cooking techniques requires length:
- "Sous Vide" (~400 words): explains precision temperature, safety, equipment, advantages, disadvantages
- "Maillard Reaction" (~350 words): covers chemistry, temperature ranges, application to different foods

These are single ideas (one technique/phenomenon) but inherently require more than 300 words to explain thoroughly.

**The Test Fails:** Teachers and culinary students need comprehensive explanations. Forcing brevity loses educational value.

### Edge Case 3: Recipe Collections and Variations

**Problem:** A note like "5 Chocolate Cake Variations" might be 500+ words covering:
- Each variation's unique characteristics
- Ingredient adjustments per variation
- Baking notes per variation

This is genuinely one idea (cake variations) but cannot be compressed to 300 words without losing the variations.

### Edge Case 4: Regional/Cultural Cuisine Overviews

**Problem:** "French Cuisine" or "Thai Cooking Fundamentals" might be 600+ words covering:
- Key ingredients
- Core techniques
- Regional variations
- Historical context
- Iconic dishes

This is one coherent topic but inherently broad.

### Edge Case 5: Menu Planning and Meal Composition

**Problem:** Notes about composing a multi-course meal (appetizer → main → dessert) naturally discuss:
- Flavor balancing
- Timing coordination
- Portion considerations
- Wine pairing

A comprehensive menu planning note might exceed 400 words.

## The Real Issue

The word count rule uses length as a proxy for atomicity. But in cooking:

1. **Procedural content** (recipes) must stay together for usability
2. **Educational content** (explanations) may need depth for understanding
3. **Comprehensive topics** (regional cuisines) are inherently broad
4. **Comparative content** (variations, alternatives) expands naturally

Length ≠ multiple ideas in cooking. A 500-word recipe is one recipe, not five.

## Recommendation

The rule should be refined to:

**Rule:** Notes should be 100-300 words UNLESS the content is:
1. A procedural recipe/tutorial that would be harder to use if split
2. An educational explanation requiring depth for comprehension
3. A comprehensive overview of a single coherent topic
4. A comparative analysis of variations within one category

**Test:** For notes >300 words: (1) Is this a procedure that would break if split? (2) Is this educational content that needs depth? (3) Is this a coherent topic that would lose synthesis if split? If yes to any, keep. Only split if the note bundles genuinely unrelated ideas.

**Alternative Test:** Can this note be summarized in one sentence that captures its core purpose? If yes, it's atomic regardless of word count.

## Related
- [[Note Thickness Balance]]
- [[Atomic Note Principle]]
- [[Stress Test - Atomicity Rule in Music Theory]]
- [[Stress Test - Minimum Link Rule in Cooking]]
