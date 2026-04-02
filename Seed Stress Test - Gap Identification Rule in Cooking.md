---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - seed-stress-test
  - gap-identification
  - cooking
  - culinary
  - edge-cases
---

# Seed Stress Test: Gap Identification Rule in Cooking

**Tested Rule:** Systematically identify knowledge gaps and prioritize filling them — use prerequisite audits, retrieval failure tracking, graph topology analysis, and contested topic scans.

**Test Date:** 2026-03-22

**Domain:** Cooking / Culinary Arts

---

## Does This Rule Make Sense for Cooking?

**Yes, largely.** A cooking knowledge base benefits from gap identification:

- Prerequisite gaps: Notes might assume knowledge of "knife skills" or "heat management" without explaining them
- Utility gaps: Common tasks like "weeknight dinners" or "feeding leftovers to kids" might be uncovered
- Connection gaps: Related techniques (braising → stewing → soup) might not be linked
- Perspective gaps: Only French techniques covered when Italian, Japanese, or Mexican approaches exist

The core insight is valid: managing existing knowledge is different from identifying what's missing.

---

## Is the Test Executable by an AI?

**Partially.** The Test criteria break down:

| Test Criterion | Executable? | Cooking-Specific Challenge |
|---------------|-------------|---------------------------|
| Prerequisite audit (undefined wikilinks) | ✅ YES | Easy to scan |
| Retrieval failure tracking | ⚠️ PARTIAL | Cooking queries are less structured; "how to cook chicken" returns thousands of results |
| Graph topology analysis | ✅ YES | Same as any vault |
| Contested topic scan | ⚠️ PARTIAL | What counts as "contested" in cooking is subjective (taste preferences) |
| Gap prioritization (impact × effort) | ⚠️ PARTIAL | "Impact" is harder to define for subjective cooking knowledge |

---

## Edge Cases Where the Rule Fails

### 1. Culinary Tradition Dependency

The rule assumes gaps are objectively identifiable, but cooking often has tradition-specific prerequisites.

**Problem:** A gap in one culinary tradition may not be a gap in another.

**Example:** Notes about French cuisine might assume knowledge of mother sauces (béchamel, velouté, etc.) without explaining them. Notes about Chinese cooking might assume wok hei (breath of the wok) without elaboration. Both assume different foundational knowledge.

**Impact:** Prerequisite audit finds many "missing" notes, but some are tradition-specific, not universal gaps.

**Recommendation:** Add `culinary-tradition:` frontmatter to prerequisite notes. Distinguish:
- Universal prerequisites (knife safety, heat management)
- Tradition-specific prerequisites (mother sauces for French, wok technique for Chinese)

**Modified Test:** For prerequisite gaps detected, check: Is this truly universal OR is it tradition-specific with tradition-tagged coverage?

---

### 2. Embodied Knowledge Gaps (Critical)

The rule assumes AI can identify gaps through metadata and graph analysis. But cooking has significant embodied knowledge — skills that require physical practice to even recognize what's missing.

**Problem:** Novice cooks cannot identify gaps in their knowledge because they don't know what they don't know. This is the "unknown unknowns" problem intensified.

**Example:** A home cook's gap audit might miss:
- How to tell when dough is properly kneaded (feels "right")
- Visual cues for steak doneness
- The "thread" stage for candy making
- Proper wok toss technique

These gaps won't appear as undefined wikilinks or retrieval failures — they're tacit knowledge the cook doesn't know exists.

**Impact:** Gap identification via metadata misses the most valuable cooking knowledge: embodied sensory skills.

**Recommendation:** Add embodied gap detection:
- Track `embodied-component: essential` notes per existing Seed rule
- For cooking, specifically audit: knife technique, temperature judgment, timing intuition, sensory recognition
- Ask: "What does this feel/look/sound like when done correctly?"

**Modified Test:** For cooking notes, add: (6) Are embodied knowledge gaps explicitly tracked? (7) Does the vault include sensory anchors for technique notes?

---

### 3. Seasonal and Ingredient-Specific Gaps

**Problem:** Recipe and ingredient knowledge depends heavily on context. What's a gap in one season or region may not be a gap elsewhere.

**Example:** 
- "How to cook with fresh tomatoes" — critical gap in summer, irrelevant in winter
- "Substitutions for heavy cream" — important for dairy-free cooking, not for standard cooking
- "Cooking with game meats" — gap for some, irrelevant for others based on cultural context

**Impact:** Gap identification must be context-aware, not universal.

**Recommendation:** Add gap context:
- `seasonal-gap: true` for time-sensitive knowledge
- `ingredient-scope:` for ingredient-specific gaps
- `cultural-context:` for cuisine-specific gaps

**Modified Test:** For cooking gaps, can you identify which are: (a) universal (b) seasonal (c) ingredient-specific (d) cultural/tradition-specific?

---

### 4. Context-Dependent Utility

**Problem:** The rule assumes "utility" can be measured objectively. But cooking utility depends entirely on user context.

