---
last-reviewed: 2026-03-09
lifecycle: active
confidence: emerging
tags:
  - seed-stress-test
  - cooking-domain
  - edge-case
---

# Stress Test: Minimum Link Rule in Cooking Domain

## Seed Rule Being Tested
**Rule:** Every note must link to at least 2 other notes.
**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links.

## Application to Cooking Knowledge Base

### Where the Rule Works Well

> **Illustrative examples** (hypothetical notes in a cooking knowledge base):

- **Techniques**: "Searing" → links to Maillard Reaction, Cast Iron Pan, Temperature Management
- **Ingredients**: "Shallots" → links to Alliums, French Cuisine, Flavor Base
- **Equipment**: "Dutch Oven" → links to Braising, Cast Iron Cookware, One-Pot Meals

### Edge Case: Foundational Elements

**Problem:** Some cooking concepts are so universal they genuinely have fewer than 2 natural links in a typical vault:

1. **Salt** - The most fundamental ingredient. Where does it link? To every recipe? That's not useful navigation.
2. **Heat** - Too generic to link meaningfully to specific notes.
3. **Water** - Basic cooking medium, but linking to Boiling, Steaming, Stock feels forced.

> **Illustrative example** (hypothetical): An AI might create artificial links like salt → Ocean, Sodium that don't help navigation.

### Edge Case: Regional/Historical Dishes

**Problem:** A note for "Haggis" or "Lutefisk" in a general cooking vault:
- May genuinely have only 1-2 relevant links (to Scottish Food or Nordic Cuisine)
- Forcing 2+ links creates decorative connections that confuse rather than help

### The Real Issue

The rule assumes every note can naturally connect to 2+ other notes. But in cooking:
- **Atomic ingredients** (salt, pepper, oil) are building blocks, not pathways
- **Historical recipes** may reference no other notes in a modern vault
- **Fusion dishes** might span cuisines with no existing intermediate notes

## Recommendation

The rule should be refined to:

**Rule:** Every note should link to at least 2 other notes UNLESS it is a foundational element (core ingredient, basic technique, or universal tool) where natural links would be decorative.

**Test:** Run orphan scan. For notes with <2 outgoing links, manually verify: (1) Is this a foundational element? (2) If not, can meaningful links be added?

## Related
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Graph Traversal Efficiency]]
