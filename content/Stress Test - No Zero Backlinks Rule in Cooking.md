---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
tags:
  - seed-stress-test
  - cooking-domain
  - edge-case
  - backlinks
---

# Stress Test: No Zero Backlinks Rule in Cooking Knowledge Base

## Seed Rule Being Tested
**Rule:** No note should have zero backlinks — every note should be linked to from at least one other note.
**Why:** Notes with no incoming links are invisible in the graph and cannot be discovered through navigation. They represent knowledge that exists but isn't connected to the broader structure.
**Test:** Run a backlink scan. Flag any note with 0 backlinks. For each orphan: (1) Should it be linked from a related note? (2) Should it be listed in a hub or index? (3) Is it truly standalone (like the Seed itself)? Keep orphaned only if yes to 3.

## Application to Cooking Knowledge Base

### Where the Rule Works Well

In a cooking knowledge base, most notes naturally have backlinks:
- Techniques link to recipes that use them
- Recipes link to ingredients
- Ingredients link to related ingredients
- Equipment links to recipes requiring it

### Edge Case: Foundational Ingredient Notes

**Problem:** Basic ingredients like "Salt", "Pepper", "Oil", "Water" are referenced by virtually EVERY recipe but:
- They don't naturally link to many notes (what does "Salt" link to? "Sodium"? "Seasoning"?)
- Forcing links creates decorative links that hurt more than help
- These are true foundational elements - like the Seed itself

**Test Scenario:** A cooking vault has:
- 500 recipe notes
- Every recipe uses salt, oil, and water
- Salt, Oil, Water have 0 outgoing links
- Salt, Oil, Water have 500+ incoming links (backlinks)

**Question:** Should Salt, Oil, Water be flagged as orphans requiring links?

**Analysis:**
- Rule says "every note must link to at least 2 other notes" (from Linking section)
- These ingredients fail the outgoing link rule
- But they pass the backlink rule (500+ backlinks)
- The current rule tests outgoing links, not incoming

**The Test Fails:** An AI applying BOTH rules strictly would:
- Demand Salt link to 2+ notes (forcing artificial links)
- Or flag Salt as violating the "no zero backlinks" rule (if interpreting broadly)

### Edge Case: Universal Substitutions

**Problem:** "Salt" is referenced by everything, but what about more specific ingredients:
- "Butter" - used in 200 recipes, links to... what?
- "All-Purpose Flour" - used in 150 recipes
- "Eggs" - used in 300 recipes

These have high backlinks but low outgoing links. The rule is about backlinks, so they'd pass. But the "every note must link to 2 other notes" rule would fail them.

### Edge Case: Regional/Historical Ingredients

**Problem:** Notes about historical or regional ingredients:
- "Lard" - once common, now niche
- "Suet" - British cooking, rare elsewhere
- "Xantham Gum" - modern ingredient

These might have:
- Low outgoing links (what does "Suet" link to? "Tallow"? "Puddings"?)
- Low backlinks (few recipes use them)
- They might legitimately be orphans in a modern cooking vault

### Edge Case: The Recipe Itself

**Problem:** A recipe like "Grandma's Apple Pie" might:
- Link to: Apples, Pie Crust, Cinnamon, Baking Temperature
- Be linked from: Desserts, American Cuisine, Holiday Recipes

This passes both rules. But what about:
- "Cholesterol-Free Cooking" - a concept, not a recipe
- Links to: Low-Fat Recipes, Heart-Healthy Diet
- But what links TO it? Possibly nothing...

Is this an orphan worth fixing, or a valid concept note?

### Edge Case: The "List of X" Notes

**Problem:** Hub notes like "List of Pasta Shapes" or "Types of Oil":
- Link TO: dozens of specific pasta shapes or oils
- Linked FROM: maybe nothing directly

These are navigation hubs - their purpose is to aggregate, not to be discovered. They serve the opposite direction of navigation.

## Analysis

The Seed already acknowledges this edge case:
> **Edge case:** The Seed file itself may legitimately have zero backlinks as the root reference — but all other notes should be reachable from it.

But cooking reveals additional legitimate orphans:
1. **Universal ingredients** (salt, oil, water) - referenced by everything, link to nothing
2. **Navigation hubs** - aggregate without being discovered
3. **Foundational elements** - domain primitives that others depend on

## Recommendation

Refine the rule to address cooking (and similar domains):

**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer AND should have at least 1 backlink UNLESS:
(a) It is a universal/primitive element (salt, oil, water in cooking; variables in programming)
(b) It is a navigation hub (aggregates content without needing discovery)
(c) It is a foundational reference note (like the Seed itself)

**Test:** For notes with 0 backlinks: (1) Is this a universal/primitive element? (2) Is this a navigation hub? (3) Is it referenced by 10+ notes indirectly (e.g., salt in every recipe but not explicitly linked)? If yes to any, allow zero backlinks.

**Alternative approach:** Instead of counting backlinks, measure "referenced by" count - salt is referenced by 500 recipes even if not explicitly wikilinked in each.

## Related
- [[Linking Principle]]
- [[Graph Traversal Efficiency]]
- [[Atomic Note Principle]]
- [[Domain-Specific Knowledge Bases]]
