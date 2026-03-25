---
last-reviewed: 2026-03-21
last-updated: 2026-03-21
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
tags:
  - seed-stress-test
  - embodied-knowledge
  - verification
  - sensory
---

# Seed Stress Test: Embodied Knowledge Rule

> Testing the newly added embodied knowledge rule across multiple domains.
> Date: 2026-03-21

## Rule Under Test

**Rule (NEW - 2026-03-21):** For embodied knowledge (knowledge requiring physical sensation, touch, feel, or bodily experience to fully understand), add `embodied-component:` frontmatter and apply modified verification rules.

**Why:** Embodied knowledge (tactile cues, kinesthetic feel, sensory judgment) cannot be verified by reading sources. The note may be "correct" in an intellectual sense but incomplete without the sensory component. Standard verification ratio treats all unverified notes equally, but embodied knowledge requires a different verification pathway — physical experience, not source checking.

**Test:** For notes tagged with `embodied-component: essential`: 
1. Does the note acknowledge what sensory information is required?
2. Is there a sensory anchor or reference point?
3. Could an AI verify this without physical access?

---

## Domain Testing

### 1. Cooking Domain

**Hypothesis:** Cooking has extensive embodied knowledge - "cook until golden brown", "dough passes poke test", "saute until fragrant."

**Test Case: The "Poke Test" for Bread Dough**

A note about bread dough readiness:
> "The dough is ready when it springs back slowly after being poked."

**Analysis:**
- Does it acknowledge sensory info? YES - describes "springs back slowly"
- Is there a sensory anchor? PARTIAL - describes the feel but doesn't anchor to a reference
- Can AI verify without physical access? NO - requires poking dough

**Edge Case Found:** The note describes what to feel but provides no reference point for comparison. What does "slowly" mean? A beginner has no baseline.

**Refinement Needed:** Add `sensory-anchor:` field with reference points:
```yaml
sensory-anchor: "Like pressing the fleshy part of your palm - slight resistance but leaves no dent"
approximation-notes: "If it springs back immediately, under-proofed. If it doesn't spring back, over-proofed."
```

**Edge Case: "Golden Brown"**

> "Cook until golden brown."

- Sensory info: visual (color)
- Anchor: What shade of brown? Compared to what?
- Problem: Different ingredients brown differently (bread vs. cookies vs. meat)

**Refinement:** Add ingredient-specific anchors or accept that some cues are ingredient-specific.

---

### 2. Fitness/Exercise Domain

**Hypothesis:** Fitness form cues are highly embodied - "engage core", "feel the stretch", "muscle activation."

**Test Case: "Engage Your Core"**

A note about core engagement:
> "Engage your core by drawing your belly button toward your spine."

**Analysis:**
- Does it acknowledge sensory info? YES - describes the action
- Is there a sensory anchor? WEAK - "draw toward spine" is an action, not a sensation
- Can AI verify without physical access? NO - requires feeling the engagement

**Edge Case Found:** The description is a mechanical instruction, not a sensory description. "What does engaged core feel like?" is not answered.

**Refinement Needed:**
```yaml
sensory-anchor: "Feels like tightening a corset around your midsection - a subtle inward pressure"
embodied-component: essential
alternative-cues: "You should be able to breathe normally while engaged"
```

**Edge Case: "Mind-Muscle Connection"**

> "Focus on feeling the muscle work."

This is pure embodied knowledge - there's no way to verify if someone feels their biceps working vs. using momentum.

**Test Question:** Can a note capture "mind-muscle connection"? 
- The advice is valid
- The verification is impossible without physical access
- The note acknowledges it's about "feeling" but doesn't define what that feels like

**Refinement:** This may be a case where embodied-component is essential but sensory anchors are inherently personal/universal.

---

### 3. Music Performance Domain

**Hypothesis:** Instrument technique is heavily embodied - "bow pressure", "breath support", "finger placement pressure."

