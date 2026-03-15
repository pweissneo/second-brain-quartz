---
last-reviewed: 2026-03-13
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-type
  - conditional-knowledge
  - domain-agnostic
related:
  - "[[Frontier Exploration - User Situational Constraints]]"
  - "[[Frontier Exploration - Conditional and Troubleshooting Knowledge]]"
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

## Edge Cases

- **Universal substitutes** (salt as preservative) aren't substitution knowledge - they're general knowledge
- **Equipment alternatives** (no mixer? use hand whisk) are equipment dependencies, covered elsewhere
- **Technique substitutions** (no oven? use stovetop pan) are conditional procedural knowledge, related but different

## Related Patterns

This connects to:
- [[Frontier Exploration - User Situational Constraints]] - substitution is one way to handle missing ingredients
- [[Frontier Exploration - Conditional and Troubleshooting Knowledge]] - substitution is a specific branch type
- [[Frontier Exploration - Equipment and Tool Dependencies]] - equipment alternatives are similar pattern for tools
