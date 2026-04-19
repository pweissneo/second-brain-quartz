---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: seed-extension
confidence: high
tags:
  - seed-refinement
  - embodied-knowledge
  - verification
  - sensory
x-origin: Seed Stress Test - Embodied Knowledge Rule.md
x-source-gaps: refined from stress test findings
---

# Seed Refinement: Embodied Knowledge Rule Enhancements

> Refinements to the embodied knowledge rule based on stress testing across multiple domains.
> Date: 2026-04-08

## Background

The Seed includes an embodied knowledge rule (line 1345-1356) that adds `embodied-component:` frontmatter and applies modified verification rules. However, stress testing across cooking, fitness, music, woodworking, and medical domains revealed gaps in the rule's coverage.

## Refinement 1: Relax the Verification Test

**Current Test (line 1347):**
> Test: For notes tagged with `embodied-component: essential`: (1) Does the note acknowledge what sensory information is required? (2) Is there a sensory anchor or reference point? (3) Could an AI verify this without physical access?

**Problem:** The third criterion ("Could AI verify without physical access?") is too strict. By this definition, almost ALL embodied knowledge fails because the point of embodied knowledge is that it requires physical experience.

**Refinement:** Focus on acknowledgment + anchor provision, not verifiability. Replace criterion 3 with:

**Revised Test:** For notes tagged with `embodied-component: essential`:
1. Does the note acknowledge what sensory information is required?
2. Is there a sensory anchor, analogue, or reference point?
3. Does the note explain the sensory cue in recognizable terms (not just mechanical instructions)?

**Why:** The goal is to make embodied knowledge as accessible as possible through text — not to make it fully verifiable. Some embodied knowledge is inherently unverifiable but still valuable.

## Refinement 2: Add `anchoring_feasibility` Field

**Current State:** No field to distinguish anchorable from unanchorable embodied knowledge.

**Problem:** Some embodied knowledge ("mind-muscle connection", "feeling the music", "intuition") is valid but resists anchoring.

**Refinement:** Add `anchoring_feasibility` field:

```yaml
embodied-component: essential
anchoring_feasibility: high|medium|low
```

- **high:** Can provide clear sensory anchors (e.g., "dough springs back slowly")
- **medium:** Can provide approximate anchors or analogues (e.g., "like holding a bird")
- **low:** Inherently personal/universal sensations that resist anchoring (e.g., "feel the music")

When `anchoring_feasibility: low`, the note should still acknowledge the embodied component but may skip the anchor requirement.

**Test:** For embodied notes with `anchoring_feasibility: low`: (1) Does the note acknowledge it's inherently personal? (2) Does it provide what guidance is possible?

## Refinement 3: Add `collective_standard` Option

**Current State:** No distinction between individual and collective embodied knowledge.

**Problem:** Some cues ARE verifiable through social means — "everyone knows what properly risen dough feels like" is a cultural/collective standard, not an individual sensation.

**Refinement:** Add `anchoring_type` field:

```yaml
anchoring_type: individual  # personal sensation
# vs
anchoring_type: collective   # shared cultural standard
collective_standard_example: "As known by experienced bakers"
```

**Examples of collective standards:**
- "Golden brown" in baking (most bakers recognize it)
- "Properly sharpened plane iron" (woodworking community standard)
- "Clean break" in sourdough (collective standard among bread bakers)

**Test:** For embodied notes: (1) Is this a personal sensation or a collective standard? (2) If collective, can you cite the community that shares this standard?

## Refinement 4: Add `skill_level_anchors` Field

**Current State:** No support for skill-level-specific embodied cues.

**Problem:** The "feel" of proper form changes as skill develops. A beginner's "engaged core" feels different from an advanced practitioner's.

**Refinement:** Add `skill_level_anchors` field:

```yaml
skill_level_anchors:
  beginner: "Feel expansion against your waistband"
  intermediate: "Feel subtle engagement without visible torso movement"
  advanced: "Feel deep stabilization without apparent effort"
```

**Why:** Embodied knowledge is not static — it evolves with proficiency. Notes should reflect this progression.

**Test:** For embodied notes in learnable skills: (1) Do sensory cues differ by skill level? (2) If so, are skill-level anchors provided?

## Refinement 5: Add `clinical_training_required` Field

**Current State:** No distinction for professional/medical embodied knowledge.

