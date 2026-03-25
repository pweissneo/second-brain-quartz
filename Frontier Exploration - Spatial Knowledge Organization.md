---
last-reviewed: 2026-03-19
last-updated: 2026-03-19
confidence: emerging
author-type: ai-assisted
lifecycle: evergreen
tags:
  - frontier-exploration
  - spatial-knowledge
  - knowledge-organization
  - geographic
---

# Frontier Exploration - Spatial Knowledge Organization

> How to organize knowledge about physical spaces, locations, and geographic relationships in a knowledge base.

## The Problem

The Seed provides robust guidance for organizing textual/conceptual knowledge but lacks explicit guidance for spatial knowledge — knowledge about physical spaces, locations, and geographic relationships. Building a knowledge base about architecture, interior design, urban planning, real estate, travel, or geography requires spatial organization patterns the Seed doesn't address.

## Distinct from Existing Concepts

This gap is different from:

- **Place-specific verification** (existing note): How to verify knowledge that requires visiting a location
- **Timeline organization**: How to organize by chronology (primary structure is time)
- **Domain taxonomies**: Hierarchical classification (primary structure is category)

Spatial knowledge has **geography as primary structure** — the physical relationships between locations are the organizing principle, not time or category.

## Challenges Unique to Spatial Knowledge

### 1. Spatial Hierarchies

Knowledge often exists at multiple scales:
- Street → Neighborhood → City → Region → Country → Continent
- Building → Floor → Room → Furniture position
- Trail → Section → Waypoint → Landmark

The Seed's "3 hops from root" rule may not suit spatial hierarchies where deeper is natural (City → District → Street → Building is 4 hops but correct).

### 2. Proximity Relationships

Spatial knowledge depends on adjacency:
- "Room A is next to Room B"
- "This coffee shop is across from the library"
- "The trail connects to the park entrance"

These are non-hierarchical relationships the Seed's hub pattern doesn't explicitly address.

### 3. Scale-Dependent Validity

Knowledge that applies at one scale may not apply at another:
- "This neighborhood is walkable" (applies at neighborhood scale)
- "The building has good sound isolation" (applies at building scale)
- "This intersection is dangerous" (applies at street/corner scale)

Without scale tagging, knowledge gets misapplied.

### 4. Multi-Location Knowledge

Some knowledge spans multiple places:
- "The best coffee shops in downtown"
- "Historic sites along this route"
- "Areas with good sunset views"

These are inherently multi-location but the Seed treats each note as atomic.

## Proposed Handling

### Frontmatter Fields

```yaml
spatial-type: hierarchy|proximity|route|network|point
spatial-scale: street|neighborhood|city|region|continent  # or building|floor|room
spatial-hierarchy:
  level: room
  parent: Floor 2
  grandparent: Office Building A
spatial-relationships:
  - type: adjacent
    target: "[[Conference Room B]]"
  - type: visible-from
    target: "[[Rooftop Terrace]]"
scale-validity:
  applies-at: [neighborhood, city]
  does-not-apply-at: [street, room]
location-coordinates:  # optional for precise locations
  lat: 40.7128
  lon: -74.0060
```

### Proposed Rules

**Rule:** For spatial knowledge vaults, allow deeper hierarchies when they reflect genuine geographic structure.
**Why:** Forcing spatial knowledge into 3 hops creates artificial flattening. A city → district → neighborhood → street hierarchy is natural and discoverable; compressing it loses information.
**Test:** For spatial vaults: Can you identify hierarchies that exceed 3 hops but are genuine geographic structure? Are they allowed?
**Implementation:** Add exception for `spatial-type: hierarchy` notes — allow up to 6 hops when path reflects genuine geographic taxonomy.

**Rule:** Tag spatial knowledge with explicit scale validity.
**Why:** Knowledge that applies at city scale may be meaningless or misleading at street scale. Without scale tagging, readers and AI agents cannot assess applicability.
**Test:** For spatial notes: (1) Is there `spatial-scale` or `scale-validity` frontmatter? (2) Can you determine what scale the knowledge applies at?
**Edge case:** Some spatial knowledge is scale-independent (fundamental geographic truths). Allow `scale-validity: universal` for these.

**Rule:** Use proximity relationship notes for adjacent-location knowledge.
**Why:** "Room A is next to Room B" is fundamentally different from "Room A is in Building B." Proximity relationships enable route planning and spatial reasoning.
**Test:** For spatial vaults: Are adjacency relationships captured as explicit notes or structured frontmatter?
**Implementation:** For simple adjacency, use `spatial-relationships` frontmatter. For complex relationships (pathfinding, route optimization), create dedicated relationship notes with `spatial-type: proximity`.

**Rule:** For multi-location knowledge (lists, routes, comparisons), use hub pattern with explicit scope.
**Why:** "Best coffee shops in downtown" is inherently about multiple locations. A hub with scoped members maintains atomicity while capturing the multi-location nature.
**Test:** For multi-location notes: (1) Is there a hub note? (2) Does each member have location metadata? (3) Can you filter by location?

**Rule:** Consider geographic coordinate fields for precision-dependent spatial knowledge.
**Why:** Names are ambiguous (multiple "Main Streets"). Coordinates enable precise retrieval and distance calculations.
**Test:** For notes where precision matters: Is there `location-coordinates` frontmatter?
**Edge case:** Only add coordinates when precision is genuinely needed — don't over-engineer for casual spatial knowledge.

## Open Questions

1. How should spatial knowledge vaults handle knowledge about imaginary/fictional spaces?
2. Should spatial vaults integrate with mapping tools or GIS systems?
3. How to handle rapidly changing spatial knowledge (new restaurants, road changes)?
4. What's the right balance between coordinate precision and privacy (home addresses)?
5. Should spatial knowledge include time-of-day or seasonal validity?

## Related Concepts

- [[AI-Assisted Knowledge Management Seed]] — The Seed this note extends
- [[Frontier Exploration - Place-Specific Verification Knowledge]] — Verification of place-specific claims
- [[Frontier Exploration - Timeline-Based Knowledge Structures]] — Temporal as primary structure
- [[Handling Temporal Knowledge]] — Time-based knowledge handling

## Test Domain

Stress test this gap by imagining building a knowledge base about:
- **Interior design**: How to organize notes about furniture, rooms, layouts, flow patterns
- **Urban planning**: How to organize notes about neighborhoods, zoning, infrastructure
- **Real estate**: How to organize notes about properties, areas, market comparisons

Where would an AI agent get stuck applying current Seed rules to these domains?

---

**Confidence**: emerging — This is a newly identified gap; rules are provisional and need stress testing across multiple spatial knowledge domains.
