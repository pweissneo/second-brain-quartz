---
last-reviewed: 2026-03-13
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - music
  - symbolic-knowledge
  - experiential
  - temporal
---

# Frontier Exploration - Symbolic and Notational Knowledge

> How do we capture knowledge that exists primarily in specialized notation systems?

## The Problem

The Seed handles text-based knowledge well, but some domains have knowledge that exists primarily in specialized symbolic or notational forms:

- **Music notation**: Standard notation, tabs, chord charts, lead sheets, MIDI
- **Mathematics**: Equations, formulas, proofs
- **Dance**: Choreography notation (Laban), video references
- **Chess**: PGN notation, diagrams
- **Programming**: Code itself as the knowledge

An AI building a knowledge base in these domains using only text-based Seed rules will struggle with:
1. When is the notation the knowledge vs. when is text description better?
2. How to make notation searchable
3. How to handle multiple notation systems for the same knowledge
4. How to balance notation precision with accessibility

## Seed Gap Analysis

### Existing Coverage
- Multi-modal knowledge (media separation)
- Temporal knowledge (sequential)
- Experiential knowledge (tacit components)
- Self-contained notes (must make sense alone)

### Missing / Incomplete

1. **No rule for symbolic notation as primary knowledge**
   - When should a note contain actual notation (ABC notation, chord symbols) vs. text description?
   - Example: "The chord progression I-vi-IV-V" - notation captures something text cannot

2. **No guidance on notation searchability**
   - A chord symbol "Cmaj7" is searchable in some systems but not others
   - How do we make notation findable?

3. **No guidance on notation system selection**
   - Music: standard notation vs. chord charts vs. tabs vs. lead sheets
   - Each serves different purposes and audiences
   - When to use which?

4. **No guidance on notation+text synthesis**
   - How to write a note that's both readable AND notation-precise
   - Example: "Use this Cmaj7 voicing" with actual chord diagram

## Proposed Seed Rules

### Rule: Distinguish notational knowledge from descriptive knowledge

**Why:** In domains with established notation systems, the notation itself carries precision that text cannot match. But notation alone may be inaccessible to novices.

**Test:** (1) Does this domain have established notation systems? (2) Would converting notation to text lose essential precision? (3) Is the target audience fluent in the notation?

**Implementation:** 
```yaml
knowledge-encoding: symbolic|text|synthetic
notation-type: [standard|chord-chart|tab|midi|pgn|equation]
notation-required: true|false
```

### Rule: Provide dual-layer representation for notational knowledge

**Why:** Accessibility. Notation experts need precision; novices need explanation. Both are valid knowledge consumers.

**Test:** Can a reader who doesn't understand the notation still get value from this note? Can an expert find the exact notation they need?

**Example:**
```markdown
# Jazz Chord Voicings

## Cmaj7 (Category: Spread voicing)

[[chord:Cmaj7:voicing:spread]]

**Text description:** Root in left hand, 3rd and 7th in right hand, extended tone (9th) on top.

**When to use:** Jazz standards, ballads, contexts requiring full sound
```

### Rule: Tag notation complexity level

**Why:** Different audiences need different notation complexity. Chord symbols are accessible; jazz voicings are advanced; atonal notation is specialist.

**Test:** Can you identify what minimum notation fluency is needed to understand this note?

**Implementation:**
```yaml
notation-fluency-required: basic|intermediate|advanced|expert
```

### Rule: For temporal-spatial knowledge (music, dance, chess), include temporal relationships separate from spatial/structural

**Why:** Music has both:
- Temporal relationships (melody unfolds in time)
- Structural relationships (chord function, harmonic analysis)

Current Seed temporal rules focus on sequence (A before B). But music analysis also needs "this chord functions as X within the harmonic context."

**Test:** For a music note: (1) Does it have temporal-type: sequential? (2) Does it also capture harmonic/structural relationships?

## Gap Summary

| Gap | Current Rule | Gap |
|-----|--------------|-----|
| Notation as knowledge | Multi-modal (media separation) | No guidance on when notation IS the knowledge |
| Notation searchability | Link/search rules | Notation symbols aren't searchable text |
| Notation selection | Tags vs links | No guidance on which notation system |
| Dual representation | Self-contained | Not notation-specific |

## Related Notes
- [[Frontier Exploration - Multi-Modal Knowledge]]
- [[Frontier Gap - Embodied Knowledge]]
- [[Handling Temporal Knowledge]]
- [[Seed Stress Test - Chess Knowledge Base]] (partial - notation in chess)
