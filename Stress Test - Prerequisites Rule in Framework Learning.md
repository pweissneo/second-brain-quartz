---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - prerequisites
  - programming
  - framework-learning
---

# Stress Test: Prerequisites Rule in Framework Learning (Programming)

## Seed Rule Being Tested

**Rule:** For notes tagged `difficulty: advanced` or covering multi-step concepts, include explicit `prerequisites` in frontmatter listing required background notes.

**Why:** Without prerequisite tracking, readers and AIs cannot construct coherent learning paths; complex notes become inaccessible without context.

**Test:** Pick 5 notes tagged `difficulty: advanced`. Does each have a `prerequisites` field listing the notes needed to understand it?

---

## Domain Challenge: Framework Learning

Programming frameworks (React, Django, TensorFlow) have complex, often circular or fuzzy prerequisite relationships:

1. **To learn React, you need JavaScript**
2. **But "JavaScript" itself requires HTML and CSS to make sense**
3. **Modern JavaScript (ES6+) requires understanding of older JS to appreciate why changes were made**
4. **Some framework concepts can be learned in isolation; others require broad ecosystem knowledge**

This creates prerequisite chains that are:
- **Non-linear**: Multiple valid entry points
- **Circular-ish**: Learning A helps B, but learning B also helps A
- **Variable**: Prerequisites depend on goals (frontend vs. full-stack vs. mobile)
- **Ecosystem-dependent**: Framework X version may require different prerequisites than version Y

---

## Test Case 1: Can We Identify Prerequisites for "React Hooks"?

### Challenge
"React Hooks" at first seems to require:
- JavaScript fundamentals
- React class components (to understand what hooks replace)
- Functional programming basics (for useState/useEffect)

But actually:
- You can learn hooks without ever learning class components
- Functional programming basics help but aren't strictly required
- JavaScript fundamentals are non-negotiable

**Question:** How do we distinguish "strict prerequisites" (cannot understand without) from "helpful background" (makes easier but optional)?

### The Test Fails
The Seed rule doesn't distinguish strict vs. optional prerequisites. A note with 20 "prerequisites" listed is unhelpful.

---

## Test Case 2: Circular Dependencies in Framework Ecosystems

### Challenge
Consider learning Redux:
- Redux → requires JavaScript promises/async
- But Redux Thunk → requires understanding Redux basics
- Redux Toolkit → requires understanding Redux
- Learning Redux → requires React

The dependency chain is:
```
React → JavaScript → Promises → Redux → Redux Thunk
                    ↘️
                  Redux Toolkit
```

But you could also:
```
JavaScript → React → Redux Toolkit → (skip Redux basics)
```

### The Test Fails
The Seed treats prerequisites as a simple list, not a directed graph with multiple valid paths.

---

## Test Case 3: Version-Specific Prerequisites

### Challenge
- **React 16.8+** (hooks introduced): Prerequisites differ from React 15
- **Python 2 vs Python 3**: Many tutorials mix both
- **Django 3 vs Django 4**: Some patterns deprecated

A note about "React patterns" may require different prerequisites depending on which version the reader uses.

### The Test Fails
Prerequisites don't capture version scope. A note marked for "React" doesn't specify which version.

---

## Test Case 4: Goal-Dependent Prerequisites

### Challenge
"Python for data science" requires:
- Python basics
- NumPy
- Pandas
- Visualization libraries

"Python for web development" requires:
- Python basics  
- Flask/Django
- SQL
- HTML/CSS/JS

Same language, COMPLETELY different prerequisite chains.

### The Test Fails
The Seed doesn't account for prerequisite chains that differ by use case/goal.

---

## Test Case 5: Prerequisite Depth - How Deep?

### Challenge
For "Advanced TypeScript":
- Strict: TypeScript basics → JavaScript → Programming fundamentals
- Extended: TypeScript basics → JavaScript → HTML/CSS → Web fundamentals → Programming

Where do we stop? The chain is theoretically infinite.

### The Test Fails
Without depth limits, prerequisite lists become unwieldy. The rule doesn't guide depth.

---

## Test Case 6: "You Don't Know What You Don't Know"

### Challenge
In emerging fields (AI/ML, Web3), even experts don't know all prerequisites because:
- New concepts emerge that require new prerequisite chains
- Best practices aren't established
- "Prerequisites" are debated by the community

### The Test Fails
The rule assumes prerequisites are known and static. In evolving domains, they're exploratory.

---

### Refinement 6: Different Proof Approaches Require Different Prerequisites

**Challenge**
A single mathematical topic may have multiple valid approaches with different prerequisites:

**Example: Fundamental Theorem of Calculus**
- **Approach 1 (Riemann Sums):** Requires understanding limits, summations, area under curves
- **Approach 2 (Differential Forms):** Requires understanding differential geometry, manifold theory
- **Approach 3 (Elementary):** Just requires understanding derivatives and integrals as operations

### The Test Fails
The rule assumes a single set of prerequisites per note.

---

## Proposed Seed Rule Refinements

### Refinement 1: Distinguish Strict vs. Optional Prerequisites

```yaml
prerequisites:
  required:
    - JavaScript Fundamentals
    - HTML Basics
  recommended:
    - Functional Programming Concepts
    - CSS Layout
```

**Test:** Can readers distinguish what they MUST know from what would help?

### Refinement 2: Add Goal/Use Case Context

```yaml
prerequisites:
  for-frontend:
    - React Fundamentals
    - JavaScript ES6+
  for-backend:
    - Node.js Basics
    - REST APIs
```

**Test:** Can readers find the prerequisite chain matching their goal?

### Refinement 3: Add Version Scope

```yaml
prerequisites:
  version: "React 18+"
  version: "TypeScript 5.0+"
```

**Test:** Can readers identify which version of prerequisites they need?

### Refinement 4: Add Depth Indicator

```yaml
prerequisites:
  depth: beginner  # Can start with this note
  depth: intermediate  # Some background needed
  depth: advanced  # Full prerequisite chain required
```

**Test:** Can readers assess whether they have sufficient background?

---

## Summary

| Seed Test | Result | Finding |
|-----------|--------|---------|
| Prerequisites listed | ✓ Works | But too simple |
| Advanced notes have prerequisites | ⚠️ Partial | Doesn't distinguish strict vs optional |
| AI can construct path | ❌ Fails | Multiple valid paths not captured |
| Prerequisites current | ❌ Fails | Version-specific not handled |
| Prerequisites match goals | ❌ Fails | Goal-dependent not handled |

---

## Recommendations

1. **Add to Seed:** Distinguish `prerequisites: required` from `prerequisites: recommended`
2. **Add to Seed:** Allow `prerequisites: for-[use-case]` to specify goal-dependent chains
3. **Add to Seed:** Add `prerequisites-version:` field for version-specific prerequisites
4. **Add to Seed:** Consider `prerequisite-depth:` to indicate how far back the chain goes

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]]
- [[Prerequisite Knowledge Tracking]]
- [[Frontier Exploration - Framework-Dependent Knowledge]]
- [[Stress Test - Expertise Level Rule in Foreign Language Learning]]
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]
