---
last-reviewed: 2026-03-25
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - mathematics
  - proof-representation
  - atomicity
---

# Seed Gap - Mathematical Proof Representation

> Gap identified via SEED_STRESS_TEST on 2026-03-25

## Gap Description

The Seed's procedural content exception handles recipes, code tutorials, and technical specs, but mathematical proofs have unique requirements not addressed:

1. **Proof structure is the knowledge** - Unlike recipes where steps can be reordered, a proof's logical flow IS its value
2. **Notation precision** - Mathematical notation IS knowledge; explaining inline vs referencing creates tension
3. **Understanding layers** - Formal proof, intuitive understanding, and computational skill are distinct
4. **Abstract concepts** - May have no concrete examples, only counterexamples or analogies

## Current Seed Coverage

- Line 997: Theorem/lemma statements allowed below word count (proves are supplementary)
- Line 1387: Mathematical proofs get `review-interval: never`
- Procedural content exception (line 978) applies to recipes, code, tutorials

## What's Missing

### Enhancement 1: Proof Structure Rule

**Rule**: For mathematical proofs, prefer keeping the proof as a single note when the logical flow is essential to understanding. Split only if:
- The proof has independently valuable lemmas
- Parts are referenced separately elsewhere
- The proof exceeds 2000 words

**Test**: Can you understand the proof's strategy from reading the note in order?

### Enhancement 2: Notation Clarity Rule

**Rule**: Mathematical notation should be explained inline on first use in any note, with optional links to a notation reference for deeper background.

**Test**: Could a reader who knows the prerequisites but not this specific notation understand the note?

### Enhancement 3: Understanding Layers Rule

**Rule**: For mathematical concepts, capture multiple layers:
- **Formal**: The precise definition/theorem
- **Intuitive**: Geometric or algebraic interpretation  
- **Computational**: How to actually calculate/solve

**Test**: Can a learner find formal, intuitive, and computational understanding for major concepts?

### Enhancement 4: Abstract Concept Handling Rule

**Rule**: For abstract mathematical concepts with no concrete examples, use:
- Counterexamples (what it is NOT)
- Analogies to more familiar abstract concepts
- Explicit statement that no concrete example exists

**Test**: For any abstract note, can you find at least one of: example, counterexample, or analogy?

### Enhancement 5: Difficulty Tagging for "Trivial" Steps

**Rule**: When a step is marked "trivial" or "obvious," include a `difficulty-note:` field explaining:
- Why it's trivial to experts (what prior knowledge makes it obvious)
- What background a novice might need

**Test**: Can a reader understand WHY a step is trivial or what they'd need to learn?

## Source

- [[Seed Stress Test - Mathematics Knowledge Base]] (full analysis)
- [[AI-Assisted Knowledge Management Seed]] (rules being tested)

## Status

**Proposed** - Enhancements should be added to Seed section 2 (Atomicity)
