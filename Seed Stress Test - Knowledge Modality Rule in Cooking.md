---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - knowledge-modality
  - cooking-domain
schema-version: "1.0"
---

# Seed Stress Test: Knowledge Modality Rule in Cooking

> Testing the "knowledge modality" rule in cooking domain.
> Related: [[AI-Assisted Knowledge Management Seed]], [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]], [[Seed Stress Test - Practice Meta-Knowledge in Cooking]]

**Date:** 2026-03-24  
**Domain:** Cooking  
**Rule Tested:** For domains with distinct knowledge modalities, tag notes with `knowledge-modality:` to distinguish use cases.

---

## The Rule Under Test

**From Seed:** For domains with distinct knowledge modalities (how knowledge is used), tag notes with `knowledge-modality:` to distinguish use cases.

**Implementation:** Use `knowledge-modality:` frontmatter with domain-appropriate values:
- Music: performance, analysis, compositional, hybrid
- Medicine: diagnosis, prognosis, treatment, hybrid  
- Engineering: theoretical, practical, design, hybrid

**Test:** For domain-specific notes: (1) Can you identify which modality this knowledge serves? (2) Does the note include `knowledge-modality:` field? (3) Are different modalities structured appropriately for their use case?

---

## Stress Test: Applying to Cooking

### Expected Modalities in Cooking

Based on how cooking knowledge is used, I propose these modalities:
- `lookup`: Quick reference (timings, ratios, ingredient lists)
- `technique`: Reusable skill (how to sauté, emulsify, braise)
- `recipe`: Complete procedure (specific dish with steps)
- `troubleshooting`: Diagnostic reasoning (why did this fail?)
- `substitution`: Ingredient/technique replacement logic
- `safety`: Food safety rules (temperature, storage, cross-contamination)
- `calibration`: Personal taste preferences

---

## Edge Cases Identified

### Edge Case 1: Multi-Modal Notes

**Problem:** Many cooking notes naturally serve multiple modalities. A note about "cooking rice" can be:
- lookup (what ratio to use)
- technique (how to control heat, when to lid)
- troubleshooting (why is it mushy?)

The current rule expects a single modality, but cooking notes are inherently hybrid.

**Test Failure:** An AI cannot cleanly assign one `knowledge-modality` value to a note like "How to Cook Rice" because it serves multiple valid use cases.

**Proposed Refinement:** Allow `knowledge-modality: mixed` with explicit `modalities-served:` list:
```yaml
knowledge-modality: mixed
modalities-served:
  - lookup
  - technique
  - troubleshooting
```

---

### Edge Case 2: Context-Dependent Modality

**Problem:** The same technique applies differently in different contexts:
- "How to sear meat" as a home cook vs. as a professional chef
- "Knife skills" for home cooking vs. for competition

Different contexts make the same knowledge serve different purposes.

**Test Failure:** The rule doesn't address how context changes modality applicability.

**Proposed Refinement:** Add `context-scope:` field:
```yaml
knowledge-modality: technique
context-scope: home-cooking|professional|野外|historical
```

---

### Edge Case 3: Evolving Modalities (Modernist Cuisine)

**Problem:** Modernist cuisine (molecular gastronomy) uses scientific approaches that sometimes contradict traditional techniques. Does this represent:
- A different modality (science-based vs. traditional)?
- A different framework within the same modality?

**Example:** "Sous vide" cooking - is it technique (cooking method) or requires new modality (precision-temperature control)?

**Test Failure:** The rule doesn't address when a domain develops NEW modalities that didn't previously exist.

**Proposed Refinement:** Add framework tagging:
```yaml
knowledge-modality: technique
framework: traditional|modernist|regional-style
note: "Modernist technique requiring precision temperature control"
```

---

### Edge Case 4: Substitution Knowledge is Triple-Layered

**Problem:** Ingredient substitution is simultaneously:
1. Lookup (what substitutes exist for X?)
2. Chemistry (why does Y work as substitute?)
3. Procedure (how to adjust cooking when using Y)

