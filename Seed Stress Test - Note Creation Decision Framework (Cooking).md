---
gap-status: analyzed
gap-priority: high
gap-type: seed-missing
gap-phase: implementation
discovered: 2026-03-29
schema-version: "1.0"
lifecycle: active
confidence: medium
author-type: ai-assisted
tags:
  - stress-test
  - note-creation
  - cooking-domain
  - gap
  - embodied-knowledge
  - culinary-tradition
  - temporal-validity
---

# Seed Stress Test - Note Creation Decision Framework (Cooking Domain)

> Testing whether note creation rules work for culinary knowledge bases.

## Test Results

**Does the rule make sense for cooking?** YES
- Same core tension (create vs extend) exists in cooking
- Embodied knowledge, recipes, techniques all face creation/extension decisions

**Is the Test executable by an AI?** PARTIALLY
- Criteria 1-2 (standalone sentence, prerequisite structure) are testable
- Criteria 3-4 (natural linking, searchability) are more subjective
- Domain expertise level affects decision tree output

**Edge cases where the rule fails?** YES — several identified

---

## Gap 1: Embodied Knowledge Distinction

**Problem:** Cooking knowledge is embodied — techniques, sensory cues, tactile feedback. The framework doesn't distinguish between:
- Technical knowledge (can be expressed in text)
- Embodied knowledge (requires physical experience to fully capture)

**Why this matters:** For embodied knowledge, "extend" decisions may be premature. Embodied knowledge may warrant its own note because it cannot be fully conveyed in extension — the sensory/physical component is irreducible.

**Proposed rule addition:**
```yaml
# For embodied knowledge domains
creation-guidance:
  embodied-distinction: true
  embodied-vs-technical:
    technical: can be captured in text extension
    embodied: irreducible physical/sensory component requires standalone note
  example: "Searing technique" vs "Proper fond formation" - former is extendable, latter requires standalone
```

**Test:** For cooking technique notes: (1) Does this knowledge require physical sensation to fully understand? (2) Could an AI agent verify this knowledge without execution? If yes to 1 and no to 2, this is embodied knowledge requiring standalone treatment.

---

## Gap 2: Domain-Category Awareness

**Problem:** Cooking has established categories (mother sauces, fundamental techniques, knife skills, cooking methods) that the framework doesn't reference. A beginner cook discovering "reduction" may think it's a new concept worth a dedicated note, when it already exists in culinary literature as a mother sauce derivative.

**Why this matters:** Without domain-category awareness, AI agents create redundant notes for knowledge that already exists in established culinary categories. The framework assumes the AI knows the domain taxonomy.

**Proposed rule addition:**
```yaml
# For domains with established knowledge categories
creation-guidance:
  domain-category-awareness: true
  category-check: "Before creating, check if this concept exists in established domain categories"
  culinary-categories:
    - mother-sauces-and-derivatives
    - fundamental-techniques
    - knife-skills
    - cooking-methods
    - ingredient-preparations
  example: "Reduction" → check mother-sauce category before creating → link to Béchamel/Velouté
```

**Test:** For domain-categorical knowledge: (1) Does this concept exist in established domain categories? (2) Does the vault have a domain taxonomy note? (3) Did you check the taxonomy before creating?

---

## Gap 3: Temporal Validity Handling

**Problem:** The framework treats all notes as static, but cooking notes have different temporal validity:
- Techniques (timeless) — creation/extension decision is permanent
- Recipes (version-specific) — decisions may be transient
- Seasonal knowledge (cyclic) — decisions may repeat

**Why this matters:** The same knowledge may need different treatment at different times. A recipe for pumpkin pie is "new" in October and "extension of seasonal note" in November. The framework doesn't handle temporal validity variance.

**Proposed rule addition:**
```yaml
# For knowledge with varying temporal validity
creation-guidance:
  temporal-validity-handling: true
  validity-types:
    timeless: "Permanent creation/extension decision (techniques)"
    version-specific: "Transient decision, may need revision with version updates"
    cyclic: "Recurring decision, same knowledge may need new note each cycle"
  example: "Pumpkin pie recipe" → cyclic validity → create seasonal note, not permanent note
```

**Test:** For cooking notes: (1) Is this knowledge timeless, version-specific, or cyclic? (2) Does the creation decision match the temporal validity type?

