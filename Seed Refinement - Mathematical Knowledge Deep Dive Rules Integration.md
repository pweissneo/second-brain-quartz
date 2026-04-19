---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - mathematics
  - proof-structure
  - understanding-layers
  - domain-specific
last-reviewed: 2026-04-08
---

# Seed Refinement - Mathematical Knowledge Deep Dive Rules Integration

> Refinement to integrate mathematical domain knowledge handling into the Seed

## Source Gap

[[Seed Gap - Mathematical Knowledge Deep Dive Rules]] — identified gap for mathematical proof handling

## Proposed Seed Addition

Add to Section 2 (Atomicity) or domain-specific adaptations:

### Rule: Proof Structure Preservation

**Rule**: For mathematical proofs, treat the logical flow as the atomic unit — don't split proofs into atomic steps unless those steps have independent value. A proof note should be readable as a continuous argument.

**Why**: Splitting a proof into individual "fact" notes destroys the inferential structure that makes the proof valuable. The relationship between steps (therefore, hence, thus) is as important as the steps themselves.

**Test**: Can you read the proof note from start to finish and follow the logical argument? Are the logical connectors (therefore, hence, thus, consequently) preserved?

### Rule: Understanding Layers for Abstract Domains

**Rule**: For mathematical and highly abstract domains, capture knowledge in three layers:
- **Formal**: Precise definition, theorem statement, proof
- **Intuitive**: Geometric interpretation, algebraic intuition, visual representation
- **Computational**: How to actually compute, calculate, or solve problems

**Why**: Understanding mathematics requires all three layers. A student may understand the formal proof but lack computational skill, or vice versa. The knowledge base should serve all aspects of mathematical maturity.

**Test**: For major theorems/concepts, can you find all three layers? Is each layer in a separate note with clear labeling?

### Rule: Abstract Concept Handling

**Rule**: For mathematical concepts with no concrete examples, provide at least one of:
- Counterexamples (what the concept is NOT)
- Analogies to more familiar abstract concepts
- Explicit statement that no concrete example exists and why

**Why**: "Use concrete examples" fails for truly abstract concepts. But users still need something to grasp onto.

**Test**: For any abstract concept note, is there a counterexample, analogy, or explicit "no concrete example" statement?

### Rule: Long Prerequisite Chain Visualization

**Rule**: For mathematical knowledge with chains >5 deep, use a `prerequisites:` list with explicit depth tracking. Visualize the chain from foundational to advanced.

**Why**: In math, understanding Real Analysis requires knowing limits, which requires knowing sequences, which requires knowing functions, which requires knowing algebra. The chain is part of the knowledge.

**Test**: For notes with >5 prerequisites, is the chain visualized (list or diagram)? Can you see the full path from axioms to this concept?

### Rule: Notation-First Capture

**Rule**: For mathematical notation that IS the knowledge (formulas, symbols, equations), lead with the notation, then explain. Don't force verbose description when symbols convey precisely.

**Why**: Converting "∫f(x)dx" to "the integral of function f of x with respect to x" loses precision and takes more space.

**Test**: For notation-heavy notes, does the notation appear first or prominently? Is verbose explanation reserved for explaining what the notation means, not replacing it?

### Rule: Difficulty Tagging for "Trivial" Steps

**Rule**: When a proof step is marked "trivial" or "obvious," include a `difficulty-note:` field explaining:
- Why it's trivial to experts (what prior knowledge makes it obvious)
- What background a novice might need

**Test**: Can a reader understand WHY a step is trivial or what they'd need to learn?

## Implementation

Add to Seed section on domain-specific adaptations (after line ~3300):

```yaml
# Mathematical Knowledge Specifics
mathematical-proof-structure: preserve-logical-flow|atomic-steps
understanding-layers: [formal, intuitive, computational]
notation-handling: notation-first|text-expanded
prerequisite-depth-tracking: true
difficulty-note-required: true
```

## Related Notes

- [[Seed Stress Test - Mathematics Knowledge Base]]
- [[Frontier Exploration - Symbolic and Notational Knowledge]]
- [[Seed Gap - Mathematical Proof Representation]] (superseded)

## Status

Ready for Seed integration consideration. These rules address the mathematical domain gap identified during frontier exploration.

---
author: Neo
date: 2026-04-08
type: seed-refinement
