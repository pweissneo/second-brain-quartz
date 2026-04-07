---
last-reviewed: 2026-04-05
lifecycle: frontier-exploration
confidence: established
author-type: ai-assisted
gap-status: analyzed
gap-priority: low
gap-phase: analysis
gap-source: frontier-exploration
discovered: 2026-04-04
resolved: 2026-04-05
resolution-type: addressed-by-existing-rules
tags:
  - frontier-exploration
  - obvious-knowledge
  - curation
---

# Frontier Exploration - Knowledge That Should Be Obvious

> ✅ **ANALYZED 2026-04-05** — Gap addressed by existing Seed rules

## Resolution

After analysis, this is **NOT a Seed gap** — the issue is already covered by existing rules:

1. **Target User Expertise** — The Seed already requires documenting target user expertise level:
   ```yaml
   target-user-expertise: beginner|intermediate|advanced|variable
   ```

2. **User Context Documentation** — The Seed requires explicit user context assumptions:
   ```yaml
   assumed-context:
     expertise-level: beginner|intermediate|advanced|variable
     terminology-preference: technical|plain|both
   ```

3. **Knowledge Type Taxonomy** — The Seed's knowledge-type system can distinguish:
   ```yaml
   knowledge-type: conceptual|factual|procedural|experiential
   ```

The "obvious knowledge" problem is solved by:
- **Entry points for different expertise levels** — Multiple starting points for beginners vs. experts
- **Terminology preferences** — `terminology-preference: plain` for novices, `technical` for experts
- **Onboarding guidance** — Required for vaults built for others

## Why This Was Misidentified as a Gap

The note conflated two separate issues:
1. **Expert authors assume baseline knowledge** — This is a content authoring issue, not a Seed rule gap
2. **Novice readers lack foundational context** — This is addressed by user-context documentation requirements

## What to Do Instead

For vaults where this is a practical problem:
1. Add onboarding notes for each expertise level
2. Create "prerequisites" notes that document assumed baseline knowledge
3. Use the `assumed-context` frontmatter on domain notes

This is a **vault-specific implementation** issue, not a **Seed rule** gap.

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

## Test Criteria (for AI Evaluation)

- [ ] Does this note clearly distinguish obvious knowledge from tacit knowledge?
- [ ] Is the resolution (addressed by existing rules) justified with specific references?
- [ ] Are the alternative solutions actionable (onboarding notes, prerequisites, assumed-context)?

## Questions for Refinement

1. Should obvious knowledge be captured as separate notes or embedded in existing notes?
2. How does obviousness differ from prerequisites?
3. Is this really a Seed gap, or is it already covered by existing rules?