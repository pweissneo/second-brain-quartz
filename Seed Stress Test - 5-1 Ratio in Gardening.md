---
last-reviewed: 2026-03-27
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - 5-1-ratio
  - gardening-domain
  - edge-case
---

# Seed Stress Test: 5:1 Ratio in Gardening Knowledge Base

Testing the 5:1 personal-to-general knowledge ratio rule in the gardening domain reveals unique challenges around context-dependence, local experimentation, and the relationship between general horticultural knowledge and personal growing experience.

## Domain Overview

Gardening knowledge is exceptionally context-dependent:
- Climate zones, microclimates, and soil conditions vary dramatically even within a single neighborhood
- Personal experimentation results are the gold standard — general advice often fails locally
- Knowledge transfer is nearly zero without adaptation

This makes the personal-to-general ratio both more important and more complex than typical domains.

---

## Does This Rule Make Sense for Gardening?

**Analysis:** Yes, with significant modifications.

The fundamental principle — capture original insights over restatable facts — applies. A gardening vault full of general advice from extension services and books provides less value than one capturing what actually worked in YOUR specific conditions.

However, gardening has unique dynamics:
- General horticultural principles are the foundation for personal application
- Local experimentation is the primary verification pathway
- Context-dependence means general advice without personal adaptation has low utility

The rule makes sense, but the test needs calibration for gardening's specific knowledge dynamics.

---

## Edge Cases Identified

### Edge Case 1: Foundational Horticultural Knowledge Exemption

**Problem:** "Photosynthesis," "nutrient cycles," "plant hardiness," and "soil pH" are general knowledge available in any botany textbook. Should these count against the 5:1 ratio?

**Analysis:** These are foundational prerequisites for personal gardening knowledge. Just like in woodworking (where tool mechanics are foundational), horticultural fundamentals enable personal experimentation but aren't the personal knowledge itself.

**Modified test for gardening:** Exclude pure foundational horticultural science (plant biology, soil chemistry, botany fundamentals) from 5:1 ratio calculations. They function as reference material, not personal knowledge. The personal value comes from APPLICATION to your specific garden.

**Recommendation:** Add explicit exemption for foundational knowledge with `knowledge-category: foundational` frontmatter.

---

### Edge Case 2: Context-Gated General Knowledge

**Problem:** "Plant tomatoes after last frost" is general advice, but it's highly useful when combined with YOUR specific frost date context. Does the context gating make it "personal-equivalent"?

**Analysis:** The general principle is restatable (any source provides "after last frost"), but the specific adaptation (YOUR frost date, YOUR microclimate adjustments) is personal. The gardening stress test note already addresses this with `context-gate:` frontmatter.

**Modified test:** For context-gated notes, assess: Does this include YOUR specific context adaptation, not just the general principle? If yes, count as personal even if the base knowledge is general.

---

### Edge Case 3: Local Experimentation Results

**Problem:** What worked (or failed) in YOUR garden is the highest-value gardening knowledge. But is "my tomatoes got blossom end rot" restatable general knowledge?

**Analysis:** This is unambiguously personal — your specific results in your specific conditions. The failure might be generalizable to others with similar conditions, but the knowledge originates from personal experience.

**Modified test:** Include notes documenting personal experimentation results as personal, regardless of whether similar experiments exist in literature. Personal verification in YOUR conditions is the gold standard in gardening.

**Recommendation:** Add `knowledge-type: experimentation-result` for personal trial documentation.

---

### Edge Case 4: Seasonal Knowledge and Timing Adaptation

**Problem:** "Plant tomatoes in May" is general advice. "I plant tomatoes on May 15 based on soil temperature reaching 60°F" includes YOUR specific adaptation.

**Analysis:** Timing knowledge is highly personal because frost dates, soil warming, and microclimates vary so much. Capturing YOUR timing decisions (and the reasoning) adds personal value even when the general principle exists elsewhere.

