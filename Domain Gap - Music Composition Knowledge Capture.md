---
last-reviewed: 2026-03-14
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - domain-gap
  - music-composition
  - tacit-knowledge
  - knowledge-type
---

# Domain Gap: Music Composition Knowledge Capture

## The Challenge

An AI building a music composition knowledge base using only current Seed rules would encounter situations where the rules are insufficient or silent.

## Identified Gaps

### 1. Tacit Aural Knowledge

Music composition relies heavily on **ear training** — the ability to hear intervals, chords, progressions, and harmonies. This is fundamentally tacit knowledge:

- Cannot be fully captured in text
- Requires practice and feedback to develop
- Experts "just know" when something sounds right/wrong but cannot always articulate why

**Current Seed coverage:** The Seed has rules about `experiential-component` and `knowledge-type: embodied`, but lacks guidance for domains where aural skills are prerequisite knowledge.

**Gap:** No guidance on how to handle knowledge that requires aural prerequisite skills that aren't textually capturable.

### 2. Canonical Compositional Forms

Music has established structural forms that practitioners expect:

- Sonata Allegro form
- Rondo form  
- Theme and Variations
- Binary/Ternary forms
- 12-bar blues progression

**Current Seed coverage:** None specifically for "canonical forms."

**Gap:** No rule for how to capture domain-specific structural templates that are widely recognized by practitioners but may not be obvious to outsiders.

### 3. Emotional/Affective Dimensions

Music communicates emotion through:

- Key characteristics (C major = bright, A minor = sad)
- Chord qualities (major = happy, minor = melancholic, diminished = tense)
- Interval qualities (perfect fifth = stable, tritone = unstable)
- Tempo and dynamics

**Current Seed coverage:** Rules about subjective knowledge exist, but music's emotional dimensions are distinct — they're not just "subjective opinion" but rather **culturally-shared affective responses** that are relatively consistent across practitioners.

**Gap:** No guidance for capturing knowledge about shared emotional/affective responses in a domain.

### 4. Notation System Expectations

Musicians expect specific notation systems:

- Chord symbols (C, Dm7, G9)
- Standard notation (treble/bass clef)
- Lead sheets
- Chord charts
- Tab notation (for fretted instruments)

**Current Seed coverage:** Rule about notation complexity (`notation-fluency-required`), but no guidance on when to use which notation system or how to handle practitioners' notation expectations.

**Gap:** No rule for capturing domain-specific notation conventions and when each is appropriate.

### 5. Temporal-Spatial Knowledge (Partial Coverage)

The Seed DOES have a rule for "temporal-spatial knowledge" (Rule: "For temporal-spatial knowledge (music, dance, chess), capture both temporal relationships..."), but it's buried in a long list and may be easy to miss.

**Gap:** This is actually covered but could be more prominent for music-specific applications.

## Proposed Seed Rules

### Rule: Capture Domain-Specific Tacit Prerequisites

**Rule:** For domains where practical skill depends on tacit prerequisite abilities (ear training in music, visual diagnosis in medicine, feel in sports), explicitly tag these as `prerequisite-type: tacit` and document what the tacit skill involves.

**Why:** AI agents need to know when knowledge cannot be fully captured in text and must be supplemented with practice, feedback, or multimedia.

**Test:** For a domain with known tacit prerequisites: (1) Does the vault acknowledge which skills are tacit? (2) Are there proxies or training guidance for developing tacit skills? (3) Is there explicit acknowledgment of what cannot be learned from text alone?

### Rule: Capture Canonical Domain Structures

**Rule:** For domains with established structural templates (forms, frameworks, standard architectures), create canonical structure notes that define the template and link to examples.

**Why:** Practitioners expect to find canonical structures; AI agents need to know what "standard" looks like in the domain.

**Test:** In a domain with canonical structures: (1) Can you identify the standard forms/frameworks? (2) Are there notes defining each canonical structure? (3) Do example notes link to their structural template?

### Rule: Handle Shared Affective Responses

**Rule:** For domains where emotional/affective responses are relatively consistent across practitioners (music, art, design), capture these as `interpretive-type: shared-affect` with consensus levels.

**Why:** Unlike purely subjective opinion, shared affective responses represent transferable knowledge about how humans respond to stimuli. Distinguishing "personal opinion" from "commonly felt response" matters for usability.

**Test:** For notes containing emotional/affective claims: (1) Is there a distinction between personal taste and shared response? (2) Is `consensus:` tagged for affective claims? (3) Can users distinguish "I prefer this" from "this is generally perceived as X"?

## Related Notes

- [[Frontier Gap - Embodied Knowledge]] - existing note on tacit knowledge
- [[Tacit Knowledge]] - Seed section
- [[Experiential Knowledge]] - related concept
- [[Notation Systems]] - partial coverage
