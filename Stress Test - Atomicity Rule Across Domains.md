---
last-reviewed: 2026-03-18
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - domain-specific
  - stress-test
  - atomicity
  - philosophy
---

# Stress Test: Atomicity Rule Across Domains

> This note consolidates stress tests for atomicity and word count rules across multiple knowledge domains.

## Merged from: Seed Stress Test - Word Count Rule.md

The following findings from the Word Count Rule stress test have been integrated:

### Additional Edge Cases from Word Count Testing

#### 1. Reference Content Not Explicitly Covered

**Problem:** The rule has edge cases for procedural content but misses reference content:
- Drug monographs (indications, contraindications, dosage, side effects, interactions, pharmacology)
- Device specifications
- Anatomical entries
- Encyclopedia-style entries

**Test scenario:** A note about "Acetaminophen" covering all pharmacological aspects could be 2000+ words but is ONE drug (one "idea" by domain standards).

**Proposed refinement:**
```
**Edge case:** Reference content (drug monographs, device specifications, encyclopedia entries, taxonomic classifications) may legitimately exceed 300 words when covering one complete reference unit. The test: (1) Is this a single reference entity? (2) Would splitting make it harder to look up? (3) Are parts not independently reusable? Keep together if yes to 1-2.
```

#### 2. Legal Documents Misclassified

**Problem:** Edge case mentions "legal documents" as procedural content, but:
- Contracts aren't executed step-by-step like recipes
- Statutes aren't tutorials
- Legal documents are reference content - you consult them, don't follow them

**Proposed refinement:**
```
**Edge case:** Legal documents (contracts, statutes, regulations) are reference content, not procedural content. Apply the reference content test: (1) Is this one legal instrument? (2) Does the user consult it rather than execute it linearly? (3) Would splitting impair legal context? Keep together if yes.
```

#### 3. Hub Notes for Aggregated Collections

**Problem:** Recipe collections, music playlists, reading lists - hub notes that legitimately aggregate many items may need 500+ words.

**Proposed refinement:**
```
**Edge case:** Hub notes that aggregate many items may exceed 300 words when each item needs contextual description. The test: (1) Is this a pure navigation hub (under 200 words acceptable)? (2) Does each aggregated item need explanation beyond just a title? Expand hub if yes to 2-3.
```

#### 4. Domain Patterns vs Individual Works

**Problem:** The rule covers "single creative works" but not:
- Musical forms (sonata form, rondo form - patterns, not single works)
- Architectural styles
- Design patterns in software

**Proposed refinement:**
```
**Edge case:** Domain patterns (musical forms, architectural styles, design patterns, methodological frameworks) are valid atomic units even when exceeding 300 words. The test: (1) Is this a reusable pattern rather than a single instance? (2) Does the pattern have multiple components that must be understood together? Keep together if yes.
```

---

## Original Content: Atomicity Rule Across Domains

Testing the atomic note principle across multiple knowledge domains to find universal patterns and domain-specific edge cases.

## Domain Comparison Summary

| Domain | What Works | What Breaks | Key Insight |
|--------|------------|-------------|-------------|
| Cooking | Simple techniques, ingredients, basic recipes | Complex recipes, composite dishes, regional cuisine | Technique vs Recipe distinction |
| Gardening | Sequential procedures (planting, building beds) | Seasonal knowledge, plant-specific guides | Temporal cycles + hub pattern |
| Programming | Code+explanation, API groups, error handling | - | Code is inseparable from explanation |
| Philosophy | Single concepts, thinkers, arguments | Contested concepts, historical overviews | Opposition pairs + perspectives structure |
| Legal | Case briefs, single statutes | Multi-issue opinions, jurisdiction-spanning topics | Reference vs analysis distinction |

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

### Legal Domain

**What works ✓:**
- Case briefs: each case = one note, atomicity works well
- Single statutes: each statute as one reference unit
- Legal terminology: definitions are atomic by nature

**What breaks ✗:**
- Comprehensive statute notes: a single statute may have multiple subsections (definitions, requirements, exceptions) that would require 5+ notes
- Multi-issue court opinions: one opinion may address multiple legal issues (contract formation, damages, procedural issues)
- Jurisdiction-spanning topics: "LLC Formation" covering federal + California + Delaware rules

**Edge cases:**
- **Comprehensive legal references:** Notes like "2024 Tax Act Summary" must cover multiple provisions, effective dates, and prior law interactions — splitting would make them unusable. Solution: tag with `reference-type: comprehensive`.
- **Multi-part legal tests:** Legal tests often have multiple elements (fraud = misrepresentation + knowledge + intent + reliance + damages). Each element could be separate, but the test is a unit. Solution: tag with `legal-test:`.
- **Jurisdiction-specific knowledge:** When a topic spans multiple jurisdictions, split by jurisdiction rather than trying to keep everything in one note.

