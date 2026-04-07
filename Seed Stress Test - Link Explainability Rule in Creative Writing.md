---
last-reviewed: 2026-03-31
last-updated: 2026-03-31
lifecycle: emerging
confidence: medium
author-type: ai-assisted
tags: [seed-stress-test, creative-writing, linking, fiction]
---

# Seed Stress Test: Link Explainability Rule in Creative Writing

**Rule tested:** Every link must be explainable in one sentence — no decorative or keyword-match links.

**Domain:** Creative writing / fiction knowledge bases

## Does this rule make sense for creative writing?

**Analysis:** The rule mostly makes sense but has unique tensions in fiction:

1. **Character links** - A character note links to many works differently. "Harry Potter links to The Philosopher's Stone" (instance) vs "Harry Potter links to characterization principles" (example). Both are explainable but serve different purposes.

2. **Theme links** - A theme like "fate" appears in multiple works. The link "fate → Oedipus Rex" is explainable as "the concept of fate is instantiated in Oedipus Rex." But the link "Oedipus Rex → fate" is explainable as "this work explores the theme of fate." Both work but direction matters.

3. **Quote links** - Quotes link to characters, themes, works, and principles. Each link type serves a different purpose. The "explainable in one sentence" test passes but loses nuance.

4. **Spoiler-sensitive links** - Linking to a note that contains plot spoilers may violate reader experience even if the link is technically explainable. The rule doesn't address this.

## Is the Test executable?

**Test:** "For each link in a note, can you state why the reader should follow it?"

**Analysis:** Yes, but it's hard to verify consistently. In fiction:
- Some links are bidirectional but explain differently in each direction
- Link purpose varies (character instance, principle example, thematic exploration)
- Spoiler consideration adds a layer beyond "explainable"

## Edge cases identified

1. **Character hub links** - A character hub links to all works featuring that character. The link is explainable ("see all appearances of this character"), but each work link has a different relationship (protagonist in one, minor role in another).

2. **Spoiler chains** - Linking to a note containing spoilers. Even if explainable ("this note discusses the villain's motivation"), the link may harm reader experience. The rule needs a spoiler consideration.

3. **Interpretive framework links** - Links between different interpretive analyses. "This Marxist analysis links to this feminist analysis" is explainable as "both analyze the same work but from different frameworks." But the link might imply the analyses are compatible when they're not.

4. **Quote-to-theme links** - A quote supports multiple themes. The link "Quote X → Theme Y" is explainable ("this quote exemplifies this theme"), but the same quote might exemplify Theme Z equally well.

5. **Adaptive reuse links** - A retelling (e.g., "Pride and Prejudice and Zombies") links to the original. The link is explainable as "this work adapts elements from the original." But it's also a commentary, a parody, and a genre mashup.

## How the Seed's fiction rules handle this

The Seed's fiction rules (added 2026-03-24, lines 2924-2950) partially address these issues:
- `link-type` frontmatter distinguishes learning vs constitutive vs reference
- Spoiler tagging (`spoiler-level`, `spoiler-scope`) addresses the spoiler link problem
- `interpretive-framework` addresses cross-framework linking

But the explainability test doesn't incorporate these refinements. The test should be:

> **Refined test:** For each link: (1) Can you explain why in one sentence? (2) If the target has spoilers, does the link warn appropriately? (3) Is the link type marked (learning, constitutive, reference)?

## Suggested refinement

Add to the link explainability rule:

> **Edge case:** In fiction knowledge bases, links to spoiler-tagged notes should include spoiler warning in link text or frontmatter. Use `link-spoiler-warning: true` when linking to content with `spoiler-level: critical|ending`.

> **Edge case:** Character hub links are constitutive ("character appears in work"), not learning ("understanding character helps understand work"). Mark link type explicitly.

> **Edge case:** Quote links are evidence links ("this quote demonstrates this principle"), distinguishable from learning links. Consider `link-type: evidence` alongside learning/constitutive/reference.

## Comparison to cooking stress test

The cooking stress test for linking (reviewed 2026-03-26) identified:
- Single-instance entities need `specialized: true`
- Domain primitives need `foundational: true`
- Technique-to-ingredient links differ from technique-to-technique

Creative writing similarly needs:
- Character instance links differ from character principle links
- Quote-as-evidence differs from quote-as-reference
- Spoiler-aware linking beyond basic explainability

## What I learned

1. **The explainability test is necessary but not sufficient for fiction** - Spoiler awareness, link typing, and directionality matter more in fiction than in other domains.

2. **Fiction links are more multi-dimensional** - A single link can be both learning and constitutive depending on traversal direction. The rule should acknowledge this bidirectionality.

3. **The Seed's fiction extensions (spoiler tags, interpretive framework, knowledge layers) integrate with the link rule** - They're not separate but layered on top.

---
**See also:** [[AI-Assisted Knowledge Management Seed]], [[Frontier Exploration - Creative Writing Knowledge Base Gaps]], [[Seed Stress Test - Linking Rule in Cooking]]
