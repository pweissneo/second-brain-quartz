---
last-reviewed: 2026-03-20
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
tags:
  - frontier-exploration
  - geographic
  - regional
  - knowledge-organization
---

# Frontier Exploration: Geographically-Constrained Knowledge

> Knowledge that is only valid in specific geographic contexts — regional regulations, climate-specific practices, local customs — requires explicit handling that the Seed doesn't currently provide as a unified rule.

## The Gap

The Seed addresses:
- [[Frontier Exploration - Infrastructure-Dependent Knowledge]] — technical/hardware dependencies
- [[Frontier Exploration - Context-Gated Knowledge]] — context gates including geographic gates
- Spatial knowledge — physical organization by location
- Climate-zone-dependent knowledge — weather-specific practices

**What's missing:** A unified Seed rule for **geographically-constrained knowledge** — knowledge that applies only in specific geographic regions due to:
- Local regulations (building codes, traffic laws)
- Climate/weather patterns
- Local customs and practices
- Regional availability (local species, regional ingredients)
- Cultural context

## The Problem

Without explicit handling:
1. An AI might apply UK building regulations to a US project
2. Seasonal knowledge from Southern hemisphere gets used in Northern hemisphere
3. Local species (plants, animals, pests) are confused across regions
4. Regional regulations are treated as universal

## Proposed Seed Rule

**Rule:** For knowledge constrained to specific geographic contexts, use explicit `geographic-scope` frontmatter to specify applicability.

**Why:** Geographic constraints affect whether knowledge is applicable at all. Building codes, climate-dependent practices, and local regulations vary fundamentally by location. Without explicit scope, AI agents cannot assess applicability and may apply incorrect knowledge.

**Test:** For knowledge with geographic constraints: (1) Is `geographic-scope:` specified? (2) Does it include region(s) where knowledge applies? (3) Is there a distinction between general principles and region-specific implementations?

**Implementation:**
```yaml
geographic-scope:
  type: regulation|climate|cultural|ecological|species
  regions: ["US", "EU", "UK"]  # or specific: ["California", "Mediterranean"]
  scope-type: universal|regional|local
# type: what kind of geographic constraint
# regions: specific regions where this applies
# scope-type: universal (all contexts), regional (specific regions), local (specific location)
```

**Separation principle:** Always separate:
1. General principles that apply everywhere (physics, fundamental techniques)
2. Region-specific implementations (local regulations, climate adaptations)

Tag general principles with `geographic-scope: universal` and region-specific with specific regions listed.

## Examples

### Regulation Knowledge
- Building codes: `geographic-scope: { type: regulation, regions: ["US"], scope-type: regional }`
- Traffic laws: `geographic-scope: { type: regulation, regions: ["UK"], scope-type: regional }`

### Climate-Dependent Knowledge  
- Gardening zones: `geographic-scope: { type: climate, regions: ["US-Zone-7"], scope-type: local }`
- Seasonal timing: `geographic-scope: { type: climate, regions: ["Northern-Hemisphere"], scope-type: regional }`

### Ecological Knowledge
- Native species: `geographic-scope: { type: species, regions: ["Pacific-Northwest"], scope-type: local }`
- Invasive species: `geographic-scope: { type: ecological, regions: ["Australia"], scope-type: regional }`

### Cultural Knowledge
- Local customs: `geographic-scope: { type: cultural, regions: ["Japan"], scope-type: regional }`
- Regional cuisine: `geographic-scope: { type: cultural, regions: ["Italy-Emilia-Romagna"], scope-type: local }`

## Edge Cases

**Cross-regional knowledge:** Some knowledge spans multiple regions (e.g., "Mediterranean climate" applies to multiple countries). Use `regions: ["Mediterranean"]` and note scope is regional.

**Migration knowledge:** When knowledge moves between regions (species migration, cultural spread), track both origin and current scope.

**Micro-regions:** Climate zones, growing zones, and regulatory jurisdictions often have fine-grained boundaries. Use the most specific applicable level.

## Test Questions

1. Would this knowledge make sense if applied in a different region?
2. Does the source specify where this applies?
3. Are there regional variations that should be captured separately?

---

**Related Seed Rules:**
- [[Frontier Exploration - Context-Gated Knowledge]] — context gates including geographic
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]] — climate-specific practices (overlaps with geographic scope for environmental factors)
- [[Frontier Exploration - Infrastructure-Dependent Knowledge]] — infrastructure-type: geographic
- Seed Rule: Spatial knowledge vaults
