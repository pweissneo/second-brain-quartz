---
last-reviewed: 2026-03-13
tags:
  - stress-test
  - atomicity
  - astronomy
  - astrophotography
confidence: high
lifecycle: evergreen
level: stress-test
author-type: ai-assisted
---

# Stress Test: Atomicity Rule in Astronomy Knowledge Base

> Domain: Astronomy/Astrophotography
> Rule tested: Every note must contain exactly one idea, summarizable in one sentence.
> Seed source: AI-Assisted Knowledge Management Seed.md, Atomicity section

## The Challenge

Astronomy presents unique atomicity challenges:
1. **Procedural content is inherently multi-step** — imaging sequences, equipment setup
2. **Celestial objects have multiple classification schemes** — by type, location, brightness
3. **Technical equipment knowledge is interconnected** — cameras, telescopes, mounts form systems
4. **Observational knowledge is experiential** — harder to atomize than textbook concepts

## Test Cases

### Case 1: Deep Sky Object Notes

**Problem:** A note about "The Orion Nebula" could contain:
- What it is (emission nebula)
- Where it is (constellation, coordinates)
- How to observe it (best time, equipment)
- How to photograph it (exposure settings)
- Historical discovery
- Scientific significance

**Atomicity test:** Can this be summarized in one sentence?

✅ **Pass:** Split into:
- [[M42 Overview]] — "M42 (Orion Nebula) is a diffuse emission nebula in Orion, visible to naked eye, primary target for beginner astrophotographers."
- [[M42 Observation Guide]] — "M42 is best observed in winter months from northern latitudes with 10x50 binoculars or larger."
- [[M42 Photography Settings]] — "M42 photography typically requires 30-60 second exposures at ISO 3200 with a modified DSLR."

**Analysis:** The Seed's procedural content edge case applies here — observation and photography guides may exceed 300 words legitimately. The test is whether each note serves a distinct purpose (reference vs. procedural).

### Case 2: Equipment Knowledge

**Problem:** " equatorial mount" knowledge includes:
- What it does (tracks celestial objects)
- Types (German equatorial, fork, alt-az converted)
- How to polar align
- Common errors
- Calibration procedures

**Atomicity test:** Is this one idea or multiple?

✅ **Pass:** Split into:
- [[Equatorial Mount Principles]] — "An equatorial mount tracks celestial objects by aligning one axis with Earth's rotation axis."
- [[German Equatorial Mount Design]] — "A German equatorial mount uses a counterweight system to provide stable tracking for long-exposure photography."
- [[Polar Alignment Procedures]] — "Polar alignment involves centering Polaris in the equatorial mount's polar scope to within 0.5° accuracy."

**Analysis:** Technical equipment descriptions can be atomic if each note focuses on one aspect (principle, design, procedure).

### Case 3: Constellation Knowledge

**Problem:** "Orion" contains:
- Location in sky
- Named stars
- Notable deep sky objects
- Mythology
- Best viewing season

**Atomicity test:** Is this one idea or a hub?

✅ **Pass:** Use hub + spoke:
- [[Orion Constellation Hub]] — "Orion, the hunter, is a prominent northern hemisphere constellation containing two of the brightest stars (Betelgeuse, Rigel) and the Great Nebula."
- [[Orion Named Stars]]
- [[Orion Deep Sky Objects]]
- [[Orion Mythology]]

**Analysis:** Constellations are naturally hub-type notes. The hub can exceed 300 words if it's purely navigational.

### Case 4: Astrophotography Processing Workflow

**Problem:** "Image Processing Pipeline" includes:
- Calibration (darks, flats, biases)
- Stacking
- Histogram stretching
- Color correction
- Noise reduction

**Atomicity test:** This is a procedure — should it be one note or split?

⚠️ **Edge Case — Keep Together:**
- The workflow is sequential — you MUST do calibration before stacking
- Users need to follow it linearly
- Parts are NOT independently reusable
- This exceeds 1000 words legitimately

**Analysis:** Seed's procedural edge case applies strongly here. The test: (1) Does user need to execute linearly? YES. (2) Would splitting make it harder to use? YES. (3) Are parts independently reusable? NO. Keep together.

### Case 5: Stellar Classification

**Problem:** "Stellar Classification" includes:
- Spectral types (OBAFGKM)
- Luminosity classes
- H-R diagram
- Temperature relationships

**Atomicity test:** Is this one coherent topic?

✅ **Pass:** Single note is appropriate because:
- It's one coherent scientific framework
- All parts reference each other
- Understanding requires seeing the whole system
- Summary: "Stars are classified by spectral type (O-M) indicating temperature and color, and luminosity class (I-V) indicating size, together determining position on the H-R diagram."

## Edge Cases Discovered

### Edge Case A: Equipment-Specific Procedures

Some procedures ONLY apply to specific equipment. Example: "NINA/APT imaging workflow" — only applies to those specific software.

**Question:** Should this be separate from "Deep Sky Imaging Workflow"?

**Answer:** Yes — different software, different UI, different specific steps. Atomicity is about IDEA, not about generalization. The general principle is "imaging workflow" (keep separate); the specific implementation is "NINA workflow" (atomic to that specific tool).

### Edge Case B: Object-Specific vs. General Knowledge

"Photographing the Moon" vs. "Moon Phases for Photography"

**Question:** Are these the same idea?

**Answer:** NO — they're different:
- [[Lunar Photography]] — general techniques for photographing the Moon
- [[Moon Phase Calendar]] — when each phase occurs and best targets

### Edge Case C: Temporal Knowledge

"Best times to observe planets in 2026" — this changes yearly.

**Atomicity test:** Does the Seed cover temporal knowledge?

**Finding:** Seed has "Handling Temporal Knowledge" note but no specific atomicity guidance. Recommend: 
- Add year-specific notes as time-boxed (lifecycle: transient)
- Link to general principles note
- Mark with `valid-until:` frontmatter

## Rule Refinement

The atomicity rule works for astronomy, but needs this clarification:

**Add to Seed:** For rapidly-changing factual knowledge (ephemeris data, yearly events, equipment models), use time-boxing with `valid-until:` frontmatter rather than trying to atomize into "permanent" vs "temporary" notes.

**Test modification:** For astronomy-type temporal knowledge:
1. Is this knowledge year-specific? → Add `valid-until: YYYY`
2. Does it link to a general principle note? → Ensures permanence
3. Is the time scope stated in the note? → Clear expiration

## Conclusion

| Test | Result |
|------|--------|
| Rule makes sense for astronomy? | ✅ Yes |
| Test is executable by AI? | ✅ Yes |
| Edge cases found? | ✅ Yes (procedural, temporal, equipment-specific) |
| Rule needs refinement? | ⚠️ Minor — add temporal guidance |

The atomicity rule is robust for astronomy. The main challenge is recognizing when procedural content legitimately exceeds 300 words (imaging workflows, equipment tutorials) vs. when multi-idea bloat should be split.

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules being tested
- [[Atomic Note Principle]] — The rule being stress tested
- [[Stress Test - Atomicity Rule Across Domains]] — Related stress test
