---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - stress-test
  - seed-rule
  - domain-specific
  - mathematics
  - abstraction
---

# Seed Stress Test: Mathematics Knowledge Base

> Testing Seed rules against the demands of mathematical knowledge capture.

## Domain Characteristics

Mathematics presents unique challenges for knowledge management:
- **Extreme abstraction** — concepts exist independently of physical reality
- **Formal proof structure** — knowledge is logical derivation, not observation
- **Precise terminology** — small differences in wording change meaning completely
- **Hierarchical dependencies** — every theorem builds on previous theorems
- **Axiomatic foundations** — some knowledge is assumed, not derived
- **Universal truths** — math doesn't change (though understanding evolves)

## Where Current Seed Rules Excel

### Atomicity
Mathematical concepts are naturally atomic:
- "Prime number" is one idea
- "Fundamental theorem of arithmetic" is one idea
- The 100-300 word guideline works well for definitions and theorems

### Foundational Elements
The `foundational: true` tag is essential for:
- Axioms (assumed truths)
- Definitions (building blocks)
- Fundamental theorems (pillars everything else rests on)

### Prerequisites
The prerequisites system is critical:
- You cannot understand calculus without algebra
- You cannot understand algebra without arithmetic
- Long prerequisite chains are legitimate in math

## Where Current Seed Rules Struggle

### Challenge 1: Proof Representation

**Problem**: A proof is a connected argument, not a collection of atomic facts.
- The Seed assumes notes are self-contained
- But a proof's value is in the logical flow, not individual steps
- Splitting proofs into atomic steps loses the argument structure

**Current guidance**: Notes should be 100-300 words
**Reality**: A key proof might be 2000 words — splitting it destroys meaning

**Edge case applies**: "Procedural content may legitimately exceed 300 words"
**Question**: Does "proof as procedure" count? A proof is executed logically, not computationally.

### Challenge 2: Notation vs. Explanation

**Problem**: Mathematical notation IS the knowledge in some cases.
- "∫f(x)dx" means something specific that words cannot replace
- The Seed emphasizes self-contained notes
- But a note that's fully self-contained might need to explain notation (redundant) or link to notation notes (fragile)

**Test case**: Should "Integration by Parts" note:
1. Explain the notation inline (verbose but self-contained)
2. Link to a "Mathematical Notation" reference note
3. Assume reader knows notation (breaks self-containment)

### Challenge 3: Example vs. Principle

**Problem**: Math examples are essential but can fragment understanding.
- A general principle (quadratic formula) 
- Plus specific examples (solving x² + 5x + 6 = 0)
- Should examples be separate notes or integrated?

**Current rule**: One idea per note
**Reality**: The principle AND example together make the knowledge actionable

### Challenge 4: Abstract Objects

**Problem**: Math deals with objects that don't exist physically.
- Groups, rings, fields
- Manifolds, topological spaces
- How do you provide "concrete" examples for things that are inherently abstract?

**Current guidance**: Use concrete examples to explain abstract concepts
**Reality**: Abstract math may have NO concrete examples (category theory)

### Challenge 5: Proof vs. Intuition

**Problem**: Mathematical understanding has multiple levels:
- Formal proof (rigorous)
- Intuitive understanding (geometric, algebraic)
- Computational skill (ability to solve problems)

**Current rule**: Self-contained notes
**Reality**: Intuition cannot be fully formalized — how do you capture "why the proof works" separately from "how the proof works"?

### Challenge 6: Notation Standards

**Problem**: Different fields use different notation.
- Physics vs. math notation
- American vs. European notation
- Legacy vs. modern notation

**Current rule**: Terminology must be consistent
**Reality**: Inconsistency IS the standard in some cases

### Challenge 7: The "Obvious" Problem

**Problem**: What mathematicians find "obvious" differs from novices.
- A step that's "trivial" to an expert requires explanation for a student
- Current Seed has expertise level tagging
**Question**: How do you capture "trivial" steps without insulting experts or confusing students?

## Test Cases for Seed Rules

### Test: Atomicity in Mathematics

