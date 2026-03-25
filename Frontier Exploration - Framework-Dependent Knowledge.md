---
last-reviewed: 2026-03-18
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - framework
  - context-dependent
  - knowledge-type
---

# Frontier Exploration: Framework-Dependent Knowledge

Knowledge that is valid within one framework but not others presents unique challenges for AI-managed knowledge bases. This note explores the patterns and solutions.

## The Problem

Some knowledge is inherently framework-dependent:

- **Programming paradigms**: OOP principles don't apply to functional programming
- **Legal systems**: Contract law varies by jurisdiction
- **Medical approaches**: Western medicine vs. traditional medicine have different foundational assumptions
- **Design frameworks**: UX methodologies conflict with each other

When an AI builds a knowledge base, it may incorrectly apply rules from one framework to another, or fail to recognize when knowledge is context-specific.

## Types of Framework Dependency

### 1. Assumption Dependencies

Knowledge that rests on unstated assumptions:

```
"Use inheritance for code reuse" 
→ Assumes OOP paradigm
→ Doesn't apply to functional programming
```

### 2. Validity Dependencies

Knowledge that's true in one context but false in another:

```
"Most birds can fly"
→ True for most birds
→ False for penguins, ostriches
→ Framework: biology taxonomy
```

### 3. Methodology Conflicts

Different frameworks prescribe conflicting approaches:

```
"Start with user interviews" (Design Thinking)
vs.
"Start with market data" (Lean Startup)
```

Neither is universally correct.

## Proposed Rule

**Rule:** For framework-dependent knowledge, document the framework explicitly in frontmatter and link to alternative frameworks.

**Why:** Without explicit framework tags, AIs cannot distinguish between universal principles and context-specific guidance. Users may apply incorrect knowledge to their situation.

**Test:** For notes about methods, principles, or approaches: (1) Is the framework explicitly stated? (2) Are alternative frameworks linked? (3) Can you identify what assumptions the knowledge rests on?

## Implementation

### Frontmatter Schema

```yaml
framework-dependent: true
frameworks:
  - name: "Design Thinking"
    validity: "When user-centered design is priority"
  - name: "Lean Startup"
    validity: "When validated learning is priority"
assumptions:
  - "Users know what they want"
  - "Iteration improves outcomes"
```

### Note Structure

For framework-dependent notes:

1. **State the framework explicitly** in the first sentence
2. **Link to alternatives** in a "Alternatives" section
3. **List assumptions** that the framework makes
4. **Note applicability** when this knowledge applies vs. fails

## Stress Test Findings

Testing this concept against multiple domains revealed:

### 1. Framework Hierarchies

Some frameworks are subsets of others:
- Agile ⊂ Project Management
- Design Thinking ⊂ User Experience

**Gap:** Rule should capture framework relationships (subset, superset, parallel, conflicting).

### 2. Framework Evolution

Frameworks change over time:

**Gap:** Rule should include temporal validity (when was this framework dominant?).

### 3. Personal Frameworks

Individuals develop personal methodologies:

**Gap:** How to handle framework-dependent knowledge that's personal vs. established?

### 4. Hybrid Approaches

Modern practice often combines frameworks:

**Gap:** How to document knowledge that's a synthesis of multiple frameworks?

## Edge Cases

- **Universal principles** (logic, mathematics) aren't framework-dependent - don't tag these
- **Domain-specific jargon** isn't the same as framework-dependent - distinguish terminology from methodology
- **Skill levels** create framework-like boundaries (beginner vs. advanced approaches)

## Related

- [[Exportable Rules]]
- [[Frontier Exploration - Knowledge Abstraction Levels]]
- [[Frontier Exploration - Context-Gated Knowledge]]
- [[Domain-Specific Knowledge Bases]]