**Test Failure:** The substitution domain in cooking cannot be cleanly categorized as one modality.

**Proposed Refinement:** Create compound modality:
```yaml
knowledge-modality: substitution
sub-components:
  - lookup
  - explanatory
  - procedural
```

---

### Edge Case 5: Safety as Conditional Activation

**Problem:** Food safety knowledge is condition-triggered:
- "Refrigerate within 2 hours" only applies when temperature >90°F
- "Cook to 145°F" only applies to pork

This is both modality (safety) AND condition-triggered (from the Condition-Triggered Knowledge rule).

**Test Failure:** No guidance on how knowledge-modality interacts with condition-triggered rules.

**Proposed Refinement:** Add safety-activation:
```yaml
knowledge-modality: safety
activation-conditions:
  - condition: food-type
    in: [poultry, pork, ground-meat]
  - condition: ambient-temperature
    greater-than: 90
```

---

### Edge Case 6: Recipe Atomicity vs. Technique Composability

**Problem:** A recipe is atomic (you follow it as a whole), but techniques are composable (you combine them). The same knowledge can be:
- Atomic unit (follow this specific recipe)
- Component (use this technique in many recipes)

**Test Failure:** No guidance on when cooking knowledge should be atomic (recipe) vs. composable (technique).

**Proposed Refinement:** Add compositionality:
```yaml
knowledge-modality: recipe
compositionality: atomic  # Follow as complete unit
---
knowledge-modality: technique
compositionality: composable  # Can be combined with others
```

---

## Revised Test for Cooking Domain

For cooking notes, the test should be:

1. **Can you identify the primary modality?** (Pick the most important use case)
2. **Is the note tagged with knowledge-modality?**
3. **Are there secondary modalities?** (If mixed, use `knowledge-modality: mixed`)
4. **Does the structure match the modality?** (Recipes should be step-by-step, techniques should explain principles)
5. **Are context constraints documented?** (Home vs. professional, modern vs. traditional)

---

## Additional Edge Cases

### Edge Case 7: Taste Calibration is Personal, Not Universal

Cooking has rich personal taste knowledge ("I prefer medium-rare," "I like bold flavors"). This isn't really a modality - it's a separate dimension (subjectivity).

**Issue:** The rule treats all domain knowledge as having modalities, but cooking has significant personal/subjective knowledge that doesn't fit the modality framework.

**Proposed Addition:** Add `subjectivity:` dimension:
```yaml
subjectivity: universal|personal|contextual
# Universal: food safety temperatures (always true)
# Personal: "I prefer柠檬酱over tomato"
# Contextual: "This dish is too spicy for children"
```

---

### Edge Case 8: Historical/Evolving Techniques

**Problem:** Cooking techniques evolve. "The French Laundry's approach to sous vide" is now historical technique. How do you tag knowledge about superseded methods?

**Proposed Addition:** Add temporal validity:
```yaml
knowledge-modality: technique
temporal-scope: current|historical|evolving
framework: classical-modern|modernist|fusion
```

---

## Summary of Proposed Refinements

1. **Allow mixed modality** with explicit `modalities-served:` list
2. **Add context-scope** for home/professional/regional contexts  
3. **Add framework tagging** for competing methodological approaches
4. **Support compound modalities** for substitution knowledge
5. **Integrate with condition-triggered** for safety knowledge
6. **Add compositionality** for atomic vs. composable knowledge
7. **Add subjectivity dimension** for personal vs. universal knowledge
8. **Add temporal-scope** for evolving/historical techniques

---

## Is the Rule's Test Executable by an AI?

**Partially.** The basic test (identify modality, tag it, structure appropriately) is executable. However:

- **Multi-modal notes** require AI judgment to determine primary vs. secondary modality
- **Context-dependent** requires understanding user's context
- **Framework conflicts** (traditional vs. modernist) require domain expertise

**Recommendation:** The test should include a fourth criterion:
> (4) For notes serving multiple modalities, is `knowledge-modality: mixed` used with explicit secondary modalities listed?
