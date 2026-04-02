---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags: [seed-stress-test, cooking, linking]
---

# Seed Stress Test: Linking Rule in Cooking Domain

**Rule tested:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.

**Domain:** Cooking / culinary arts

## Does this rule make sense for cooking?

**Analysis:** The rule mostly makes sense but has specific tensions in cooking:

1. **Foundational ingredients** (salt, oil, water, heat) are true domain primitives in cooking - they serve as prerequisites for everything else. The `foundational: true` exception works well here.

2. **Specific ingredients** that appear in exactly one recipe could legitimately have only 1 link - e.g., a niche spice used only in one specific curry. The `specialized: true` tag accommodates this.

3. **Technique definitions** in cooking may have fewer natural links because they connect to many different dishes differently - "braising" connects to beef, pork, vegetables, but each connection is different. The rule is flexible enough.

## Is the Test executable?

**Test:** "Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag AND lacks the `specialized: true` tag."

**Analysis:** Yes, this is executable. An AI can count links and check frontmatter. However, in cooking, this creates false positives for:
- Single-use ingredients (niche spices)
- Specific recipes (one-off preparations)
- Technique-to-dish specific applications

The test should be: check for <2 links AND missing both tags AND not a single-instance entity.

## Edge cases identified

1. **Cuisine-specific ingredients** - Some ingredients appear in only one cuisine's recipes. They should get `specialized: true` or be marked as cuisine-specific.

2. **Regional specialty ingredients** - Ingredients tied to specific regions should have geographic metadata, not just link count.

3. **Seasonal ingredients** - Link patterns change by season - same ingredient may be central in one season, peripheral in another.

4. **Technique-to-ingredient links** - A technique like "tempering" primarily links to ingredients (cocoa butter, chocolate) rather than other techniques.

## Suggested refinement

For cooking domain, add to the rule:

> **Edge case:** In culinary knowledge bases, single-instance entities (niche ingredients, one-off recipes, cuisine-specific components) should use `specialized: true` tag. The orphan scan should exclude these.

This is already handled by the existing `specialized: true` tag - the issue is awareness. Cooks may not know to apply this tag to their single-use ingredients.

---
**See also:** [[Seed Stress Test - Cooking Knowledge Base]], [[Seed Stress Test - Error Knowledge Capture in Cooking]], [[Atomic Note Principle]]