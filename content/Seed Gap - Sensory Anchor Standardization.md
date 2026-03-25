---
last-reviewed: 2026-03-25
last-updated: 2026-03-25
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - sensory
  - embodied-knowledge
  - standardization
level: principle
schema-version: "1.0"
---

# Seed Gap: Sensory Anchor Standardization

> Standardizing sensory cues across notes for embodied knowledge domains.

**Date:** 2026-03-25
**Discovery Method:** REDUNDANCY_SCAN - Merged from Seed Stress Test - Embodied Knowledge Rule
**Status:** CONTENT MERGED - Previously referenced file now consolidated

---

## Overview

This note consolidates guidance on sensory anchors for embodied knowledge — knowledge requiring physical sensation, touch, feel, or bodily experience to fully understand. It addresses:

1. How to capture sensory information in notes
2. Standard formats for expressing tactile, visual, auditory cues
3. Frontmatter fields for embodied knowledge tagging
4. Handling edge cases where anchoring is difficult or impossible

The Seed references this note in two places for embodied knowledge guidance.

---

## Why Sensory Anchors Matter

Embodied knowledge (tactile cues, kinesthetic feel, sensory judgment) cannot be verified by reading sources. A note may be "correct" intellectually but incomplete without the sensory component. Without standardized sensory anchors:

1. AI agents have no guidance on what sensory cues to capture
2. There's no standard format for expressing tactile, visual, auditory cues
3. Embodied knowledge remains inconsistent across notes
4. The Seed's recommendation cannot be operationalized

---

## What to Capture

| Sense | Examples | Quality Indicators |
|-------|----------|-------------------|
| Visual | Color, texture, shape, movement | Specific, not "looks good" |
| Auditory | Sounds, timing cues | Repeatable, measurable |
| Tactile | Temperature, resistance, pressure | Actionable (press until...) |
| Olfactory | Aromas, signs of doneness | Cross-modal indicators |
| Taste | Flavor profiles, textures | Descriptive vocabulary |

---

## Frontmatter Fields

### Core Fields

```yaml
embodied-component: essential|partial|none
sensory-modes: [visual, tactile, auditory, olfactory, taste]
sensory-anchor: "Concrete reference point for the sensation"
```

### Extended Fields (for complex cases)

```yaml
# For inherently personal sensations that resist anchoring
anchoring_feasibility: high|medium|low

# For cues that are shared cultural standards (vs. individual sensation)
anchoring_type: individual|collective
collective_standard_example: "As known by experienced practitioners"

# For medical/clinical embodied knowledge requiring training
clinical_training_required: true|false

# For multi-sensory integration
sensory_integration: sequential|simultaneous
primary_sensory: visual
secondary_sensory: [auditory, tactile]
```

### Skill-Level Anchors

For embodied cues that differ at different proficiency levels:

```yaml
skill_level_anchors:
  beginner: "Feel the expansion against your waistband"
  intermediate: "Feel subtle engagement without visible torso movement"
  advanced: "Feel deep stabilization without apparent effort"
```

---

## Standard Format

### Basic Template

```
## Sensory Anchors

### Visual
- [Specific visual cue with reference point]

### Tactile
- [Specific tactile cue with actionable guidance]

### Auditory  
- [Specific auditory cue with what to listen for]

### Olfactory (if applicable)
- [Specific aroma cue]

### Taste (if applicable)
- [Specific flavor/texture cue]
```

### Complete Example: Bread Dough Poke Test

```yaml
---
embodied-component: essential
sensory-modes: [tactile, visual]
sensory-anchor: "Like pressing the fleshy part of your palm - slight resistance but leaves no dent"
anchoring_feasibility: high
---

## Sensory Anchors

### Tactile
- Press finger into dough about 1 inch deep
- Feel for slow spring-back (2-3 seconds)
- Reference: Like pressing the fleshy part of your palm

### Visual
- Dough should hold the dent without collapsing immediately
- If it springs back immediately: under-proofed
- If it doesn't spring back at all: over-proofed
```

