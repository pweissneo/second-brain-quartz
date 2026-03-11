---
last-reviewed: 2026-03-11
confidence: emerging
lifecycle: draft
tags:
  - seed-refinement
  - procedural-content
  - atomicity
---

# Stress Test: Word Count Rule for Cooking Knowledge Bases

## The Problem

The Seed's word count rule states:
- **Rule:** Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas.
- **Test:** Count words. Flag notes outside the 100-300 range for review.

However, the Seed also includes an edge case:
> Edge case: Procedural content (recipes, code, tutorials, technical specs) may legitimately exceed 300 words.

## Stress Test: Applying to Cooking

When building a cooking knowledge base using only the Seed rules, an AI agent would:

1. **Encounter a recipe note** (e.g., "Boeuf Bourguignon" at 800 words)
2. **Run the word count test** → flags for review
3. **Apply the edge case** → "is this an executable procedure? Yes"
4. **Check follow-up questions:**
   - "Would splitting make it harder to use?" → Yes, recipes need context
   - "Are parts independently reusable?" → Maybe (sub-recipes for sauce, marinade)

The issue: The test is **partially executable but confusing**. The AI must:
1. Count words (easy)
2. Flag for review (easy)
3. Apply edge case logic (requires judgment)

## The Gap

The Test doesn't explicitly tell an AI HOW to handle the edge case. It says "Do NOT flag if yes to 1-2" but:
- What if the AI can't determine if splitting would "make it harder to use"?
- What if parts ARE independently reusable - should it split anyway?

## Suggested Improvement

Add to the Test section:

> **For procedural content:** If the note is clearly an executable procedure (recipe, code, tutorial) AND meets either: (a) the user must execute linearly from start to finish, OR (b) splitting would lose essential context → Do NOT flag. Only split if parts are genuinely reusable AND the note is excessively long (>1000 words).

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Atomic Note Principle]]
- [[Frontier Exploration - Conditional and Troubleshooting Knowledge]]
