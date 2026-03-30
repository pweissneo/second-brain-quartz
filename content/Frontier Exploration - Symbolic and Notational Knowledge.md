---
last-reviewed: 2026-03-29
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
specialized: true
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

The Seed's visual knowledge rule (added 2026-03-26) now explicitly covers musical notation as a case where "visual formats convey meaning textually but have visual components." However, that rule addresses when to include visual format alongside text. This note addresses a distinct problem: when notation IS the primary knowledge encoding, not just a supplementary visual.

### Key Distinction
- **Visual knowledge rule:** "Include visual format alongside text explanation" (notation as supplement)
- **This note:** "When is the notation itself the knowledge vs. when is text description better?" (notation as primary)

The Seed lacks guidance on:
1. **Notation as primary knowledge** - domains where text cannot substitute for notation (music composition, equations)
2. **Notation searchability** - symbolic systems that aren't searchable as plain text
3. **Notation system selection** - when to use which notation system for the same domain
4. **Multi-notation synthesis** - handling multiple valid representations of the same knowledge

## Seed Gap Analysis

### Existing Coverage (Post 2026-03-26)
- **Visual knowledge rule:** Covers musical notation, mathematical notation, and similar as cases where visual format is needed alongside text. Scope: "include visual format alongside text explanation."
- **Multi-modal knowledge:** Media separation for different knowledge types
- **Experiential knowledge:** Tacit components that text can't capture
- **Self-contained notes:** Must make sense alone (notation should be interpretable)

### Still Missing / Incomplete

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

## Gap Status (Post 2026-03-26)

| Gap | Previous Status | Current Status | Remaining Gap |
|-----|----------------|-----------------|---------------|
| Notation as knowledge | Not covered | Partially covered (visual knowledge rule) | Guidance on notation-as-primary vs notation-as-supplement |
| Notation searchability | Not covered | Not covered | Symbolic systems aren't plain-text searchable |
| Notation selection | Not covered | Not covered | No guidance on which system to use |
| Dual representation | Proposed rule | Partially covered (visual-alt-text) | Not notation-specific |

### What's Still Missing

1. **Notation-as-primary knowledge handling** - domains where text fundamentally cannot substitute for notation (music composition, equations, code). The visual rule covers "notation alongside text" but not "notation is the knowledge itself."

2. **Notation searchability solutions** - chord symbols, music notation, equations aren't searchable as text strings. Need pattern-based search or cross-reference systems.

3. **Notation system selection guidance** - when to use standard notation vs chord charts vs tabs vs lead sheets for the same musical knowledge.

4. **Notation accessibility standards** - guidance on what "text equivalent" means for technical notation (not just visual descriptions but functional accessibility).

## Related Notes
- [[Frontier Exploration - Multi-Modal Knowledge]]
- [[Frontier Gap - Embodied Knowledge]]
- [[Handling Temporal Knowledge]]
- [[Seed Stress Test - Chess Knowledge Base]] (partial - notation in chess)

## 2026-03-29 Update: Notation-Primary vs Notation-Supplement Distinction

The 2026-03-26 visual knowledge rule provides this guidance:
> "In mathematics and logic, notation and graphs convey meaning textually but have visual components (geometric figures, graphs, diagrams). Include visual elements when they are standard notation in the field."

This addresses notation AS VISUAL SUPPLEMENT (text explanation with visual included). But it doesn't address notation AS PRIMARY KNOWLEDGE ENCODING.

### The Distinction

**Notation-as-supplement** (covered by visual rule):
- Text is primary; notation is included for precision
- Example: "The Cmaj7 voicing uses root-3-7-9 in the right hand" with chord diagram
- Reader could get value from text alone; notation adds precision

**Notation-as-primary** (NOT covered):
- The notation itself IS the knowledge; text cannot substitute
- Example: "Folk song uses the pentatonic scale: C D E G A"
- Without the scale degrees spelled out, the knowledge is incomplete
- The symbols carry relationships that text can't fully capture

### Why This Matters for AI Knowledge Management

When an AI is building a knowledge base in a notation-heavy domain:
- **If it treats notation as supplement**: Notes may read like "This chord is Cmaj7" without capturing the chord's function, voice leading, or voicing possibilities. The knowledge is incomplete.
- **If it treats notation as primary**: Notes become inaccessible to non-fluent readers and may fail the "can an AI agent evaluate this?" test from the Seed's verification rules.

### The Remaining Gap

The Seed needs guidance on:
1. **When to treat notation as primary** vs supplement (based on: domain conventions, audience, knowledge type)
2. **How to verify notation-primary knowledge** (an AI can't "read" music notation the way it reads text)
3. **How to make notation-primary knowledge accessible** (dual-layer approach: notation + text equivalent, where the text equivalent is functional not just visual description)

### Proposed Additional Rule

**Rule:** For domains where established notation systems carry knowledge that text cannot equivalently represent, treat notation as the primary knowledge encoding with text as accessibility layer.

**Why:** Some knowledge exists in the relationships between symbols, not in the meaning of individual symbols. Text can describe what a chord progression IS but cannot capture how it FUNCTIONS in the same way notation can.

**Test:** (1) Does this domain have established notation systems? (2) Could a text description replace the notation without loss? (3) Is the notation fluent audience the primary reader? If yes to all, treat notation as primary with text accessibility layer.

**Implementation:**
```yaml
knowledge-encoding: symbolic-primary  # vs symbolic-supplement or text-primary
notation-system: [standard|ABC|chord|midi|pgn|equation]
text-accessibility-layer: true  # is there a text equivalent for non-fluent readers?
notation-verify-ability: partial|none  # can an AI agent verify correctness without domain knowledge?
```