---

## Edge Cases

### 1. Unanchorable Knowledge

Some embodied knowledge cannot be anchored — "mind-muscle connection," "feeling the music," "intuition."

**Handling:** Mark with `anchoring_feasibility: low`. The note should still acknowledge the embodied component but may skip the anchor requirement.

### 2. Collective Standards

Some cues ARE verifiable through social means — "everyone knows what properly risen dough feels like" is a cultural/collective standard.

**Handling:** Use `anchoring_type: collective` with `collective_standard_example`.

### 3. Ingredient-Specific Cues

"Golden brown" varies by ingredient (bread vs. cookies vs. meat).

**Handling:** Provide ingredient-specific anchors or note the variability.

### 4. Time-Based vs. Embodied

Some "ready" cues are time-based, not sensory — "wood is ready to plane" after acclimating.

**Handling:** Clarify when rule applies vs. doesn't apply. Time-based knowledge is NOT embodied.

### 5. Multi-Sensory Integration

Some knowledge requires combining multiple senses — perfect espresso needs visual + auditory + tactile + olfactory.

**Handling:** Use `sensory_integration` field and prioritize senses.

---

## Domain Examples

### Cooking: "Golden Brown"

> "Cook until golden brown."

| Element | Detail |
|---------|--------|
| Sensory mode | Visual |
| Anchor | What shade of brown? Compared to what? |
| Problem | Different ingredients brown differently |
| Refinement | Specify shade range, ingredient-specific anchors |

### Fitness: "Engage Core"

> "Engage your core by drawing your belly button toward your spine."

| Element | Detail |
|---------|--------|
| Sensory mode | Tactile |
| Anchor | "Feels like tightening a corset around your midsection" |
| Alternative | "You should be able to breathe normally while engaged" |

### Music: Bow Pressure

> "Apply light bow pressure for a warm tone."

| Element | Detail |
|---------|--------|
| Sensory modes | Tactile + Auditory |
| Tactile anchor | "Like holding a bird — enough to feel resistance, not enough to hurt" |
| Auditory anchor | "A clear, resonant sound without scratchiness" |
| Progression | "Start with almost no pressure (breathy sound), gradually increase until clear tone emerges" |

### Woodworking: Planing

> "Continue planing until the shavings curl as they exit the plane."

| Element | Detail |
|---------|--------|
| Sensory modes | Tactile + Visual |
| Tactile anchor | "Shavings should feel almost silky — not scratchy, not fuzzy" |
| Visual anchor | "Continuous curl, like a ribbon, about as thick as a piece of paper" |
| Problem indicator | "If shavings are torn or fuzzy, the blade is dull or the wood is chipping" |

### Medical: Palpation

> "Palpate the abdomen for tenderness."

| Element | Detail |
|---------|--------|
| Sensory mode | Tactile |
| Anchor | "Localized pain when pressure applied, guarding (involuntary muscle contraction)" |
| Clinical training required | true |
| Reference standard | "Compare to adjacent areas — tenderness is significantly more sensitive to pressure" |

---

## Test Criteria

- [ ] Do technique notes in embodied domains include at least 2 sensory anchors?
- [ ] Are sensory anchors specific and actionable?
- [ ] Can a reader use these cues to verify correct execution?
- [ ] Are sensory anchors cross-referenced with similar techniques?
- [ ] For `embodied-component: essential` notes: does the note acknowledge what sensory information is required?
- [ ] Is there a sensory anchor or reference point (unless `anchoring_feasibility: low`)?

---

## Related

- [[Frontier Exploration - Sensory Knowledge Capture]]
- [[Seed Gap - Sensory Evaluation Knowledge]]
- [[Seed Stress Test - Embodied Knowledge Rule]]
- [[Frontier Gap - Embodied Knowledge]]
- [[AI-Assisted Knowledge Management Seed]]