---

## Gap 4: Expertise-Dependent Granularity

**Problem:** The decision tree output depends on cook expertise level:
- Beginner sees "reduction" as NEW concept → creates note
- Intermediate knows "reduction" as technique → extends existing sauce note
- Expert sees "reduction" as applied to SPECIFIC ingredient → creates ingredient-variant note

**Why this matters:** Same knowledge triggers different decisions based on who makes them. The framework doesn't account for user expertise level affecting what counts as "new."

**Proposed rule addition:**
```yaml
# For expertise-dependent domains
creation-guidance:
  expertise-context: true
  expertise-calibration:
    beginner: "Any new-to-them concept → create standalone note"
    intermediate: "New technique category → create; new example → extend"
    advanced: "Specific application/variant → create; general principle → extend"
  note: "For personal vaults, expertise is the vault owner's expertise level"
```

**Test:** Can you identify the expertise level at which this knowledge was captured? Does the creation/extension decision match that expertise level?

---

## Gap 5: Recipe vs Technique Contamination

**Problem:** Many cooking notes are hybrids (recipe+technique). The framework asks "can this idea stand alone?" but a recipe that uses a technique cannot stand alone without the technique context.

**Why this matters:** Distinguishing when a cooking note is about technique vs. recipe requires domain expertise beyond the decision tree. AI agents may create recipe notes thinking they're creating technique notes.

**Proposed rule addition:**
```yaml
# For hybrid-domain notes
creation-guidance:
  hybrid-domain-handling: true
  recipe-vs-technique:
    recipe: "Purpose is to produce specific food item; includes ingredients, quantities, steps"
    technique: "Purpose is to teach a repeatable skill; applies across multiple recipes"
  separation-test: "Can this be executed without understanding a broader technique?"
  recipe-contamination: "If recipe requires prior technique knowledge, it's not standalone"
  guidance: "Keep recipe and technique notes separate; recipes link to techniques"
```

**Test:** For cooking notes: (1) Is this primarily a recipe (specific output) or technique (repeatable skill)? (2) Does it require prior knowledge to execute? (3) Can it be applied to different outputs?

---

## Gap 6: Cultural/Regional Variation Handling

**Problem:** When learning a cooking technique from a non-native cuisine, the decision is ambiguous:
- Is it a NEW note because it's new to the cook?
- Or an EXTENSION of the existing technique note?

**Why this matters:** The framework says "new concept" but for a cook learning Italian cooking, reduction IS new even if it exists in culinary literature. Knowledge that's "new to user" may warrant different treatment than knowledge that's "new to field."

**Proposed rule addition:**
```yaml
# For cross-cultural knowledge capture
creation-guidance:
  cultural-variation: true
  new-to-user-vs-new-to-field:
    new-to-user: "Create note, link to canonical technique"
    new-to-field: "Check for existing note, extend if found"
  cross-cultural-note: "Add context noting this is from non-native cuisine"
  example: "Japanese dashi technique" → new-to-user → create with link to general stock-making technique
```

**Test:** For techniques from non-native cuisines: (1) Does this technique exist in the vault? (2) Is this new to the vault owner? (3) Does the note include cultural context?

---

## Recommendations for Seed Update

The Note Creation Decision Framework needs domain-specific guidance for:
1. Embodied knowledge distinction (cooking, crafts, music)
2. Domain-category awareness (established fields like culinary arts)
3. Temporal validity handling (cyclic vs. timeless knowledge)
4. Expertise-dependent granularity (decision output varies by user level)
5. Recipe vs. technique contamination (hybrid domain handling)
6. Cultural/regional variation handling (cross-cultural capture)

**Integration point:** Add edge cases to the Note Creation Decision Framework note covering these domain-specific adaptations.

---

## See Also

- [[Seed Stress Test - Gap Identification Rule in Cooking]]
- [[Seed Stress Test - Diminishing Returns Testing in Cooking]]
- [[Seed Stress Test - Error Knowledge Capture in Cooking]]
- [[Frontier Exploration - Embodied Knowledge in Knowledge Bases]]
- [[Note Lifecycle Management]] (for temporal validity of notes)

---

**Test (for AI agents):** Run on your last 10 cooking notes. How many creation decisions matched the expertise level of the vault owner? How many embodied knowledge notes are properly standalone?