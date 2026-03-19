---
last-reviewed: 2026-03-19
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - astronomy-domain
  - link-density
  - instrumentation
---

# Seed Stress Test: Amateur Astronomy Knowledge Base

## Seed Rule Being Tested

**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.

**Why:** Unlinked notes are invisible in the graph — they cannot be discovered through navigation. Foundational elements are a special case that should be explicitly marked, not manually verified each time.

**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag AND lacks the `specialized: true` tag.

---

## Domain: Amateur Astronomy

Amateur astronomy presents unique challenges for link density:
- Many specialized instruments (telescopes, eyepieces, mounts, cameras)
- Specific celestial objects with catalog numbers (NGC, Messier, IC objects)
- Equipment-specific knowledge (what works with one setup may not work with another)
- Observational techniques that depend on location, season, and equipment
- Mixed observational (hands-on) and theoretical (astrophysics) knowledge

---

## Edge Case 1: Celestial Object Catalog Numbers

**Problem:** Notes about specific NGC/Messier/IC objects may only naturally link to one thing (the object category). For example:
- "NGC 4274" might only link to "Galaxies"
- "M31" might only link to "Andromeda Galaxy"

These are legitimate atomic notes about specific objects, but they fail the 2-link test.

**Seed Edge Case:** The Seed already acknowledges "Domain-specific instruments, tools, or assessment scales may legitimately have only 1 natural link when used in a specific context."

**Analysis:** Celestial objects are domain-specific entities, not instruments. The existing edge case doesn't cover them.

**Recommendation:** Add explicit edge case for **domain-specific entities**:

> **Edge case:** Specific entities in a domain (celestial objects in astronomy, species in biology, chemical elements in chemistry, specific works in literature) may legitimately have fewer outgoing links when they are reference targets rather than concept-developing notes. Tag with `type: entity-reference` to distinguish from conceptual notes.

---

## Edge Case 2: Equipment-Specific Procedures

**Problem:** A note about "using a Baader Mk III corrector" might only link to "Baader Mark III" (the device) because the procedure is highly specific to that piece of equipment.

**Seed Edge Case:** The Seed acknowledges "Specialized instruments... may legitimately have only 1 natural link."

**Analysis:** This edge case applies, but the test might not distinguish between:
- The instrument note itself (should have 1+ links)
- A procedure specific to that instrument (might be highly specific)

**Recommendation:** The test should distinguish:
- Instrument notes: must have links to category and usage context
- Equipment-specific procedures: may have fewer links if tagged `applicability-transferability: low`

---

## Edge Case 3: Observational Knowledge vs. Theoretical Knowledge

**Problem:** Astronomy mixes:
- Theoretical knowledge (astrophysics, cosmology) - links naturally to related concepts
- Observational knowledge (what to look for, how to find objects) - may be highly specific

A note about "how to find M31 in binoculars" might only link to "M31" and "binocular observing" - 2 links, but both are specific to this observation.

**Recommendation:** Add `knowledge-type: observational` vs `knowledge-type: theoretical` distinction. Observational notes may have more specific link patterns.

---

## Edge Case 4: Location-Dependent Knowledge

**Problem:** Astronomy knowledge depends heavily on:
- Latitude/longitude (what's visible from your location)
- Light pollution levels
- Weather patterns
- Season

A note about "best observation times for [local galaxy]" from a specific site might only link to the galaxy and the site.

**Seed Edge Case:** Already covered by "Context-Gated Knowledge" rules.

**Analysis:** The existing context-gated rules should handle this, but link density expectations might need adjustment for highly location-specific notes.

---

## Edge Case 5: Equipment Calibration Sequences

**Problem:** Some astronomy procedures form chains:
- Polar alignment → Star alignment → Calibration → Imaging
- Each step might only link to the next in sequence

This is sequential knowledge that naturally has linear links.

**Seed Edge Case:** The Seed acknowledges "Sequential knowledge (history, processes, narratives) legitimately has homogeneous cause/effect links."

**Analysis:** This edge case applies. The test should exclude purely sequential process notes from link diversity requirements.

---

## Test Refinements for Astronomy

### Modified Test for Celestial Objects

For notes about specific celestial objects:
1. Is this a catalog reference (NGC, Messier, IC, star name)?
2. Does it link to its category (galaxy, nebula, star, planet)?
3. Does it have observational relevance?

If yes to 1-2, allow 1 link; tag with `type: entity-reference`.

### Modified Test for Equipment

For notes about telescopes, mounts, cameras:
1. Is this a specific instrument model?
2. Does it link to its category?
3. Does it have usage notes?

If yes to all, minimum 1 link is acceptable; tag with `specialized: true`.

### Modified Test for Location-Specific Knowledge

For notes with heavy location dependence:
1. Is context-gate properly documented?
2. Does it link to relevant domain concepts?
3. Is transferability marked?

If yes to 1-2, allow reduced link count; enforce context-gate documentation.

---

## Summary

| Challenge | Seed Coverage | Recommendation |
|-----------|---------------|----------------|
| Celestial catalog objects | Partial | Add `entity-reference` type |
| Equipment-specific procedures | Covered | Enforce `applicability-transferability` |
| Observational vs theoretical | Partial | Add `knowledge-type` distinction |
| Location-dependent | Covered | Verify context-gate compliance |
| Sequential processes | Covered | Apply existing edge case |

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Amateur Astronomy Knowledge Bases]]
- [[Frontier Exploration - Equipment and Tool Dependencies]]
- [[Stress Test - Equipment Dependencies Rule Across Domains]]
