---
last-reviewed: 2026-03-15
last-updated: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - domain-gap
  - meal-planning
  - coordination
  - cooking
---

# Frontier Exploration: Multi-Dish Meal Coordination Knowledge

## The Gap

The current Seed handles individual procedural notes (recipes, techniques) well, but has limited guidance for **knowledge about coordinating multiple interdependent dishes** — a meal where timing, flavor balance, and resource management must be orchestrated together.

## Why This Matters

Building a knowledge base about cooking eventually requires:
1. **Menu planning** — selecting dishes that work together
2. **Timing coordination** — sequencing so everything finishes together
3. **Flavor balancing** — ensuring courses complement rather than compete
4. **Resource management** — shared equipment, oven space, stovetop slots
5. **Make-ahead decisions** — what can be prepped vs. must be fresh

These are distinct from individual recipe knowledge.

## Questions an AI Would Struggle With

Given the current Seed rules applied to cooking:
- "How do I plan a 3-course meal?" — no explicit guidance
- "Which dishes should I serve before fish vs. after?" — no rule
- "How do I time a soup + roasted chicken + dessert?" — procedural but multi-dish
- "What should I cook given only a sheet pan and one pot?" — constraint-based planning

## Related Existing Coverage

The Seed DOES cover:
- [[Rule: Document physical equipment dependencies]] — equipment constraints
- [[Rule: For knowledge where applicability depends on user situational constraints]] — constraint scoping
- [[Rule: Track knowledge gaps explicitly]] — gap discovery

But multi-dish coordination is a specific gap.

## Proposed Seed Rule

**Rule:** For domains with interdependent multi-item creation (cooking meals, event planning, project portfolios), create coordination knowledge separate from item knowledge — document timing relationships, resource conflicts, and sequencing rules as atomic notes.
**Why:** Individual item notes (recipes, tasks) are atomic; coordination knowledge is orthogonal. Without explicit coordination notes, the vault contains recipes but lacks meal-level guidance.
**Test:** Can you find coordination notes for multi-item events? Do timing relationships exist as separate notes? Are resource conflicts documented?

## Edge Cases

- Some domains have natural coordination structures (concert programs, meeting agendas) — treat similarly
- Multi-dish coordination knowledge is often personal/preference-based — capture individual context
- Make-ahead vs. fresh timing creates different coordination requirements

## Status

This is an initial exploration. The gap may be addressable through existing rules with better application guidance, or may require a new Seed rule.
