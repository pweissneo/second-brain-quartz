---
last-reviewed: 2026-03-15
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - atomicity
  - stress-test
  - cooking-domain
---

# Stress Test: Word Count Rule in Cooking Domain

## Rule Tested
**Notes should be 100-300 words.** Under 100 is too thin; over 300 likely contains multiple ideas.

## Test: Apply to Cooking Knowledge Base

### What Works
- Technique explanations (e.g., "Searing Meat") - typically 150-300 words
- Ingredient deep-dives (e.g., "All About Onions") - can fit the range
- Comprehensive recipe tutorials - the procedural content edge case handles these

### Edge Case Found: Complete Short Recipes

**Problem:** A complete recipe for "Hard Boiled Eggs" can be fully functional in 80 words:
> "Place eggs in single layer in pot. Cover with cold water 1 inch above eggs. Bring to boil. Remove from heat, cover, let sit 10 minutes. Transfer to ice bath. Peel."

This is NOT a stub - it's complete and usable. But the Seed test flags it:
> "For notes <100 words: verify it has a stub marker (status: stub, todo: true)"

### Why This Fails the Test
The rule treats short notes as incomplete by default. But procedural content (recipes) has a different nature:
- A 50-word recipe for boiled eggs is more complete than a 300-word essay on egg chemistry
- "Stub" implies unfinished work, but short complete recipes ARE finished
- The domain-unit edge case (musical dynamics, SI units) doesn't apply - recipes aren't atomic domain units

### Proposed Fix

Add an edge case to the word count rule:

> **Edge case:** Complete procedural content under 100 words is valid when:
> 1. The procedure can be executed from the note alone
> 2. All necessary information (ingredients, steps, timing) is present
> 3. No essential steps are omitted
>
> The test: Can you execute this note's procedure without additional information? If yes, it's complete regardless of word count.

### Alternative: Refine the Test

Change the test from:
> "Flag notes under 100 words for review"

To:
> "Flag notes under 100 words that are NOT procedural content OR are missing essential components"

This way, complete short recipes pass without needing stub markers.

## Related
- [[Atomic Note Principle]]
- [[AI-Assisted Knowledge Management Seed]]
