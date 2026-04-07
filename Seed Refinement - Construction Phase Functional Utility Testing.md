---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: medium
author-type: ai-assisted
refinement-type: rule-refinement
applies-to: "Rule: Define explicit construction completion criteria"
target-phase: foundation
---

# Seed Refinement - Construction Phase Functional Utility Testing

## The Issue

The Seed's construction completion criteria (orphan rate <10%, hub coverage >80%, verification ratio >50%, schema stable 60+ days, compliance score >85%) measure **structural health** but not **functional utility**.

A vault can pass all structural metrics yet be unable to answer real questions that someone in the domain would actually ask.

## Evidence from Stress Testing

The woodworking stress test identifies this exact gap but only documents it as an edge case without formalizing a rule:

> **Edge case (stress test 2026-03-29):** Structural completion criteria measure vault HEALTH, not vault UTILITY. A vault can pass all structural metrics but still be unable to answer real questions.

This is correctly identified but NOT resolved - it's an acknowledged gap with no corresponding rule.

## Proposed Rule Addition

**Rule:** Add functional utility testing to construction completion criteria — verify the vault can answer real domain questions before transitioning to maintenance mode.

**Why:** Structural metrics ensure well-built vaults, but users care about functional vaults. Without utility testing, maintenance mode begins on structurally sound but practically useless vaults.

**Test:** Run three functional tests alongside structural criteria:
1. **Entry Point Test:** Can a newcomer find the vault's purpose and 2+ starting points from `_root.md`?
2. **Question Answering Test:** Can the vault answer 5+ realistic questions in its primary domain using only internal knowledge?
3. **Breadth Test:** Does the vault cover 2+ distinct topic areas with cross-topic connections?

**Domain-specific utility tests:**
- Cooking: Can answer 3+ "how do I do X?" questions without external lookup
- Home repair: Can provide guidance on 3+ common tasks
- Philosophy: Can explain 3+ major positions with core arguments
- Medical: Can verify claims using internal sources with confidence levels
- Language learning: Can trace prerequisite chains for basic communication

**Implementation:** The completion test becomes:
```
structural_criteria_passed AND functional_utility_passed
```

Both must pass before transition to maintenance mode.

**See also:** 
- [[Seed Stress Test - Woodworking Knowledge Base]] (identifies gap)
- [[Frontier Exploration - Knowledge Base Utility Assessment]] (existing utility exploration)