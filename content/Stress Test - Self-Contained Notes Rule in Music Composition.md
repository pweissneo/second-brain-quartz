---
last-reviewed: 2026-03-10
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- music-domain
- edge-case
---

# Stress Test: Self-Contained Notes Rule in Music Composition

## Seed Rule Being Tested
**Rule:** Each note must be self-contained — readable without clicking any links.
**Test:** Read the note in isolation. Does it make sense without following any links?

## Application to Music Composition Knowledge Base

### Where the Rule Works Well

Music composition has many concepts that CAN be self-contained:

- **Counterpoint** → "The relationship between melodic lines that are harmonically interdependent yet independent in rhythm and contour." (Self-contained definition)
- **Sonata Form** → "A structure consisting of exposition, development, and recapitulation." (Self-contained structure description)
- **Dynamics** → "The volume of a sound or note." (Simple, definable)

### Edge Case: Circular Terminology Networks

**Problem:** Music theory has inherent circular dependencies:

1. **Chord** → "A combination of three or more notes sounded simultaneously" → What is a note? → "A single pitch" → What is pitch? → "The frequency of a sound" → What is frequency? → Physics...

2. **Interval** → "The distance between two pitches" → What is pitch? → "The frequency of a sound" → What is an interval in terms of frequency? → "The ratio between two frequencies"

3. **Key** → "A tonal center" → What is tonal center? → "The note that feels like home" → (entirely subjective, not definable without examples)

> **Illustrative example** (hypothetical, not actual notes): A note about "triad" says "see Chord for definition." The Chord note says "see Interval." The Interval note says "see Pitch." No note is actually self-contained.

### Edge Case: Historical Terminology Evolution

**Problem:** Music terms evolve with historical context:

- **Motu proprio** (Latin) → "in the manner of one's own will" → Needs context about Catholic liturgical music
- **Da capo** (Italian) → "from the head" → Meaning "repeat from the beginning" → Requires understanding of Baroque conventions
- **Gesamtkunstwerk** (German) → "total work of art" → Wagner's specific concept → Requires historical music context

> **Illustrative example** (hypothetical, not actual notes): A note on "Sonata Form" cannot be self-contained without referencing Classical period conventions, which reference Baroque forms, which reference Renaissance counterpoint...

### Edge Case: Culture-Bound Concepts

**Problem:** Some concepts only make sense within specific cultural frameworks:

- **Maqam** (Arabic music) → No direct Western equivalent → Must link to Arabic music theory
- **Gamelan** (Indonesian) → Uses metallophones, gongs → No Western equivalent
- **Raga** (Indian classical) → Melodic framework with emotional associations → Cannot be explained without cultural context

A note on "Maqam" that is "self-contained" would either be incomprehensible or require embedding entire Arabic music theory.

### Edge Case: Tacit Knowledge in Performance

**Problem:** Music is inherently experiential:

- **Tone quality** ("timbre") → Described as "the character of a sound" → Cannot be understood without hearing examples
- **Phrasing** → "Shaping a musical sentence" → Requires listening to performances to understand
- **Rubato** → "Flexible tempo" → Must be experienced to be understood

> **Illustrative example** (hypothetical, not actual notes): A note describing "legato" as "smooth and connected" means nothing without hearing the difference from "staccato."

### The Real Issue

The self-containment rule assumes concepts can be defined in isolation. But music theory is:
- **Circular by nature** (notes → intervals → chords → harmony → notes)
- **Historically grounded** (terms evolve, meanings shift)
- **Culturally specific** (no universal music theory)
- **Experiential** (sound cannot be conveyed in text)

## Recommendation

The Seed's existing edge case addresses this partially:

> **Edge case:** In domains with building-block terminology (legal, medicine, technical fields), complete self-containment can create circular definitions or bloat. Apply the "core + supporting" distinction: (1) Core content (main concept, key definition) must be self-contained; (2) Supporting content (jurisdiction variations, related concepts, deep details) may link out; (3) Factual claims should still be verifiable even if the full source is linked.

**For Music Composition, this should be refined to:**

**Rule:** Notes in music composition should be self-contained WITHIN THE WESTERN CLASSICAL TRADITION. For non-Western or historical concepts, the note should: (1) Provide a working definition that makes sense to a general reader, (2) Acknowledge the cultural/historical context explicitly, (3) Link out for deeper understanding.

**Test:** For each note: (1) Can a reader understand the basic concept from the note alone? (2) Does the note acknowledge its cultural/historical scope? (3) Are links provided for deeper exploration without being required?

**Additional test for experiential concepts:** For notes about sound/performance: (1) Is there an audio example or reference? (2) Is the tacit nature acknowledged? (3) Are there analogical descriptions (e.g., "like waves crashing")?

## Related
- [[Atomic Note Principle]]
- [[Frontier Exploration - Tacit Knowledge Capture]]
- [[Frontier Exploration - Cross-Domain Knowledge]]
- [[Stress Test - Self-Contained Notes Rule in Legal Knowledge]]
