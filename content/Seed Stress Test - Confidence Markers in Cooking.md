---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
schema-version: "1.0"
tags:
  - verification
  - edge-case
  - cooking
  - embodied-knowledge
---

# Seed Stress Test: Confidence Markers in Cooking

> Stress testing the confidence marker rule against the cooking domain reveals a gap in how confidence is interpreted for experiential knowledge.

## The Rule

The Confidence Markers rule defines confidence levels as:
- **high**: Well-verified, multiple sources, strong evidence
- **medium**: Some verification, reasonable confidence  
- **low**: Limited evidence, personal experience only, or theoretical
- **unknown**: Not yet assessed

## Stress Test: Cooking Domain

**Does the rule make sense for cooking?**
Partially. Confidence matters for recipe reliability, but the rule conflates two distinct concepts that cooking exposes:

1. **Source confidence** — Is this recipe from a trusted source?
2. **Execution confidence** — Have you personally made it successfully in YOUR kitchen?

A recipe can have high source confidence (from a trusted cookbook) but low execution confidence (you haven't tried it yet, or it failed in your conditions due to altitude, equipment, or ingredient differences).

**Is the Test executable by an AI?**
The test "is confidence level appropriate" is subjective. An AI cannot easily assess whether a recipe works in the user's specific conditions.

**Edge case where the rule fails:**
In cooking (and other embodied knowledge domains), source verification ≠ execution verification. A recipe from Ferran Adrià's cookbook (highest source credibility) might fail catastrophically at home due to:
- Altitude (affects baking temperatures and leavening)
- Equipment differences (professional vs home ovens can vary 50°F+)
- Ingredient availability (substitutions change results)
- Personal technique (some skills require hands-on learning)

## Gap Identified

The Confidence Markers rule needs a distinction between:
- `confidence: source-based` — how reliable is the source?
- `confidence: execution-based` — has this been personally verified in your context?

This is similar to the existing `verification-status` distinction but applies specifically to confidence levels for embodied knowledge.

## Test for Cooking

For cooking notes: Can you identify both the source confidence AND whether you've personally executed the recipe successfully in your conditions? If only source confidence is tracked, the note is incomplete for cooking knowledge.

## Related Seed Rules

- [[Verification Status]] - already handles verification separately
- [[Embodied Knowledge]] - has sensory component guidance
- Diminishing returns testing for experiential domains