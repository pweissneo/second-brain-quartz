---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- self-contained-notes
- edge-case
- multi-domain
- legal-knowledge
- music-composition
---

# Stress Test: Self-Contained Notes Rule Across Domains

> Testing Seed rule: "Every note must be self-contained — readable without clicking any links."

This note consolidates stress tests from multiple domains (Legal, Music Composition) to provide a comprehensive view of the Self-Contained Notes rule's strengths and limitations.

## The Rule

**Rule:** Every note must be self-contained — readable without clicking any links.

**Why:** Notes that depend on external context become meaningless when links break or context shifts.

**Test:** Read the note in isolation. Does it make sense without following any links?

---

## Domain 1: Legal Knowledge

### Does the rule make sense?

**Partially.** In legal knowledge bases, some notes ARE naturally self-contained:
- **Statute texts**: The actual law text is self-contained
- **Case summaries**: Facts, holding, and reasoning are in the note
- **Legal forms**: Template language stands alone

However, legal concepts often require understanding of other legal concepts that cannot be self-contained without becoming circular or bloated.

### Edge Cases

**Edge Case 1: Legal Terminology Building Blocks**

> **Illustrative example** (hypothetical legal knowledge base):
> 
> A note about "Negligence" might say: "A tort involving breach of duty of care..."
> 
> To be self-contained, it would need to define "tort" and "duty of care" inline. But:
> - Defining "tort" requires explaining civil vs. criminal law
> - Defining "duty of care" requires explaining standard of care, foreseeability
> - This balloons a simple concept note into a treatise

**Edge Case 2: Cross-Jurisdiction Knowledge**

> **Illustrative example** (hypothetical):
> "Contract" note links to Contract Law (US), Contract Law (UK), Contract Law (EU)
> 
> Without clicking these links, the note is incomplete - but including all variations makes it unwieldy.

**Edge Case 3: Legal Citations**

> **Illustrative example** (hypothetical):
> "Judicial review was established in *Marbury v. Madison* (1803)"
> 
> A reader unfamiliar with US constitutional history cannot understand this without clicking. But a full explanation of the case makes the note about judicial review into a case summary.

### The Real Issue

The self-containment rule assumes links are "nice to have" for depth. In legal knowledge:
- **Terminology is building-block based** - concepts depend on prior concepts
- **Precision requires citations** - legal claims need sources
- **Jurisdiction creates variation** - universal statements are often wrong

### Recommendation

Apply the Seed's existing edge case:

> **Edge case:** In domains with building-block terminology (legal, medicine, technical fields), complete self-containment can create circular definitions or bloat. Apply the "core + supporting" distinction: (1) Core content (main concept, key definition) must be self-contained; (2) Supporting content (jurisdiction variations, related concepts, deep details) may link out; (3) Factual claims should still be verifiable even if the full source is linked.

**For Legal, refine to:**
- **Core content**: Self-contained (main concept, key definition)
- **Supporting content**: May link for depth (jurisdiction variations, related concepts)
- **Citations**: Required for factual claims but may link for full source

---

## Domain 2: Music Composition

### Does the rule make sense?

**Partially.** Music composition has many concepts that CAN be self-contained:
- **Counterpoint** → "The relationship between melodic lines that are harmonically interdependent yet independent in rhythm and contour."
- **Sonata Form** → "A structure consisting of exposition, development, and recapitulation."
- **Dynamics** → "The volume of a sound or note."

However, music theory has inherent challenges that make full self-containment difficult.

### Edge Cases

**Edge Case 1: Circular Terminology Networks**

1. **Chord** → "A combination of three or more notes sounded simultaneously" → What is a note? → "A single pitch" → What is pitch? → "The frequency of a sound" → What is frequency? → Physics...

2. **Interval** → "The distance between two pitches" → What is pitch? → "The frequency of a sound" → What is an interval in terms of frequency? → "The ratio between two frequencies"

3. **Key** → "A tonal center" → What is tonal center? → "The note that feels like home" → (entirely subjective, not definable without examples)

**Edge Case 2: Historical Terminology Evolution**

- **Motu proprio** (Latin) → "in the manner of one's own will" → Needs context about Catholic liturgical music
- **Da capo** (Italian) → "from the head" → Meaning "repeat from the beginning" → Requires understanding of Baroque conventions
- **Gesamtkunstwerk** (German) → "total work of art" → Wagner's specific concept → Requires historical music context

**Edge Case 3: Culture-Bound Concepts**

- **Maqam** (Arabic music) → No direct Western equivalent → Must link to Arabic music theory
- **Gamelan** (Indonesian) → Uses metallophones, gongs → No Western equivalent
- **Raga** (Indian classical) → Melodic framework with emotional associations → Cannot be explained without cultural context

**Edge Case 4: Tacit Knowledge in Performance**

- **Tone quality** ("timbre") → Described as "the character of a sound" → Cannot be understood without hearing examples
- **Phrasing** → "Shaping a musical sentence" → Requires listening to performances to understand
- **Rubato** → "Flexible tempo" → Must be experienced to be understood

> A note describing "legato" as "smooth and connected" means nothing without hearing the difference from "staccato."

### The Real Issue

The self-containment rule assumes concepts can be defined in isolation. But music theory is:
- **Circular by nature** (notes → intervals → chords → harmony → notes)
- **Historically grounded** (terms evolve, meanings shift)
- **Culturally specific** (no universal music theory)
- **Experiential** (sound cannot be conveyed in text)

### Recommendation

For Music Composition, refine to:

**Rule:** Notes in music composition should be self-contained WITHIN THE WESTERN CLASSICAL TRADITION. For non-Western or historical concepts, the note should: (1) Provide a working definition that makes sense to a general reader, (2) Acknowledge the cultural/historical context explicitly, (3) Link out for deeper exploration without being required.

**Test:** For each note: (1) Can a reader understand the basic concept from the note alone? (2) Does the note acknowledge its cultural/historical scope? (3) Are links provided for deeper exploration without being required?

**Additional test for experiential concepts:** For notes about sound/performance: (1) Is there an audio example or reference? (2) Is the tacit nature acknowledged? (3) Are there analogical descriptions (e.g., "like waves crashing")?

---

## Unified Refinements

### Refinement 1: The Core + Supporting Distinction

For domains with building-block terminology (legal, medicine, music theory, technical fields):

| Content Type | Self-Containment Requirement |
|--------------|----------------------------|
| Core content | Must be self-contained (main concept, key definition) |
| Supporting content | May link out for depth |
| Citations/sources | Required for factual claims but may link for full source |
| Cultural/historical context | Must acknowledge scope; full depth may link out |

### Refinement 2: Audience-Appropriate Self-Containment

**Rule:** Every note must be self-contained for its intended audience — the core claim must be understandable without links, but supporting details and variations may link out.

**Test:** 
1. Read the note as a domain novice. Is the main point clear?
2. Read it as an expert. Are there unsupported claims?
3. Are factual claims supported with citations (even if not fully explained)?

### Refinement 3: Tacit Knowledge Markers

For experiential concepts (music, cooking, physical skills):

- Include `experiential: true` in frontmatter
- Provide analogical descriptions where possible
- Reference audio/video examples when available
- Acknowledge that some knowledge cannot be fully conveyed in text

---

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Frontier Exploration - Tacit Knowledge Capture]]
- [[Frontier Exploration - Cross-Domain Knowledge]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
