---
last-updated: 2026-04-05
confidence: medium
lifecycle: seedling
author-type: ai-assisted
access-pattern: decision
knowledge-type: procedural
verification-status: unverified
verification-mode: reasoning
tags:
  - frontier-exploration
  - operational-knowledge
  - domain-transformation
  - scale-awareness
---

# Frontier Exploration - Domain Transformation Knowledge

## The Problem

When bootstrapping a knowledge base in a domain like cooking, an AI agent encounters knowledge that transforms based on operational parameters — not just static facts or concepts. The current Seed handles what knowledge exists, but not how knowledge changes based on context variables.

## Examples of Transformation Knowledge

**Cooking Domain:**
- **Scaling:** Recipe quantities need adjustment based on serving size changes
- **Ingredient substitution:** One ingredient can replace another with adjustment rules
- **Pan-size adjustment:** Cooking time changes based on surface area and depth
- **Altitude adaptation:** Baking requires modifications at high altitudes
- **Temperature-time relationships:** Lower temperature requires longer time

**DIY/Construction:**
- **Material quantity calculation:** Paint/splywood coverage based on surface area
- **Load-bearing calculations:** Material strength based on dimensions
- **Time estimation:** Labor time based on square footage, complexity factors

**Medical/Dosage:**
- **Weight-based dosing:** Medication quantity based on patient weight
- **Age-adjusted parameters:** Dosage changes for different age groups

## Why Current Seed Rules Don't Cover This

The Seed focuses on:
- What knowledge to capture (atomicity, linking)
- How to verify it (verification modes, priority)
- How to organize it (taxonomy, retrieval patterns)

But it doesn't explicitly address: **how to handle knowledge that is defined as a function of variable inputs**.

## The Gap

The Seed lacks rules for:

1. **Transformation rule identification:** How to recognize when knowledge is a function rather than a static value

2. **Parameter scope definition:** What variables affect the transformation, and what are their valid ranges

3. **Edge case handling:** What happens when parameters go outside normal ranges (e.g., recipe for 1000 servings)

4. **Cascade effects:** When changing one parameter cascades to others (scaling a recipe changes cooking time)

5. **Precision vs. flexibility trade-offs:** Some transformations are exact (metric conversion), others are heuristic (a pinch more salt)

## Proposed Seed Rules

**Rule:** Identify and tag transformation knowledge — knowledge that exists as a function of input parameters rather than as static content.

**Why:** Transformation knowledge requires different storage (formula + parameters) and retrieval (input → output) patterns than static knowledge. Default approaches treat everything as static, leading to either infinite note variants or missing the transformation logic.

**Test:** For any knowledge that could vary based on context: (1) Can you identify the input parameters? (2) Can the output be computed from inputs? (3) Are the parameter ranges defined? (4) Is the transformation rule explicit?

**Rule:** For transformation knowledge, store the transformation function separately from the specific instances.

**Why:** Storing every possible variant bloats the vault. Storing only the specific case loses the transformation capability. The function + parameters approach enables generation of any needed variant.

**Test:** Can you generate a new variant without having a pre-existing note for it? Does the transformation rule enable this?

**Rule:** Define parameter validity bounds for transformation knowledge — what ranges produce valid outputs.

**Why:** Transformations often have bounds beyond which they fail. A recipe scaled 100x may behave differently than expected. A weight-based dose formula may not work for extreme weights.

**Test:** Can you identify the valid parameter range? Does the knowledge base handle out-of-bounds cases?

## Related Notes

- [[Frontier Exploration - Domain Jargon vs Plain Language]] — terminology handling
- [[Seed Gap - Mathematical Knowledge Deep Dive Rules]] — transformation formulas in mathematical domains
- [[Frontier Exploration - Condition-Triggered Knowledge]] — similar but focuses on conditions rather than transformations

## Status

This is a **seedling** note — it identifies a potential gap but needs development into a full Seed rule. The concept of "transformation knowledge" as distinct from static or procedural knowledge may be a useful addition to the knowledge type taxonomy.