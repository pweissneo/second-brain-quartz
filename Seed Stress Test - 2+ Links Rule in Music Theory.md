---
last-reviewed: 2026-03-16
last-updated: 2026-03-16
confidence: high
author-type: ai-assisted
domain-familiarity: assessed
lifecycle: evergreen
tags:
  - seed-stress-test
  - music-theory
  - link-quality
  - 2-plus-links
  - cross-domain
---

# Seed Stress Test: 2+ Links Rule (Music Theory + Nursing)

**Tested Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.

**Test Domains:** Music Theory, Nursing (multi-domain stress test)

## Does the Rule Make Sense for Music Theory?

**Yes** — Music theory has a highly interconnected structure where concepts build on each other. A well-organized music theory vault should have concepts like harmony linking to chord theory, voice leading, and harmonic analysis. However, music theory also has some fundamental primitives that challenge the 2-link minimum.

## Is the Test Executable?

**Yes** — The orphan scan test is straightforward: count outgoing links in each note. However, music theory reveals some edge cases that need refinement.

## Edge Cases Discovered

### 1. Musical Dynamics (piano, forte, crescendo)

**Problem:** Dynamics markings (piano=soft, forte=loud, crescendo=gradually louder) are fundamental primitives in music. Every piece of music uses dynamics, but a basic definition note about "dynamics" has no natural 2+ links:
- It doesn't "build on" other concepts
- It's a primitive that others build from
- Forcing links like "[[Loudness]]" or "[[Volume]]" creates decorative links

**Resolution:** This fits the existing `foundational: true` edge case perfectly. Dynamics are true domain primitives.

### 2. Tempo Markings (adagio, allegro, andante)

**Problem:** Tempo markings are standard Italian terms that function like abbreviations in music. "Allegro" means "fast" but is the standard term. A note defining "Allegro" might:
- Link to tempo (tautological: allegro is a tempo)
- Not naturally link elsewhere

**Resolution:** This is close to the "single-term definitions" edge case, but not quite. Tempo terms aren't abbreviations — they're the standard vocabulary. However, they could be considered "domain primitives" that should use `foundational: true`.

### 3. Musical Intervals (unison, octave, perfect fifth)

**Problem:** Intervals are the building blocks of harmony, but a note like "Perfect Fifth" might only naturally link to:
- Interval (category)
- Consonance (related concept)

That's only 1-2 links. It could link to "Circle of Fifths" but that's a more advanced concept, not a direct relationship.

**Resolution:** Intervals are foundational music theory primitives. They should use `foundational: true`.

### 4. Musical Forms (sonata, rondo, theme-and-variations)

**Problem:** Form concepts describe structural patterns. A note about "Rondo Form" might link to:
- Musical Form (category)
- Sonata (related form)

That's 2 links, which passes the test, but barely. The relationships are thin.

**Resolution:** Passes the test but with weak links. This is acceptable but worth noting — form notes may need careful linking to avoid feeling decorative.

### 5. Instrument-Specific Techniques

**Problem:** Techniques like "pizzicato" (plucking strings) are specific to string instruments. A note might only link to:
- String instruments (category)
- Articulation (category)

Two links, but both are category links, not explanatory relationships.

**Resolution:** This fits the existing `specialized: true` edge case — pizzicato is a specialized technique used in specific contexts.

### 6. Historical Terminology (baroque, classical, romantic)

**Problem:** Period terms like "Baroque" might link to:
- Music history (broad)
- Era-specific characteristics

Two links, but these are broad categorical relationships that don't add navigational value.

**Resolution:** These are borderline. They pass the 2-link test but the links are weak. The rule's test is passed but the spirit is challenged.

## Nursing Domain Edge Cases

### Edge Case 1: True Foundational Primitives in Clinical Practice

**Problem:** Notes like "Vital Signs," "Nursing Assessment," "Patient Safety" are referenced by everything but don't naturally link out to 2+ notes.

Analysis:
- "Vital Signs" is used in every patient encounter
- It references heart rate, blood pressure, temperature, respiration
- But as a core primitive, it's referenced BY many notes, not the other way around

**Resolution:** The `foundational: true` tag works for clinical primitives. Criteria for WHEN to use it in clinical domains:
- (a) Referenced by 10+ other notes?
- (b) A core skill all practitioners must have?
- (c) A building block concept?

### Edge Case 2: Patient Population-Specific Notes

**Problem:** Notes like "Pediatric Vital Signs" vs "Adult Vital Signs" — both link to "Vital Signs" but have different reference ranges.

Structure:
- "Vital Signs" → links to "Pediatric Vital Signs", "Adult Vital Signs", "Vital Signs Measurement"
- Each population note links to Vital Signs + maybe 1 other

Is this enough? The rule says 2+ links. These have exactly 2.

