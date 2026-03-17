---
last-reviewed: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-improvement
  - music-composition
  - gap-analysis
---

# Seed Gap: Music Composition Knowledge Bases

> Identifying what the Seed is missing for building a knowledge base about music composition.

## Domain: Music Composition

Music composition is a knowledge domain that combines sequential knowledge (the order of musical events), iterative-evaluative knowledge (does this melody "work"?), and highly experiential knowledge (the "feel" of a passage).

## What the Seed Covers

The Seed handles:
- Sequential knowledge (temporal-type: sequential)
- Iterative-evaluative knowledge (process-type: iterative)
- Cyclic-branching knowledge (verse/chorus structure)
- Notation knowledge (notation-fluency-required)
- Experiential knowledge (experiential-component)

## What's Missing

### Gap 1: Musical Motif Tracking

The Seed has no specific guidance on tracking musical motifs (recurring melodic/rhythmic ideas) across a composition.

**Rule:** For compositions with motif development, capture motif identity and transformation as metadata.

**Why:** Motifs are fundamental compositional elements that recur and transform; without explicit tracking, the structural logic of a composition is lost.

**Test:** Can you identify all instances of a motif across a composition and their transformations?

### Gap 2: Harmonic Progression Representation

The Seed covers linking between notes but not the specific relationships between chords in a progression.

**Rule:** For harmonic knowledge, use typed relationships (dominant-to-tonic, modulation) rather than generic links.

**Why:** Harmonic relationships are structurally significant and differ from general concept relationships; typed links preserve this distinction.

**Test:** Can you trace harmonic progressions through typed links rather than generic connections?

### Gap 3: Temporal Structure Layers

Music has multiple simultaneous temporal layers (melody, harmony, rhythm, dynamics). The Seed's sequential knowledge assumes a single timeline.

**Rule:** For multi-voice knowledge, tag with `temporal-layer: melody|harmony|rhythm|dynamics` to distinguish parallel streams.

**Why:** Parallel temporal layers behave differently from sequential ones; treating them as single timeline loses structural information.

**Test:** Can you identify temporal layers in a multi-voice composition and tag them appropriately?

### Gap 4: Experiential "Feel" Documentation

Composers describe music with subjective terms (tense, resolved, yearning). The Seed has confidence markers but not "affect" markers.

**Rule:** For compositional affect, add `affect: [emotional quality]` tags to capture the subjective quality of musical passages.

**Why:** Affective quality is intrinsic to music composition; without explicit tagging, the emotional dimension is lost.

**Test:** Can you tag passages with their affective quality and find patterns across compositions?

### Gap 5: Tacit Aural Knowledge

Music composition relies heavily on **ear training** — the ability to hear intervals, chords, progressions, and harmonies. This is fundamentally tacit knowledge:

- Cannot be fully captured in text
- Requires practice and feedback to develop
- Experts "just know" when something sounds right/wrong but cannot always articulate why

**Rule:** For domains where practical skill depends on tacit prerequisite abilities (ear training in music, visual diagnosis in medicine, feel in sports), explicitly tag these as `prerequisite-type: tacit` and document what the tacit skill involves.

**Why:** Tacit knowledge requires different capture strategies; treating it as declarative knowledge sets false expectations for transferability.

**Test:** Can you identify tacit skills required for competence in the domain and tag them appropriately?

### Gap 6: Canonical Compositional Forms

Music has established structural forms that practitioners expect:

- Sonata Allegro form
- Rondo form  
- Theme and Variations
- Binary/Ternary forms
- 12-bar blues progression

**Rule:** For domains with established structural templates (forms, frameworks, standard architectures), create canonical structure notes that define the template and link to examples.

**Why:** Canonical forms provide navigation landmarks and signal expectations; without them, readers cannot orient themselves.

**Test:** Can you identify canonical forms in the domain and find hub notes for each?

### Gap 7: Emotional/Affective Dimensions

Music communicates emotion through:

- Key characteristics (C major = bright, A minor = sad)
- Chord qualities (major = happy, minor = melancholic, diminished = tense)
- Interval qualities (perfect fifth = stable, tritone = unstable)
- Tempo and dynamics

**Rule:** For domains where emotional/affective responses are relatively consistent across practitioners (music, art, design), capture these as `interpretive-type: shared-affect` with consensus levels.

**Why:** Shared affect represents domain-specific knowledge that differs from general subjective opinion; tagging it appropriately helps readers assess applicability.

**Test:** Can you identify affective claims that have consensus across practitioners and tag them appropriately?

### Gap 8: Notation System Expectations

Musicians expect specific notation systems:

- Chord symbols (C, Dm7, G9)
- Standard notation (treble/bass clef)
- Lead sheets
- Chord charts
- Tab notation (for fretted instruments)

**Rule:** For domains with established notation conventions, create guidance on when to use which notation system and how to handle practitioners' notation expectations.

**Why:** Notation expectations affect usability; mismatched notation creates friction for practitioners.

**Test:** Can you identify notation conventions used in the domain and create guidance for appropriate use?

## Proposed Seed Rule: Musical Knowledge Adaptation

> **Rule:** For music composition knowledge bases, adapt Seed rules to account for: motif tracking, harmonic relationships as typed links, multi-voice temporal layers, and affective/subjective terminology.
> **Why:** Generic Seed rules don't capture domain-specific structure that affects navigability and quality.
> **Test:** For music notes: (1) Are motifs trackable? (2) Are harmonic relationships typed? (3) Are temporal layers distinguished? (4) Is affect documented?

## Related
- [[Frontier Exploration - Musical Arrangement Knowledge]] — Existing exploration of music knowledge
- [[Frontier Exploration - Symbolic and Notational Knowledge]] — Notation handling
- [[Knowledge Graph Structure]] — General structure rules
- [[The Extended Mind]] — External cognition for creative domains
- [[Frontier Gap - Conflicting Style-Specific Rules]] — Contradicting rules in different musical styles