**Example:**
- "How to cook a Thanksgiving dinner for 20" — extremely high utility for some, zero for others
- "Molecular gastronomy techniques" — high utility for avant-garde chefs, irrelevant for home cooks
- "One-pot meals" — high utility for people who hate dishes, irrelevant for those with dishwashers

**Impact:** Gap prioritization based on generic "impact" fails for cooking — impact is user-specific.

**Recommendation:** Add user-context gap tagging:
- `gap-utility-context: home-cook|professional|foodie|dietician|special-occasion`
- Allow multiple context tags per gap

**Modified Test:** For cooking gaps, can you categorize utility by user context? Are gaps tagged with intended audience?

---

### 5. Taste Preference "Contested" Topics

The rule mentions scanning for "contested topics with only one perspective." In cooking, almost everything is contested because taste is subjective.

**Problem:** What's "best" in cooking is inherently disputed:
- Best oil for high-heat cooking (avocado vs. grapeseed vs. peanut)
- Best way to cook steak (reverse sear vs. cast iron vs. grill)
- Best pasta shape for marinara (spaghetti vs. rigatoni vs. linguine)

**Impact:** The "contested topic" scan will flag nearly EVERY cooking note as potentially contested, defeating the purpose.

**Recommendation:** Distinguish:
- Factual contested (which technique is actually safer/more effective) — flag these
- Preference contested (taste, tradition, opinion) — don't flag

**Modified Test:** For cooking contested topic scan, add filter: Is this a factual dispute (food safety, scientific effectiveness) or a preference dispute (taste, tradition)? Only flag factual disputes.

---

### 6. Verification Gaps Are Different

**Problem:** Cooking verification differs from technical domains. A recipe might "pass" technical verification (ingredients listed, steps logical) but still fail in practice (taste bad, don't work in humid climates, don't scale).

**Impact:** Standard verification gap detection misses cooking-specific failures.

**Recommendation:** Add cooking verification modes:
- `verification-mode: source` (recipe from trusted cookbook)
- `verification-mode: executed` (actually cooked by vault owner)
- `verification-mode: context-validated` (worked in YOUR kitchen conditions)

---

## Summary: Modified Gap Identification for Cooking

### Additions to Rule Test:

For cooking (and culinary domains), add:

6. **Embodied gap detection:** Are tactile/sensory technique gaps tracked?
7. **Context awareness:** Are gaps tagged by culinary tradition, season, ingredient scope, or user context?
8. **Contested topic filtering:** Distinguish factual vs. preference disputes
9. **Verification mode:** Distinguish source verification from execution verification

### Frontmatter Extensions for Cooking Gaps:

```yaml
gap-type: prerequisite|utility|connection|verification|perspective|embodied
culinary-tradition: [french, japanese, italian, mexican, etc.]
seasonal-gap: true|false
ingredient-scope: [dairy-free, gluten-free, specific-ingredient]
gap-utility-context: home-cook|professional|foodie|dietician
contested-type: factual|preference
verification-mode: source|executed|context-validated
embodied-component: essential|nice-to-have|none
```

---

## Did I Learn Something New?

**Yes.** The gap identification rule assumes knowledge gaps are discoverable through metadata analysis and graph topology. But cooking knowledge has a massive embodied component that won't appear in any graph — you can only find it by asking "what sensory information am I not capturing?"

This is different from the existing "embodied knowledge" edge case in the Seed. That edge case addresses HOW to verify embodied knowledge. This edge case addresses HOW TO IDENTIFY that embodied knowledge is missing in the first place.

The gap identification rule needs an "embodied gap detection" step specifically for domains like cooking, music performance, and physical crafts.

---

## Seed Update Recommended?

**Yes.** Add an edge case to the gap identification rule:

> **Edge case (stress test 2026-03-22 - cooking domain):** In embodied knowledge domains (cooking, music performance, physical crafts), gap identification via metadata and graph analysis misses the most critical gaps — tacit knowledge that practitioners don't know they lack. Add embodied gap detection: specifically audit for sensory, tactile, and kinesthetic knowledge that enables expertise but is rarely written down. Ask: "What does this technique feel like when done correctly?" "What visual/tactile/auditory cues indicate success?" Notes about techniques should include sensory anchors even if they can't fully convey the embodied knowledge.

## Related Notes

### Seed Foundation
- [[AI-Assisted Knowledge Management Seed]] — The core Seed being stress tested
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — The rule being tested (gap identification merged into prioritization)

### Related Frontier Explorations
- [[Frontier Gap - Embodied Knowledge]] — Related embodied knowledge concepts
- [[Seed Gap - Recurring and Periodic Knowledge]] — consolidated cyclical knowledge guidance
- [[Frontier Exploration - Ingredient Substitution Knowledge]] — Ingredient-specific knowledge

### Other Stress Tests
- [[Seed Stress Test - Compound Context Rule in Cooking]] — Other cooking stress test
- [[Seed Stress Test - Staging Rule in Cooking Domain]] — More cooking domain testing

### Structural
- [[Graph Maintenance]] — For maintaining note connectivity
