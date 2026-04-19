---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-02
lifecycle: seed-extension
confidence: emerging
tags:
  - seed-refinement
  - location-dependent
  - geographic
  - domain-extension
---

# Seed Refinement - Location-Dependent Knowledge Handling

## The Gap

The Seed lacks explicit guidance for knowledge that is fundamentally dependent on physical location. While the infrastructure-dependent rule (line ~299) covers hardware/network configuration, it doesn't address geographic location as a dimension that changes knowledge truth values.

**Evidence of need:**
- [[Seed Gap - Location-Dependent Knowledge Handling]] — gap analysis complete
- [[Frontier Exploration - Geographically-Constrained Knowledge]] — partial coverage
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]] — partial coverage (gardening focus)
- [[Seed Stress Test - Amateur Astronomy Knowledge Base]] — astronomy domain stress test
- [[Seed Stress Test - Gardening Knowledge Base]] — gardening domain stress test

## The Rule

**Rule:** For knowledge that varies by physical location (geography, latitude, climate zone, timezone), explicitly tag location scope and provide variants or caveats for relevant alternatives.
**Why:** Without explicit location scoping, knowledge becomes unreliable when transferred to different contexts. An AI building an astronomy vault in Australia using Northern hemisphere sources produces incorrect guidance. Location-dependent knowledge is not interchangeable — applying knowledge to the wrong location causes real-world failures (failed crops, missed celestial events, wrong species identification).
**Test:** (1) Does the vault contain knowledge that varies by location? (2) If yes, is location scope tagged in frontmatter or explicitly documented? (3) Are alternative locations addressed (variants, caveats, or separate notes)? (4) Can a user from a different location determine whether the knowledge applies to them?

## Implementation

```yaml
location-scope: global|northern-hemisphere|southern-hemisphere|latitude-specific|climate-zone|region|country|local
location-variants:
  northern: "Content for Northern Hemisphere"
  southern: "Content for Southern Hemisphere"
applicable-regions: [northern-hemisphere, temperate]
excluded-regions: [tropical, southern-hemisphere]
```

## Domain-Specific Applications

### Astronomy
- Visible constellations differ by hemisphere
- Best viewing months vary by latitude
- Meteor shower visibility depends on location
- Implementation: Tag with `location-scope: hemisphere` or `location-scope: latitude-specific`

### Gardening
- USDA climate zones determine planting schedules
- Frost dates vary by microclimate
- Growing season length depends on latitude
- Implementation: Tag with `climate-zone:` field and `hardiness-zone:` range

### Birdwatching
- Species distribution varies by continent and region
- Migration timing depends on hemisphere
- Implementation: Tag with `biome:` or `region:` fields

### Travel
- Visa requirements depend on citizenship
- Currency varies by country
- Cultural norms vary by region
- Implementation: Tag with `applies-to-nationality:` or `applies-to-region:`

## Relationship to Infrastructure Rule

The infrastructure-dependent rule (line ~299) covers:
- Network configuration
- Hardware setup
- Protocol dependencies

Location-dependent knowledge is DISTINCT because:
1. Location changes truth value, not just applicability
2. Location dependencies are often implicit in sources (author assumes their location)
3. Location variants multiply content requirements (required for correctness, not optional)

The rules are complementary: infrastructure = "configuration dependencies", location = "geographic dependencies".

## Edge Cases

**Implicit location assumptions:** Many sources assume the author's location without stating it. When capturing knowledge, note any implicit location assumptions:
- "Summer" — which hemisphere?
- "Common birds" — which continent?
- "Best months" — which hemisphere/region?

**Micro-variation:** Within a city, knowledge can vary by microclimate (urban heat island effect, elevation). For high-precision domains, use `location-scope: local` with specific area documentation.

**Moving knowledge:** Some knowledge follows the person (travel tips), some stays fixed (garden plants). Distinguish with `location-type: portable|fixed`.

## Test Clarification

For the test, "varies by location" means:
- The knowledge has different truth values in different locations (NOT just different examples)
- A user in Location B would find the knowledge misleading or wrong if applied to their context
- The variation is structural, not just illustrative

**Examples that DO require location tagging:**
- "Best time to see Saturn" (varies by hemisphere)
- "Hardy to zone 5" (climate zone specific)
- "Common backyard birds" (continent specific)

**Examples that DON'T require location tagging:**
- "How to boil water" (universal)
- "Newton's laws" (universal)
- "Basic recipe structure" (principle, not location-specific)

## Related Seed Rules

- [[Seed Rule - Infrastructure-Dependent Domains]] (line ~299) — configuration dependencies
- [[Frontier Exploration - Geographically-Constrained Knowledge]] — exploration
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]] — exploration
- [[Seed Gap - Location-Dependent Knowledge Handling]] — original gap note

[[_root]]

**Question for Seed:** Should location-scope become a standard frontmatter field alongside infrastructure-type? The gap note suggests yes for location-heavy domains.
