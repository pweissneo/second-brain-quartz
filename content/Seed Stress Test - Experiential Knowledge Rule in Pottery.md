---
confidence: emerging
last-reviewed: 2026-03-13
lifecycle: active
author-type: ai-assisted
tags:
  - seed-stress-test
  - pottery
  - experiential-knowledge
related-seed-rules:
  - Experiential Knowledge (Section 5)
---

# Seed Stress Test: Experiential Knowledge Rule in Pottery

> Testing: The "experiential knowledge" rule in the domain of pottery/ceramics
> Domain: Pottery and Ceramic Arts

## The Rule Under Test

**Rule:** For domains where experiential knowledge (knowledge gained through practice, feel, tacit understanding) is essential, include `experiential-component` frontmatter indicating what aspects require direct experience to fully understand.

**Why:** In domains like music composition, clinical skills, martial arts, and creative arts, the useful knowledge extends beyond what can be documented. Readers and AI agents need to know when a note represents complete theoretical knowledge vs. knowledge that requires practice to apply.

**Test:** Pick 5 notes in an experiential domain (music, clinical practice, crafts, creative arts). Can you identify which require experience to fully apply? Do they have explicit `experiential-component` markers?

## Domain Analysis: Pottery/Ceramics

Pottery is an intensely experiential craft. The gap between theoretical knowledge and practical skill is enormous - knowing that clay should be centered is trivial; actually centering clay on a wheel takes months of practice.

### Categories of Experiential Knowledge in Pottery

1. **Wheel Throwing**
   - Centering clay (completely tacit - "you feel when it's centered")
   - Opening the clay (pressure sensing)
   - Pulling walls (consistency of pressure, speed)
   - Controlling moisture levels

