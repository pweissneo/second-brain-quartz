---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - experiential-knowledge
  - cross-domain
related-seed-rules:
  - Experiential Knowledge (Section 5)
  - Knowledge Activation States
  - Interpretive Knowledge
---

# Seed Stress Test: Experiential Knowledge Rule (Cross-Domain Analysis)

> Testing: The "experiential knowledge" rule across multiple domains: meditation, pottery, and clinical practice
> Domain: Multi-domain (Meditation, Crafts, Medicine)

## The Rule Under Test

**Rule:** For domains where experiential knowledge (knowledge gained through practice, feel, tacit understanding) is essential, include `experiential-component` frontmatter indicating what aspects require direct experience to fully understand.

**Why:** In domains like music composition, clinical skills, martial arts, and creative arts, the useful knowledge extends beyond what can be documented. Readers and AI agents need to know when a note represents complete theoretical knowledge vs. knowledge that requires practice to apply.

**Test:** Pick 5 notes in an experiential domain (music, clinical practice, crafts, creative arts). Can you identify which require experience to fully apply? Do they have explicit `experiential-component` markers?

---

## Domain Analysis: Three Perspectives

### 1. Meditation Practice

Meditation is an intensely internal practice. The gap between reading about meditation and actually meditating is enormous - knowing the instructions for breath awareness is trivial; actually maintaining focused attention for 20 minutes without distraction takes extensive practice.

**Categories of Experiential Knowledge:**
- **Attention Training:** Noticing when mind has wandered, maintaining subtle alertness without tension, recognizing the "edge" of sleep
- **Body Awareness:** Subtle sensations during sitting, posture quality from within, energy sensations
- **Mental States:** Recognizing dullness vs. calm, noting arising emotions before they fully form
- **Introspective Knowledge:** Self-awareness of mental processes, non-conceptual knowing

### 2. Pottery/Ceramics

Pottery is an intensely experiential craft. The gap between theoretical knowledge and practical skill is enormous - knowing that clay should be centered is trivial; actually centering clay on a wheel takes months of practice.

**Categories of Experiential Knowledge:**
- **Wheel Throwing:** Centering clay (completely tacit), opening the clay, pulling walls
- **Hand Building:** Slab rolling consistency, joinery
- **Glazing:** Application thickness, layering interactions
- **Firing:** Reading kiln atmosphere, knowing when work is fully dry

### 3. Clinical Practice

Clinical practice has multiple knowledge types that vary in documentability:

| Knowledge Type | Example | Documentable? |
|---------------|---------|----------------|
| Factual | "MI presents with chest pain" | Fully |
| Procedural | "How to perform CPR" | Fully |
| Tacit/Experiential | "Feeling for subtle organ enlargement" | Partial |
| Judgment | "When to escalate to surgery" | Partial |
| Interpersonal | "Delivering bad news to families" | Partial |

---

## Stress Test Scenarios (Consolidated)

### Scenario 1: The "Partial" Boundary Is Unclear

**From Clinical Domain:** What distinguishes `experiential-component: partial` from `experiential-component: essential`?

A note saying "auscultation involves listening to heart sounds" has:
- Documentable: The anatomy, the locations to listen, the sequence
- Experiential: What normal vs. abnormal sounds feel like

**Current rule doesn't clarify:** At what point does "partial" become "essential"?

**Proposed refinement:**
> `experiential-component: partial` — Core knowledge is documentable, but "calibration" requires experience (knowing WHAT to listen for vs. being able to HEAR it)
> 
> `experiential-component: essential` — Cannot teach through text at all; requires apprenticeship

### Scenario 2: Different Skills Within One Note

**From Clinical Domain:** A single clinical note like "Abdominal Examination" contains multiple skills with different experiential levels:
- Percussion technique — partially experiential
- Palpation — highly experiential
- Patient communication — partially experiential

**Current rule:** Single `experiential-component` value per note

**Issue:** One note may have multiple experiential levels for different aspects.

**Proposed refinement:**
> For multi-aspect notes, use array syntax: `experiential-component: [technique: partial, palpation: essential, communication: partial]`

