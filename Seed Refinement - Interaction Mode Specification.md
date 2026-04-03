---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: seed-refinement
verification-status: unverified
refines: Seed Gap - Interaction Mode Specification
target-rule: Knowledge Type Taxonomy (line 68-98)
tags:
  - seed-refinement
  - interaction-mode
  - knowledge-presentation
  - knowledge-type-extension
seealso:
  - Seed Gap - Interaction Mode Specification
  - Frontier Exploration - Context-Dependent Knowledge Interaction
  - Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases
---

# Seed Refinement - Interaction Mode Specification

## Refinement Target

Extends the **Knowledge Type Taxonomy** rule (Seed lines 68-98) to add interaction mode as a complementary dimension to knowledge type.

## Why This Refinement

The Knowledge Type Taxonomy classifies knowledge by its nature (procedural/conceptual/factual/experiential/relational/meta), but doesn't address **how the knowledge will be consumed**:

- A **procedural** recipe can be:
  - **Performative** — step-by-step in the kitchen (needs inline measurements, imperative voice)
  - **Exploratory** — browsed for inspiration (needs images, creative framing)
  - **Compressed** — quick recall under stress (needs bold single-step format)

- A **conceptual** explanation can be:
  - **Progressive** — designed for learning (needs prerequisites, scaffolds)
  - **Reference** — quick lookup (needs clear headers, search-optimized)
  - **Comparative** — decision-making between options (needs table/contrast format)

Knowledge type answers "what kind of knowledge is this?" — interaction mode answers "how will it be used?" These are orthogonal dimensions that together determine optimal structure.

## Proposed Rule Addition

Add to the Knowledge Type Taxonomy section:

**Rule (EXTENSION):** Identify knowledge interaction modes at capture time — determine whether knowledge is primarily performative (executed step-by-step), exploratory (browsed and discovered), compressed (quick recall under stress), progressive (designed for learning), or comparative (decision-making between options).

**Why:** Different consumption contexts require different structures. A recipe as exploratory graph fails in the kitchen; emergency steps as exploratory prose fails in crisis. Mode identification ensures knowledge serves its primary use context.

**Test:** For any note, can you identify its primary interaction mode? Could someone in that use context use it effectively without manual restructuring?

**Implementation:**
```yaml
interaction-mode: performative|exploratory|compressed|progressive|comparative
mode-context: description of primary use context
# Optional mode-specific optimizations:
mode-optimization:
  context: kitchen-use
  format: step-by-step, measurements-inline, imperative-voice
```

**Rule (EXTENSION):** For high-frequency use contexts (kitchen, emergency, quick reference), maintain mode-optimized representations alongside reference versions when significant restructuring would be needed.

**Why:** One representation cannot serve all contexts effectively. The Seed should support context-specific optimization without creating fragmentation.

**Test:** For knowledge frequently used in distinct contexts, is there a mode-optimized version? Or does the user manually restructure?

## Interaction Mode Definitions

| Mode | Description | Structure Needs | Example |
|------|-------------|-----------------|---------|
| Performative | Executed step-by-step | Inline measurements, imperative, minimal links | Recipe during cooking, first aid under stress |
| Explorative | Browsed and discovered | Rich context, images, creative framing | Inspiration browsing, concept exploration |
| Compressed | Quick recall under stress | Bold single-step, no navigation, minimum text | Emergency procedures, quick reference |
| Progressive | Designed for learning | Prerequisites, scaffolds, progression markers | Tutorial content, skill acquisition |
| Comparative | Decision-making between options | Table/contrast format, clear distinctions | Tool selection, method comparison |

## Knowledge Type × Interaction Mode Matrix

| Knowledge Type | Performative | Exploratory | Compressed | Progressive | Comparative |
|----------------|-------------|-------------|------------|-------------|-------------|
| Procedural | ✓ (recipe) | (browse) | ✓ (emergency) | (learning) | (compare methods) |
| Conceptual | (how-to) | ✓ (concept) | (quick-def) | ✓ (tutorial) | ✓ (compare theories) |
| Factual | N/A | ✓ (explore) | ✓ (recall) | (learn facts) | ✓ (compare data) |
| Experiential | (recreate) | ✓ (reflect) | (remember) | ✓ (learn from) | (compare experiences) |
| Relational | N/A | ✓ (discover) | (key links) | (learn connections) | ✓ (X vs Y) |
| Meta-Knowledge | (apply method) | ✓ (explore) | (quick-ref) | ✓ (learn method) | (compare methods) |

## Edge Cases

1. **Multi-mode knowledge** — Some knowledge serves multiple contexts equally. Tag with `mode: [primary], secondary: [others]` and consider mode-specific variants.

2. **Mode transitions** — Knowledge captured in one mode may need another for different use. Document original capture mode to help future agents understand context.

3. **Safety-critical knowledge** — Emergency procedures should ALWAYS have compressed performative variant, regardless of primary mode.

4. **Mode-specific variants** — When creating variants for different modes, link them with `variant-of:` and `variant-type: interaction-mode`.

## Gap Evidence

From Seed Gap - Interaction Mode Specification:
- Current Seed covers context-frame (who is this for, what purpose)
- Missing: "how will this be consumed" (execution vs. browsing vs. under stress)
- Concrete failure: First aid note as exploratory prose fails under stress
- Emergency knowledge needs compressed performative mode

From Frontier Exploration - Emergency and First-Aid Knowledge:
- Compressed mode critical for emergencies
- Current Seed doesn't guide mode-specific representations

## Test Scenario: First Aid Knowledge Base

An AI building a first aid knowledge base using current Seed:
- ✓ Tags knowledge-type: procedural
- ✓ Tags context-frame: emergency
- ✗ Creates exploratory format with wikilinks (fails under stress)
- ✗ No compressed performative version

With this refinement:
- ✓ Tags interaction-mode: compressed (for emergency procedures)
- ✓ Creates bold single-step version for crisis use
- ✓ Links to exploratory version for learning context

## Refinement Status

**Status:** proposed — ready for Seed integration
**Confidence:** emerging — needs domain stress test
**Next:** Stress test in one procedural domain (cooking or first aid)

## Related

- [[Seed Gap - Interaction Mode Specification]] — Source gap
- [[AI-Assisted Knowledge Management Seed]] — Knowledge Type Taxonomy (lines 68-98)
- [[Frontier Exploration - Context-Dependent Knowledge Interaction]]
- [[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]]