---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
tags:
  - seed-stress-test
  - mathematics-domain
  - edge-case
---

# Stress Test: Prerequisites Rule in Mathematics Domain

## Seed Rule Being Tested
**Rule:** For notes tagged `difficulty: advanced` or covering multi-step concepts, include explicit `prerequisites` in frontmatter listing required background notes.
**Test:** Pick 5 notes tagged `difficulty: advanced`. Does each have a `prerequisites` field listing the notes needed to understand it?

## Application to Mathematics Knowledge Base

### Where the Rule Works Well
> ⚠️ *Illustrative examples — hypothetical notes for a math knowledge base, not actual links*

- **Calculus** → prerequisites: Algebra, Trigonometry
- **Linear Algebra** → prerequisites: Basic Arithmetic, Abstract Thinking
- **Differential Equations** → prerequisites: Calculus, Linear Algebra

### Edge Case 1: Prerequisites Form a DAG, Not a Linear List

**Problem:** In mathematics, prerequisites form a directed acyclic graph (DAG), not a simple list:

```
Calculus Prerequisites:
├── Pre-Calculus
│   ├── Algebra II
│   │   └── Algebra I
│   └── Trigonometry
└── Mathematical Analysis (foundations)
```

The current rule suggests a flat list, but mathematics requires a graph of dependencies.

**The Test Fails:** A simple prerequisites list can't capture:
- Multiple paths to the same concept
- "Soft" vs "hard" prerequisites
- Which prerequisites are foundational vs. supplementary

### Edge Case 2: Soft vs. Hard Prerequisites

**Problem:** Some prerequisites are truly required, others are "helpful but not essential":

- **Hard Prerequisite:** Cannot possibly understand without it
  - Understanding derivatives requires understanding limits
  
- **Soft Prerequisite:** Helpful background but not blocking
  - Understanding group theory helps with abstract algebra but isn't required

The rule doesn't distinguish these, treating all prerequisites as equal.

### Edge Case 3: Prerequisite Chains Create Circular Definitions

**Problem:** Some mathematical concepts are interdependent:

- **Geometry** and **Algebra** both trace back to foundational axioms
- **Set Theory** is foundational but itself requires basic logical reasoning
- Defining prerequisites strictly can create apparent circularity

### Edge Case 4: Different Proof Approaches Require Different Prerequisites

**Problem:** A single mathematical topic may have multiple valid approaches with different prerequisites:

**Example: Fundamental Theorem of Calculus**
- **Approach 1 (Riemann Sums):** Requires understanding limits, summations, area under curves
- **Approach 2 (Differential Forms):** Requires understanding differential geometry, manifold theory
- **Approach 3 (Elementary):** Just requires understanding derivatives and integrals as operations

The rule assumes a single set of prerequisites per note.

### Edge Case 5: Self-Referential Prerequisites

**Problem:** Advanced notes may need prerequisites that include "simpler versions" of themselves:

> ⚠️ *Illustrative examples*

- **Real Analysis** → prerequisites include **Calculus** (the "simple" version)
- **Abstract Algebra** → prerequisites include **Basic Math** (but also builds intuition from concrete examples)
- **Topology** → prerequisites include **Set Theory** but also benefits from **Metric Spaces**

### Edge Case 6: Prerequisites Change Based on Audience

**Problem:** The same note may have different prerequisites for different audiences:

- **For Undergraduates:** Prerequisites: Calculus I, II, III, Linear Algebra
> ⚠️ *Illustrative example*

- **For High School Students:** Prerequisites: AP Calculus BC, Strong Algebra
> ⚠️ *Illustrative example*

- **For Researchers:** Prerequisites: None (foundational)
> ⚠️ *Illustrative example*

The rule doesn't account for audience-specific prerequisite lists.

## The Real Issue

The prerequisites rule assumes:
1. Prerequisites can be listed as a simple array
2. All prerequisites are equally required
3. There's one correct prerequisite set per note

Mathematics (and other hierarchical disciplines) violate all three assumptions.

## Recommendation

**Refined Rule:** For notes with complex prerequisite chains, include a `prerequisites` field that can specify:
- `required`: Must be understood before this note
- `recommended`: Helps but not blocking
- `alternative`: Another path to understanding this note
- `audience`: Different prerequisites for different expertise levels

**Example Frontmatter:**
> ⚠️ *Illustrative example — not actual notes, hypothetical for demonstration*

```yaml
prerequisites:
  required:
    - Calculus I  # example topic name
    - Linear Algebra  # example topic name
  recommended:
    - Mathematical Proofs  # example topic name
  alternative:
    - approach: intuitive
      notes: Calculus Visualized  # example topic name
    approach: formal
      notes: Real Analysis  # example topic name
```

**Test:**
1. Can you identify which prerequisites are blocking vs. helpful?
2. Are there multiple valid approaches with different prerequisites?
3. Does the note acknowledge audience-specific variations?

## Related
- [[Graph Traversal Efficiency]]
- [[Hub Node Creation]]
- [[Frontier Exploration - Learning vs Reference Knowledge Bases]]
- [[Confidence Markers]]
- [[Prerequisite Knowledge Tracking]]
