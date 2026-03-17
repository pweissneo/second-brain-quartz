---
last-reviewed: 2026-03-16
lifecycle: deprecated
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - frontier-exploration
  - knowledge-prioritization
---

# Stress Test: Diminishing Returns in Experiential Domains

> **DEPRECATED:** This note has been superseded by [[Stress Test - Diminishing Returns Experiential Domains Refinement]]. The refined version includes comprehensive verification workflows and operational guidance.

## Rule Tested
**Diminishing returns testing**: Skip or defer if a note fails 2+ of: utility, connection, uniqueness, effort.

## Domain Applied
**Cooking** (experiential knowledge)

## Findings

### The Problem
The diminishing returns test assumes knowledge can be evaluated for utility WITHOUT execution. In reference KBs (programming, law), you can assess:
- Does this improve answers? (read and judge)
- Does it connect naturally? (analyze links)
- Is it unique? (compare to existing)

But in **experiential domains**, you often CANNOT evaluate utility without DOING:
- A recipe might look similar to existing ones but taste completely different when executed
- A cooking technique might seem redundant in description but be transformative in practice
- "Unique" in cooking is subjective - a minor variation might be precisely what someone needs

### Edge Case Needed
The Seed needs an edge case for **experiential domains** where evaluation requires execution:

> **Edge case:** In experiential domains (cooking, music, crafts, physical skills), diminishing returns testing should account for **execution uncertainty**. A note that fails 2+ tests MAY still be worth capturing if: (1) it represents a method/technique not personally verified, (2) the outcome depends on individual skill or context, (3) slight variations might produce materially different results. Apply "try before judge" logic: capture potentially redundant recipes/techniques, but tag with `verification-status: unverified` and prioritize testing over passive expansion.

### Test Refinement
For experiential domains, the test should include:
- **Execution feasibility**: Can I actually test this? (time, ingredients, skill)
- **Outcome uncertainty**: Even if described similarly, might the result differ?
- **Personal gap**: Even if others have it, do I need hands-on experience?

If the note fails diminishing returns BUT passes execution feasibility → capture and test.

## Related Seed Rules
- [[Active Reading]] - processing knowledge vs. consuming
- [[Knowledge Activation States]] - captured → processed → verified → applied
- [[Procedural Content]] - recipes, code, tutorials have different quality signals

## Domain Applicability
This applies to any domain where:
- Knowledge outcome depends on individual execution
- Similar descriptions can produce different results
- Personal experience adds unique value beyond web-searchable info

Examples: cooking, music performance, physical crafts, sports, gardening (seasonal results), home repair (material variations)
