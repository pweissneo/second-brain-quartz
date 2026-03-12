---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
tags:
  - seed-refinement
  - domain-specific
  - stress-test
  - atomicity
---

# Stress Test: Atomicity Rule Across Domains

Testing the atomic note principle across multiple knowledge domains to find universal patterns and domain-specific edge cases.

## Domain Comparison Summary

| Domain | What Works | What Breaks | Key Insight |
|--------|------------|-------------|-------------|
| Cooking | Simple techniques, ingredients, basic recipes | Complex recipes, composite dishes, regional cuisine | Technique vs Recipe distinction |
| Gardening | Sequential procedures (planting, building beds) | Seasonal knowledge, plant-specific guides | Temporal cycles + hub pattern |
| Programming | Code+explanation, API groups, error handling | - | Code is inseparable from explanation |
| Philosophy | Single concepts, thinkers, arguments | Contested concepts, historical overviews | Opposition pairs + perspectives structure |

---

## Universal Findings

### What the Atomicity Rule Gets Right

1. **Single-idea focus** — Notes should have one clear purpose
2. **Self-containment** — Readable without clicking links
3. **Reusability** — Parts can be referenced independently
4. **Word count as proxy** — 100-300 words is a good starting heuristic

### Universal Test for Atomicity

**One-Sentence Summary Test:** Can this note be summarized in one sentence that captures its core purpose?

If yes, it's atomic regardless of word count. This is the ultimate test — not length, but whether the note has a single, coherent focus.

---

## Domain-Specific Findings

### Cooking Domain

**What works ✓:**
- Simple techniques: "How to sear meat" (~150 words)
- Ingredient notes: "Types of onions" (~200 words)
- Basic recipes: "Scrambled eggs" (~180 words)

**What breaks ✗:**
- Complex recipes: "Beef Bourguignon" with all components → 800+ words
- Composite dishes: "Pasta" — too broad (fresh vs dried vs stuffed?)
- Regional cuisine: "Italian cuisine" — could cover hundreds of items

**Key insight:** Distinguish technique (atomic) from recipe (executable procedure).

### Gardening Domain

**What works ✓:**
- Sequential procedures: planting, building raised beds, making compost
- Technique notes: "Pruning Tomatoes", "Watering Newly Planted Trees"

**Edge cases:**
- **Seasonal knowledge:** "Growing Tomatoes" spans spring planting → summer care → fall harvest → winter prep. Splitting destroys the comprehensive cycle gardeners want.
- **Plant-specific vs technique-specific:** Gardeners think by plant; the Seed prioritizes by technique. Solution: create BOTH.
- **Climate/zone dependency:** Same procedure has different parameters across hardiness zones.

**Key insight:** Apply atomicity WITHIN seasons, keep annual cycles as hub notes.

### Programming Domain

**What works ✓:**
- Code + explanation kept together (inseparable for programming)
- API domain areas (e.g., "Stripe Payment API")
- Error handling patterns as coherent concepts
- Framework-specific knowledge as valid atomic units

**Edge cases:**
- **Code snippets:** Both explanation AND executable — keep together
- **API documentation:** Split by domain area, not individual endpoints
- **Tutorial vs Reference:** Tutorials can be longer; reference should be atomic

**Key insight:** Code and explanation are one atomic unit for programming.

---

## Universal Edge Cases

### Edge Case 1: Domain Unit Concepts

Some concepts are inherently brief by definition — they CANNOT be expanded without losing meaning:

- **Music:** Dynamic markings (piano=f, forte=f), tempo markings (Largo, Allegro)
- **Cooking:** Basic techniques (blanch, sauté, sous vide)
- **Science:** SI units (meter, kilogram), chemical elements
- **Gardening:** Hardiness zones, plant families

**Test:** For notes <100 words: (1) Is this a standard unit/notation element? (2) Does splitting make the domain's logic incoherent? (3) Is the brevity intentional, not lazy?

### Edge Case 2: Procedural Content

Recipes, code samples, and technical specs must stay together for usability — even when >300 words. Splitting breaks the workflow.

**Test:** For notes >300 words:
1. Is this an executable procedure? → Keep together
2. Would splitting make it harder to use? → Keep together
3. Are parts independently reusable? → Split if yes

### Edge Case 3: Comprehensive Principle Notes

Notes covering multiple related sub-points in a coherent framework may exceed 300 words when splitting would reduce explanatory coherence.

**Test:** (1) Does the note explore one theme comprehensively? (2) Does it bundle unrelated ideas?

### Edge Case 4: Seasonal/Temporal Knowledge

Knowledge spanning multiple time cycles (seasons, years) needs special handling.

**Test:** Does this span multiple temporal cycles? → Split into atomic notes per cycle + hub note

### Edge Case 5: Tacit Knowledge

Much knowledge is experiential/tacit — cannot be fully captured in text.

**Test:** Does the note describe what experience would teach? Are failure modes captured?

### Edge Case 6: Opposition-Dependent Concepts (Philosophy)

Philosophy often thinks in thesis/antithesis pairs. Some concepts only exist in opposition to another concept.

**Test:** Does the note make sense only in opposition to another concept? → Create bidirectional pairs

**Examples:**
- Materialism ↔ Idealism — linked bidirectionally
- Determinism ↔ Free Will — linked bidirectionally
- Empiricism ↔ Rationalism — linked bidirectionally

### Edge Case 7: Argument Structures (Philosophy)

A philosophical argument (premises + conclusion) is a valid atomic unit even if it references multiple other concepts.

**Test:** Is this a single inferential structure? → Keep as one note, link to component premises

### Edge Case 8: Contested Concepts (Philosophy)

Concepts with 3+ major competing accounts need perspectives structure, not single definitions.

**Test:** Do experts fundamentally disagree on what this IS? → Use perspectives structure

```
## Perspectives

### Viewpoint 1
[description + key proponents]

### Viewpoint 2
[description + key proponents]
```

### Edge Case 9: Historical Development (Philosophy)

For concepts that evolved significantly over time:

- **Hub:** "Concept of X" — links to each historical version
- **Spokes:** "X in Ancient Philosophy", "X in Modern Philosophy"

**Test:** Has this concept changed meaning over 50+ years? → Hub + spokes pattern

---

## Recommendations for Seed

### Refined Atomicity Test

```
Given any note:
1. Can it be summarized in one sentence? → If no, split
2. Is it executable procedure (recipe, code, tutorial)? → Keep together
3. Would splitting make it harder to use? → Keep together
4. Are parts independently reusable? → Split if yes
5. Is it a standard domain unit? → Accept brevity
```

### Domain-Specific Guidance

| Domain | Primary Pattern | Hub Usage |
|--------|-----------------|-----------|
| Cooking | Recipe = atomic | By cuisine/ingredient type |
| Gardening | Technique = atomic | By plant AND by season |
| Programming | Code+explanation = atomic | By framework/language |
| Philosophy | Concept + opposition pair | By school + by problem |

### Updated Seed Rule

**Rule:** Notes should be 100-300 words UNLESS:
- Executable procedure (recipe, code, tutorial)
- Standard domain unit (definition-atomic)
- Comprehensive principle note (coherent framework)
- Hub note serving navigation

**Test:** Apply the One-Sentence Summary Test first — word count is secondary.

---

## Related
- [[Atomic Note Principle]]
- [[AI-Assisted Knowledge Management Seed]] — Core atomicity rules
- [[Domain-Specific Knowledge Bases]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
- [[Stress Test - Prerequisites Rule in Mathematics]]
