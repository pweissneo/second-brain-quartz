---
gap-status: partially-resolved
last-reviewed: 2026-03-28
last-updated: 2026-04-08
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - mathematics
  - proof-representation
  - understanding-layers
  - frontier-exploration
resolution-notes: "Seed atomicity section (lines 2124-2174) now covers mathematical notation handling via edge cases. Proof structure and understanding layers remain as identified gaps. See Seed lines 1286-1289 for notation rules."
---
gap-status: identified

# Seed Gap - Mathematical Knowledge Deep Dive Rules

> Gap identified via FRONTIER_EXPLORATION on 2026-03-28

See also: [[Seed Gap - Mathematical Proof Representation]] | [[Seed Stress Test - Mathematics Knowledge Base]] | [[Frontier Exploration Hub]]

## Gap Description

The Seed has rules for mathematical notation elements (line 1286-1289) and symbolic encoding (line 3441-3443), but when building a mathematics knowledge base from scratch, an AI would still get stuck on:

1. **Proof-as-architecture** — The logical flow of a proof IS the knowledge; treating proofs like recipes misses the point
2. **Understanding layers** — Formal proof, intuitive explanation, and computational skill are distinct and equally important
3. **Abstract concepts without examples** — Category theory, set theory, topology often have no "concrete" examples
4. **Prerequisite chains** — Mathematical knowledge has extremely long dependency chains (algebra → trig → calculus → analysis)
5. **Notation as knowledge** — Sometimes the notation itself IS what you're capturing, not description of it

## What's Already in Seed

- Line 1286-1289: Theorem/lemma statements below word count
- Line 3441-3443: Symbolic vs text encoding for notation domains
- Edge case: mathematical notation elements are atomic

## What's Missing

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

### Rule: Difficulty Tagging for "Trivial" Steps (merged from Seed Gap - Mathematical Proof Representation)

**Rule**: When a proof step is marked "trivial" or "obvious," include a `difficulty-note:` field explaining:
- Why it's trivial to experts (what prior knowledge makes it obvious)
- What background a novice might need

**Test**: Can a reader understand WHY a step is trivial or what they'd need to learn?

## Source

- [[Seed Stress Test - Mathematics Knowledge Base]] (full stress test analysis)
- [[Seed Gap - Mathematical Proof Representation]] (previous gap note)
- [[AI-Assisted Knowledge Management Seed]] (current rules)
- [[Frontier Exploration - Symbolic and Notational Knowledge]] (notation handling)

## Status

**Identified** - These rules should be added to Seed section 2 (Atomicity) or section on domain-specific adaptations
**Merged** (2026-03-28): Merged content from [[Seed Gap - Mathematical Proof Representation]] (duplicate coverage of mathematical proof handling). That note is now superseded.

## Related Gaps

- [[Seed Gap - Mathematical Proof Representation]] (superseded - merged 2026-03-28)

## Gap Severity

- **Blocking**: Proof structure rule is needed to prevent harmful splits
- **Useful**: Understanding layers and abstract concept handling improve quality
- **Nice-to-have**: Long prerequisite chain visualization and notation-first capture

---
gap-status: identified

[[_root]] | [[Seed Gap Analysis Methodology]]