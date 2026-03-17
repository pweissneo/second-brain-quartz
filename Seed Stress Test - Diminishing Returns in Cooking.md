---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
confidence: high
author-type: ai-assisted
lifecycle: evergreen
tags:
  - seed-stress-test
  - knowledge-management
  - cooking
  - domain-testing
---

# Seed Stress Test: Diminishing Returns Rule in Cooking Knowledge Base

> Testing the diminishing returns testing rule against a cooking knowledge base to identify edge cases and refine the rule.

## Original Rule

**Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility (improves vault answers), connection (links to 2+ existing naturally), uniqueness (adds new knowledge), effort (maintenance worth value).

**Test:** For the last 5 notes added to a mature topic: Do 3+ pass all four tests?

## Stress Test: Applying to Cooking Knowledge Base

### Does this rule make sense for cooking?

**Analysis:** The diminishing returns rule makes sense for cooking, but with significant modifications needed:

1. **Utility is context-dependent in cooking**: A recipe for "beef stir-fry" has different utility for different cooks. A professional chef needs different utility than a home cook with limited ingredients.

2. **Connection is difficult in early-stage cooking KBs**: Many foundational cooking notes (basic techniques, ingredient understanding) don't have 2+ natural links initially.

3. **Uniqueness is hard to assess**: Many recipes seem "unique" but are minor variations of existing ones. The difference between "garlic butter steak" and "peppercorn steak" may be trivial or significant depending on context.

4. **Effort is experiential**: The maintenance value of a recipe note depends on whether you've actually cooked it.

### Is the rule's Test executable by an AI?

**Issues found:**

1. **The "last 5 notes" metric doesn't work for new topics**: A new cooking domain (e.g., "French pastries") starts with foundational notes that fail the test but are essential.

2. **The test assumes knowledge can be evaluated without execution**: In cooking, you often cannot assess utility without cooking. A recipe may LOOK similar to existing ones but produce dramatically different results.

3. **Subjective nature of "uniqueness"**: Two recipes that differ only in one ingredient may be trivial variations OR could represent different culinary traditions.

### Edge Cases Identified

1. **Foundational knowledge exemption**: Basic techniques (knife skills, heat management, sauce foundations) should be exempt from diminishing returns testing in early-stage cooking KBs.

2. **Experiential knowledge requires different testing**: For recipes, the test should include "have you cooked this?" rather than just assessing the note itself.

3. **Cuisine-specific context matters**: A recipe that's redundant in one cuisine (many Italian pasta dishes) may be unique in another (Japanese-Italian fusion).

4. **Ingredient availability affects utility**: A recipe using obscure ingredients has different utility depending on the cook's location and access.

5. **Skill level intersection**: A recipe's utility depends on matching the cook's skill level - advanced techniques may be useful for experts but overwhelming for beginners.

## Proposed Refinements

### Modification 1: Foundational Knowledge Exemption

Add to the rule:
> **Edge case:** Foundational knowledge (core techniques, essential ingredients, fundamental principles) should be exempt from diminishing returns testing during domain bootstrap. Apply the test only to application-level knowledge after foundations are established.

### Modification 2: Experiential Domain Adjustment

The rule already has an edge case for experiential domains, but cooking specifically needs:
- Require `verification-status: tested` for recipes rather than just assessing note quality
- Add `cookability-assessment:` field capturing: equipment requirements, skill level needed, time investment

### Modification 3: Cuisine/Domain Context

Add applicability scope:
- For crossover cuisine notes: assess uniqueness within each culinary tradition separately
- For fusion cooking: require explicit documentation of what makes the fusion distinctive

### Modified Test for Cooking Domain

For the last 5 notes added to a cooking topic:
1. Do 3+ pass utility/connection/uniqueness/effort tests OR have verification-status: tested?
2. For foundational technique notes: are they exempt during bootstrap phase?
3. For recipe notes: do they have cookability-assessment completed?

## Conclusion

The diminishing returns rule needs domain-specific refinement for cooking:
- Foundational techniques need exemption during bootstrap
- Verification should require actual cooking, not just note assessment  
- Utility must be assessed relative to cook's context (skill, equipment, ingredients)
- The rule should acknowledge that recipe uniqueness is often in the eye of the beholder

See also: [[Frontier Exploration - Expert Heuristics and Rules of Thumb]] for related discussion on domain-specific heuristics.
