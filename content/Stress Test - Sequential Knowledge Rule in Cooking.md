---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
tags:
  - seed-stress-test
  - cooking-domain
  - sequential-knowledge
  - edge-case
---

# Stress Test: Sequential Knowledge Rule in Cooking Domain

## Seed Rule Being Tested
**Rule:** Distinguish sequential knowledge (where order IS the knowledge) from static and time-sensitive knowledge — tag temporal sequences with `temporal-type: sequence` and prerequisites with `prerequisites: []`.

**Test:** Pick 10 notes in a domain with inherent sequences (history, music, biology, learning). Can you categorize each as: (1) static fact, (2) time-sensitive data, or (3) sequential knowledge? Do sequential notes have temporal-type or prerequisites metadata?

## Application to Cooking Knowledge Base

### Where the Rule Works Well

**Recipes as Sequential Knowledge:**
- **Beef Bourguignon** → temporal-type: sequence
  - Steps MUST happen in order: sear meat → sauté aromatics → deglaze → braise
  - Skipping or reordering steps produces different (usually worse) results

**Bread Baking** → temporal-type: sequence
  - Fermentation timing IS the knowledge: autolyse → bulk ferment → shape → proof → bake
  - Temperature and timing directly affect texture

**Caramelization** → temporal-type: sequence
  - Sugar phases: sugar → molten → amber → burnt
  - The sequence IS the knowledge — you can't skip phases

### Edge Case 1: Parallelizable Steps

**Problem:** Many recipes have steps that can happen in any order:

**Example: Prep ingredients for stir-fry**
- Chop vegetables (any order)
- Make sauce (any order)
- These can happen simultaneously — no strict sequence

**The Test Fails:** Not all cooking steps are truly sequential. Some are:
- **Sequential** (must happen in order): Searing meat before braising
- **Parallelizable** (any order): Prepping mise en place
- **Conditional** (depends on outcome): Adjust seasoning based on taste

The rule assumes sequence is binary (sequential or not), but cooking has degrees.

### Edge Case 2: Interchangeable Elements

**Problem:** Some cooking knowledge has interchangeable components:

**Example: Aromatics**
- onions → carrots → celery (the "mirepoix" concept)
- But you can use ANY of these singly, or add garlic, ginger, lemongrass
- Order matters slightly (hard aromatics first) but not strictly

**The Test Fails:** The rule doesn't handle "options within a pattern" — where there are multiple valid sequences, not one correct one.

### Edge Case 3: Technique vs. Recipe Atomicity

**Problem:** Is "sautéing" a single technique (static knowledge) or a step in many recipes (sequential)?

- **As technique:** "How to sauté" is a reference note — static
- **As step in recipe:** "Sauté onions until translucent" is sequential
- Same concept, different contexts

**The Test Fails:** The atomicity of cooking knowledge depends on context, not just content type.

### Edge Case 4: Iterative Processes

**Problem:** Some cooking processes are iterative, not linear:

**Example: Reducing a sauce**
- Reduce → taste → adjust → reduce → taste → adjust
- This loops until desired consistency

**Example: Bread fermentation**
- Bulk ferment → stretch and fold → bulk ferment → shape
- Repeat cycles

**The Test Fails:** The rule assumes linear sequences (A → B → C), but cooking has loops and iterations.

### Edge Case 5: "Until" Conditions Are Hard to Capture

**Problem:** Cooking steps often depend on sensory cues, not time:

- "Sauté until translucent" — visual cue
- "Cook until done" — touch/visual cue  
- "Season to taste" — personal judgment

**The Test Fails:** Sequential knowledge in cooking isn't just about order — it's about recognizing when to proceed. These cues are tacit knowledge.

### Edge Case 6: Equipment Changes Sequence

**Problem:** The same recipe can have different sequences based on equipment:

**Example: Butter Cake**
- **Conventional oven:** Cream butter → add dry → bake
- **Stand mixer:** Different mixing order
- **Sous vide:** Entirely different process

**The Test Fails:** The rule doesn't account for equipment-dependent sequences.

### Edge Case 7: Traditional vs. Modern Methods

**Problem:** Same dish, different cooking philosophy = different sequences:

**Example: Stocks**
- **Classical French:** Start with cold water, slowly bring up
- **Modern quick:** Start with boiling water, quick extraction
- Both produce stock, different sequences

**The Test Fails:** Multiple valid sequences for the same outcome.

## The Real Issue

The sequential knowledge rule assumes:
1. Knowledge is either sequential or it isn't
2. There's one correct sequence
3. Steps are time-based, not condition-based

Cooking violates all three:
1. Steps can be sequential, parallelizable, or conditional
2. There are often multiple valid sequences
3. "Until" conditions are central to cooking knowledge

## Recommendation

**Refined Rule for Cooking Domain:**
- `temporal-type: linear` — strict order (e.g., bread baking)
- `temporal-type: parallelizable` — can happen in any order (e.g., mise en place)
- `temporal-type: iterative` — loops until condition met (e.g., reducing sauce)
- `temporal-type: conditional` — depends on outcome of previous step

**Additional Field:** `sensory-cues:` for condition-based steps

**Example Frontmatter:**
```yaml
temporal-type: linear
sensory-cues: "Cook until edges pull away from pan and center is set"
prerequisites:
  - Knife Skills
  - Understanding Maillard Reaction
```

**Test:**
1. Can you identify which steps must happen in order vs. can be parallelized?
2. Are there sensory cues that determine when to proceed?
3. Does the recipe have iterations or loops?

## Related
- [[Frontier Exploration - Temporal and Sequential Knowledge]]
- [[Frontier Exploration - Tacit Knowledge Capture]]
- [[Atomic Note Principle]]
