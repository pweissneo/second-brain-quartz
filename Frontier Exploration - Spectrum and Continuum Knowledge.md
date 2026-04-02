---
last-reviewed: 2026-03-20
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-rule
  - frontier-exploration
  - atomicity
  - classification
  - spectrum
---

# Frontier Exploration - Spectrum and Continuum Knowledge

> This note explores a gap in the Seed: how to handle knowledge that exists on a spectrum or continuum rather than as discrete categories.
> See [[AI-Assisted Knowledge Management Seed]] for the authoritative rules.

## The Challenge

Some knowledge exists on a continuum rather than as binary categories or discrete points:

- **Political ideology** — left to right spectrum
- **Skill levels** — beginner to expert
- **Temperature preferences** — cold to hot
- **Color** — hue gradients
- **Personality traits** — introvert to extrovert
- **Financial risk** — conservative to aggressive
- **Cooking doneness** — rare to well-done
- **Audio quality** — lo-fi to hi-fi

The Seed's atomicity principle assumes discrete ideas that can be separated. But spectrum knowledge challenges this: where do you cut?

## Why It Matters

Consider a cooking knowledge base:
- "Medium-rare" is a point on a temperature/time continuum
- Different chefs define it differently
- The exact moment depends on thickness, starting temp, pan temperature

A knowledge base that treats everything as discrete categories loses nuance. But a knowledge base that creates a note for every possible point on every continuum explodes in size.

## Current Seed Limitations

The Seed has rules for:
- Atomicity (one idea per note)
- Comparative knowledge (comparing two options)
- Hub + spoke patterns (organizing related notes)
- Context frames (different presentations for different purposes)

But nothing specifically addresses:
1. Where to draw boundaries on continua
2. How to represent intermediate/mixed states
3. Whether to create discrete notes or range-based notes
4. How to handle domain-specific spectrum standards

## Proposed Approach

### Principle 1: Identify Natural Boundaries

Some continua have natural breaking points recognized by practitioners:

- **Cooking**: rare/medium-rare/medium/medium-well/well-done (5 points)
- **Coffee**: light/medium/dark roast (3 points)
- **Risk**: conservative/moderate/aggressive (3 points)

**Test:** Does the domain have established terminology for spectrum points? If yes, use those as atomic units.

### Principle 2: Define Range Notes for Intermediates

When intermediate states are meaningful, create range notes:

```
Rare *[illustrative]* → Specific point
Medium-Rare *[illustrative]* → Specific point  
Medium *[illustrative]* → Specific point
Cooking Doneness *[illustrative]* → Hub linking to all points
  → Links: Rare, Medium-Rare, Medium, etc.
```

**Test:** Can users find both specific points and range overviews?

### Principle 3: Use Frontmatter for Gradient Knowledge

For knowledge that genuinely exists on a continuum, use structured fields:

```yaml
---
spectrum-type: continuous  # vs discrete
spectrum-bounds:
  min: 0
  max: 100
spectrum-unit: percentage  # or degrees, scale, etc.
spectrum-anchor-low: " Conservative"
spectrum-anchor-high: "Aggressive"
---
```

This allows filtering and queries that respect the continuous nature.

### Principle 4: Distinguish Spectrum from Binary

Some apparent continua are actually binary in practice:

- **Alive/Dead** — appears binary but medically there are states
- **On/Off** — digital but analog switches exist

**Test:** Is the spectrum genuinely continuous, or are there just multiple discrete categories that happen to be ordered?

## Edge Cases

### Edge Case: Subjective Spectra

Some spectra are inherently subjective:

- "Spiciness" — Scoville scale is objective, but "too spicy" is personal
- "Loudness" — decibels are objective, but "too loud" is subjective
- "Sweetness" — brix is objective, but "too sweet" is personal

**Guidance:** Track both objective measurement and subjective threshold separately.

### Edge Case: Cultural Spectra

Some spectra vary by culture:

- "Politeness levels" vary significantly across cultures
- "Personal space" distances differ by culture
- "Punctuality" expectations vary

**Guidance:** Add `cultural-scope:` to spectrum-based notes.

### Edge Case: Evolving Spectra

Some spectra change over time as domains evolve:

- Music genres blend and create new categories
- Technology generations blur boundaries
- Scientific understanding changes category boundaries

**Guidance:** Add `spectrum-stable:` field with values `stable|evolving|contested`.

## Test Cases

### Test 1: Cooking Doneness

Pick a cooking knowledge base:
1. Can you find notes for specific doneness levels?
2. Are they linked to a doneness hub?
3. Is there guidance on what "medium-rare" means (temp, time, appearance)?

### Test 2: Political Ideology

For a political knowledge base:
1. Are ideological positions treated as discrete or continuous?
2. Can users find nuance between "liberal" and "conservative"?
3. Is there guidance on what labels mean in what context?

### Test 3: Skill Levels

For a learning knowledge base:
1. Are skill levels defined with measurable criteria?
2. Can users determine what "intermediate" means in this domain?
3. Are there notes about what prerequisites exist at each level?

## Related

- [[AI-Assisted Knowledge Management Seed]] — The authoritative rules
- [[Atomic Note Principle]] — One idea per note
- [[Comparative Knowledge]] — Comparing two options
- [[Frontier Exploration - Multi-Perspective Knowledge]] — Related to subjective knowledge
