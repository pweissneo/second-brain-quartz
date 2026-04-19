---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-01
lifecycle: merged
confidence: high
gap-resolution: 2026-04-01 - Merged into Seed as verification priority cooking edge case
tags:
  - seed-refinement
  - verification-priority
  - cooking-domain
  - edge-case
  - food-safety
  - merged
---

# Seed Refinement: Verification Priority in Cooking Domain

> **Status:** This gap has been resolved and merged into the Seed on 2026-04-01.

## The Edge Case

The verification priority hierarchy rule (Level 1: safety-critical → Level 4: low) works well for most domains but has an edge case in cooking:

**Problem:** Food safety knowledge in cooking has dual nature:
1. **General food safety rules** (cross-contamination, temperature control, allergen handling) — applies universally
2. **Ingredient-specific safety** (certain fish species have parasites, raw beans are toxic, some mushrooms are poisonous) — applies to specific ingredients

The rule says prioritize Level 1 (safety-critical), but in cooking, "safety-critical" is scattered across many ingredient-specific notes, not consolidated in one hub note.

## Analysis

### Current Rule Test

For your verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`?

In cooking:
- General food safety note: likely has safety-critical: true ✓
- Ingredient-specific safety (e.g., "fugu preparation" or "jack bean toxicity"): might NOT have safety-critical tag if the note is primarily about the ingredient, not about safety

### Gap Identified

The verification priority rule assumes:
- Safety-critical notes are clearly labeled with `safety-critical: true`
- Domain experts can easily identify Level 1 knowledge

But in cooking, safety-critical knowledge is embedded in:
- Technique notes (temperature control)
- Ingredient notes (toxicity, allergies)
- Equipment notes (proper storage)
- Cleanup notes (sanitization)

A note titled "Sautéing Fundamentals" contains Level 1 knowledge (oil temperature → fire hazard, food safety) but might not have any safety-related frontmatter.

## Resolution

**Merged into Seed:** The edge case is now documented in the verification priority rule as of 2026-04-01:

> **Edge case (NEW - 2026-04-01):** In cooking domain, safety-critical knowledge is often embedded in non-safety notes — a note titled "Sautéing Fundamentals" contains Level 1 knowledge (oil temperature → fire hazard, food safety) but might not have safety-related frontmatter. Additionally, food safety has dual nature: general food safety rules (cross-contamination, temperature control) apply universally and are centralized, while ingredient-specific safety (toxic mushrooms, undercooked fish, bean toxicity) is scattered across ingredient notes and harder to identify.

The Seed now includes:
- Content keyword scanning for safety-sensitive terms
- Distinction between general vs ingredient-specific food safety
- Frontmatter extensions for `food-safety-type` and `verification-mode`

## Related Seed Rules

- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Drill-Verified Rule in Home Repair]] (similar safety-domain pattern)
- [[Frontier Exploration - Food Safety Knowledge in Knowledge Bases]] (may not exist yet)