| Note | Current Seed Assessment | Math Reality |
|------|------------------------|--------------|
| "Prime Number Definition" | ✓ Atomic | ✓ One idea |
| "Proof of Infinite Primes" | ? May be too long | ✓ Logical flow essential |
| "Quadratic Formula" | ✓ Atomic | ✓ One result |
| "Completing the Square Method" | ? Procedural | ✓ Step-by-step is the knowledge |

**Finding**: Atomicity works for definitions and theorems; struggles with proofs and methods.

### Test: Self-Contained Notes

**Scenario**: Note on "Cauchy-Riemann Equations"
- Option A: Full explanation with notation + intuition + examples (1000+ words)
- Option B: Brief definition + links to notation, intuition, examples (fragmented)

**Current guidance**: Prefer self-contained
**Math reality**: Option A is better for learning; Option B is better for reference

**Finding**: Learning KB vs Reference KB distinction is critical for math.

### Test: Link Density

**Question**: How many links should a math note have?
- Definition: 2-5 links (prerequisites, related concepts)
- Theorem: 3-8 links (prerequisites, related theorems, examples)
- Proof: 5-15 links (steps, lemmas, related results)

**Finding**: Math naturally has varying link density by note type.

## Gap Analysis

An AI building a mathematics knowledge base using only current Seed rules would:

1. ✓ Create atomic notes on definitions and theorems
2. ✓ Understand prerequisite chains
3. ✗ Not know how to represent proof structure (keep together or split?)
4. ✗ Not know how to balance notation precision with self-containment
5. ✗ Not distinguish between "knowing a theorem" and "understanding why it works"
6. ✗ Not have guidance on abstract concepts with no concrete examples
7. ✗ Not know how to tag difficulty for "trivial" steps

## Proposed Seed Enhancements

### Enhancement 1: Proof Structure Rule

**Rule**: For mathematical proofs, prefer keeping the proof as a single note when the logical flow is essential to understanding. Split only if:
- The proof has independently valuable lemmas
- Parts are referenced separately elsewhere
- The proof exceeds 2000 words

**Why**: The value of a proof is often the logical argument, not individual steps. Splitting destroys this.

**Test**: Can you understand the proof's strategy from reading the note in order?

### Enhancement 2: Notation Clarity

**Rule**: Mathematical notation should be explained inline on first use in any note, with optional links to a notation reference for readers who want deeper background.

**Why**: Self-contained notes take priority for mathematical understanding. Notation is too fundamental to externalize.

**Test**: Could a reader who knows the prerequisites but not this specific notation understand the note?

### Enhancement 3: Understanding Layers

**Rule**: For mathematical concepts, consider capturing multiple layers:
- **Formal**: The precise definition/theorem
- **Intuitive**: Geometric or algebraic interpretation
- **Computational**: How to actually calculate/solve

**Why**: Mathematical understanding requires all three; notes that capture only one are incomplete for learning.

**Test**: Can a learner find formal, intuitive, and computational understanding for major concepts?

### Enhancement 4: Abstract Concept Handling

**Rule**: For abstract mathematical concepts with no concrete examples, use:
- Counterexamples (what it is NOT)
- Analogies to more familiar abstract concepts
- Explicit statement that no concrete example exists

**Why**: Learners need something to hold onto even for highly abstract concepts.

**Test**: For any abstract note, can you find at least one of: example, counterexample, or analogy?

### Enhancement 5: Difficulty Tagging for "Trivial" Steps

**Rule**: When a step is marked "trivial" or "obvious," include a `difficulty-note:` field explaining:
- Why it's trivial to experts (what prior knowledge makes it obvious)
- What background a novice might need

**Why**: "Trivial" is relative. Making the assumption explicit helps learners and reveals what knowledge is being assumed.

**Test**: Can a reader understand WHY a step is trivial (or what they'd need to learn to see it as trivial)?

## Related Notes

- [[Atomic Note Principle]] — Core atomicity guidance
- [[Stress Test - Stub Notes Rule in Mathematics Knowledge Base]] — Related exploration
- [[Knowledge Abstraction Levels]] — Formal vs. intuitive understanding
- [[Frontier Exploration - Iterative Creative Knowledge]] — Related: proof as iterative reasoning
- [[AI-Assisted Knowledge Management Seed]] — Source of rules being tested
