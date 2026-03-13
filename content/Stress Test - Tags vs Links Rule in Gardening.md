---
author-type: ai-assisted
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- gardening-domain
- edge-case
level: pattern
---
author-type: ai-assisted

# Stress Test: Tags vs Links Rule in Gardening Knowledge Base

## Seed Rule Being Tested
**Rule:** Use tags for broad categorization and filtering; use links for essential relationships and navigation.
**Why:** Tags and links serve different purposes — tags enable faceted search across independent dimensions, links create navigable graph structure. Conflating them loses both benefits.
**Test:** Can you explain why each tag represents a category (not a specific relationship)? Can you explain why each link represents an essential connection (not just categorical membership)?

## Application to Gardening Knowledge Base

### Where the Rule Works Well

In a gardening knowledge base, tags naturally handle broad categories:

- `#vegetable`, `#herb`, `#flower` — plant types
- `#spring`, `#summer`, `#fall`, `#winter` — seasons
- `#hardiness-zone-5`, `#hardiness-zone-6`, `#hardiness-zone-7` — climate zones
- `#organic`, `#conventional` — gardening methods

Links handle specific relationships:

- "Tomatoes" → Tomato Cage, Pruning Tomatoes, Tomato Diseases — essential relationships
- "Compost" → Composting Methods, Soil Amendment — causal relationships

### Edge Case: Overlapping Categories

**Problem:** In gardening, many plants belong to multiple categories simultaneously:

- Basil is both an **herb** AND an **annual** AND a **culinary ingredient**
- Should "Basil" have tags: `#herb #annual #culinary`?
- Should "Basil" link to: Herbs, Annual Plants, Culinary Uses?

The line between "category" (tag) and "relationship" (link) blurs when:
- A category itself is a note in the vault (e.g., Herbs exists)
- The "category" has subcategories (culinary herbs → cooking herbs → basil)

### Edge Case: Climate Zone as Tag vs Link

**Problem:** The Seed explicitly requires climate zone tags. But climate zone is also a navigable concept:

Option A (tag): `hardiness-zone: 7` — enables filtering
Option B (link): Hardiness Zone 7 — contains list of plants in that zone

Which is correct? The rule says tags for categories, links for navigation. But climate zones are both.

### Edge Case: Seasonal Knowledge

**Problem:** "Plant tomatoes in spring" — is "spring" a tag or a link?

- Tag `#spring` would show all spring activities
- Link Spring Planting Guide would provide navigation
- The Seed says tags enable "faceted search" — but so do hub notes

In gardening specifically:
- Seasonal knowledge is temporal navigation (when to do something)
- Climate zone knowledge is spatial navigation (where it grows)
- Both could use either tags OR links

### Edge Case: Plant Hardiness Systems

**Problem:** Multiple hardiness systems exist:
- USDA Hardiness Zones
- Sunset Climate Zones
- RHS Hardiness Ratings

A plant might be "Zone 7" in USDA but "Zone 15" in Sunset system. The Seed requires climate zone tags, but:
- Which system? Both? How to tag?
- Does this become a metadata mess?

### The Real Issue

The rule assumes tags = categories, links = relationships. But in gardening:
1. **Categories are often also notes** (e.g., Herbs exists, so why tag `#herb`?)
2. **Climate zones are both categories AND navigation points**
3. **Seasonal knowledge is temporal but also categorical**

The distinction is clear in theory but blurry in practice for domain-specific vaults.

## Recommendation

The rule should clarify:

1. **Tags are for filtering** — enable "show me all plants in Zone 7"
2. **Links are for traversal** — enable "navigate from tomato to related knowledge"
3. **When a category IS a note, prefer linking** — Herbs > #herb
4. **When filtering is needed AND no note exists, use tags** — #hardiness-zone-7

For gardening specifically:
- Use tags for: hardiness zones, seasons, plant types (filterable facets)
- Use links for: related plants, techniques, tools, diseases (navigable relationships)

## Related
- [[Linking Principle]]
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]]
- [[Metadata and Tagging]]
