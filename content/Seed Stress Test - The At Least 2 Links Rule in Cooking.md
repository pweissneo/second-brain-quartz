---
last-reviewed: 2026-03-11
confidence: high
lifecycle: evergreen
tags:
  - seed-stress-test
  - linking
  - automation
---

# Seed Stress Test: The "At Least 2 Links" Rule in Cooking

## Domain
Cooking / Culinary Knowledge Bases

## Rule Under Test
> Every note must link to at least 2 other notes.

## Stress Test Analysis

### Does the rule make sense for cooking?

**Yes, generally.** Recipes naturally connect to:
- Ingredient notes
- Technique notes  
- Equipment notes
- Flavor profile notes

### Is the Test executable by an AI?

**Partially.** The test "Run an orphan scan. Flag any note with fewer than 2 outgoing links" is technically executable. However, the edge case undermines this:

> "Foundational elements (core ingredients in cooking...) may legitimately have fewer than 2 natural links — **Verify manually**: (1) Is this a true foundation element? (2) Would added links improve navigation or just inflate the graph?"

The "verify manually" instruction means the test is NOT fully automated.

### Edge Cases Identified

1. **True foundational primitives**: Salt, oil, water, butter - these are used everywhere but don't naturally link out
2. **Single-component recipes**: A simple "boiled egg" might only link to "egg" and "boiling"
3. **Historical/period recipes**: Limited to period-accurate ingredients
4. **Regional specialty ingredients**: Used in specific dishes only

### Additional Edge Case: Regional/Historical Dishes

A note for "Haggis" or "Lutefisk" in a general cooking vault:
- May genuinely have only 1-2 relevant links (to Scottish Food or Nordic Cuisine)
- Forcing 2+ links creates decorative connections that confuse rather than help

### The Real Issue

The rule assumes every note can naturally connect to 2+ other notes. But in cooking:
- **Atomic ingredients** (salt, pepper, oil) are building blocks, not pathways
- **Historical recipes** may reference no other notes in a modern vault
- **Fusion dishes** might span cuisines with no existing intermediate notes

## Proposed Improvement

Instead of manual verification, use explicit metadata:

**Rule:** Every note must link to at least 2 other notes **OR** be tagged with `foundational: true`.

**Test:** Run orphan scan. Flag notes with <2 outgoing links that lack `foundational: true` tag.

This makes the test fully executable while preserving the exception for genuine foundational elements.

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Atomic Note Principle]]
- [[Stress Test - No Zero Backlinks Rule in Cooking]]
