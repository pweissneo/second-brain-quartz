---
last-reviewed: 2026-03-27
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - music-composition
  - linking
---

# Seed Stress Test: Every Link Must Be Explainable in Music Composition

> Testing the "Every link must be explainable" rule against music composition knowledge reveals unique challenges around structural relationships, temporal composition, and harmonic dependencies.

## Seed Rule Being Tested

**Rule:** Every link must be explainable in one sentence — no decorative or keyword-match links.
**Why:** Meaningless links inflate the graph without adding navigational or conceptual value.
**Test:** For each link in a note, can you state why the reader should follow it? Remove any link where you cannot.

## Application to Music Composition Knowledge Base

### The Challenge

Music composition knowledge involves:
- Harmonic relationships (chord progressions, functional harmony)
- Structural relationships (form, sections, transitions)
- Temporal relationships (melodic development, motif tracking)
- Instrumental relationships (orchestration, timbre)
- Theoretical dependencies (counterpoint, voice leading)

These relationships are fundamentally different from typical knowledge links because:
1. They often represent implicit knowledge that musicians understand intuitively
2. They can be structural (X is part of Y) or generative (X leads to Y)
3. They may not be "explainable" in one sentence without oversimplifying

### Edge Cases Found

#### Edge Case 1: Harmonic Functional Relationships

**Problem:** Note discusses "tonic resolution" and links to [[dominant seventh chord]], [[half-step resolution]], [[functional harmony]].

Is each link explainable?
- "A dominant seventh chord creates tension that resolves to tonic" ✓
- "Half-step resolution is how the leading tone resolves up to the tonic" ✓
- "Functional harmony explains why chords have specific roles in progressions" ✓

All explainable. But what about: Note discusses "secondary dominants" and links to [[secondary dominants]]

This is circular — the link goes to itself essentially.

**Verdict:** Harmonic relationships ARE explainable but require understanding of functional harmony. The test needs to account for prerequisite knowledge.

#### Edge Case 2: Structural Links in Form

**Problem:** Note: "The exposition introduces the [[primary theme]], [[secondary theme]], and closing material."

Three links in one sentence. Explainable?
- "Primary theme is the main melodic idea" ✓
- "Secondary theme provides contrast in key/character" ✓
- "Closing material wraps up the section" ✓

All explainable — but this is a structural description, not a learning path.

**Distinction:** In music form notes, links often describe what IS part of the form, not what you learn from following. The test may need to distinguish:
- **Constitutive links** — "X is part of Y" (structural description)
- **Learning links** — "Understanding X helps you understand Y" (conceptual connection)

#### Edge Case 3: Temporal/Developmental Links

**Problem:** Note: "The [[melodic motif]] from measure 1 [[develops]] throughout the movement."

Two types of links:
- "melodic motif" — concept link ✓
- "develops" — this is a relationship type, not a note to follow

**Issue:** In music, relationships like "develops," "transforms," "recurs," "varies" are essential but don't map cleanly to "follow this link to learn."

**Proposed refinement:** Add a link type category for developmental relationships:
```yaml
link-type: constitutive|learning|developmental|reference
```

#### Edge Case 4: Instrumentation and Timbre Links

**Problem:** Note: "The [[French horn]] carries the melody in this section, while [[string section]] provides accompaniment."

Links to instruments. Explainable?
- "French horn is a brass instrument with warm, mellow tone" ✓
- "String section includes violin, viola, cello, bass" ✓

Both explainable — but they're basic reference links, not conceptual learning.

**Issue:** Music often references instruments/timbres as given — the reader is expected to know what a French horn sounds like. These links may be decorative in a composer's knowledge base.

**Test:** Should composers include links to instrument notes? Only if the note discusses the instrument's role specifically, not as assumed knowledge.

#### Edge Case 5: Analytical Notation Links

**Problem:** Note: "The chord progression follows [[I-vi-IV-V]] in G major."

This is notation, not a link to a note. If formatted as [[I-vi-IV-V]], is it explainable?

This is a pattern reference, not a concept. It's more like a tag or category.

