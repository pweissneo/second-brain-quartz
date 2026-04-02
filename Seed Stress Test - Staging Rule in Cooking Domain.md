---
lifecycle: seed-extension
confidence: emerging
last-reviewed: 2026-03-20
author-type: ai-assisted
tags:
  - seed-stress-test
  - staging
  - cooking
  - domain-edge-case
---

# Seed Stress Test: Staging Rule in Cooking Domain

## Rule Tested
**Rule:** Use explicit staging for incomplete knowledge — capture fragments, drafts, and hypotheses in marked transitional states rather than only complete notes.

## Domain: Cooking Knowledge Base

### Question 1: Does this rule make sense for that domain?

**Yes.** Cooking knowledge naturally exists in incomplete states:
- A recipe you heard about but haven't tried
- A technique you saw described but haven't practiced  
- An ingredient combination you want to experiment with
- A variation of an existing recipe you're developing

The staging concept (whisper/draft/probe) maps well to cooking workflows.

### Question 2: Is the rule's Test actually executable by an AI?

**Partially.** The current test asks: "Can you identify notes in transitional states? Do they have explicit review dates? Do they graduate to complete status through defined workflows?"

For cooking, this is executable but INCOMPLETE because:
1. The rule doesn't specify what "verification" means for staged cooking notes
2. A recipe marked "draft" — when is it complete? After one successful execution? Three?
3. The rule conflates "incomplete structure" with "needs verification" — these are different

**The test should distinguish:**
- Structural incompleteness (missing links, unfinished writing)
- Verification incompleteness (needs to be cooked/tested)

### Question 3: Is there an edge case where the rule fails?

**Yes. Several edge cases:**

1. **Recipe versioning:** When you modify a recipe multiple times (adjusting seasoning, substituting ingredients), each version might be a "draft" but they're all valid. The rule doesn't handle iterative improvement of the same core knowledge.

2. **Inherited recipes:** Recipes from family members often come as fragments ("mom's sauce") with missing measurements. These are "whispers" but contain implicit knowledge that can't be easily captured. The rule doesn't address how to handle knowledge that exists in someone's head but not on paper.

3. **Technique notes that ARE complete at <100 words:** A technique definition like "Sear: To brown the surface of food using high heat to create flavor through the Maillard reaction" is complete in 15 words but might be marked as "whisper" because it's short. The rule needs to handle domain-specific completeness criteria.

4. **Failed experiments as valid knowledge:** A cooking "probe" that fails (tried a weird ingredient combination, it didn't work) is still valuable knowledge. The current rule treats "probe" as uncertain, but failed experiments are verified negative results — they should be trackable differently.

## Proposed Edge Case Addition

For experiential domains (cooking, music, crafts), staging should track verification modality separately:

```yaml
verification-modality: passive|practice-required|hybrid
practice-status: not-attempted|in-progress|successful|failed
```

This distinguishes:
- A "whisper" that needs source verification (read about a technique)
- A "probe" that needs execution verification (try a recipe)
- A "draft" where execution failed (the note is valid, the recipe wasn't)

## Test Refinement

For staging in experiential domains, the test should ask:
1. Can you identify staged notes by status?
2. Does each staged note have an appropriate verification modality?
3. Are failed experiments tracked separately from uncertain hypotheses?
4. Do staged notes graduate through defined workflows WITH appropriate verification?

## Related Notes
- [[Frontier Exploration - Incomplete and Provisional Knowledge]]
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]]
- [[Frontier Exploration - Verification Hierarchy]]
- [[Stress Test - Verification Status Rule in Home Repair]]
- [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]]