### Scenario 3: Gradation of Experiential Knowledge

**From Pottery Domain:** The current rule has three levels but doesn't provide guidance on WHERE to draw the line:
- `experiential-component: none` - fully documentable
- `experiential-component: partial` - core is documentable, "feel" requires experience
- `experiential-component: essential` - cannot be fully captured

**Problem:** In pottery, most skills are on a spectrum. Centering clay is essential experiential. Knowing cone temperatures is documentable. But what about "opening clay" - is that partial or essential? There's no guidance for borderline cases.

### Scenario 4: Experiential Knowledge That Can Be Approximated

**From Pottery Domain:** Some experiential knowledge CAN be approximated with enough detail:
- "Apply even pressure" → too vague
- "Push with palms, not fingers, maintaining 2lb pressure" → more testable

**Problem:** The rule doesn't distinguish between experiential knowledge that IS documentable (with enough effort) vs. genuinely inexpressible knowledge.

### Scenario 5: Expertise Level Interaction

**From Clinical Domain:** "How to take a blood pressure" has different needs:
- For medical students: experiential component is HIGH (they need to practice)
- For patients: documentable (they just need to know numbers)

**Current rule:** Doesn't account for audience-dependent experiential needs.

**Proposed refinement:**
> When `experience-level` AND `experiential-component` both exist, the note serves different purposes. Consider splitting.

### Scenario 6: Cross-Cultural / Tradition-Specific Knowledge

**From Meditation Domain:** Different traditions have different tacit knowledge bases:

| Tradition | Documentable | Partially Experiential | Tacit |
|-----------|--------------|------------------------|-------|
| Zen | Koans, procedures | Sitting posture, zazen | Kensho, satori |
| Tibetan | Visualization instructions | Tongue positions, energy | Tummo experience |
| Vipassana | Technique, satipatthana | Equanimity, noting speed | Insight knowledge |

**Issue:** The Seed doesn't handle multi-tradition vaults well. Notes might need to be tagged by tradition AND have experiential markers.

### Scenario 7: Guided vs. Solo Practice

**From Meditation Domain:** 
- **Guided practice:** More can be documentable, teacher corrects mistakes in real-time
- **Solo practice:** All corrections must be self-generated, requires more experiential knowledge

The Seed doesn't distinguish these contexts.

---

## Edge Cases Discovered

### Edge Case 1: What to Write vs. What to Mark

The rule suggests tagging but doesn't address quality - a note can acknowledge experiential components but still fail to actually help the reader. The test only checks for MARKER EXISTENCE, not whether the marker is useful.

**Proposed Addition:** Notes with `experiential-component: essential` should include "canary indicators" - observable signs that tell the learner whether they're on track.

### Edge Case 2: Physical Sensation Vocabulary

**From Pottery:** Experiential knowledge relies heavily on sensory metaphors:
- "clay that feels like ear lobe"
- "walls that ring when tapped"
- "clay that pulls like taffy"

**Problem:** These sensory descriptions ARE the knowledge, but they're metaphorical. An AI could document them but wouldn't understand them without the physical experience.

### Edge Case 3: Cultural Context

**From Meditation & Pottery:** Practices emerge from specific cultural contexts:
- Buddhist traditions (Theravada, Mahayana, Vajrayana)
- Hindu traditions (Patanjali yoga, Kundalini)
- Japanese raku, Italian maiolica, American studio pottery

**Issue:** Some knowledge is culturally-bound in ways that affect practice. The Seed's "domain-agnostic" approach may miss cultural dependencies.

### Edge Case 4: Progress Subjectivity

**From Meditation Domain:** Meditation progress is deeply subjective. The Seed doesn't have clear guidance for:
- Subjective vs. objective progress markers
- How to track personal development without comparison
- Distinguishing genuine insight from imaginative construction

**Proposed Refinement:**
> For domains with subjective progress, add:
> ```yaml
> progress-markers: subjective  # vs. objective
> verification-method: self-report|teacher-assessment|no-verification-possible
> ```

---

## Proposed Seed Rule Refinements

### Refinement 1: Graduated Experiential Markers (Enhanced)

