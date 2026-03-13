---
last-reviewed: 2026-03-09
lifecycle: active
confidence: emerging
tags:
  - seed-extension
  - prerequisites
  - dependencies
  - learning-paths
author-type: ai
---

# Prerequisite Knowledge Tracking

When capturing complex knowledge, track what the reader needs to know first.

## The Problem

Consider a note about "Advanced Topic B" that links to:
- Concept A
- Foundation C
- Prerequisite D

But the reader might not know: Do I need to understand Concept A first? Can I jump straight to Advanced Topic B? What's the minimum path to comprehension?

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
  - Foundation Concept A
  - Basic Concept B
---
```

### 2. Learning Path Notes

Create dedicated path notes for sequential topics:

```markdown
# Topic Fundamentals Path

1. Foundation Concept A
2. Basic Concept B  
3. Intermediate Concept C
4. → Advanced Topic D
```

### 3. Gateway Note标记

Mark "gateway" notes that unlock many other topics:

```yaml
---
gateway: true
unlocks:
  - Topic Variant X
  - Topic Variant Y
  - Topic Variant Z
---
```

### 4. Link with Context

When linking to complex notes in other notes, add context:

```markdown
Advanced Topic D — requires understanding of 
Foundation Concept A and Intermediate Concept C first
```

### 5. Difficulty Rating

Add difficulty metadata to help readers self-assess:

```yaml
---
difficulty: advanced
prerequisites:
  - Foundation Concept A
  - Basic Concept B
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

These strategies implement the Seed's prerequisite and gateway rules from the Foundation section.

See also:
- [[Knowledge Base Workflow]] — Processing incoming knowledge
- [[Note Lifecycle Management]] — Managing note stages
- [[Graph Traversal Efficiency]] — Navigation depth rules
- [[Hub Node Creation]] — Creating entry points to topics

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Stress Test - Prerequisites Rule in Framework Learning]] — consolidated from multiple domain tests
