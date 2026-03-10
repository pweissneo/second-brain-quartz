---
last-reviewed: 2026-03-10
lifecycle: emerging
confidence: emerging
tags: [seed-refinement, domain-specific, stress-test]
---

# Stress Test: Atomicity Rule in Cooking

**Rule tested:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Domain:** Cooking / Culinary knowledge bases

## Findings

### What works ✓
- **Simple techniques:** "How to sear meat" (~150 words) - fits the rule perfectly
- **Ingredient notes:** "Types of onions" (~200 words) - good atomic size
- **Basic recipes:** "Scrambled eggs" (~180 words) - works well

### What breaks ✗
- **Complex recipes:** "Beef Bourguignon" with ingredients, steps, wine pairing, troubleshooting, variations → 800+ words
- **Composite dishes:** "Pasta" - does this mean all pasta? Fresh vs dried vs stuffed?
- **Regional cuisine:** "Italian cuisine" - could cover hundreds of dishes, techniques, ingredients

### Root cause
The edge case for "executable procedures" works for individual recipes, but doesn't address:
1. **Technique vs Recipe distinction** - techniques should be atomic (100-300 words), recipes can exceed
2. **Composite dish categories** - when does "pasta" become too broad?
3. **Regional/topical hubs** - are these subject to atomicity at all?

## Refined Test

For notes >300 words in cooking domain:

1. Is this a **single technique**? → Split if >300 words
2. Is this a **single recipe**? → Keep together (executable procedure)
3. Is this a **category/hub** (e.g., "Italian desserts")? → This is a navigation note, keep but mark as hub

## Test for AI agents

```
Given a cooking note >300 words:
1. Does the title name ONE specific dish/technique? → Recipe/technique → keep together
2. Does the title name a CATEGORY of things? → Hub note → may exceed 300 if serving navigation
3. Does the user need to execute this linearly? → Keep together
4. Are parts independently reusable? → Split
```

### Alternative Test: One-Sentence Summary

**Question:** Can this note be summarized in one sentence that captures its core purpose?

If yes, it's atomic regardless of word count. This is the ultimate test of atomicity - not length, but whether the note has a single, coherent focus.

### Additional Edge Cases from Stress Testing

#### Edge Case 3: Recipe Collections and Variations
**Problem:** A note like "5 Chocolate Cake Variations" might be 500+ words covering each variation's unique characteristics, ingredient adjustments, and baking notes.

This is genuinely one idea (cake variations) but cannot be compressed to 300 words without losing the variations.

#### Edge Case 4: Regional/Cultural Cuisine Overviews
**Problem:** "French Cuisine" or "Thai Cooking Fundamentals" might be 600+ words covering key ingredients, core techniques, regional variations, historical context, and iconic dishes.

This is one coherent topic but inherently broad - it's a navigation hub, not an atomic note.

#### Edge Case 5: Menu Planning and Meal Composition
**Problem:** Notes about composing a multi-course meal (appetizer → main → dessert) naturally discuss flavor balancing, timing coordination, portion considerations, and wine pairing. A comprehensive note might exceed 400 words.

## Related
- [[Atomic Note Principle]]
- [[Stress Test - Atomicity Rule in Music Theory]]
- [[Domain-Specific Knowledge Bases]]
- [[Note Thickness Balance]]

> Note: Merged content from "Stress Test - Word Count Rule in Cooking" (deprecated 2026-03-10) - see git history for original.
