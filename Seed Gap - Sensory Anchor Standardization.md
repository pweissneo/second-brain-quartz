---
last-reviewed: 2026-03-30
last-updated: 2026-03-30
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
tags:
  - seed-gap
  - frontier-exploration
  - embodied-knowledge
  - sensory-anchors
  - tacit-knowledge
  - knowledge-representation
schema-version: "1.0"
---

# Seed Gap: Sensory Anchor Standardization

> Standardizing sensory cues across notes for embodied knowledge domains — how to capture tactile, visual, auditory, olfactory, and taste cues that cannot be verified by reading.

**Date:** 2026-03-30
**Discovery Method:** REDUNDANCY_SCAN — Merged duplicate notes
**Status:** EMERGING — Content consolidated from two related notes

---

## Overview

This note consolidates guidance on sensory anchors for embodied knowledge — knowledge requiring physical sensation, touch, feel, or bodily experience to fully understand. It addresses:

1. How to capture sensory information in notes
2. Standard formats for expressing tactile, visual, auditory cues
3. Frontmatter fields for embodied knowledge tagging
4. Handling edge cases where anchoring is difficult or impossible

## The Problem

Embodied knowledge domains (cooking, crafts, music, physical skills, medicine) contain knowledge that:

1. **Cannot be fully captured in text** — The "feel" of a correct technique is not translatable
2. **Creates false confidence when captured as text** — "I read about it, therefore I know it"
3. **Lacks verification through reading** — You can't verify a physical sensation by re-reading a note

Examples of where this fails:

| Domain | Vague Capture | What It Actually Means |
|--------|---------------|------------------------|
| Cooking | "cook until golden" | No indication of what golden looks like vs. burnt |
| Craft | "sand until smooth" | No reference for smooth vs. still rough |
| Music | "light touch on keys" | No calibration for what "light" means |
| Medicine | "apply gentle pressure" | No reference for how much pressure |

---

## Why Sensory Anchors Matter

Without standardized sensory anchors:

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

## Proposed Seed Rule

**Rule:** For embodied knowledge notes, provide standardized sensory anchors using target/contrast/verification structure — anchors must be concrete, familiar, and testable.

**Why:** Vague descriptors ("light pressure," "smooth texture," "gentle touch") provide no actionable guidance. Concrete anchors with familiar references and explicit contrast points give readers a fighting chance of recognizing the correct sensation without direct instruction.

**Test:** For notes tagged `embodied-component: essential`: (1) Is there at least one sensory anchor? (2) Does the anchor include a target AND a contrast? (3) Is the anchor testable by a reader who hasn't experienced the sensation? (4) Is the reference familiar to the target audience?

---

## Proposed Frontmatter Structure

```yaml
sensory-anchors:
  - sense: tactile
    target: "Like pressing a ripe avocado — slight give but not mushy"
    target-description: "Gentle pressure that yields slightly"
    negative-contrast: "Not like a rock — completely rigid with no give"
    negative-description: "No give whatsoever"
    verification: "Press gently with thumb; if it yields slightly and springs back, it's ready"
    failure-indicator: "If it indents without springing back, it's overripe"
    anchor-type: analogy|comparison|physical-reference
```

### Anchor Types and When to Use Each

| Anchor Type | When to Use | Example |
|-------------|-------------|---------|
| Analogy | When the target sensation has no direct physical equivalent | "Feels like pressing into a ripe tomato" (nothing else is exactly like this) |
| Comparison | When a known object provides reliable calibration | "Like testing bread dough — should spring back slowly" (common cooking reference) |
| Physical reference | When an instrument or tool provides exact measurement | "Resistance equal to pressing through a sheet of paper" |
| Negative-space | When the key is knowing what it's NOT | "Should not feel like chalk — too dry and rough" |

---

## Domain-Specific Anchor Conventions

### Cooking
- Temperature references: "pan hot enough to sizzle a drop of water immediately" (not just "medium-high")
- Texture references: "like thick pancake batter" (not "should coat the spoon")
- Doneness: "spring back when poked" vs. "stays indented" as the key difference

### Crafts (woodworking, pottery)
- Surface feel: "like fine sandpaper (220 grit) — smooth but not slippery"
- Resistance: "should feel like pressing through soft cheese — some resistance but yields"
- Fit tolerance: "you should feel the fit before you hear it" (no gaps, no force needed)

### Music
- Touch weight: "like touching a soap bubble — enough contact to feel but not break"
- Pressure: "like writing with a pencil — firm enough for control, light enough for expression"
- Timing feel: "like the space between heartbeats — present but unhurried"

### Medical/physical examination
- Tissue resistance: "like pressing into a firm orange — some resistance with slight give"
- Pain response: "sharp stabbing vs. dull ache — distinct quality difference"
- Temperature: "warm to touch vs. hot to touch — compare to your own forearm as reference"

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

### 3. Anchor when no familiar reference exists

If the sensation has no familiar equivalent, use "what to listen for" or "what to look for" instead. Not all senses apply to all situations.

### 4. Anchors for absolute beginners

Some anchors assume experience ("like a ripe avocado"). For beginners, pair with video links or explicit "here's what to look for" guidance. Tag anchors with `requires-prior-experience: true` if the reference itself assumes familiarity.

### 5. Culture-dependent references

"Like a ripe banana" works in some cultures, not others. Mark anchors with `cultural-scope:` and provide alternatives for different audiences when possible.

### 6. Anchors vs. measurements

When a tool can provide exact measurement (thermometer, pressure gauge), prefer measurement and treat the anchor as backup. Use "thermometer reads X but feels like Y" pattern.

### 7. Cross-reference anchors

Sensory experiences transfer across domains. Create links between anchors:

```yaml
sensory-cross-references:
  - related-anchor: "[[Dough Spring-Back Test]]"
    transfer: "Same feeling as testing bread — both use spring-back as indicator"
    domain: cooking
  - related-anchor: "[[Clay Center Test]]"
    transfer: "Same resistance feel as centering clay on wheel"
    domain: pottery
```

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
- [ ] Do anchors include target AND contrast?
- [ ] Are references familiar to the target audience?

---

## Relationship to Existing Seed

This extends the existing `embodied-component` frontmatter by providing:
1. A standardized structure for sensory anchors (not just one vague field)
2. Contrast anchors (both positive and negative calibration)
3. Domain-specific conventions
4. Cross-reference mechanism for anchor network building

---

## Related

- [[Frontier Exploration - Sensory Knowledge Capture]]
- [[Seed Gap - Sensory Evaluation Knowledge]]
- [[Seed Stress Test - Embodied Knowledge Rule]]
- [[Frontier Gap - Embodied Knowledge]]
- [[AI-Assisted Knowledge Management Seed]]