Replace single marker with graduated scale:

```yaml
experiential-component: none  # Fully documentable
experiential-component: partial  # Can describe but needs practice
experiential-component: essential  # Cannot convey in text; direct experience required
```

**With guidance field:**
```yaml
experiential-component: essential
experiential-guidance:
  - "This requires practice - expect 50+ hours to develop basic competence"
  - "Find a mentor who can provide hands-on feedback"
  - "Focus on the physical sensations described, not the written instructions"
```

### Refinement 2: Verification Method Field

```yaml
verification-method: self-report  # Practitioner assesses own progress
verification-method: teacher-assessment  # Qualified teacher verifies
verification-method: no-verification-possible  # Cannot verify through any external means
```

### Refinement 3: Multi-Aspect Support

For notes with multiple skill types:
```yaml
experiential-component:
  technique: partial
  palpation: essential
  communication: partial
```

### Refinement 4: Tradition/Lineage Tagging

```yaml
tradition: zen|buddhist|vipassana|secular
lineage: optional-specific-lineage
```

### Refinement 5: Progress Subjectivity Marker

```yaml
progress-markers: subjective  # Personal, varies by individual
progress-markers: objective  # Can be measured externally
```

### Refinement 6: Add "Canary Knowledge" Concept

Some experiential knowledge has "canary" indicators - signs that tell you whether you're on track. Notes with `experiential-component: essential` should include canary indicators where possible:
- "If the clay wobbles when you push it, it's not centered - this is your canary"
- "If the glaze looks chalky before firing, it's too thick"

### Refinement 7: Tacit-to-Explicit Spectrum

Add guidance:
- Level 1: Fully explicit (can be learned from text alone)
- Level 2: Partially tacit (text helps but practice needed)
- Level 3: Heavily tacit (text provides framework, experience fills in)
- Level 4: Purely tacit (text cannot meaningfully convey - must be shown)

---

## Test Executability Analysis

**Current Test:** "Pick 5 notes in an experiential domain... Can you identify which require experience?"

**Problems:**
1. Requires human judgment to "identify"
2. Doesn't specify WHAT about the note requires experience
3. No automated way to verify compliance

**Proposed Improved Test:**
> 1. Search vault for notes in experiential domains (tags: clinical, medical, crafts, meditation)
> 2. Check for `experiential-component` frontmatter field
> 3. Verify field value matches the note's content type
> 4. Flag notes where frontmatter is missing in experiential domains

---

## What the Rule Gets Right

1. **Three-level gradation** — `none/partial/essential` is a useful spectrum
2. **Domain-agnostic** — applies to music, clinical, crafts equally
3. **Guidance differentiation** — "try this" vs. "follow this" is actionable

---

## Conclusion

The experiential knowledge rule works conceptually but needs:

1. Graduated markers with guidance (none/partial/essential)
2. Verification method field
3. Tradition/lineage support for multi-tradition vaults
4. Multi-aspect support for notes with varied skill types
5. Progress subjectivity markers for self-reported domains
6. "Canary" indicators for essential-experiential notes
7. Explicit acknowledgment that some knowledge genuinely CANNOT be documented

These three domains (meditation, pottery, clinical practice) all reveal that some knowledge genuinely CANNOT be documented - not just "hard to document" but actually inexpressible in text. The Seed should acknowledge this ceiling explicitly.

---

**Test Run Date:** 2026-03-14
**Domains:** Meditation, Pottery, Clinical Practice
**Rule Tested:** Experiential Knowledge Component
**Outcome:** Needs refinement - see proposed refinements above

## Related Notes

- [[Frontier Gap - Embodied Knowledge]] — methodology for extracting tacit knowledge
- [[Frontier Gap - Embodied Knowledge]]
- [[Seed Stress Test - Self-Contained Notes in Photography]] — partial overlap with subjective expertise
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[Seed Stress Test - Woodworking Knowledge Base]] — testing Seed rules in another craft domain
- [[Seed Stress Test - Craft Knowledge Bases]] — another experiential domain
- [[AI-Assisted Knowledge Management Seed]] — the rule being tested