**Test Case: Bow Pressure in Violin**

> "Apply light bow pressure for a warm tone."

**Analysis:**
- Sensory info: tactile (pressure) + auditory (tone quality)
- Anchor: What does "light" feel like? What does "warm" sound like?
- Can AI verify? NO - requires playing and hearing

**Edge Case Found:** The note describes both the physical action (pressure) AND the auditory result (tone), but provides no way to connect them. How does a beginner know if their pressure is correct?

**Refinement Needed:**
```yaml
sensory-anchor: "Like holding a bird - enough to feel resistance, not enough to hurt"
auditory_anchor: "A clear, resonant sound without scratchiness"
progression: "Start with almost no pressure (breathy sound), gradually increase until clear tone emerges"
```

**Edge Case: Breath Support**

> "Support your breath from your diaphragm."

This is a classic embodied cue - you can't see the diaphragm, you have to feel it working.

**Problem:** The cue requires knowing what diaphragm engagement feels like, which most beginners don't.

**Refinement:** Add beginner-accessible proxy sensations:
```yaml
sensory-anchor: "Feels like expanding your lower ribs to the sides while maintaining gentle engagement"
beginner_proxy: "Cough gently - feel the abdominal muscles engage? That's the area."
```

---

### 4. Woodworking Domain

**Hypothesis:** Woodworking has extensive material-ready cues - "when the wood is ready to joint", "plane shavings feel like X."

**Test Case: "Plane Until Shavings Curl"**

> "Continue planing until the shavings curl as they exit the plane."

**Analysis:**
- Sensory info: tactile (shaving feel) + visual (curl shape)
- Anchor: What kind of curl? How thick?
- Can AI verify? NO - requires planing and feeling

**Edge Case Found:** The description is precise (shavings curl) but doesn't explain what a "good" curl feels/looks like vs. a problem curl.

**Refinement:**
```yaml
sensory-anchor: "Shavings should feel almost silky - not scratchy, not fuzzy"
visual_anchor: "Continuous curl, like a ribbon, about as thick as a piece of paper"
problem_indicator: "If shavings are torn or fuzzy, the blade is dull or the wood is chipping"
```

**Edge Case: "The Wood is Ready"**

When has wood acclimated to shop conditions? There's no reliable sensory test - it's purely time-based.

**This is NOT embodied knowledge** - it's unknownable through senses. The rule should clarify that some knowledge is simply not determinable through physical access.

---

### 5. Medical/Clinical Domain

**Hypothesis:** Clinical skills have extensive embodied knowledge - palpation, auscultation, percussion.

**Test Case: "Palpate for Tenderness"**

> "Palpate the abdomen for tenderness."

**Analysis:**
- Sensory info: tactile (feeling for resistance, pain response)
- Anchor: What does "tenderness" feel like compared to normal?
- Can AI verify? NO - requires medical training + physical patient contact

**Edge Case Found:** Medical embodied knowledge has two layers:
1. Basic sensation (this feels different from that)
2. Clinical interpretation (this difference means X)

The rule handles layer 1 but layer 2 requires professional training.

**Refinement:**
```yaml
embodied_component: essential
sensory_anchor: "Localized pain when pressure applied, guarding (involuntary muscle contraction)"
clinical_training_required: true
reference_standard: "Compare to adjacent areas - tenderness is significantly more sensitive to pressure"
```

---

## Stress Test Questions

### 1. Does the Test work as written?

**Question:** "Could an AI verify this without physical access?"

**Problem:** This test is too strict. By this definition, almost ALL embodied knowledge would fail. The question should be:

**Refinement:** "Does the note acknowledge the sensory component AND provide SOME way for a reader to recognize the cue (anchor, analogue, comparison)?"

The current test asks for impossible verification. The rule should focus on acknowledgment + anchor provision, not verifiability.

### 2. What about inherently unverifiable knowledge?