**Key insight:** Distinguish legal reference content (statutes, cases, regulations — consulted, not executed) from legal analysis (synthesizing multiple sources — may violate atomicity but should be broken down).

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

### Edge Case 10: Equipment-Specific Procedures (Technical Domains)

Some procedures ONLY apply to specific equipment or software. Example: "NINA imaging workflow" — only applies to that specific software.

**Test:** Is this specific to one tool/product? → Keep as separate atomic note from general principle
- The general principle: "imaging workflow" (general)
- The specific implementation: "NINA workflow" (atomic to that specific tool)

This applies to: photography software, programming frameworks, domain-specific tools.

### Edge Case 11: Temporal Knowledge with Expiration

Knowledge that changes over time (ephemeris data, yearly events, equipment models, yearly guides) needs time-boxing.

**Test:** Does this knowledge have a known expiration? → Add `valid-until: YYYY-MM-DD` frontmatter
- Link to general principles note
- Mark with `lifecycle: transient` if appropriate

This applies to: astronomy ephemeris, yearly planning guides, equipment compatibility lists, event schedules.

### Edge Case 12: Large Procedural Workflows

Some workflows are sequential and MUST be followed in order - splitting them makes them harder to use. Examples: astrophotography processing pipeline, CI/CD workflows, complex recipes.

**Test:** (1) Does user need to execute linearly? (2) Would splitting make it harder to use? (3) Are parts independently reusable?
If yes to 1-2 and no to 3: Keep together even if >300 words.

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

### Issue Found: The "And" Test is Problematic

The Seed's current test states: "If the summary requires 'and', split it."

This heuristic is too simplistic because:
- "The relationship between X and Y" is ONE idea, even with "and"
- Comparative notes like "X vs Y" are single ideas
- Hub notes may list multiple topics but are still single navigation ideas
- The word "and" is connective, not indicative of multiple ideas

**Better test:** Use the One-Sentence Summary Test without the "and" prohibition:
"Can this note be summarized in one sentence that captures its core purpose?"

If yes → atomic. The presence of "and" in a summary is NOT a reliable indicator of multiple ideas.

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

## Philosophy Domain: Additional Refinements

### Rule Update Proposal (from Philosophy Stress Test)

> **Additional Edge Case - Philosophical Concepts:** For philosophy knowledge bases:
> - Opposition-dependent concepts (materialism/idealism): create bidirectional pairs
> - Historical development across eras: prefer temporal splitting with hub
> - Canonical thought experiments: allow brief notes with `type: thought-experiment`
> - Schools of thought: use hub+spoke with clear doctrine boundaries
> - Interpretive debates: use perspectives structure
> - Default to `confidence: emerging` for contested philosophical claims

**Test:** Can you apply atomicity rules to philosophy concepts without artificial fragmentation?

### Specific Philosophy Challenges Validated

The philosophy stress test confirmed these challenges:

1. **Opposition-Dependent Concepts:** Free Will cannot be understood without Determinism - create bidirectional pairs
2. **Multi-Premise Arguments:** Keep argument as atomic unit; individual premises MAY be separate notes
3. **Philosophical Works:** 500+ page works violate word count - solution is overview + linked deep-dives
4. **Historical Development:** Split by era (Ancient/Medieval/Modern/Contemporary) with hub
5. **Schools of Thought:** Hub+spoke pattern works well (Stoicism hub → Stoic Ethics, Stoic Physics, etc.)

### Additional Edge Cases from Philosophy Testing

#### Edge Case: Philosophical Jargon
Philosophy uses precise technical terms (epistemology, ontology, phenomenology) that are inherently brief but essential. These are like domain unit concepts.

**Test:** Allow under 100 words with `type: terminology` tag.

#### Edge Case: Thought Experiments
Classic thought experiments (Trolley Problem, Ship of Theseus, Brain in a Vat) are atomic units even when brief because:
- Referenced as complete units
- Can be applied across multiple philosophical debates
- Breaking them apart loses their identity

**Test:** Allow under 100 words with `type: thought-experiment` tag.

#### Edge Case: Interpretive Debates
Major philosophical texts have centuries of interpretation. Present multiple interpretive positions within one note using the perspectives structure.

**Test:** This is where the perspectives structure applies - the note presents multiple views, which IS the single idea.

---

## Related
- [[Atomic Note Principle]]
- [[AI-Assisted Knowledge Management Seed]] — Core atomicity rules
- [[Domain-Specific Knowledge Bases]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
- [[Stress Test - Prerequisites Rule in Framework Learning]] — consolidated prerequisites stress test
- [[Frontier Exploration - Game Design Knowledge]] — tests atomicity in mechanical systems with high interdependence

---
## Consolidation Note

This note now consolidates content from the following merged files:
- **Seed Stress Test - Word Count Rule.md** (merged 2026-03-14) — Word count and reference content edge cases
