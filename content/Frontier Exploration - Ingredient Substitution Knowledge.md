---
last-reviewed: 2026-03-13
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-type
  - conditional-knowledge
  - domain-agnostic
related:
  - "[[Frontier Exploration - User Situational Constraints]]"
  - "[[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]]"
---

# Frontier Exploration: Ingredient Substitution Knowledge

## The Gap

The Seed handles conditional/troubleshooting knowledge with if-then branches and user situational constraints (time, budget, equipment). But it misses a specific pattern common in cooking, chemistry, crafts, and other动手domains:

> "If you don't have ingredient X, use Y instead, in ratio Z, noting the texture/flavor impact."

This is **substitution knowledge** - a distinct category from general troubleshooting because:
- Substitutions have specific ratios (not just binary yes/no)
- Substitutions affect the final result's properties (texture, flavor, chemistry)
- Substitutions may work in some contexts but not others (baking vs. stovetop)

## Why It Matters

Without explicit guidance, AIs building knowledge bases in动手domains will:
- Capture substitution as ad-hoc notes rather than structured knowledge
- Lose the ratio information (just say "use Y instead")
- Miss the contextual applicability (when substitution works vs. fails)
- Create duplicate notes for each ingredient pair instead of a reusable pattern

## Proposed Rule

**Rule:** For substitution knowledge (ingredient, material, or component alternatives), capture as structured conditional notes with:
- The substitution ratio (e.g., "1 cup buttermilk = 1 cup milk + 1 tbsp lemon juice")
- The property impact (texture change, flavor note, chemical behavior)
- The contextual applicability (works in baking? works in sauces? fails when?)

**Why:** Substitution knowledge is conditional by nature - it only applies when the primary ingredient is unavailable. Capturing ratios and impacts enables AIs to make informed decisions; contextual limits prevent harmful substitutions.

**Test:** For substitution notes: (1) Is there a ratio? (2) Is there a property impact description? (3) Is contextual applicability stated?

## Stress Test Findings

When stress-testing this rule against a cooking knowledge base, the following gaps were identified:

### 1. Directionality
The rule doesn't specify if substitutions are bidirectional. In cooking:
- "Butter can substitute for oil" often works (1:1 ratio usually acceptable)
- "Oil can substitute for butter" often fails (different water content affects baking)
**Gap:** Rule should specify whether substitution is one-way or bidirectional, and test should verify direction is documented.

### 2. Quality Degradation Tiers
Some substitutions work but produce notably inferior results:
- **Perfect substitute** (works identically): Buttermilk → milk + lemon (works in most baking)
- **Acceptable substitute** (noticeable difference): Applesauce for oil (works but denser result)
- **Poor substitute** (significant compromise): Water for chicken broth (technically edible but lacks flavor)
**Gap:** Rule should include quality/tier indicator so AIs can warn users about expected results.

### 3. Condition Triggers
The rule doesn't specify when to TRY a substitution:
- **Out of ingredient** (primary use case)
- **Dietary restrictions** (vegan, gluten-free, allergy)
- **Cost optimization** (cheaper alternative)
- **Availability** (seasonal, regional)
**Gap:** Rule should include trigger conditions to help AIs match substitutions to user needs.

### 4. Reversibility
Most substitution notes don't clarify if the reverse also works:
- "A can replace B" ≠ "B can replace A" in cooking
**Gap:** Add explicit `reversible: true/false` field or document both directions.

## Edge Cases

- **Universal substitutes** (salt as preservative) aren't substitution knowledge - they're general knowledge
- **Equipment alternatives** (no mixer? use hand whisk) are equipment dependencies, covered elsewhere
- **Technique substitutions** (no oven? use stovetop pan) are conditional procedural knowledge, related but different
- **Temporal substitutions** (out of season) should note freshness/quality impact

## Proposed Rule Refinement

**Rule:** For substitution knowledge (ingredient, material, or component alternatives), capture as structured conditional notes with:
- The substitution ratio (e.g., "1 cup buttermilk = 1 cup milk + 1 tbsp lemon juice")
- The property impact (texture change, flavor note, chemical behavior)
- The contextual applicability (works in baking? works in sauces? fails when?)
- The directionality (one-way or bidirectional)
- The quality tier (perfect | acceptable | poor)
- The trigger conditions (out of ingredient | dietary | cost | availability)

**Test:** For substitution notes: (1) Is there a substitution ratio? (2) Is there a property impact description? (3) Is contextual applicability stated? (4) Is directionality documented? (5) Is quality tier indicated? (6) Are trigger conditions clear?

## Implementation

```yaml
substitution:
  primary: Original ingredient
  bidirectional: false  # or true
  quality-tier: acceptable  # perfect | acceptable | poor
  triggers:
    - out-of-ingredient
    - dietary-restriction
  ratio: "1:1"  # or "1 cup X = 3/4 cup Y"
  alternatives:
    - ingredient: Substitution name
      ratio: Amount
      property-impact: Description
      context: When this works / when to avoid
```

## Related Patterns

This connects to:
- [[Frontier Exploration - User Situational Constraints]] - substitution is one way to handle missing ingredients
- [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]] - substitution is a specific branch type
- [[Frontier Exploration - Equipment and Tool Dependencies]] - equipment alternatives are similar pattern for tools