**Problem:** Medical embodied knowledge (palpation, auscultation, percussion) has two layers: (1) basic sensation (this feels different from that), (2) clinical interpretation (this difference means X). The rule handles layer 1 but layer 2 requires professional training.

**Refinement:** Add `clinical_training_required` field:

```yaml
embodied-component: essential
clinical_training_required: true
sensory_anchor: "Localized pain when pressure applied, guarding (involuntary muscle contraction)"
reference_standard: "Compare to adjacent areas - tenderness is significantly more sensitive to pressure"
```

**Test:** For embodied notes in clinical/professional domains: (1) Does the note require training to interpret? (2) If yes, is `clinical_training_required: true` set?

## Refinement 6: Distinguish Time-Based from Embodied

**Current State:** The rule applies to all physical knowledge.

**Problem:** Some "ready" cues are time-based, not sensory — "when wood has acclimated to shop conditions" is purely time-based, not embodied.

**Refinement:** Clarify in the Seed that embodied knowledge requires physical SENSATION. Time-based readiness is different:

```yaml
# Embodied: requires sensory perception
embodied-component: essential
readiness-type: sensory  # visual, tactile, auditory, olfactory

# Time-based: requires patience, not sensation
time-based: true
acclimation-period: "72 hours"
```

**Test:** For "ready" notes: (1) Is the readiness determined by sensory cue or by time passing? (2) Is the appropriate field used?

## Updated Rule Text

Replace the current embodied knowledge rule (line 1345-1356) with:

> **Rule:** For embodied knowledge (knowledge requiring physical sensation, touch, feel, or bodily experience to fully understand), add `embodied-component:` frontmatter and apply modified verification rules. Include sensory anchors where possible; acknowledge when anchoring is inherently limited.

> **Why:** Embodied knowledge (tactile cues, kinesthetic feel, sensory judgment) cannot be verified by reading sources. The note may be "correct" in an intellectual sense but incomplete without the sensory component. Standard verification ratio treats all unverified notes equally, but embodied knowledge requires a different verification pathway — physical experience, not source checking.

> **Test:** For notes tagged with `embodied-component: essential`:
> 1. Does the note acknowledge what sensory information is required?
> 2. Is there a sensory anchor, analogue, or reference point?
> 3. Does the note explain the sensory cue in recognizable terms (not just mechanical instructions)?

> **Implementation:**
> ```yaml
> embodied-component: essential  # essential|nice-to-have|none
> verification-modality: embodied
> anchoring_feasibility: high|medium|low
> anchoring_type: individual|collective
> collective_standard_example: "As known by [community]"
> skill_level_anchors:
>   beginner: "anchor text"
>   intermediate: "anchor text"
>   advanced: "anchor text"
> clinical_training_required: true|false
> time-based: true|false  # if readiness is time, not sensory-based
> sensory-anchors: "description"
> approximation-notes: "partial conveyance via comparison"
> ```

> **Verification pathway:** For embodied notes, "verification" means (1) acknowledging the sensory component exists, (2) providing anchors/analogues that help reader recognize the cue, (3) noting whether the vault owner has personally experienced it. Do not count as "verified" through source-checking alone.

> **Edge case:** Some embodied knowledge can be approximated through analogues — "what it feels like to ride a bike" can be partially conveyed through comparison. Include `sensory-anchors:` and `approximation-notes:` to capture what's possible in text. For inherently unanchorable knowledge (`anchoring_feasibility: low`), acknowledge the limitation while preserving the note.

## Domain Testing Summary

| Domain | Key Insight | Rule Enhancement |
|--------|-------------|------------------|
| Cooking | "Golden brown" needs ingredient-specific anchors | Add domain-specific anchor guidance |
| Fitness | "Engage core" is mechanical instruction, not sensory | Require sensory, not action, description |
| Music | "Light pressure" has action + result, lacks connection | Add progression ("start near-zero, increase until X") |
| Woodworking | Some "ready" cues are time-based, not embodied | Distinguish time-based from sensory |
| Medical | Palpation requires professional interpretation | Add clinical_training_required field |

## Related Notes

- [[Seed Stress Test - Embodied Knowledge Rule]] — Original stress test
- [[AI-Assisted Knowledge Management Seed#embodied]] — Current Seed coverage
- [[Frontier Exploration - Sensory Knowledge Capture]] — Original gap exploration
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Fitness Knowledge Base]]
- [[Seed Stress Test - Woodworking Knowledge Base]]