---
last-reviewed: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - gardening-domain
  - edge-case
---

# Seed Stress Test: Gardening Knowledge Base

Testing Seed rules in the gardening domain reveals unique challenges around climate zones, seasonal timing, and plant-specific knowledge.

## Domain Overview

Gardening knowledge bases face unique challenges:
- Geographic/zone dependency is fundamental (what works in Zone 7 doesn't work in Zone 4)
- Seasonal timing is critical (planting dates vary by hemisphere and frost dates)
- Plant taxonomy creates natural hierarchies (family → genus → species)
- Regional terminology variations (different countries use different names)
- Hardiness zone systems conflict (USDA vs Sunset vs RHS)

---

## 1. Climate Zone Dependency Rule

**Seed Rule:** For knowledge whose validity depends on climate zones, hardiness zones, or environmental conditions, use explicit scope tags.

**Gardening Application:**
- "Plant tomatoes after last frost" — applies differently in Zone 4 vs Zone 9
- " Hardy to Zone 5" — specific to USDA system

**Edge Cases:**

### Multiple Hardiness Systems
**Problem:** Multiple competing systems exist with different zone numbers:
- USDA Zone 7 (average annual minimum winter temperature -18°C to -12°C)
- Sunset Climate Zone 15 (California-specific, based on overall climate)
- RHS Hardiness Rating H5 (UK system)

A plant might be "Zone 7" in USDA but "Zone 15" in Sunset system. The Seed requires climate zone tags, but which system?

**Test Failure:** The Seed rule says use `hardiness-zone` tag but doesn't specify which system. An AI cannot determine applicability without knowing the system.

**Proposed Refinement:**
```yaml
hardiness-zone:
  system: USDA  # or Sunset, RHS
  zones: [5, 6, 7]
  note: "USDA recommended; Sunset zones differ"
```

### Microclimates Within Zones
**Problem:** A garden in Zone 5 might have a south-facing wall creating a Zone 7 microclimate. Generic zone advice fails here.

**Test:** Does the note acknowledge microclimate exceptions? Can users filter by "urban heat island" or "south-facing wall"?

### Southern Hemisphere Inversion
**Problem:** USDA zones don't apply in Australia/New Zealand. Seasons are inverted (December = summer, not winter).

**Test:** Does gardening advice specify hemisphere? Does "plant in spring" clarify which spring?

---

## 2. Sequential Knowledge: Seasonal Timing

**Seed Rule:** Distinguish sequential knowledge with `temporal-type: sequence`.

**Gardening Application:**

| Type | Example | temporal-type |
|------|---------|---------------|
| Frost date sequence | Last frost → hardening off → transplant | linear |
| Plant growth stages | Germination → seedling → vegetative → flowering → harvest | sequential |
| Crop rotation | Year 1: heavy feeder → Year 2: light feeder → Year 3: nitrogen fixer | cyclic |
| Perennial calendar | Spring: cut back → Summer: mulch → Fall: divide → Winter: plan | cyclical |

**Edge Cases:**

### Temperature vs Date-Based Triggers
**Problem:** Gardening advice often says "plant in spring" but the real trigger is temperature:
- "Plant tomatoes when soil reaches 60°F (15°C)"
- "Sow peas when forsythia blooms" (phenological indicator)

Date-based rules break across zones; temperature-based rules are more universal but harder to capture.

**Test:** Can an AI determine the actual trigger (temperature, phenology) vs. the simplified rule (date/season)?

### Variable Season Length
**Problem:** Zone 4 has a 120-day growing season; Zone 9 has 300 days. "Plant 8 weeks before last frost" means very different things.

**Test:** Does advice with time requirements specify zone ranges where it's valid?

### Hemisphere Asymmetry
**Problem:** Spring planting in Northern Hemisphere = September-October in Southern Hemisphere.

**Test:** Does advice specify hemisphere? Is there a mechanism to auto-flip seasons?

---

## 3. Word Count & Atomicity in Plant Notes

**Seed Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Gardening Application:**

**Edge Cases:**

### Complete Short Procedural Content
**Problem:** "How to Test Soil pH" can be complete in 75 words:
> "Collect soil sample from 4-6 inches deep. Mix 1 cup soil with 2 cups distilled water. Let settle 30 minutes. Dip pH strip in solution. Compare to color chart. Ideal pH for most vegetables: 6.0-7.0."

This is NOT a stub — it's complete and executable. But the Seed test flags it.

**Test Refinement:** For procedural content: Can you execute this note's procedure without additional information? If yes, it's complete regardless of word count.

### Comprehensive Plant Notes
**Problem:** "Tomatoes" as a single note covering 50+ varieties, growing techniques, diseases, and recipes exceeds 1000 words. Is this atomic or bloated?

**Analysis:**
- If note is "How to Grow Tomatoes" — contains multiple ideas (soil, water, sun, pruning, varieties)
- If note is "Tomato (Solanum lycopersicum)" — single concept comprehensively covered, could exceed 300 words

**Test:** Does the note explore ONE theme comprehensively, or bundle UNRELATED ideas?

---

## 4. Link Density: Plant Taxonomy

**Seed Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true`.

**Gardening Application:**
- Tomato → Nightshade Family, Solanum, Vegetable Garden
- Basil → Lamiaceae, Herb Garden, Culinary Herbs

**Edge Cases:**

### Natural Single Relationships
**Problem:** "Grafting" only naturally links to "Fruit Trees" and "Propagation" — 2 links, meets minimum. But what about special techniques?
- "Approach grafting" only used for specific plants
- "Air layering" has narrow applicability

**Test:** Does the rule distinguish "sparingly used technique" from "poorly connected"?

### Foundational Elements
**Problem:** Soil, water, sunlight — used by everything, link to nothing.

**Solution:** Tag with `foundational: true` per Seed rule.

### Plant Family Hubs
**Problem:** "Nightshade Family (Solanaceae)" links to 200+ plants. Exceeds 7 outgoing links rule.

**Test:** Hub notes legitimately exceed 7 links — domain taxonomy IS the structure.

---

## 5. 3-Hop Rule in Plant Hierarchies

**Seed Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.

**Gardening Application:**

Path example:
```
_root → Edible Plants → Vegetables → Fruiting Vegetables → Tomatoes → Cherry Tomatoes → Sweet 100
```
= 6 hops

**Edge Cases:**

### Natural Domain Taxonomy
**Problem:** Plant taxonomy (Kingdom → Phylum → Class → Order → Family → Genus → Species) legitimately exceeds 3 hops.

**Test:** Does this path reflect a genuine domain taxonomy (biological classification)? If yes, allow deeper paths.

### Hub-Based Shortcuts
**Solution:** Create intermediate hubs to shorten paths:
- _root → Plants → Food → Vegetables → Tomatoes → [varieties]
- _root → Plants → Food → Herbs → Basil → [varieties]

**Test:** Are there hub notes at major category boundaries (edible vs ornamental, annual vs perennial, cool vs warm season)?

---

## 6. Knowledge Timeliness: Varieties & Recommendations

**Seed Rule:** Use diminishing returns testing before adding notes — skip if utility/connection/uniqueness/effort test fails.

**Gardening Application:**

**Edge Cases:**

### Rapidly Evolving Variety Recommendations
**Problem:** "Best tomato varieties for Zone 7" changes yearly as new varieties are released and old ones are discontinued.

**Test:** Does the note have `as-of:` date? Is there a review trigger for new variety releases?

### Regional vs Universal Advice
**Problem:** "Add lime to raise soil pH" — universal principle, but amount depends on current pH, target pH, and soil type.

**Test:** Can the note be applied without region-specific calibration?

### Historical vs Current Knowledge
**Problem:** Old gardening books recommend practices now known to be harmful (arsenic-based pesticides, DDT).

**Test:** Is there a way to distinguish historical record from current recommendation?

---

## 7. Experiential Knowledge: "Feel" and Tacit Understanding

**Seed Rule:** For domains with experiential knowledge, include `experiential-component` frontmatter.

**Gardening Application:**

**Edge Cases:**

### Sensory Cues vs Fixed Rules
**Problem:** "Cook until translucent" in cooking = "pick when ripe" in gardening. But:
- "Ripe" varies by variety and personal preference
- Texture, color, smell — all subjective without reference photos
- Weather affects ripening timing

**Test:** Are sensory cues documented with examples (e.g., "skin glosses over," "slight softness at stem")?

### Failed Experiments
**Problem:** "I tried growing vanilla in Zone 4 — it died" — is this worth capturing?

**Answer:** YES. Personal failure is valuable negative knowledge. Tag as `type: negative-knowledge` with context.

**Test:** Can you find 3+ failure mode notes in the vault?

---

## 8. Source Quality in Gardening

**Seed Rule:** For knowledge with established evidence hierarchies, capture source quality tier.

**Gardening Application:**

| Source Type | Reliability | Example |
|-------------|-------------|---------|
| University extension | High | Cooperative Extension Service |
| Commercial nursery | Medium | Often biased toward products sold |
| Forum/community | Low-Variable | Experience-based but untested |
| Historical texts | Variable | Pre-1970s advice may be outdated |

**Edge Cases:**

### Traditional/Folk Knowledge
**Problem:** "Plant marigolds to deter pests" — traditional wisdom, but research is mixed.

**Test:** Is there a `myth-status:` tag? Is evidence quality assessed?

### Regional Adaptation
**Problem:** Advice from UK gardening books often doesn't apply to US climates.

**Test:** Is source region documented? Can users filter by source geography?

---

## 9. Equipment Dependencies

**Seed Rule:** Document physical equipment dependencies.

**Gardening Application:**

| Equipment | Domain-Wide | Optional |
|-----------|-------------|----------|
| Trowel | Yes | No |
| Garden fork | Yes | No |
| Soaker hose | Yes | Yes |
| Cold frame | Climate-specific | Yes |
| Greenhouse | Climate-specific | Yes |

**Edge Cases:**

### Climate-Dependent Equipment
**Problem:** "Need a cold frame" — only for cold climates with short seasons.

**Test:** Does equipment note specify climate applicability?

### Skill-Level Assumptions
**Problem:** "Use a soil knife" assumes user knows what that is.

**Test:** Can beginners find equipment guidance without jargon?

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Climate Zone Tags | Multiple competing systems (USDA, Sunset, RHS) | Specify system in metadata |
| Climate Zone Tags | Microclimates within zones | Add scope tags for urban heat islands |
| Seasonal Timing | Temperature triggers vs date rules | Document actual trigger, not simplified rule |
| Word Count | Complete short procedures <100 words | Test: can execute without additional info? |
| Word Count | Comprehensive plant notes >300 words | Single theme vs bundled concepts |
| 3-Hop Rule | Plant taxonomy legitimately deep | Allow domain taxonomies; create hub shortcuts |
| Source Quality | Traditional vs scientific knowledge | Tag folk wisdom separately from research |
| Experiential | Sensory cues (ripeness, readiness) | Document with examples and photos |

---

## Recommendations for Seed

1. **Climate Zone Rule:** Require explicit system specification (USDA/Sunset/RHS) in frontmatter.

2. **Seasonal Knowledge:** Add `hemisphere:` field to distinguish Northern/Southern applications.

3. **Experiential Knowledge:** For gardening specifically, require `sensory-cues:` field when knowledge depends on visual/tactile judgment.

4. **Source Quality:** Distinguish "university research" from "extension service" from "nursery" from "community forum" — all have different reliability profiles.

5. **3-Hop Rule:** Explicitly allow biological taxonomy as legitimate deep structure; encourage hub creation at family/genus boundaries.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]]
- [[Frontier Exploration - Jargon vs Plain Language]]
- [[Stress Test - Tags vs Links Rule in Gardening]]
- [[Handling Temporal Knowledge]]
- [[Domain-Specific Knowledge Bases]]
