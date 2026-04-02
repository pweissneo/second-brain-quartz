---
gap-status: identified
gap-priority: medium
gap-phase: analysis
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-04-02
domain: astronomy
---

# Seed Gap - Location-Dependent Knowledge Handling

## Gap Description

The Seed lacks explicit guidance for knowledge that is fundamentally dependent on physical location. In domains like astronomy, birdwatching, gardening (climate zones), and travel, the same knowledge has different truth values or applicability based on WHERE it applies.

**Example in astronomy:**
- "Best months to observe Saturn" — depends on hemisphere (Northern vs Southern)
- "Meteor shower peak dates" — depends on global maximum but viewing conditions depend on latitude
- "Visible constellations" — completely different sky maps for Northern vs Southern hemisphere
- "Best viewing latitude for [object]" — some objects only visible from certain latitudes

**Example in birdwatching:**
- "Common backyard birds" — varies by continent, region, season
- "Migration timing" — varies by hemisphere

**Example in gardening:**
- "Planting zone" — USDA zones determine what grows when
- "Frost dates" — critical date varies by microclimate

## Current Seed Coverage

The Seed mentions:
- [[Frontier Exploration - Geographically-Constrained Knowledge]] — partial coverage
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]] — partial coverage (gardening focus)
- General temporal knowledge rules

What's MISSING:
1. Explicit rule for location as a first-class metadata dimension
2. Guidance on when location overrides other knowledge attributes
3. Framework for handling contradictory knowledge that's actually location-dependent
4. Entry point design for location-dependent vaults (how do you start when location matters?)

## Proposed Rule

**Rule:** For knowledge that varies by physical location (geography, latitude, climate zone, timezone), explicitly tag location scope and provide variants or caveats for relevant alternatives.
**Why:** Without explicit location scoping, knowledge becomes unreliable when transferred to different contexts. An AI building an astronomy vault in Australia using Northern hemisphere sources will produce incorrect guidance. Location-dependent knowledge is not interchangeable — applying knowledge to the wrong location can cause real-world failures (failed crops, missed celestial events, failed observations).
**Test:** (1) Does the vault contain knowledge that varies by location? (2) If yes, is location scope tagged in frontmatter or explicitly documented? (3) Are alternative locations addressed (variants, caveats, or separate notes)? (4) Can a user from a different location determine whether the knowledge applies to them?

**Implementation:**
```yaml
location-scope: global|northern-hemisphere|southern-hemisphere|latitude-specific|climate-zone|region|country|local
location-variants:
  northern: "Content for Northern Hemisphere"
  southern: "Content for Southern Hemisphere"
applicable-regions: [northern-hemisphere, temperate]
excluded-regions: [tropical, southern-hemisphere]
```

## Related Notes

- [[Frontier Exploration - Geographically-Constrained Knowledge]]
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]]
- [[Seed Stress Test - Amateur Astronomy Knowledge Base]]
- [[Seed Gap - Domain-Velocity Confidence Decay]] (related: confidence may vary by location too)

## Why This Matters

This gap is distinct from existing Seed rules because:
1. Location is not just another tag — it changes the truth value of knowledge
2. Location dependencies are often implicit in sources (author assumes their location)
3. Location variants multiply content requirements (not optional enhancement, required for correctness)
4. The Seed doesn't address "when knowledge appears valid but actually has hidden location dependencies"