**Issue:** In clinical domains, population-specific knowledge legitimately has narrow links. A pediatric note links to:
1. General principle (vital signs)
2. Pediatric-specific reference

That's it. Forcing more links creates decorative links.

### Edge Case 3: Clinical Instruments and Tools

**Problem:** Notes about clinical instruments ("Foley Catheter," "Sepsis Screening Tool") — what do they link to?

- "Foley Catheter" note → only links to "Catheterization Procedure"
- Missing: [[Catheter Care]], [[Complications]], [[Indwelling vs Intermittent]]

**Resolution:** Clinical instruments/tools may have 1-2 links if they're specific to one procedure. This fits the `specialized: true` edge case.

### Edge Case 4: Legacy/Deprecated Practices

**Problem:** "Traditional Wound Care" (older methods) — what does this link to?

- Links to [[Wound Care]] (general)
- May link to [[Modern Wound Care]] (comparison)

Only 2 links. But one is essentially "don't use this" — is that a meaningful link?

**Verdict:** Legacy practices should link to what replaced them AND what they were used for. Not just the replacement.

### Edge Case 5: Evidence-Based Practice Meta-Knowledge

**Problem:** Notes about research methods ("Evidence-Based Practice," "Nursing Research Methods") — what do they link to?

Challenge: Research methods don't naturally link to clinical content. They're meta-knowledge.

Options:
- Link to [[Research Critique]]
- Link to [[Clinical Guidelines]]
- Link to [[Quality Improvement]]

That's 3 links — works. But is it meaningful? Or decorative?

**Resolution:** Research methods notes are meta-knowledge — link to other meta-notes, not clinical content.

## Refinements Needed

### Refinement 1: Expand "single-term definitions" to include "standard terminology"

The current edge case covers abbreviations (BP, CPR) but not standard domain terms (allegro, adagio). These are the "vocabulary" of the domain.

**Proposed change to edge case:**
> **Edge case:** Standard domain terminology (abbreviations, foreign language terms, standard notation symbols) may legitimately have fewer links when the note exists primarily as a vocabulary reference. Examples: tempo markings (allegro, adagio), dynamics (piano, forte), foreign language terms in classical music. Test: (1) Is this term the standard way this concept is expressed in the domain? (2) Does the note primarily serve as a definition/lookup? If yes to both, allow fewer links with `type: terminology`.

### Refinement 2: Clarify "foundational" vs. "category" links

The current rule and edge cases don't clarify whether links to category hubs count as "natural" links. In music theory, linking "Perfect Fifth" to "Intervals" (a hub) feels like a category link, not a conceptual relationship.

**Proposed clarification:**
> The 2-link test should distinguish between: (1) conceptual links (explains HOW this relates), (2) category links (this belongs to X category). Category-only links should be supplemented with at least one conceptual link, or the note should use `foundational: true`.

### Refinement 3: Clinical Domain-Specific Test Refinements

```
For clinical knowledge bases:
- Standard notes: 2+ links required
- Clinical instruments (scales, tools, equipment): 1+ link OK if specific
- Foundational skills: tag with foundational: true
- Population-specific: link to general + population
- Legacy/deprecated: link forward to replacement + backward to original use
- Research methods: link to other meta-notes, not domain content
```

### Refinement 4: The Dilemma - Clinical Relevance vs. Graph Density

The 2-link rule assumes notes can naturally connect to 2+ related concepts. But clinical knowledge has:
- **Broad concepts** (assessment, intervention, evaluation) — easily link
- **Specific instruments** (specific scales, tools, equipment) — limited natural links
- **Population-specific** (pediatric, geriatric, maternal) — limited to their population

Forcing 2+ links on specific instruments creates decorative links that hurt clinical utility.

## Test Validation

Can an AI agent execute this test in a music theory vault?
- ✅ Count outgoing links: straightforward
- ✅ Check for `foundational: true` tag: straightforward  
- ✅ Check for `specialized: true` tag: straightforward
- ⚠️ Distinguish decorative from natural links: requires judgment (category vs. conceptual)

## Conclusion

The rule works well across both music theory and nursing domains, but needs refinements:

1. **Standard terminology** (tempo markings, dynamics terms, clinical abbreviations) — allow fewer links with `type: terminology`
2. **Category vs. conceptual links** — clarify distinction
3. **Clinical domain refinements** — instruments, populations, deprecated practices each need specific handling
4. **Graph density vs. relevance** — don't force decorative links in specialized domains

The core logic is sound, but domain-specific edge cases require tailored guidance.

---
See also: 
- [[Seed Stress Test - Chess Knowledge Base]] (similar structural analysis)
- [[Seed Stress Test - Atomicity Rule Across Domains]] (domain-specific edge cases)
- [[Frontier Exploration - Musical Arrangement Knowledge]]
- [[Domain-Specific Knowledge Bases]]
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[AI-Assisted Knowledge Management Seed]] (source of rules being tested)
