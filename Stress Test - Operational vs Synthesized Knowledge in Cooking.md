---
last-reviewed: 2026-03-10
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- cooking-domain
- edge-case
---

# Stress Test: Operational vs Synthesized Knowledge in Cooking

## Seed Rule Being Tested
**Rule:** Separate operational knowledge from synthesized knowledge — project notes, meeting notes, and task lists should either be time-boxed (auto-deprecate) or clearly marked as temporary.
**Why:** Operational debris looks like knowledge but isn't. It clutters searches and misleads about the vault's actual contents.
**Test:** Pick 10 random notes. Can you categorize each as: (a) permanent knowledge, (b) time-boxed operational, or (c) should be deleted?

## Application to Cooking Knowledge Base

### What Constitutes "Permanent Knowledge" in Cooking

In a cooking knowledge base, synthesized knowledge includes:
- **Techniques:** braising, roasting, emulsification, fermentation
- **Ingredient properties:** flavor profiles, chemical reactions, seasonal availability principles
- **Recipe principles:** the science behind baking, sauce mother foundations
- **Equipment knowledge:** how different cookware affects heat transfer

### What Constitutes "Operational Knowledge" in Cooking

Operational knowledge that should be time-boxed:
- **Specific meal plans:** "Thanksgiving Dinner 2025"
- **Shopping lists:** "Groceries for week of March 10"
- **Prep schedules:** "Marathon cooking order for Christmas dinner"
- **Inventory tracking:** "What's currently in the pantry"

### Edge Case 1: Recipe Notes

**Problem:** Is a specific recipe like "Grandma's Chicken Soup" permanent knowledge or operational?

Arguments for operational:
- It's a specific instance, not a general principle
- Someone might only make it occasionally
- It could become outdated (family tastes change)

Arguments for permanent:
- It represents synthesized family tradition
- The techniques involved are transferable
- It documents cultural knowledge

**Verdict:** Recipes are generally **permanent knowledge** because they represent synthesized technique and cultural knowledge. However, "Meal Plan: Week of X" should be **operational** (time-boxed).

### Edge Case 2: Seasonal Ingredient Guides

**Problem:** "Tomatoes: Summer Peak Season" — is this operational or synthesized?

This is **synthesized knowledge** because it captures a permanent principle (tomatoes taste best in summer) rather than a specific time-bound plan.

### Edge Case 3: Kitchen-Specific Notes

**Problem:** "How to Season My Cast Iron Skillet" — operational (specific to one person's equipment) or synthesized (general technique)?

This is **synthesized** if it teaches transferable technique. If it only covers "my specific pan," it's operational debris.

### Edge Case 4: Recipe Variations

**Problem:** "Variations on Chocolate Chip Cookies" — operational (many specific versions) or synthesized (principle of cookie chemistry)?

This is **synthesized** — it captures the principle of how ingredients affect texture, which is generalizable.

### Edge Case 5: Cooking Events

**Problem:** "Cooking for a Dinner Party of 8" — is this operational or synthesized?

This is **operational** — it's a specific plan for a specific event. The principles of scaling recipes could be synthesized, but the specific plan is not.

### Edge Case 6: Restaurant Reviews

**Problem:** "My Review of Chez Panisse" — operational or synthesized?

This is tricky. A review captures experiential knowledge that could inform future decisions. However, it's highly personal and time-bound. The Seed would suggest: **delete or deprecate** — it's not really synthesizable knowledge, just opinion.

### The Test in Practice

For a cooking vault, here's how to categorize:

| Note Type | Category | Action |
|-----------|----------|--------|
| "How to Roast Chicken" | Permanent | Keep |
| "Thanksgiving 2025 Menu" | Operational | Time-box with expiry |
| "Chocolate Chip Cookie Recipe" | Permanent | Keep |
| "Week 10 Meal Plan" | Operational | Delete after week |
| "Knife Skills Guide" | Permanent | Keep |
| "Pantry Inventory March 2026" | Operational | Delete after update |
| "Sauce Mother Derivatives" | Permanent | Keep |
| "Restaurant Notes: Tokyo" | Debris | Delete or deprecate |

### Weakness Discovered

**The rule is unclear about:**

1. **Personal experience notes** — "My best baking failure" could be negative knowledge (synthesized) or personal diary (debris)
2. **Tool/equipment reviews** — "Best chef's knife under $100" — is this synthesized (research) or operational (will become outdated)?
3. **Diet-specific knowledge** — "Keto-friendly substitutions" — is this synthesized (principle) or diet-specific (potentially time-bound)?

### Recommendation

The rule should clarify:
- **Personal opinion/review** = operational debris (delete or deprecate)
- **Research/principle** = synthesized (keep)
- **Time-specific plans** = operational (time-box)
- **Transferable techniques** = synthesized (keep)

The test should also include: "Could this note teach someone who has never met me?" If no, it's likely operational debris.

## Related
- [[Note Lifecycle Management]]
- [[Atomic Note Principle]]
- [[Knowledge Base Workflow]]
