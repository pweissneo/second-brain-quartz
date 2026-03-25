---
last-reviewed: 2026-03-17
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - cooking-domain
  - edge-case
  - food-safety
---

# Seed Stress Test: Cooking Knowledge Base

Testing Seed rules in the cooking domain reveals unique challenges around procedural content, sensory judgment, and ingredient-specific knowledge.

## Domain Overview

Cooking knowledge bases face unique challenges:
- Procedural content (recipes) requires different handling than conceptual notes
- Sensory judgment (ripeness, doneness, "done") is difficult to capture in text
- Ingredient knowledge varies by cuisine, region, and availability
- Equipment assumptions differ across home vs professional kitchens
- Technique knowledge has steep skill curves

---

## 1. Atomicity & Word Count

**Seed Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Cooking Application:**

### Edge Case: Complete Recipes Under 100 Words

**Problem:** Some complete recipes are legitimately under 100 words. Example:
> "Quick Pickles: Combine 1 cup vinegar, 1 cup water, 1 tbsp salt in saucepan. Bring to boil. Pour over sliced cucumbers in jar. Cool 30 min. Serve."

This is complete and executable at 47 words. Is it a stub that needs expansion, or is it properly atomic?

**Seed Test:** Notes under 50 words must either be marked as stubs OR provide sufficient substance to stand alone.

**Analysis:** This recipe can be executed without additional information. It passes the "complete short procedural content" test.

**Refinement:** For procedural content (recipes, techniques), apply atomicity test FIRST: Can this be executed without additional information? If yes, word count is secondary.

### Edge Case: Comprehensive Technique Notes

**Problem:** "Sautéing" as a single note covers: terminology, pan types, fat options, temperature control, common mistakes, troubleshooting. This could exceed 1000 words.

**Analysis:** Is this one idea (sautéing) comprehensively covered, or multiple ideas bundled?

**Test:** Does the note explore ONE technique comprehensively, or does it bundle distinct sub-techniques (e.g., stir-fry vs sauté vs pan-fry as separate techniques that happen to use similar equipment)?

---

## 2. Link Density: Basic Ingredients

