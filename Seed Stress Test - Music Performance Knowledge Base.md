---
last-reviewed: 2026-03-24
last-updated: 2026-03-24
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - music
  - performance
  - domain-specific
---

# Seed Stress Test - Music Performance Knowledge Base

> Testing Seed rules against a knowledge base for instrumental/vocal music performance.
> Related: [[Frontier Exploration - Music Knowledge Type Distinctions]], [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]], [[AI-Assisted Knowledge Management Seed]]

## Domain Context

Music performance knowledge includes:
- Instrument technique (classical guitar, piano, violin, voice, etc.)
- Practice methodologies
- Performance preparation and stage presence
- Music interpretation
- Physical/human factors (posture, ergonomics, injury prevention)

This is distinct from music composition (creating music) and music theory (understanding concepts).

---

## Stress Test Results

### Rule: Every vault must have a root note

**Does this rule make sense for music performance?** Yes.

- A music performance vault needs a clear purpose (e.g., "Improve my classical guitar technique and performance skills")
- Without purpose, notes drift into composition, theory, or general music appreciation

**Is the rule's Test executable?**

- Test: "Does `_root.md` exist and state purpose in one sentence?"
- For music performance: Could state "Document practice routines, technique development, and performance preparation for [instrument]"
- Executable: Yes

**Edge cases:**

- Multiple instruments: Each could have its own root or share one with subscope
- Amateur vs professional: Purpose differs significantly
- Genre-specific: Jazz vs classical have different focus areas

### Rule: Establish 3 foundational convention notes

**Does this rule make sense?** Yes.

- Conventions for practice documentation
- Conventions for technique notes
- Conventions for performance reflection

**Test executable?** Yes.

- Check for convention notes exist
- Check recent notes reference them

### Rule: Distinguish conceptual notes from procedural content

**Does this rule make sense?** Yes, with modification.

- Practice routines (procedures) must stay together
- Technique concepts (how muscles work) are conceptual
- But: Performance has strong embodied knowledge component

**Edge case - Embodied knowledge in music performance:**

- "How to hold the bow" is procedural but requires embodied understanding
- Finger placement on instrument requires tactile knowledge
- Tempo feel and groove require embodied knowledge

The atomicity rule needs modification: Music performance notes often contain BOTH conceptual AND procedural content that cannot be separated without losing essential context.

### Rule: Use diminishing returns test

**Does this rule make sense?** Yes.

- Music technique notes can accumulate without adding value
- Many "tips" exist online that are redundant

**Test executable?** Partially.

- Utility: Harder to measure in music (improvement is subjective)
- Connection: Works well (technique connects to repertoire)
- Uniqueness: "This exercise for X" may be duplicative
- Effort: Maintenance is low for most music notes

**Edge case - Experiential domain:**

- Music practice knowledge requires execution to verify utility
- A technique note may "look" redundant but feel different in practice
- Apply modified test (see experiential domain edge case)

### Rule: Track verification ratio

**Does this rule make sense?** Yes.

- Performance knowledge should be verified through actual practice
- Source verification insufficient for embodied knowledge

**Test executable?** Yes, but verification pathway differs:

- `verification-status: verified` should mean "tested in practice"
- Source checking (videos, teachers) is insufficient

**Edge case - Long-horizon verification:**

- Some technique improvements take months/years to verify
- Long-horizon verification rules apply (see Seed)

### Rule: 5:1 personal-to-general ratio

**Does this rule make sense?** Yes.

- General: Music theory facts, standard technique descriptions
- Personal: YOUR practice routine, YOUR interpretation insights

**Modified test for music:**

- Personal includes: Your specific practice modifications, your performance experiences, your injury/pain experiences
- General acceptable when: Frequently referenced (scales patterns, standard notation)

**Edge case - Embodied knowledge exemption:**

- Tacit knowledge about feel, timing, tone quality counts as personal even when not framed as explicit decisions

### Rule: Verification workflow for practice-required knowledge

**Does this rule make sense?** Yes, highly relevant.

- Music performance is practice-required
- Verification means actual practice, not just reading

**Implementation:**

- `verification-modality: practice-required`
- `practice-status: not-attempted | in-progress | successful | failed`
- Expected verification window: 30-90 days depending on skill complexity

### Rule: Handle embodied knowledge

**Does this rule make sense?** Yes - CRITICAL for music performance.

- Instrument technique is heavily embodied
- "Feel" of correct posture, hand position, bowing

**Implementation:**

- Add `embodied-component: essential` to technique notes
- Include sensory anchors ("like pressing a ripe avocado")
- Note if personally experienced or learned from teacher

### Rule: Note lifecycle management

**Does this rule make sense?** Yes.

- Technique notes evolve as skill develops
- repertoire notes change as pieces are learned

**Modification:**

- Lifecycle stages work well: draft → active → evergreen → archived
- Add "performance-ready" as subset of active

---

## Gap Findings

1. **Practice routine templates:** No Seed rule for structuring practice session knowledge (warm-up, main, cool-down segments)

2. **Injury prevention:** No guidance for capturing pain/discomfort and remedy knowledge (high-stakes for instrumentalists)

3. **Performance psychology:** How to capture mental preparation, stage fright management

4. **Repertoire lifecycle:** Notes about specific pieces go from "learning" to "maintaining" to "performing"

5. **Teacher/external guidance:** How to capture lessons from teachers (oral tradition in music)

---

## Recommendations

1. Add Seed rule for practice routine structure
2. Add Seed rule for injury/health tracking in physical skill domains
3. Add Seed rule for performance psychology knowledge
4. Add Seed rule for repertoire lifecycle management
5. Confirm embodied knowledge rule is prominently applied for music performance notes

---

## Conclusion

The Seed works well for music performance with appropriate edge cases for:
- Experiential verification
- Embodied knowledge
- Long-horizon skill development
- Physical health factors

The main gap is specialized rules for practice structure, injury prevention, and performance psychology.