**Modified test:** For timing notes: Does this include YOUR specific date/temperature threshold, not just the general "when to plant" guidance?

---

### Edge Case 5: Variety-Specific Personal Experience

**Problem:** There's a 10,000+ tomato varieties. General advice about "cherry tomatoes" is different from YOUR experience with 'Sungold' in YOUR specific conditions.

**Analysis:** Variety-specific experience is inherently personal — no one else has grown that exact variety in your exact conditions. Even if someone else has written about the same variety, your specific results, timing, and observations are unique.

**Modified test:** For variety notes: Does this document YOUR specific growing experience with this variety? If yes, count as personal.

---

### Edge Case 6: The "Utility Exception" Threshold

**Problem:** Gardening advice like "rotate your crops" is general but frequently referenced. Is there a utility threshold where general knowledge becomes worth capturing despite being restatable?

**Analysis:** Gardening already has the most generous utility exception — because context matters so much, general advice without local adaptation has LIMITED utility. The utility of rotation depends on YOUR specific crops, YOUR disease pressure, YOUR soil conditions. Generic rotation advice has low practical value.

**Modified test:** For gardening, general knowledge must include adaptation rationale to count as valuable. "Rotate crops" (general) → "I rotate nightshades with brassicas because [your specific reason]" (personal-equivalent).

---

## Modified 5:1 Test for Gardening

For gardening domain notes:

1. **Exclusion test:** Is this pure foundational horticultural science (not application)? If yes → exempt from ratio
2. **Context test:** Does this include YOUR specific context adaptation (frost date, microclimate, soil type)? If yes → count as personal
3. **Experimentation test:** Does this document YOUR specific growing results (success or failure)? If yes → count as personal
4. **Timing test:** Does this include YOUR specific date/temperature threshold? If yes → count as personal
5. **Variety test:** Does this document YOUR experience with a specific variety? If yes → count as personal
6. **Adaptation test:** For any general advice: Does this include YOUR specific why (not just the what)? If yes → count as personal

**Count as personal if yes to any of tests 2-6. Exempt if test 1 is true.**

---

## Knowledge Type Distribution in Gardening

Based on gardening vault structure analysis:

| Type | Ratio Concern | Treatment |
|------|--------------|-----------|
| Foundational plant science | Exempt from ratio | Reference material |
| General horticultural techniques | High general ratio needs personal adaptation | Require context-gating |
| Variety-specific notes | Low concern | Almost always personal |
| Personal experimentation results | Low concern | Personal by definition |
| Seasonal timing decisions | Medium concern | Include YOUR threshold |
| Climate-zone adaptations | High concern | Include YOUR zone context |
| Pest/disease management | Variable | Depends on personal validation |

---

## Comparison with Other Domains

| Domain | 5:1 Challenge | Modification |
|--------|---------------|--------------|
| Cooking | Recipes exist online but YOUR version is personal | Include modifications, not just base recipe |
| Woodworking | Foundational techniques exempt | Exclude foundational tool mechanics |
| Philosophy | General knowledge is prerequisite | Include YOUR interpretation, not just restatement |
| Scientific research | Literature synthesis adds personal value | Count synthesis with interpretation |
| Gardening | Context-dependence means general without adaptation has low utility | Require specific context adaptation |

---

## Recommendations for Seed

1. **Add gardening-specific edge case:** Document that general gardening advice without local context has limited utility and should include personal adaptation to count as personal-equivalent.

2. **Explicit foundational exemption:** Add horticultural science to the list of exempted foundational knowledge categories (alongside tool mechanics in woodworking).

3. **Include context-gating in test:** The 5:1 test should explicitly ask "Does this include YOUR specific context (location, climate, soil, timing)?" not just "Is this restatable?"

4. **Experimentation result field:** Add `knowledge-type: experimentation-result` for notes documenting personal trials — these should count toward personal side of ratio.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Gardening Knowledge Base]]
- [[Seed Stress Test - 5-1 Ratio Across Domains]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]