**Seed Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true`.

**Cooking Application:**

### Edge Case: Foundational Ingredients

**Problem:** Salt, oil, water, heat — used in virtually every recipe, but what do they naturally link to?

**Analysis:** These are domain primitives. Per Seed rule, they should be tagged `foundational: true`.

**Test:** Does "Salt" link to 2+ notes naturally? Probably not. But it's referenced in hundreds of recipes.

**Solution:** Tag with `foundational: true`.

### Edge Case: Cuisine-Specific Ingredients

**Problem:** "Miso paste" might only naturally link to "Japanese cooking" and "fermentation."

**Analysis:** Two links meets minimum. But if the vault doesn't have those notes, it's orphaned.

**Test:** Should cuisine hub notes exist to provide natural link targets?

---

## 3. Equipment Dependencies

**Seed Rule:** Document physical equipment dependencies.

**Cooking Application:**

### Edge Case: Equipment Tier Assumptions

**Problem:** "Use a Dutch oven" assumes the reader has one. But:
- Budget cooking: "Use a heavy pot with tight lid" (alternatives exist)
- Professional: "Ricer" vs "food mill" vs "immersion blender"

**Test:** Does the technique note specify required vs optional equipment? Are alternatives documented?

### Edge Case: Temperature Control Equipment

**Problem:** "Simmer at 180°F" — most home cooks don't have a thermometer.

**Analysis:** Some techniques require equipment; others have workarounds.

**Test:** For techniques requiring specific equipment: Is there a `safety-mandatory:` tag? (e.g., candy-making requires thermometer for safety)

---

## 4. Experiential Knowledge: Sensory Cues

**Seed Rule:** For domains with experiential knowledge, include `experiential-component` frontmatter.

**Cooking Application:**

### Edge Case: "Cook Until..."

**Problem:** Recipes say "cook until golden brown" or "until internal temperature reaches 145°F" — but:
- "Golden brown" varies by ingredient, heat level, pan color
- Color is easier to judge than internal temp
- "Doneness" for meat is both measurable (temp) and sensory (touch)

**Test:** Are sensory cues documented with examples?
- Good: "Skin bubbles and wrinkles; edges turn golden"
- Poor: "Cook until done"

### Edge Case: "Add Salt to Taste"

**Problem:** This is the classic unhelpful advice. Salt amount depends on:
- Sodium content of the salt (table vs kosher vs sea)
- Other sodium sources in the dish
- Personal preference
- Type of cuisine

**Test:** Can the note provide a starting point (e.g., "about 1 tsp per quart") rather than just "to taste"?

---

## 5. Source Quality: Recipe Reliability

**Seed Rule:** For knowledge with established evidence hierarchies, capture source quality tier.

**Cooking Application:**

| Source Type | Reliability | Example |
|-------------|-------------|---------|
| Professional cookbook | High | America's Test Kitchen |
| Restaurant chef blog | Medium-High | Depends on chef's teaching skill |
| Community recipe | Variable | Home cooks, untested by editor |
| Viral social media | Low-Variable | Often untested, optimized for engagement |
| Historical cookbook | Variable | Techniques valid, ratios may differ |

### Edge Case: Recipe Testing

**Problem:** A recipe on a blog might work for the author but not for home cooks with different equipment.

**Seed Rule:** For procedural content, include `verification-status: unverified | tested | community-validated`.

**Test:** Can you identify the verification status of each recipe? Are tested recipes marked?

---

### Edge Case: Food Safety Critical Knowledge

**Problem:** Cooking involves safety-critical knowledge that differs from regular procedural content:
- Specific temperature thresholds (165°F for poultry, 40°F for refrigeration)
- Expiration vs. best-before distinctions
- Cross-contamination prevention procedures

This knowledge requires explicit safety tagging because incorrect information can cause real harm (foodborne illness).

**Seed Rule:** For high-stakes knowledge, use `criticality: high` frontmatter and include explicit safety disclaimers.

**Test:** For temperature-related food safety notes:
1. Is the temperature precise and sourced from authoritative bodies (FDA, USDA)?
2. Is there a `criticality: high` tag?
3. Does the note distinguish between safety thresholds and quality/preference?

### Edge Case: Expiration vs. Best-Before Dates

**Problem:** "Expiration date" and "best-before date" have different meanings:
- "Expires on" = unsafe after this date
- "Best before" = quality may decline but still safe

Conflating these causes either food waste (throwing away safe food) or foodborne illness (eating unsafe food).

**Test:** Do date-related food notes explicitly distinguish safety vs. quality thresholds?

---

## 6. Climate/Region Scope

**Seed Rule:** For knowledge whose validity depends on climate zones, use explicit scope tags.

**Cooking Application:**

### Edge Case: Altitude Baking

**Problem:** Baking at high altitude (5,000+ ft) requires adjustments:
- Lower boiling point (water at 200°F vs 212°F)
- Leavening adjustments
- Moisture adjustments

**Test:** Does high-altitude baking advice include altitude range? Is it tagged with `elevation:` scope?

### Edge Case: Ingredient Availability

**Problem:** "Substitute soy sauce for fish sauce" — works in some cuisines, wrong in others.

**Test:** Does substitution advice specify cuisine applicability?

---

## 7. Time-Sensitive Knowledge: Trendy Ingredients

**Seed Rule:** Track knowledge validity periods.

**Cooking Application:**

### Edge Case: Ingredient Trends

**Problem:** "Best new ingredients of 2023" — foam, spherification, liquid nitrogen — are these still relevant?

**Test:** Does the note have `as-of:` date? Is there a review trigger?

---

## 8. Taxonomy: Cuisine Organization

**Seed Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.

**Cooking Application:**

### Path Example

```
_root → Food → Cuisines → Asian → Japanese → Sushi → [specific rolls]
```
= 6 hops

**Analysis:** This is a natural taxonomy (Food → Category → Cuisine → Sub-cuisine → Technique → Specific). But it exceeds 3 hops.

**Seed Edge Case:** "Natural domain hierarchies (taxonomies, classification systems, geographic/regional breakdowns) may legitimately exceed 3 hops."

**Solution:** This is a genuine domain taxonomy. Allow deeper paths OR create hub shortcuts.

---

## 9. Diminishing Returns Testing in Cooking

**Seed Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility, connection, uniqueness, effort.

**Cooking Application:**

### Edge Case: Foundational Knowledge Exemption

**Problem:** Basic techniques (knife skills, heat management, sauce foundations) don't have 2+ natural links initially but are essential for any cooking knowledge base.

**Solution:** Foundational knowledge (core techniques, essential ingredients, fundamental principles) should be exempt from diminishing returns testing during domain bootstrap. Apply the test only to application-level knowledge after foundations are established.

### Edge Case: Experiential Knowledge Requires Different Testing

**Problem:** In cooking, you often cannot assess utility without actually cooking. A recipe may LOOK similar to existing ones but produce dramatically different results.

**Solution:** For recipes, the test should include "have you cooked this?" rather than just assessing the note itself. Require `verification-status: verified` for recipes.

### Edge Case: Cuisine-Specific Context

**Problem:** A recipe that's redundant in one cuisine (many Italian pasta dishes) may be unique in another (Japanese-Italian fusion).

**Solution:** For crossover cuisine notes: assess uniqueness within each culinary tradition separately. For fusion cooking: require explicit documentation of what makes the fusion distinctive.

### Edge Case: Ingredient Availability Affects Utility

**Problem:** A recipe using obscure ingredients has different utility depending on the cook's location and access.

**Solution:** Add `ingredient-access:` scope tag (local | specialty | import required).

### Modified Test for Cooking Domain

For the last 5 notes added to a cooking topic:
1. Do 3+ pass utility/connection/uniqueness/effort tests OR have `verification-status: verified`?
2. For foundational technique notes: are they exempt during bootstrap phase?
3. For recipe notes: do they have sensory-cues documented?

## 10. 5:1 Personal-to-General Ratio in Cooking

**Seed Rule:** Capture insights, decisions, and experiences (personal) over restatable facts (general) at a 5:1 ratio.

**Cooking Application:**

### Edge Case: Recipes Exist Online

**Problem:** The core assumption of 5:1 is that "a web search can replace this note in <30 seconds." But for recipes, this is almost always true — every recipe exists online. Does this mean most recipe notes fail the 5:1 test?

**Analysis:** The 5:1 rule has an edge case for creative skill domains (line 295 in Seed): "Allow higher general ratio (3:1 or 2:1) during foundational skill acquisition." Cooking is a creative skill where general knowledge (recipes) enables personal creation.

**Refinement:** For recipe notes, the 5:1 test should assess:
1. Does this include YOUR specific modifications/adaptations?
2. Does this document YOUR cooking decisions and why?
3. Does this capture personal tips, timing adjustments, or ingredient swaps YOU made?
4. Does this include YOUR verification results (what worked/didn't)?

A recipe that is "YOUR version" with modifications counts as personal even if the base recipe exists online.

### Edge Case: "General" Knowledge That's Frequently Referenced

**Problem:** A recipe for "classic béchamel sauce" exists everywhere. Is it worth capturing?

**Seed Edge Case:** "General knowledge is acceptable when: frequently referenced (saves lookup time), synthesized with personal analysis, or domain-specific enough to be hard to find."

**Analysis:** Classic recipes are frequently referenced and benefit from personal synthesis (your notes on texture, timing, troubleshooting). Capture as "general but personal-analysis-added."

---

## 11. Verification Timing for Seasonal Cooking

**Seed Rule:** Verify at least 50% of new captures within 30 days.

**Cooking Application:**

### Edge Case: Seasonal Ingredients

**Problem:** A recipe for "pumpkin soup" captured in March cannot be verified until October (pumpkin season). The 30-day verification window is unrealistic.

**Seed Edge Case:** "In domains with seasonal or cyclical verification constraints, the 30-day verification window may unfairly penalize valid captures."

**Solution:** Apply domain-aware verification windows for cooking:
- Use `verification-cycle:` field with values `seasonal|annual|circular`
- Track `verification-season:` for when verification is possible
- Count seasonal notes as "pending verification" during off-seasons
- Set verification ratio targets based on capture timing

### Edge Case: Long-Cooked Dishes

**Problem:** Some dishes take 8+ hours (braises, stews, fermented foods). You can't verify multiple recipes in a week.

**Solution:** Track `verification-effort:` field (quick <1hr, moderate 1-4hr, extensive 4hr+) to set realistic verification expectations.

### Edge Case: Ingredient-Specific Verification

**Problem:** A recipe works with one type of ingredient but not another (e.g., grass-fed vs grain-fed beef). Single verification may be insufficient.

**Solution:** For ingredient-sensitive recipes, document verification scope: "Tested with [ingredient type], results may vary with alternatives."

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Atomicity | Complete recipes <100 words | Test execution completeness, not just word count |
| Atomicity | Comprehensive technique notes >300 words | Single theme comprehensively covered = valid |
| Link Density | Foundational ingredients (salt, oil) | Tag with `foundational: true` |
| Equipment | Tier assumptions (professional vs home) | Document alternatives, specify `required` vs `optional` |
| Experiential | "Cook until golden" | Document sensory cues with examples |
| Source Quality | Recipe verification status | Use `verification-status` field |
| Altitude | High-altitude adjustments | Add `elevation:` scope tag |
| 3-Hop Rule | Cuisine taxonomy legitimately deep | Allow domain taxonomies; create hub shortcuts |
| Critical Knowledge | Food safety temperatures | Use `criticality: high` tag; source from FDA/USDA |
| Critical Knowledge | Expiration vs. best-before dates | Distinguish safety vs. quality thresholds |

---

## Recommendations for Seed

1. **Procedural Content**: Clarify that word count limits apply to conceptual notes; procedural content (recipes, techniques) follows different atomicity test.

2. **Equipment Dependencies**: Add `equipment-skill-level:` field (home-cook vs professional) to clarify assumptions.

3. **Experiential Knowledge**: For cooking, require `sensory-cues:` field documenting how to judge doneness without equipment.

4. **Verification Status**: For recipes, distinguish "author-tested" from "community-validated" from "untested."

5. **Cuisine Hubs**: Create hub structure at major category boundaries (by cuisine, by technique type, by meal type) to shorten navigation paths.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Gardening Knowledge Base]]
- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Frontier Gap - Embodied Knowledge]]
- [[Frontier Exploration - Expert Heuristics and Rules of Thumb]]
- [[Handling Temporal Knowledge]]
- [[Domain-Specific Knowledge Bases]]
