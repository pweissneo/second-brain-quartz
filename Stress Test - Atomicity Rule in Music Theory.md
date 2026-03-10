---
last-reviewed: 2026-03-09
lifecycle: emerging
confidence: emerging
tags:
- seed-stress-test
- music-theory-domain
- edge-case
---

# Stress Test: Atomicity Rule in Music Theory

## Seed Rule Being Tested
**Rule:** Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas.
**Test:** Count words. Flag notes outside the 100-300 range for review.

## Application to Music Theory Knowledge Base

### Where the Rule Works Well
- **Music Forms** (300-500 words): Sonata form naturally requires 400+ words to cover exposition, development, recapitulation, and coda. The rule's procedural edge case applies here.
- **Composition Techniques**: Counterpoint exercises, harmonic progression chapters - these are procedural and benefit from staying together.

### Edge Case: Dynamic Markings (Too Small)

**Problem:** Music theory has concepts that are inherently brief by definition:

1. **Piano (p)** - "Soft" - 1 word. The entire concept IS the definition.
2. **Forte (f)** - "Loud" - 1 word.
3. **Mezzo-piano (mp)** - "Moderately soft" - 2 words.
4. **Crescendo** - "Gradually getting louder" - 4 words.

These are real, valid musical concepts. An AI applying the 100-300 word rule strictly would either:
- Merge all dynamics into one "Dynamics" note (violating atomicity!)
- Create bloated notes with useless padding
- Flag valid concepts as "too thin"

**The Test Fails:** The rule assumes every concept can be expanded to 100 words without fluff. Dynamics are fundamentally atomic - their brevity IS the point.

### Edge Case: Tempo Markings (Equally Brief)

Same problem:
- **Largo** - 40-60 BPM, very slow
- **Allegro** - 120-140 BPM, fast
- **Andante** - 76-108 BPM, walking pace

Each is a single word that means a specific tempo range. Creating 100+ word notes about "Allegro" would be nonsensical.

### Edge Case: Historical Performance Practice

**Problem:** Notes about period instruments or historical interpretation:
- **Vibrato** in Baroque vs. Romantic - could be 50 words
- **Harpsichord registration** - 80 words covers it adequately
- **Baroque bow technique** - genuinely complex, needs 300+ words

The rule can't distinguish "thin because unfinished" from "brief because that's the natural size."

### The Real Issue

The Seed's edge cases acknowledge:
- Procedural content >300 is OK
- Hub notes <200 are OK

But there's no guidance for:
- **Definition-only concepts** (words that ARE their definition)
- **Standard notation elements** (dynamics, tempo, articulation marks)
- **Unit concepts** (these exist at a specific granularity)

### Recommendation

The atomicity rule should explicitly address **unit concepts**:

**Rule:** Notes should be 100-300 words UNLESS the concept is a:
- Standard unit of the domain (dynamics in music, axioms in math, basic SI units in science)
- Definition-atomic concept (cannot be split without losing meaning)
- Notation element (symbols that have fixed meanings)

**Test:** For notes <100 words: (1) Is this a standard unit/notation element? (2) Does splitting it make the domain's logic incoherent? (3) Is the brevity intentional, not lazy? Accept if yes to any.

## Related
- [[Atomic Note Principle]]
- [[Note Thickness Balance]]
- [[Domain-Specific Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed]] — see "Domain unit concepts" edge case in Atomicity section
