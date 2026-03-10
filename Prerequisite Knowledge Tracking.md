---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
  - seed-extension
  - prerequisites
  - dependencies
  - learning-paths
---

# Prerequisite Knowledge Tracking

When capturing complex knowledge, track what the reader needs to know first.

## The Problem

Consider a note about "Recurrent Neural Networks" that links to:
- [[Neural Networks]]
- [[Backpropagation]]
- [[Sequence Modeling]]

But the reader might not know: Do I need to understand neural networks first? Can I jump straight to RNNs? What's the minimum path to comprehension?

The Seed's 3-hop rule handles navigation depth, but not **semantic prerequisites** — the knowledge dependencies that determine whether a note is actually understandable.

## The Challenge

Without prerequisite tracking:
- Readers hit confusing notes without context
- AIs generate learning paths that skip foundations
- The "prioritize foundational concepts" Seed rule has no enforcement mechanism
- Complex notes become inaccessible to newcomers

## Strategies for Prerequisite Tracking

### 1. Explicit Prerequisite Frontmatter

Add a `prerequisites` field to complex notes:

```yaml
---
prerequisites:
  - [[Neural Networks Basics]]
  - [[Linear Algebra Fundamentals]]
---
```

### 2. Learning Path Notes

Create dedicated path notes for sequential topics:

```markdown
# Machine Learning Fundamentals Path

1. [[Linear Algebra Fundamentals]]
2. [[Probability Basics]]  
3. [[Neural Networks]]
4. → [[Recurrent Neural Networks]]
```

### 3. Gateway Note标记

Mark "gateway" notes that unlock many other topics:

```yaml
---
gateway: true
unlocks:
  - [[Deep Learning]]
  - [[NLP]]
  - [[Computer Vision]]
---
```

### 4. Link with Context

When linking to complex notes in other notes, add context:

```markdown
[[Recurrent Neural Networks]] — requires understanding of 
[[Neural Networks]] and [[Sequence Modeling]] first
```

### 5. Difficulty Rating

Add difficulty metadata to help readers self-assess:

```yaml
---
difficulty: advanced
prerequisites:
  - [[Neural Networks]]
  - [[Linear Algebra]]
---
```

## Domain Examples

### Mathematics
- Prerequisite: Calculus before Differential Equations
- Prerequisite: Linear Algebra before Machine Learning

### Programming  
- Prerequisite: Variables before Functions
- Prerequisite: Functions before Object-Oriented Programming

### Cooking
- Prerequisite: Knife Skills before Complex Cuts
- Prerequisite: Basic Sauces before Mother Sauces

### Music
- Prerequisite: Rhythm Basics before Time Signatures
- Prerequisite: Scales before Chord Progressions

## Relationship to Other Rules

These strategies implement the Seed's prerequisite and gateway rules:
- **Prerequisites rule** (Seed line 142): For `difficulty: advanced` notes, include `prerequisites` frontmatter
- **Gateway rule** (Seed line 146): Mark notes unlocking 5+ topics with `gateway: true`

## Related
- [[AI-Assisted Knowledge Management Seed]]