2. **Hand Building**
   - Slab rolling consistency
   - Joinery (slip and score - knowing when it's ready)
   - Coil building structural integrity

3. **Glazing**
   - Application thickness (too thick runs, too thin crawls)
   - Layering interactions (what works together)
   - Kiln firing effects (glaze behaves differently at different temperatures)

4. **Firing**
   - Reading kiln atmosphere (oxidation vs reduction reading)
   - Knowing when work is fully dry
   - Stack loading for even heat distribution

## Stress Test Scenarios

### Scenario 1: Centering Clay on the Wheel

**Theoretical knowledge (easy to document):**
- "Center the clay by applying steady downward pressure while rotating"
- "Work from the bottom up"

**Experiential knowledge (hard to document):**
- "The clay feels different when centered - there's a subtle vibration change"
- "You know it's centered when you can push it an inch in any direction without it wobbling"
- "If your arms are tired, the clay will be off-center"

**Test:** Can the current Seed rules capture this distinction?
- The rule says to include `experiential-component` frontmatter
- But the note would need to distinguish what IS documentable vs what ISN'T

**Gap Found:** The Seed rule doesn't provide guidance on HOW to document experiential knowledge - just that it should be marked. In pottery, you can describe the theory but the "feel" is genuinely inexpressible.

### Scenario 2: Glaze Application Thickness

**Theoretical knowledge:**
- "Apply glaze to leather-hard or bone-dry bisqueware"
- "3 coats recommended"

**Experiential knowledge:**
- "You know it's right when it looks matte after application but will be glossy when fired"
- "If it drips heavily, it's too thick - it will run in the kiln"
- "Different clays absorb differently - test on scrap first"

**Gap Found:** The rule suggests tagging but doesn't address the quality issue - a note can acknowledge experiential components but still fail to actually help the reader. The test only checks for MARKER EXISTENCE, not whether the marker is useful.

### Scenario 3: Kiln Firing Knowledge

**Theoretical knowledge:**
- "Cone 6 firing reaches approximately 2232°F (1222°C)"
- "Oxidation firing has full oxygen; reduction limits oxygen"

**Experiential knowledge:**
- "You can tell the kiln is approaching temperature by the color through the peepholes"
- "A kiln shut down too quickly will crack pieces from thermal shock"
- "The kiln sounds different when it's nearly done"

**Gap Found:** There's no guidance on what LEVEL of experiential component should be tagged. Is "knowing when to open the kiln" essential, partial, or none?

## Edge Cases Discovered

### Edge Case 1: Gradation of Experiential Knowledge

The current rule has three levels:
- `experiential-component: none` - fully documentable
- `experiential-component: partial` - core is documentable, "feel" requires experience
- `experiential-component: essential` - cannot be fully captured

**Problem:** In pottery, most skills are on a spectrum. Centering clay is essential experiential. Knowing cone temperatures is documentable. But what about "opening clay" - is that partial or essential? There's no guidance for borderline cases.

### Edge Case 2: Experiential Knowledge That Can Be Approximated

Some experiential knowledge CAN be approximated with enough detail:
- "Apply even pressure" → too vague
- "Push with palms, not fingers, maintaining 2lb pressure" → more testable

**Problem:** The rule doesn't distinguish between experiential knowledge that IS documentable (with enough effort) vs. genuinely inexpressible knowledge. Pottery has both.

### Edge Case 3: Culture-Specific Experiential Knowledge

Different pottery traditions (Japanese raku, Italian maiolica, American studio pottery) have different tacit knowledge bases. What feels "right" in one tradition may be wrong in another.

**Problem:** The rule doesn't address whether experiential markers should be scoped to tradition/style.

### Edge Case 4: Physical Sensation Vocabulary

Experiential knowledge in pottery relies heavily on physical sensation descriptions:
- "clay that feels like ear lobe"
- "walls that ring when tapped"
- "clay that pulls like taffy"

**Problem:** These sensory descriptions ARE the knowledge, but they're metaphorical. An AI could document them but wouldn't understand them without the physical experience.

## Test Execution Results

I created test notes to see if the current rules handle pottery knowledge:

### Test Note 1: Wheel Throwing Basics
```
---
experiential-component: essential
---

# Wheel Throwing Basics

Centering is the first skill to master on the potter's wheel. Apply downward pressure with steady, even force while the wheel rotates.

[FAILS: Acknowledges experiential but doesn't help reader actually center]
```

### Test Note 2: Glaze Thickness Guide
```
---
experiential-component: partial
---

# Glaze Application

Apply 3 coats of glaze. The coat should look matte when wet but will fire glossy.

[PARTIAL: Provides vague "3 coats" but doesn't explain how to judge]
```

### Test Note 3: Kiln Temperature Reading
```
---
experiential-component: partial
---

# Reading Kiln Temperature

Watch the peepholes. The color indicates temperature - orange means approaching cone 6.

[BETTER: Provides visual cue, but still requires experience to interpret "orange"]
```

## Recommendations for Seed Improvement

### Recommendation 1: Add Experiential Depth Levels

Extend the rule to include depth guidance:
```yaml
experiential-component: essential
experiential-guidance: # What to tell the reader instead
  - "This requires practice - expect 50+ hours to develop basic competence"
  - "Find a mentor who can provide hands-on feedback"
  - "Focus on the physical sensations described, not the written instructions"
```

### Recommendation 2: Add "Canary Knowledge" Concept

Some experiential knowledge has "canary" indicators - signs that tell you whether you're on track:
- "If the clay wobbles when you push it, it's not centered - this is your canary"
- "If the glaze looks chalky before firing, it's too thick"

**Seed addition:** Notes with `experiential-component: essential` should include canary indicators where possible.

### Recommendation 3: Address Tacit-to-Explicit Spectrum

Add guidance:
- Level 1: Fully explicit (can be learned from text alone)
- Level 2: Partially tacit (text helps but practice needed)
- Level 3: Heavily tacit (text provides framework, experience fills in)
- Level 4: Purely tacit (text cannot meaningfully convey - must be shown)

### Recommendation 4: Cross-Reference with Tacit Knowledge Capture

The existing "Tacit Knowledge Capture" note should be linked from experiential-component notes to provide methodology for extracting tacit knowledge.

## Conclusion

The experiential knowledge rule in the Seed is a good start but lacks:
1. **Guidance on what to write** - it says mark experiential knowledge but doesn't say HOW to make marked notes useful
2. **Boundary guidance** - no help deciding between partial/essential for borderline cases
3. **Depth indicators** - no way to communicate how much practice is needed
4. **Canary concepts** - no guidance on providing observable indicators

Pottery exposes these gaps clearly because it's a heavily experiential craft where the gap between "knowing the theory" and "being able to do it" is enormous.

---
*Test Date: 2026-03-13*
*Domain: Pottery/Ceramics*
*Rule Tested: Experiential Knowledge Capture*

## Related Notes

- [[Frontier Exploration - Tacit Knowledge Capture]] — methodology for extracting tacit knowledge
- [[Seed Stress Test - Experiential Knowledge in Clinical Practice]] — testing experiential rule in medical domain
- [[Seed Stress Test - Woodworking Knowledge Base]] — testing Seed rules in another craft domain
- [[AI-Assisted Knowledge Management Seed]] — the rule being tested
