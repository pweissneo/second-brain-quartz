---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - best-practice
  - organization
  - structure
schema-version: "1.0"
counterpart-antipattern: [[Anti-Pattern - Over-Organization]]
---

# Best Practice - Minimal Organization

> Let structure emerge from connections, not from folders. Trust the graph.

## The Principle

Over-organization happens when you spend more time categorizing and structuring than actually learning. The alternative is minimal organization — using flat files with wikilinks that create organic, multi-dimensional structure.

## The Flat File Approach

**Keep it simple:**
- All notes in one folder (no nested directories)
- Use wikilinks `[[Note Name]]` to create connections
- Let hubs emerge naturally as topics accumulate connections

## Why Folders Fail

Folders impose hierarchy — but knowledge doesn't always fit hierarchies:
- A note about sourdough bread is both about bread AND about fermentation
- Folders force you to choose ONE location
- Wikilinks let you connect from multiple directions

## The Test

Ask: "Can I reach any note from root in 3 hops or less?"

If yes, your organization is sufficient. More structure is overhead, not value.

## When to Create Hubs

Create hub notes when:
- Multiple notes naturally cluster around a topic
- You find yourself linking to the same topic repeatedly
- A central concept would help navigation

Don't pre-plan hubs — let them emerge.

## The Balance

Organization should serve discovery, not satisfy a need for tidiness. The goal is finding knowledge, not having a clean folder structure.

## Hub Emergence Example

Instead of pre-creating structure like:
```
/biology/plants/flowers/
```

Let connections emerge:
1. First note: "Photosynthesis" links to "Sunlight", "Chlorophyll"
2. Second note: "Soil Nutrients" links to "Roots", "Nitrogen"
3. Third note: "Seasonal Growth" links to both "Photosynthesis" and "Soil Nutrients"
4. Only now create "[[Plant Growth]]" hub — it emerged from existing connections

This is backward from traditional folder-based organizing — create the content first, let the hub arise naturally.

## Edge Cases

**When folders make sense:**
- Clear project boundaries with defined end dates
- Different access permissions for different content
- When the domain is inherently hierarchical (file systems, org charts)

**When to still use structure:**
- Multi-tenant vaults (different users see different content)
- Temporal boundaries (2024 projects vs 2025 projects)

## Related

- [[Anti-Pattern - Over-Organization]] — What to avoid
- [[Knowledge Graph Structure]] — How graphs work
- [[Hub Node Creation]] — When to create hubs
- [[Seed Stress Test - 2+ Links Rule Across Domains]] — Edge cases for link requirements