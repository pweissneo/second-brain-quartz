---
last-reviewed: 2026-03-12
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - cooking-domain
  - edge-case
---

# Seed Stress Test: Cooking Knowledge Base

Testing all Seed rules in the cooking domain reveals where general rules break down for culinary knowledge.

> "A knowledge base that only captures successes is incomplete." — [[Anti-Patterns in Knowledge Management]]

## Domain Overview

Cooking knowledge bases face unique challenges:
- Procedural content (recipes) legitimately exceeds 300+ words
- Foundational ingredients (salt, oil, water) are referenced by everything but link to nothing
- Sequential knowledge is central but has degrees (linear, parallelizable, iterative)
- Regional terminology variations are all "correct"

---

## 1. Word Count Rule

**Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Cooking Application:**
- A recipe like "Boeuf Bourguignon" at 800 words flags for review
- Edge case applies: "Is this an executable procedure? Yes"
- Follow-up: "Would splitting make it harder to use?" → Yes

**Gap:** The test doesn't tell AI HOW to handle the edge case.

**Suggested Improvement:**
> For procedural content: If clearly executable AND meets either: (a) user must execute linearly, OR (b) splitting would lose essential context → Do NOT flag. Only split if parts are genuinely reusable AND >1000 words.

**Related:** [[Atomic Note Principle]], [[Frontier Exploration - Conditional and Troubleshooting Knowledge]]

---

## 2. "At Least 2 Links" Rule

**Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true`.

**Cooking Application:**
Recipes naturally connect to ingredients, techniques, equipment, flavor profiles.

**Edge Cases:**
1. **True foundational primitives**: Salt, oil, water — used everywhere but don't link out
2. **Single-component recipes**: "Boiled egg" only links to "egg" and "boiling"
3. **Historical/period recipes**: Limited to period-accurate ingredients

**Problem:** "Verify manually" instruction means test is NOT fully automated.

**Proposed Improvement:**
Use explicit metadata: `foundational: true` tag makes test fully executable.

---

## 3. No Zero Backlinks Rule

**Rule:** Every note should be linked to from at least one other note.

**Cooking Application:**
- Techniques link to recipes using them
- Recipes link to ingredients
- Equipment links to recipes requiring it

**Edge Cases:**
1. **Universal ingredients** (salt, oil, water): Referenced by 500+ recipes but link to nothing — high backlinks, low outgoing
2. **Navigation hubs**: "List of Pasta Shapes" aggregates but nothing links TO it
3. **Regional ingredients**: "Suet" might have zero backlinks in a modern vault

**Recommendation:**
> Every note must be reachable from `_root.md` in ≤3 hops AND should have ≥1 backlink UNLESS: (a) universal/primitive element, (b) navigation hub, (c) foundational reference.

---

## 4. Operational vs Synthesized Knowledge

**Rule:** Separate operational knowledge from synthesized knowledge — time-box or mark temporary.

**Cooking Application:**

| Note Type | Category | Action |
|-----------|----------|--------|
| "How to Roast Chicken" | Permanent | Keep |
| "Thanksgiving 2025 Menu" | Operational | Time-box |
| "Chocolate Chip Cookie Recipe" | Permanent | Keep |
| "Week 10 Meal Plan" | Operational | Delete after week |
| "Pantry Inventory March 2026" | Operational | Delete after update |

**Edge Cases:**
- **Recipe notes**: "Grandma's Chicken Soup" — is this operational or permanent? Verdict: **permanent** (synthesizes technique and cultural knowledge)
- **Restaurant reviews**: "My Review of Chez Panisse" — delete or deprecate (not synthesizable knowledge)

**Recommendation:**
- Personal opinion/review = operational debris
- Research/principle = synthesized
- Time-specific plans = operational
- Transferable techniques = synthesized

---

## 5. Sequential Knowledge Rule

**Rule:** Distinguish sequential knowledge (where order IS the knowledge) with `temporal-type: sequence`.

**Cooking Application:**

| Type | Example | temporal-type |
|------|---------|----------------|
| Bread baking | autolyse → bulk ferment → shape → proof → bake | linear |
| Prep ingredients | Chop vegetables, make sauce | parallelizable |
| Reducing sauce | Reduce → taste → adjust → reduce | iterative |
| Searing meat | Depends on outcome of each step | conditional |

**Edge Cases:**
1. **Parallelizable steps**: Mise en place can happen in any order
2. **Interchangeable elements**: "Aromatics" — onions, carrots, celery (order matters slightly but not strictly)
3. **Technique vs. Recipe**: "Sautéing" as technique = static; "Sauté onions" in recipe = sequential
4. **Iterative processes**: Reducing sauce, bread fermentation
5. **"Until" conditions**: "Cook until translucent" — sensory cues, not time
6. **Equipment-dependent**: Same recipe, different sequence for oven vs sous vide
7. **Traditional vs. Modern**: Stocks — classical French vs modern quick

**Recommendation:**
```yaml
temporal-type: linear | parallelizable | iterative | conditional
sensory-cues: "Cook until edges pull away from pan"
```

---

## 6. Terminology Consistency Rule

**Rule:** Pick one term per concept and use it everywhere.

**Cooking Application:**
- Equipment: "skillet" OR "frying pan" consistently
- Techniques: "simmer" consistently

**Edge Cases:**
1. **Genuinely different terms:**
   - Sauté vs pan-fry vs stir-fry (different techniques)
   - Broth vs stock (different preparations, though some regions reverse)

2. **Regional variations (both valid):**
   - Bell pepper (US/UK) vs capsicum (AU/NZ)
   - Eggplant (US) vs aubergine (UK)
   - Cilantro (US leaves) vs coriander (seeds/UK)

3. **Technical vs common:**
   - "Deglaze" (technical) vs "add liquid to pan" (common)
   - Different audiences need different terms

4. **Historical/classical:**
   - "Fond" (French) vs "brown bits" (common)

**Recommendation:**
> Terminology consistent UNLESS: (a) distinct terms represent different techniques, (b) regional variations both valid, (c) common + technical serve different audiences.

---

## Summary of Edge Cases

| Rule | Edge Case | Solution |
|------|-----------|----------|
| Word count | Recipes >300 words | Don't flag if executable procedure |
| 2+ links | Salt, oil, water | Use `foundational: true` |
| No zero backlinks | Universal ingredients | Allow if referenced 10+ times indirectly |
| Operational vs synthesized | Recipes | Recipes = permanent; meal plans = time-box |
| Sequential knowledge | Parallelizable steps | Add `temporal-type: parallelizable` |
| Terminology | Regional variants | Allow both with context |

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Chess Knowledge Base]] - Another domain stress test
- [[Seed Stress Test - Woodworking Knowledge Base]] - Craft domain stress test
- [[Domain-Specific Knowledge Bases]]
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Stress Test - Atomicity Rule Across Domains]]
- [[Stress Test - Prerequisites Rule in Framework Learning]] — consolidated prerequisites stress test
- [[Handling Temporal Knowledge]]
- [[Frontier Exploration - Jargon vs Plain Language]]
