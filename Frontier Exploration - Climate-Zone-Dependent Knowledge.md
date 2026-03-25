---
last-reviewed: 2026-03-21
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - domain-agnostic
  - scope-metadata
level: pattern
---

# Frontier Exploration - Climate-Zone-Dependent Knowledge

## The Gap

The Seed includes rules for **jurisdiction-dependent knowledge** (legal, medical, financial knowledge that varies by country/region) and general **temporal knowledge** (knowledge that changes over time). However, there's a gap: **climate-zone-dependent knowledge** — knowledge whose validity depends on environmental factors like hardiness zones, rainfall patterns, humidity, and growing season length.

## Why This Matters

Many domains have knowledge that is TRUE but only under specific environmental conditions:

- **Gardening**: "Plant tomatoes after last frost" — depends on frost date, which varies by USDA hardiness zone
- **Construction**: "Use exterior latex paint" — depends on humidity levels
- **Birdwatching**: "Migratory birds arrive in March" — depends on hemisphere and migration routes
- **Solar energy**: "Panel efficiency peaks at 25°C" — depends on typical operating temperatures
- **Beekeeping**: "Harvest honey in late summer" — depends on climate and flora

This isn't quite jurisdiction (not political) and not quite temporal (doesn't change over time in the short term). It's **environmentally scoped** knowledge.

## Current Seed Coverage

The Seed has:
- `jurisdiction` tag for legal/governmental scope
- `region` tag for geographic/cultural scope
- Temporal knowledge rules with `data-date` frontmatter

But there's no explicit `climate-zone` or `hardiness-zone` tag, and no guidance on when to use environmental scope vs. geographic scope.

## Proposed Rule Addition

**Rule:** For knowledge domains where validity depends on climate zones, hardiness zones, or environmental conditions, use explicit `climate-zone` or `hardiness-zone` scope tags.
**Why:** Without environmental scope tags, AI agents cannot distinguish between universally applicable gardening advice and zone-specific guidance. This creates risk of applying incorrect advice (planting tomatoes in January in Zone 4 would fail spectacularly).
**Test:** Pick 5 gardening notes. Do they have hardiness-zone or climate-scope tags? Can you determine which zone(s) the advice applies to?

## Examples

### Gardening Domain

| Knowledge | Climate Scope | Tag |
|----------|--------------|-----|
| "Plant tomatoes after last frost" | USDA Zone dependent | `hardiness-zone: [4-9]` |
| "Mulch before winter" | Cold-hardiness dependent | `hardiness-zone: [3-7]` |
| "Water deeply once a week" | Aridity zone dependent | `climate-zone: arid` |

### Construction Domain

| Knowledge | Climate Scope | Tag |
|----------|--------------|-----|
| "Use exterior latex paint" | Humidity dependent | `climate-zone: humid` |
| "Insulation R-value requirements" | Temperature dependent | `climate-zone: [cold-temperate]` |
| "Roof pitch recommendations" | Precipitation dependent | `climate-zone: high-rainfall` |

### Energy/Solar Domain

| Knowledge | Climate Scope | Tag |
|----------|--------------|-----|
| "Panel efficiency peaks at 25°C" | Temperature range | `operating-range: [15-35C]` |
| "Optimal panel angle = latitude" | Hemisphere dependent | `hemisphere: [northern-southern]` |

## Edge Cases

1. **Microclimates**: A garden in a city may be one zone warmer than surrounding rural areas. How granular should scope be?
2. **Northern vs. Southern hemisphere**: Seasons are reversed. A note saying "prune in spring" is ambiguous without hemisphere context.
3. **Altitude**: Temperature decreases with altitude. A mountain town may be 2-3 zones colder than the same latitude at sea level.
4. **Transition zones**: Some areas fall between zones. Advice may apply to "zones 5-7" rather than a single zone.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] (jurisdiction/region rules)
- [[Frontier Exploration - User Situational Constraints]] — Related: scope metadata for user context
- [[Frontier Exploration - Geographically-Constrained Knowledge]] — Overlapping concern: geographic scope of knowledge applicability
- [[Handling Temporal Knowledge]]
- [[Stress Test - Tags vs Links Rule in Gardening]] — Domain stress tests including climate-dependent knowledge handling
