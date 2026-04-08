---
last-reviewed: 2026-04-08
last-updated: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - frontier-exploration
  - music-theory
  - knowledge-types
  - performance
  - analysis
schema-version: "1.0"
---

# Frontier Exploration: Music Knowledge Type Distinctions

> Distinguishing performance knowledge, analytical knowledge, and compositional knowledge in music theory knowledge bases.

## Domain: Music Theory

Music theory knowledge bases face a fundamental challenge: the same musical content can be captured and used in fundamentally different ways. A C major scale is:
- **Performance knowledge:** How to physically play C major on piano (fingerings, hand position)
- **Analytical knowledge:** Understanding that C major is the tonal center, its relationship to other keys, its function in harmony
- **Compositional knowledge:** How to use C major in writing a melody, what emotions it conveys, when to modulate away

The Seed treats knowledge as either procedural (how to do something) or conceptual (understanding something). Music requires a third category.

## What the Seed Covers

The Seed covers:
- Procedural content (recipes, code, tutorials)
- Conceptual content (principles, definitions, frameworks)
- Experiential knowledge (requires practice to verify)

## What's Missing

### Gap: Tripartite Knowledge Classification for Music

Music theory knowledge doesn't fit the binary procedural/conceptual model:

1. **Performance Knowledge** — How to execute music on an instrument/voice
   - Physical technique (fingerings, breath control, bowing)
   - Notation reading (immediate translation to sound)
   - Tempo/rhythm execution
   - Dynamics and articulation control
   
2. **Analytical Knowledge** — Understanding what happens in existing music
   - Harmonic analysis (what chords are used and why)
   - Form identification (sonata form, rondo, etc.)
   - Counterpoint analysis
   - Historical context and style recognition
   
3. **Compositional Knowledge** — How to create new music
   - Harmonic vocabulary selection
   - Melodic construction principles
   - Form design choices
   - Orchestration and arrangement

### Why This Matters

A music student needs all three types, but they're structured differently:
- Performance knowledge is sequential and physical
- Analytical knowledge is hierarchical and comparative
- Compositional knowledge is creative and principle-based

The Seed's rules for atomicity, linking, and verification don't distinguish between these. For example:
- A note about "circle of fifths" could be analytical (understanding key relationships) or compositional (choosing key transitions)
- A note about "root position triads" could be conceptual (what they are) or performance (how to play them)

Without distinguishing knowledge types, the vault can't serve different use cases effectively.

## Proposed Seed Rule Addition

> **Rule:** For domains with distinct knowledge modalities (performance/analysis/composition in music, diagnosis/prognosis/treatment in medicine, theory/practice in engineering), tag notes with `knowledge-modality:` to distinguish how the knowledge is used.
> 
> **Why:** Generic procedural/conceptual distinction fails when the same domain has multiple valid use cases that require different structuring approaches.
> 
> **Test:** For music theory notes: (1) Count notes with `knowledge-modality:` field, (2) Verify all music notes can be categorized as performance|analysis|compositional|hybrid, (3) Check that each modality follows appropriate structure (performance→execution details, analysis→examples from works, compositional→principles+examples). Pass if yes/no checkable.

### Implementation

```yaml
knowledge-modality: performance|analysis|compositional|hybrid
# Performance: how to execute
# Analysis: understanding existing works
# Compositional: how to create new works
# Hybrid: serves multiple purposes
```

### Example Applications

**Performance notes:**
- Include practical execution details
- Link to specific passages in repertoire
- Tag with instrument-specific variants

**Analysis notes:**
- Include multiple examples from different works
- Link to compositional techniques being used
- Tag with historical period and style

**Compositional notes:**
- Include principles that can be applied
- Link to analysis examples showing the principle
- Tag with emotional/affective qualities

## Related

- [[Seed Gap - Music Composition Knowledge Bases]] — Existing music gaps
- [[Frontier Exploration - Musical Arrangement Knowledge]] — Arrangement-specific knowledge
- [[Knowledge Type Classification]] — General knowledge type guidance
- [[Sequential Knowledge Domains]] — Sequential-skill domain handling
