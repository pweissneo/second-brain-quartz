---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
gap-status: proposed
gap-priority: medium
gap-source: frontier-exploration
discovered: 2026-04-04
tags:
  - seed-refinement
  - climate-zone
  - hardiness-zone
  - environmental-scope
  - geographic-knowledge
---

# Seed Refinement - Climate-Zone-Dependent Knowledge Scope

## Gap Identification

**What knowledge is missing:** The Seed has explicit rules for jurisdiction-dependent knowledge (legal, medical, financial varies by country/region) and temporal knowledge (changes over time), but lacks guidance for **climate-zone-dependent knowledge** — knowledge whose validity depends on environmental conditions like USDA hardiness zones, humidity levels, rainfall patterns, or growing season length.

## Why This Matters

Many domains have knowledge that is TRUE but only under specific environmental conditions:
- **Gardening**: "Plant tomatoes after last frost" — depends on frost date by hardiness zone
- **Construction**: "Use exterior latex paint" — depends on humidity levels
- **Birdwatching**: "Migratory birds arrive in March" — depends on hemisphere and migration routes
- **Solar energy**: "Panel efficiency peaks at 25°C" — depends on typical operating temperatures
- **Beekeeping**: "Harvest honey in late summer" — depends on climate and flora

Without climate-zone scope, AI agents cannot distinguish between universally applicable advice and zone-specific guidance, risking incorrect application (planting tomatoes in January in Zone 4).

## What the Seed Currently Covers

- `jurisdiction` tag for legal/governmental scope
- `region` tag for geographic/cultural scope  
- Temporal knowledge rules with `data-date` frontmatter
- No explicit `climate-zone` or `hardiness-zone` scope tags

## Proposed Rule Addition

**Rule (NEW - 2026-04-04):** For knowledge domains where validity depends on climate zones, hardiness zones, or environmental conditions, use explicit `climate-zone` or `hardiness-zone` scope tags.

**Why:** Without environmental scope tags, AI agents cannot distinguish between universally applicable advice and zone-specific guidance, creating risk of applying incorrect advice.

**Test:** Pick 5 gardening notes. Do they have hardiness-zone or climate-scope tags? Can you determine which zone(s) the advice applies to?

### Frontmatter Extension

```yaml
climate-zone: [hardiness-zone-designation]
hardiness-zone: [USDA zone, e.g., "4-9"]
hemisphere: [northern|southern]
climate-type: [arid|temperate|tropical|mediterranean]
```

### Examples

| Knowledge | Climate Scope | Tag |
|----------|--------------|-----|
| "Plant tomatoes after last frost" | USDA Zone dependent | `hardiness-zone: [4-9]` |
| "Mulch before winter" | Cold-hardiness dependent | `hardiness-zone: [3-7]` |
| "Water deeply once a week" | Aridity zone dependent | `climate-zone: arid` |
| "Optimal panel angle = latitude" | Hemisphere dependent | `hemisphere: [northern,southern]` |

## Edge Cases

1. **Microclimates**: City gardens may be one zone warmer than surrounding rural areas
2. **Northern vs Southern hemisphere**: Seasons reversed — "prune in spring" is ambiguous without hemisphere
3. **Altitude**: Temperature decreases with altitude — mountain towns may be 2-3 zones colder
4. **Transition zones**: Some areas fall between zones — advice may apply to "zones 5-7"

## Related Notes

- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]] — Original gap identification
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules (jurisdiction/region)
- [[Frontier Exploration - Geographically-Constrained Knowledge]] — Overlapping geographic scope
