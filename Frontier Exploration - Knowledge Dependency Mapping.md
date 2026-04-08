---
last-updated: 2026-04-07
last-reviewed: 2026-04-08
confidence: medium
author-type: ai-assisted
knowledge-type: meta
access-pattern: learning
tags: [frontier-exploration, knowledge-dependency, bootstrapping]
---

# Frontier Exploration - Knowledge Dependency Mapping

**Core gap identified:** The Seed provides guidance on what individual notes should contain and when to create vs. extend notes, but offers minimal guidance on **dependency-aware bootstrap sequencing** — how to determine which note to create next given the current state of the vault.

## The Problem

When bootstrapping a new knowledge base, an AI agent needs to answer:
- "Given what I have, what's the highest-impact next note to create?"
- "What knowledge do I need BEFORE I can meaningfully capture X?"
- "Which notes are prerequisites for others?"

The Seed's current priority signals (blocking, high-utility, gap, curiosity) help rank candidates but don't model dependencies between notes.

## Domain: Music Theory

Imagine bootstrapping a music theory knowledge base using only current Seed rules. An agent might:
1. Create "Chord Progressions" early (high-utility)
2. Create "Scale Theory" (gap-filling)
3. Only later realize that "Intervals" is a prerequisite for both

The agent wasted effort reorganizing because it captured higher-level concepts before foundational ones.

## What the Seed Lacks

**Missing rule:** Map bidirectional dependencies between knowledge concepts — capture prerequisite notes before dependent notes, and document dependency relationships in frontmatter.

**Test:**
1. Can you identify which notes are prerequisites for others?
2. For any note >300 words, are its dependencies documented?
3. When creating a new note, can you identify what must exist first?
4. Does the vault have a dependency graph showing knowledge prerequisites?

## Implementation

```yaml
prerequisites:
  - note-name: "Intervals"
    reason: "foundational - all chords and scales built from intervals"
  - note-name: "Basic Music Notation"
    reason: "prerequisite - cannot understand theory without reading it"
```

## Related Seed Rules

- [[Seed Gap - Access-Pattern-Aware Knowledge Organization]] (integrated)
- [[Seed Refinement - Process-State Temporal Knowledge]] (integrated)
- [[Knowledge Type Taxonomy]] (integrated)
- Domain-aware capture sequence (partially covers)
- [[Frontier Exploration - Single-Point Dependency Knowledge]] (complementary gap)