**Question:** Some embodied knowledge cannot be anchored - "mind-muscle connection", "feeling the music", "intuition."

**Edge Case:** These are valid embodied knowledge but resist anchoring. Should they fail the rule?

**Refinement:** Add a category:
```yaml
embodied_component: essential
anchoring_feasibility: high|medium|low  # low = inherently personal, cannot be anchored
```

When anchoring_feasibility is low, the note should still acknowledge the embodied component but may skip the anchor requirement.

### 3. What about collective vs. individual embodied knowledge?

**Question:** Some cues ARE verifiable through social means - "everyone knows what properly risen dough feels like" is a cultural/collective standard.

**Edge Case:** "Golden brown" is a collective standard in baking - most bakers recognize it.

**Refinement:** Distinguish:
```yaml
anchoring_type: individual  # personal sensation
anchoring_type: collective  # shared cultural standard
collective_standard_example: "As known by experienced bakers"
```

### 4. What about progressive/learning embodied knowledge?

**Question:** Some embodied knowledge changes as skill develops. The "feel" of proper form changes as you become more proficient.

**Edge Case:** A beginner's "engaged core" feels different from an advanced practitioner's. Notes may need skill-level-specific anchors.

**Refinement:** Consider `skill_level_anchors:` for embodied notes:
```yaml
skill_level_anchors:
  beginner: "Feel the expansion against your waistband"
  intermediate: "Feel subtle engagement without visible torso movement"
  advanced: "Feel deep stabilization without apparent effort"
```

### 5. What about MULTI-SENSORY integration?

**Question:** Some knowledge requires combining multiple senses - perfect espresso needs visual + auditory + tactile + olfactory.

**Current rule:** `sensory-modes` field accepts array - this is good.

**Edge Case:** How should notes handle multi-sensory integration? Is there an expected order? Is all sensory info equally important?

**Refinement:** Add priority or integration guidance:
```yaml
sensory_integration: sequential  # one builds on another
sensory_integration: simultaneous  # all needed together
primary_sensory: visual
secondary_sensory: [auditory, tactile]
```

---

## Summary of Edge Cases

| Domain | Edge Case | Current Rule Response | Refinement Needed |
|--------|-----------|----------------------|-------------------|
| Cooking | "Golden brown" - what shade? | Partial anchor | Specify shade range, ingredient-specific anchors |
| Fitness | "Engage core" - mechanical vs. sensory | Weak anchor | Add tactile anchor ("corset feel") |
| Music | "Light bow pressure" | Has action + result, lacks connection | Add progression ("start near-zero, increase until X") |
| Woodworking | "Wood is ready" | Not embodied - time-based | Clarify rule doesn't apply |
| Medical | Palpation | Training required | Add clinical_training_required field |
| General | Unanchorable knowledge ("intuition") | Fails test | Add anchoring_feasibility: low option |
| General | Multi-sensory integration | Supported | Add integration type (sequential/simultaneous) |
| General | Skill-level dependent cues | Not addressed | Add skill_level_anchors field |

---

## Recommendations for Seed

1. **Relax the verification test** - Current test ("Could AI verify?") is impossible for embodied knowledge. Focus on acknowledgment + anchor provision.

2. **Add anchoring_feasibility field** - For inherently personal/universal sensations that resist anchoring.

3. **Add collective_standard option** - Some cues are verifiable through cultural/social means, not individual sensation.

4. **Add skill_level_anchors** - Embodied cues may differ at beginner/intermediate/advanced levels.

5. **Clarify time-based vs. embodied** - Some "ready" cues are time-based, not sensory. The rule should clarify when it applies.

6. **Add clinical_training_required** - For medical/clinical embodied knowledge that requires professional training to interpret.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Gap - Embodied Knowledge]] (merged from Frontier Exploration - Embodied and Sensory Knowledge)
- [[Frontier Gap - Embodied Knowledge]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[Seed Stress Test - Fitness Knowledge Base]]
