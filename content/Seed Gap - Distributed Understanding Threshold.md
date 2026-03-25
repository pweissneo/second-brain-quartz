---
last-reviewed: 2026-03-24
last-updated: 2026-03-24
lifecycle: nascent
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
- seed-gap
- atomicity
- distributed-knowledge
---

# Seed Gap - Distributed Understanding Threshold

## The Problem

The Seed's atomicity rules focus on keeping executable workflows together and splitting genuinely reusable components. But there's a gap: **notes that require distributed understanding** — knowledge that cannot be fully understood by reading any single note, but requires synthesizing information across 3+ notes.

### Examples

- A photography composition principle that only makes sense when combined with specific lighting notes and subject-matter notes
- A cooking technique that depends on understanding flavor profiles from separate notes
- A legal concept that requires understanding both procedural rules and substantive rights from different notes

### Why Current Rules Fail

The atomicity rule says "split if parts are independently reusable." But distributed understanding notes have parts that are **not independently useful** — they're only valuable together. Splitting them creates fragmented knowledge that loses its integrated value.

The 2-link minimum rule also doesn't address whether those links are **complementary** (multiple notes needed for understanding) vs. **redundant** (any single note sufficient).

## What the Seed Lacks

A rule addressing:
1. When knowledge is intentionally distributed across multiple notes for integrated understanding
2. How to signal that notes require multi-note reading
3. How to ensure distributed notes stay synchronized
4. How to balance atomicity with integration needs

## Proposed Rule Structure

**Rule:** Identify and explicitly mark notes requiring distributed understanding — notes where complete comprehension requires synthesizing 3+ sources.
**Why:** Distributed knowledge is structurally different from atomic knowledge. Without explicit marking, agents may split distributed notes into "independently reusable" pieces that actually destroy integrated value. The atomicity rule optimizes for reuse, but some knowledge value lies in the relationships between concepts, not the concepts themselves.
**Test:** Can you identify notes where: (a) each component is not independently meaningful, (b) the whole is greater than sum of parts, (c) understanding requires reading multiple notes in sequence?

**Implementation:** Use frontmatter to mark distributed notes:
```yaml
distributed-understanding: true
components:
  - [[Note A]]
  - [[Note B]]
  - [[Note C]]
synthesis-note: [[This note]]
```

Alternative: Create a hub note that explicitly synthesizes the distributed components, and mark component notes with `requires-synthesis: true`.

## Domain Applicability

This gap is most critical in:
- Creative composition (cooking, writing, music)
- Complex procedural knowledge (legal, medical)
- Theory-to-practice domains (physics, engineering)
- Interconnected systems (home automation, ecosystem management)

## See Also

- [[Atomic Note Principle]]
- [[Seed Gap - Knowledge Reorganization vs In-Place Updates]]
- [[Frontier Exploration - Knowledge Synthesis Quality]]
