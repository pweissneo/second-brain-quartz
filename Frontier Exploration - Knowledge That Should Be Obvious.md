---
last-reviewed: 2026-04-04
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-phase: discovery
gap-source: frontier-exploration
discovered: 2026-04-04
---

# Frontier Exploration - Knowledge That Should Be Obvious

> The gap: The Seed doesn't address how to capture knowledge that experts consider "obvious" but novices genuinely don't know.

## The Gap

The Seed covers:
- What to capture (utility, connection, uniqueness)
- How to organize (atomicity, linking, taxonomy)
- When to verify (verification modes, confidence levels)
- How to structure (knowledge types, access patterns)

But it lacks guidance on **obvious knowledge** — the things experts know but never write down because they seem too fundamental to mention. This creates a systematic blind spot in knowledge bases built by or for experts.

## Examples of Obvious Knowledge

### In Technical Domains
- "You need to save before closing" — never documented because it's trivial
- "The default settings work for most cases" — expertise-based judgment
- "This error means X" — pattern recognition experts have but don't explain

### In Craft Domains
- "Wood warps if you don't let it acclimate" — assumed baseline knowledge
- "You need to sharpen before starting" — obvious to practitioners, not learners

### In Professional Domains
- "You need approval before proceeding" — organizational common sense
- "This client expects X format" — learned through exposure, not training

## Why This Is Different From Existing Concepts

| Concept | What's Missing |
|---------|---------------|
| Tacit knowledge | Expertise that's hard to articulate |
| **Obvious knowledge** | Expertise that seems too basic to articulate |
| Gaps | Missing prerequisite knowledge |
| Negative knowledge | What doesn't work |

The key distinction: **Obvious knowledge is what the expert genuinely believes requires no explanation, not what they can't explain.**

## Why It Matters

Without obvious knowledge capture:
1. **Novice friction** — New users can't understand why something "obvious" doesn't work
2. **Onboarding failures** — Knowledge bases assume baseline knowledge that's never documented
3. **Expertise assumption** — Notes written by experts are incomprehensible to non-experts

## The Challenge for AI Agents

An AI building a knowledge base:
- Can identify what it was taught
- Can find what's documented
- **Cannot know what's "obvious" to experts** — this is invisible in source material

## Potential Seed Rule Direction

**Rule:** When capturing knowledge from expert sources, explicitly add one note documenting something "obvious" that the expert didn't explain — a baseline assumption, a common beginner mistake, or a step that's trivial to experts.
**Why:** Expert knowledge bases systematically under-document obvious knowledge. Adding one "obvious" note per captured topic counters this bias.
**Test:** (1) Can you identify 3 baseline assumptions in your domain? (2) Are there beginner mistakes that experts find baffling? (3) What's the "you should know this" knowledge that newcomers actually don't know?

**Alternative direction:** Add a frontmatter field for obviousness level:
```yaml
obviousness: baseline|intermediate|advanced
```
Where baseline = what anyone in the domain would know, advanced = what only experts know. This enables filtering by expertise level.

## Related Notes

- [[Frontier Exploration - Tacit Knowledge Capture]]
- [[Frontier Exploration - Embodied Knowledge]]
- [[Best Practice - Balanced Capture]] — capturing negative knowledge
- [[Seed Stress Test - Expertise Level Rule in Foreign Language Learning]]
- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]]
- [[Note Creation Decision Framework]]

## Questions for Refinement

1. Should obvious knowledge be captured as separate notes or embedded in existing notes?
2. How does obviousness differ from prerequisites?
3. Is this really a Seed gap, or is it already covered by existing rules?