**Verdict:** Harmonic shorthand (I-vi-IV-V) should NOT be a wikilink unless it links to a specific note explaining that progression pattern. It functions like a tag.

#### Edge Case 6: Stylistic Reference Links

**Problem:** Note discusses "impressionist harmony" and links to [[impressionism]], [[Debussy]], [[whole-tone scale]].

Which are explainable?
- "Impressionism was a 19th-century artistic movement" ✓
- "Debussy is a composer associated with impressionist style" ✓
- "Whole-tone scale is a scale used in impressionist music" ✓

All explainable. But note: Linking to Debussy when discussing impressionism may be too indirect. The link should go to a note about "Impressionist Music Characteristics" rather than to a specific composer.

**Edge case:** For very specialized knowledge bases (e.g., "Ravel orchestration"), linking to specific composers may be appropriate since that's the expected depth.

### What Works ✓

1. **Concept-to-principle links:** "This passage uses [[parallel fifths]]" — explains the technique
2. **Form-to-section links:** "The development section [[develops]] the primary theme" — explains structure
3. **Technique-to-example links:** "[[Sequence]] creates momentum as shown in [[Mozart Sonata]]"
4. **Instrument-to-role links:** "The [[oboe]] plays the solo melody" — explains specific role

### What Breaks ✗

1. **Notation-as-link:** [[I-vi-IV-V]] — shorthand, not a learnable concept
2. **Assumed knowledge:** [[French horn]] in a composer's vault — too basic
3. **Circular links:** [[functional harmony]] linked from a note about functional harmony
4. **Over-linking:** Note with 10+ links to every mentioned concept
5. **Stylistic without principle:** [[Debussy]] linked without [[impressionist-technique]]

### Refined Test for Music Composition

```
For each link in a music note:
1. Does the link go to a SPECIFIC concept/technique/structure? (not "music" or "composer")
2. Can you state what compositional principle the reader learns?
3. Is this constitutive (describes structure) OR learning (teaches concept)?
   - Constitutive: acceptable but distinguish from learning links
4. Is this basic assumed knowledge (instrument names, basic terms) OR specialized?
   - Basic: likely decorative in a composer's knowledge base
5. Does this link require prerequisite knowledge to be meaningful?
   - If yes, the target note should be linked from prerequisites first
```

### New Link Type Taxonomy for Music

```yaml
link-type: learning|constitutive|developmental|reference|notation
# learning: teaches a concept (primary use)
# constitutive: describes what is part of a structure
# developmental: describes transformation/evolution
# reference: basic assumed knowledge (instruments, terms)
# notation: harmonic/melodic shorthand patterns
```

### Recommendation

The Seed rule should clarify:

1. **Distinguish link purposes** — constitutive vs. learning vs. reference
2. **Allow constitutive links** — form descriptions are valid but should be marked
3. **Treat assumed knowledge as decorative** — basic instrument names, notation basics
4. **Notation shorthand is not a link** — I-vi-IV-V should be a tag, not a wikilink
5. **Developmental relationships need new category** — "develops," "transforms," "variations"

### Test for AI Agents

```
Given a link in a music composition note:
1. Is this basic assumed knowledge (instrument, basic term)?
   - If yes: likely decorative, remove
2. Is this notation shorthand (chord symbols, scale degrees)?
   - If yes: convert to tag, not link
3. Is this constitutive (describes structure) or learning (teaches)?
   - If constitutive: mark with link-type: constitutive
4. Can you state what compositional principle the reader learns?
   - If no: remove or improve the link
5. Does this require prerequisites?
   - If yes: ensure prerequisites are accessible from this note
```

## Related

- [[Linking Principle]]
- [[Seed Stress Test - Music Performance Knowledge Base]]
- [[Seed Stress Test - Construction Phase Model in Music Composition]]
- [[Seed Stress Test - Compound Context Rule in Cooking]] — similar structure testing
- [[Domain-Specific Knowledge Bases]]
- [[Frontier Exploration - Musical Arrangement Knowledge]]