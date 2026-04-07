---
last-reviewed: 2026-03-15
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - learning
  - curriculum
  - progression
---

# Frontier Exploration - Learning Progression and Curriculum Design

> How do you capture the implicit ordering of knowledge in a domain? When building a knowledge base for learning purposes, how do you determine what to learn first, second, and why?

## The Problem

When bootstrapping a knowledge base in a new domain for learning purposes (not just reference), you face questions the Seed doesn't explicitly answer:

1. **What makes something "foundational"?** - The Seed says prioritize foundational concepts, but how do you identify what's actually foundational vs. what's just familiar?
2. **How do you sequence learning?** - If note A depends on note B, the order is clear. But what about parallel dependencies or mutually reinforcing knowledge?
3. **When does order NOT matter?** - Some knowledge can be learned in any order. How do you identify these?
4. **What's the minimum viable start?** - For a domain you know nothing about, where do you begin?

## Existing Coverage

The Seed touches on related concepts:
- [[Frontier Exploration - Knowledge Abstraction Levels]] - abstraction tiers help organize depth
- Prerequisites in frontmatter - explicit dependency tracking
- Learning vs. reference KB distinction - purpose matters

What's missing: **explicit curriculum design principles**

## Gap Analysis

### What's NOT Covered

1. **How to identify domain-specific primitives** - In cooking, salt and heat are primitives. In programming, variables and functions are primitives. What makes something a primitive vs. derived?

2. **How to assess learning prerequisites vs. content prerequisites** - You might need "basic algebra" as a learning prerequisite, but the content note might assume "understanding of equations"

3. **How to design a learnable sequence** - Not just dependency order, but pedagogical order that builds intuition

4. **How to know when you've covered "enough" for basic competence** - The Seed's domain completeness rules focus on reference completeness, not learning completeness

5. **How to handle mutually-supporting knowledge** - Where A and B both help understand each other (like vocabulary and grammar in language learning)

## Potential Seed Rule

```
Rule: Define explicit learning progression for learning-focused vaults — identify 
entry points, milestone nodes, and exit criteria.
Why: Without explicit progression, learning vaults become reference vaults 
in disguise. Learners need a path, not just a graph.
Test: Can you trace a learning path from zero to basic competence? Are there 
explicit milestone notes marking progress? Can a learner determine when they've 
"completed" the basics?
```

## Test Scenario

**Domain:** Home bread baking

**Current Seed approach:**
- Create atomic notes on ingredients, techniques, equipment
- Link with prerequisites
- Set up hub notes by bread type

**What's missing:**
- What's the first thing a complete beginner should learn? (Not "what's foundational" but "what's learnable first")
- What knowledge enables all other knowledge? (In bread: understanding yeast activity)
- What's the minimum set to bake a basic loaf? (Not comprehensive, just functional)
- How do you know when you're ready to try advanced techniques?

## Questions to Resolve

1. Should learning progression be captured as:
   - A dedicated "curriculum" note with ordered list?
   - Linked milestone notes with explicit sequence?
   - Prerequisite chains with "learning order" metadata?

2. How do you distinguish "content dependencies" from "learning dependencies"?
   - Content: can't understand B without A
   - Learning: understanding A makes B easier but not required

3. Should the Seed recommend a specific learning theory approach?
   - Scaffolded complexity (Vygotsky)
   - Spiral curriculum (Bruner)
   - Discovery learning

## Related Notes

- [[Frontier Exploration - Knowledge Abstraction Levels]]
- [[Frontier Exploration - Prerequisites and Learning Paths]]
- [[Stress Test - Prerequisites Rule in Framework Learning]]

## Next Steps

This frontier needs:
1. Stress testing across multiple domains (language, crafts, technical subjects)
2. Testing whether learning progressions should be explicit notes vs. metadata
3. Determining minimum viable entry criteria for different domain types
