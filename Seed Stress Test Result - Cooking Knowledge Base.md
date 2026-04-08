---
last-updated: 2026-04-08
confidence: high
knowledge-type: meta
verification-status: verified
verification-modality: analytical
tags:
  - seed-stress-test
  - cooking-domain
  - context-window
  - ai-optimization
---

# Seed Stress Test: Cooking Knowledge Base

> Result of applying Seed rules to a cooking knowledge base domain

## Domain: Cooking

Applied the following Seed rules to a hypothetical cooking knowledge base (200+ notes):
- Note atomicity rules
- Knowledge type taxonomy
- Verification and completeness rules
- Access pattern tagging
- Link structure requirements

## Where Rules Work Well

1. **Atomicity** — Cooking concepts map cleanly to atomic notes (e.g., "Searing", "Deglazing", "Emulsification")
2. **Knowledge types** — Procedural, factual, conceptual all apply naturally to cooking
3. **Verification** — Recipes can be verified through practice (execution verification)
4. **Access patterns** — Recipes are lookup, techniques are learning, flavor pairing is inspiration

## Where Rules Fail / Edge Cases Found

### 1. Context-Window Problem (Critical Gap)

**Issue:** The Seed assumes unlimited context for AI agents. A cooking vault with 200+ notes on techniques, ingredients, flavor profiles, and recipes creates token costs that break AI-assisted retrieval.

**Example:** An AI with 32K context needs to answer "What wine pairs with beef stroganoff?" This requires:
- Wine pairing principles (≈500 tokens)
- Beef cooking techniques (≈300 tokens)
- Flavor profile of stroganoff (≈200 tokens)
- sauce chemistry (≈300 tokens)

That's 1300+ tokens just for background. In a large vault, this exhausts context budgets.

**Test for this gap:** Can an AI with your vault's average context window answer common queries without exceeding token limits while maintaining accuracy?

### 2. Temporal-Sequential Knowledge Gap

**Issue:** Cooking has strong temporal dependencies — the order of steps matters, and timing is both clock-time and process-state based. The Seed's temporal-sequential rule (2026-04-07) helps but lacks specificity for cooking.

**Example:** "Sear the meat, then deglaze" — "then" implies sequence, but timing depends on:
- Clock time: How long to sear (2-3 min per side)
- Process state: When to flip (when release naturally occurs), when to deglaze (when fond has formed)

**Current Seed coverage:** Partial — temporal-sequential rule exists but doesn't address process-state timing in procedural domains.

### 3. Verification Modality Edge Case

**Issue:** Cooking verification is practice-based, but the Seed's verification rules don't distinguish between:
- Recipe verification (does it work as written?)
- Technique verification (can you execute the skill?)
- Preference verification (does it taste good to you?)

**Example:** A recipe can be "verified" by following exactly, but a cook's technique might still be flawed. The recipe is verified but the knowledge isn't fully useful.

**Test for this gap:** Does verification-status distinguish between recipe-verified and technique-verified?

## Recommendations

1. **Add context-window-aware rules** — See [[Frontier Exploration - Context-Window-Aware Knowledge Organization]]
2. **Extend temporal-sequential for procedural domains** — Add guidance for process-state timing in domains like cooking, crafts, chemistry
3. **Enhance verification modality** — Distinguish between output-verified and skill-verified

## Related Notes

- [[Frontier Exploration - Context-Window-Aware Knowledge Organization]]
- [[Seed Refinement - Cognitive State-Aware Knowledge Organization]]
- [[AI-Assisted Knowledge Management Seed]]

---

[[_root]] | [[Seed Stress Test Hub]]