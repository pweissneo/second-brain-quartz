---
last-reviewed: 2026-03-12
confidence: emerging
lifecycle: draft
tags:
  - frontier-exploration
  - knowledge-types
  - experiential-knowledge
  - tacit-knowledge
---

# Frontier Exploration - Experiential vs Documented Knowledge

## The Gap

When stress-testing the Seed against music composition, a significant gap emerges: **the Seed has no rule for handling knowledge that is fundamentally experiential vs. documented**.

In music composition:
- Some knowledge is well-documented (music theory, harmony rules, form structures)
- Some knowledge is inherently tacit (how a piece "feels," when a transition "works," the sense of pacing)

An AI building a composition knowledge base from just the Seed rules would capture all the documented theory but miss the tacit, experiential layer that makes a knowledge base actually useful for creative work.

## The Problem

The Seed treats all knowledge as if it can be captured in notes. But there's a spectrum:

1. **Fully articulable knowledge** - Can be fully captured in text (facts, procedures, rules)
2. **Partially articulable** - Core is documentable, but the "feel" requires experience
3. **Inherently tacit** - Cannot be captured in text at all (Polanyi's "we know more than we can tell")

The Seed has no guidance for:
- When to acknowledge knowledge is incomplete without experience
- How to tag notes that require experiential validation
- Whether to include "try it and see" guidance vs. only theoretical rules

## Existing Related Rules

The Seed does have related rules:
- [[Frontier Exploration - Tacit Knowledge Capture]] - discusses capturing tacit knowledge
- [[Knowledge-Type Rule]] - distinguishes canonical/analysis/personal
- [[Confidence Markers]] - signals reliability

But none specifically address: **how to handle knowledge bases where the useful knowledge extends beyond what can be documented**

## Proposed Seed Addition

A potential rule might be:

**Rule:** For domains where experiential knowledge is essential, include `experiential-component` frontmatter indicating what knowledge requires direct experience to fully understand.
**Why:** Readers (and AI agents) need to know when a note represents complete knowledge vs. knowledge that requires practice/experience to apply. This prevents over-reliance on theoretical understanding.
**Test:** Pick 5 notes in an experiential domain. Can you identify which require experience to fully apply? Do they have explicit markers?

This rule would help in domains like:
- Music composition (theory ≠ ability to compose)
- Clinical skills (textbook ≠ bedside manner)
- Martial arts (techniques ≠ combat readiness)
- Artistic domains (rules ≠ aesthetic judgment)

## Questions for Further Exploration

1. Should experiential markers be binary (has experiential component / doesn't) or gradated (requires: none/some/extensive)?
2. How do you test whether a note's experiential component is adequately captured?
3. Does including "experiential notes" encourage building knowledge bases in experiential domains, or should those domains be excluded from the Seed's scope?

## Related Notes

- [[Frontier Exploration - Tacit Knowledge Capture]]
- [[Knowledge-Type Rule]]
- [[Confidence Markers]]
- [[Seed Stress Test - Cooking Knowledge Base]] - cooking has both theoretical and experiential components
- [[Frontier Exploration - Sensory Knowledge Capture]]
