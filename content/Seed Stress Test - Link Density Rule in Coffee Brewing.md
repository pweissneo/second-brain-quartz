---
lifecycle: seed-extension
confidence: emerging
last-reviewed: 2026-03-21
author-type: ai-assisted
tags:
  - seed-stress-test
  - link-density
  - coffee
  - brewing
  - domain-edge-case
related-seed-rule: [[AI-Assisted Knowledge Management Seed#Linking]]
---

# Seed Stress Test: Link Density Rule in Coffee Brewing Domain

This note tests the [[AI-Assisted Knowledge Management Seed#Every note must link to at least 2 other notes]] rule against the coffee brewing domain.

## Seed Rule Being Tested

**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.

**Why:** Unlinked notes are invisible in the graph — they cannot be discovered through navigation. Foundational elements are a special case that should be explicitly marked, not manually verified each time.

**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag AND lacks the `specialized: true` tag.

---

## Domain: Coffee Brewing Knowledge Base

Coffee brewing presents unique challenges for link density:
- Many specific brew methods (pour-over, French press, espresso, AeroPress, cold brew, Moka pot)
- Equipment-specific knowledge (grinders, scales, kettles, filters)
- Ingredient-level knowledge (specific beans, water chemistry, grind sizes)
- Technique knowledge (timing, temperature, agitation)
- Temporal knowledge (seasonal beans, freshness windows)

---

## Edge Case 1: Specific Bean Varietals

**Problem:** Notes about specific coffee beans (e.g., "Ethiopian Yirgacheffe", "Colombian Supremo") may only naturally link to one thing (the origin country or region). For example:
- "Ethiopian Yirgacheffe" might only link to "Ethiopian Coffee"
- "Geisha" might only link to "Coffee Varietals"

These are legitimate atomic notes about specific products, but they fail the 2-link test.

**Analysis:** Coffee beans are domain-specific entities, similar to celestial objects in astronomy. The existing Seed edge case for "domain-specific instruments" doesn't cover agricultural products.

**Recommendation:** Add explicit edge case for **specific agricultural products**:

> **Edge case:** Specific products in a domain (beans in coffee, grape varieties in wine, specific ingredients in cooking) may legitimately have fewer outgoing links when they are reference targets rather than concept-developing notes. Tag with `type: product-reference` to distinguish from conceptual notes.

---

## Edge Case 2: Water Chemistry Specifics

**Problem:** A note about "water hardness for espresso" might only link to "Water Chemistry" because it's a highly specific parameter. Similarly, "total dissolved solids (TDS)" might only link to "Water Quality."

**Seed Edge Case:** The Seed acknowledges "Specialized instruments... may legitimately have only 1 natural link" but water chemistry parameters are not instruments.

**Analysis:** This is a case of specialized terminology that describes a narrow parameter. The rule might need refinement for "measurement parameters" vs "instruments."

**Recommendation:** Add `type: parameter` tag for specialized measurement concepts that may have fewer natural links but are nonetheless essential reference points.

---

## Edge Case 3: Brew Ratio Numbers

**Problem:** Notes about specific ratios (e.g., "1:16 ratio", "18g in, 36g out") might only link to one parent concept ("Brew Ratios") because they're specific values rather than broader concepts.

**Analysis:** This is similar to the celestial object problem - specific numeric values that are reference targets, not concept-developing notes.

**Recommendation:** Consider excluding purely numeric reference notes from the 2-link rule, or add a specific tag for `type: reference-value` that exempts from the link requirement.

---

## Edge Case 4: Temporal Freshness Windows

**Problem:** Coffee freshness is time-sensitive. Notes about "optimal freshness window" (typically 2-4 weeks post-roast) only link to "Coffee Freshness" - a single natural connection.

**Analysis:** Temporal knowledge often has limited natural connections because it's about timing rather than relationships between concepts.

**Recommendation:** Add edge case for **temporal parameters** - knowledge that's time-dependent may have fewer natural links.

---

## Edge Case 5: Equipment-Specific Techniques

**Problem:** A technique like "James Hoffmann's V60 technique" might only link to "James Hoffmann" and "V60" - 2 links, but highly specific to one person and one piece of equipment.

**Analysis:** Named techniques by specific experts create natural singletons - they're highly specific and may not connect to broader concepts naturally.

**Recommendation:** Named techniques should link to: (1) the person/expert, (2) the equipment, (3) a broader category. If only 2 exist, add a category link. This edge case is resolvable by the rule itself.

---

## Question 1: Does this rule make sense for coffee?

**Yes, with modifications.** Coffee knowledge is highly interconnected:
- Beans connect to origins, roasters, processing methods
- Equipment connects to techniques, maintenance, accessories
- Techniques connect to brew methods, timing, temperature
- Water connects to chemistry, equipment, extraction

The rule makes sense but needs the edge cases above to avoid false positives.

---

## Question 2: Is the rule's Test actually executable by an AI?

**Yes.** An AI can:
1. Scan all notes for outgoing links
2. Check for `foundational: true` or `specialized: true` tags
3. Flag violations

**However**, the test doesn't account for domain-specific exceptions. The AI would need:
- Knowledge of edge cases (celestial objects, agricultural products, parameters, temporal knowledge)
- Ability to recognize when exceptions apply

**Recommendation:** The test should include a domain-specific exception check before flagging violations.

---

## Question 3: Is there an edge case where the rule fails?

**Yes.** The rule fails when:
1. Domain-specific entities (beans, celestial objects) are flagged incorrectly
2. Measurement parameters have only one natural connection
3. Temporal knowledge has limited connections
4. Named techniques are too specific to create broad connections

The rule needs domain-aware exception handling to work correctly.

---

## Conclusion

The 2+ Links rule is fundamentally sound for coffee brewing but requires domain-specific edge cases:
1. Specific products (beans, ingredients) may have fewer links
2. Measurement parameters may be exempt
3. Temporal knowledge may be exempt
4. The test should be domain-aware

This validates the Seed's approach of allowing domain-specific edge cases while maintaining the core rule.

---

## Related Notes

- [[Seed Stress Test - Gardening Knowledge Base]] - Another domain-specific stress test for link density
- [[Seed Stress Test - Link Density Rule in Amateur Astronomy]] - Edge case for domain-specific entities
- [[Frontier Exploration - Ingredient Substitution Knowledge]] - Related to specific product references