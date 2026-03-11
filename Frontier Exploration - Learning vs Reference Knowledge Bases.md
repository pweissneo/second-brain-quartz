---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
tags:
  - seed-extension
  - frontier-exploration
  - knowledge-types
---

# Frontier Exploration: Learning vs Reference Knowledge Bases

## The Question

Does the Seed apply equally well to knowledge bases designed for **learning** (personal growth, skill acquisition) vs **reference** (looking up facts, procedures, solutions)?

## Why This Matters

The Seed assumes a general-purpose knowledge base. But:
- **Learning KBs** prioritize understanding, progression, prerequisites
- **Reference KBs** prioritize findability, quick retrieval, completeness

These goals can conflict. A learning KB might benefit from spaced repetition prompts; a reference KB doesn't need them.

## Stress Test: Applying Seed Rules to Different KB Types

### Rule: Atomicity

**Reference KB:** "How to reset a router" — one procedure, clear and complete ✓
**Learning KB:** "Understanding network fundamentals" — needs depth, not atomicity ✗

**Problem:** Atomicity works for reference but may fragment learning content unnecessarily.

### Rule: Minimum 2 Links

**Reference KB:** "Ingredients for soup" → links to soup types ✓
**Learning KB:** Prerequisite chains can create "orphan" foundational notes that don't link outward — they're meant to be reached, not to link out.

**Problem:** Forcing links on foundational learning notes creates artificial connections.

### Rule: 3-Hops Maximum

**Reference KB:** Quick retrieval, 3 hops is plenty ✓
**Learning KB:** Prerequisites create natural chains: A → B → C → D. Shortening these loses learning progression.

**Problem:** The 3-hop rule may conflict with pedagogically necessary prerequisite chains.

### Rule: Hub Notes

**Reference KB:** Hubs are essential for navigation ✓
**Learning KB:** Too many hubs can create "overview overload" — learners need depth, not more entry points.

**Problem:** Hub density may need to be lower for learning KBs.

## Key Insight

The Seed's rules are optimized for **reference** knowledge bases. Learning knowledge bases need modifications:

1. **Atomicity exception:** Learning content that builds understanding may legitimately exceed 300 words without being "procedural content"
2. **Link requirements:** Foundational notes in learning chains may have <2 outgoing links — that's intentional
3. **Hop tolerance:** Prerequisite chains in learning KBs may exceed 3 hops — pedagogical depth matters
4. **Hub caution:** Don't over-hub learning content — learners need to dive deep, not bounce between overview notes

## Proposed Seed Addition

**Rule:** Distinguish knowledge base purpose — learning vs reference — and adjust Seed rules accordingly:

| Rule | Reference KB | Learning KB |
|------|-------------|-------------|
| Atomicity | Strict (100-300 words) | Flexible for explanatory content |
| Links | Minimum 2 required | Allow prerequisite chains with <2 links |
| Hubs | Dense (5+ connections) | Sparse (avoid overview overload) |
| 3-Hops | Strict | Allow pedagogical depth |

## Test for AI Agents

1. What is this vault's primary purpose: learning or reference?
2. If learning: Are prerequisite chains preserved even if they exceed 3 hops?
3. If reference: Is findability optimized with hub density?

## Related

- [[Note Prioritization Strategy]] — What to create first
- [[Note Types and Templates]] — Different note types for different purposes
- [[Prerequisite Knowledge Tracking]] — Managing learning progressions
- [[AI-Assisted Knowledge Management Seed]] — The Seed being extended
