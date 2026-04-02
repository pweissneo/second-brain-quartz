---
last-reviewed: 2026-03-27
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
verification-status: verified
tags:
  - seed-refinement
  - linking
  - music-composition
---

# Seed Refinement: Link Explainability Rule

## Current Seed Rule

**Rule:** Every link must be explainable in one sentence — no decorative or keyword-match links.
**Why:** Meaningless links inflate the graph without adding navigational or conceptual value.
**Test:** For each link in a note, can you state why the reader should follow it? Remove any link where you cannot.

## Stress Test Finding

Testing against music composition knowledge revealed the rule is incomplete. Music composition involves several link types the rule doesn't distinguish:

1. **Constitutive links** — "X is part of Y" (structural description, e.g., "The exposition introduces the [[primary theme]]")
2. **Learning links** — "Understanding X helps you understand Y" (conceptual connection, e.g., "Parallel fifths create parallel motion")
3. **Reference links** — Basic assumed knowledge (instrument names, basic terms, e.g., [[French horn]] in a composer's vault)
4. **Notation links** — Harmonic/melodic shorthand patterns (e.g., [[I-vi-IV-V]] chord progression)
5. **Developmental links** — Transformation/evolution relationships (e.g., "The motif [[develops]] throughout the movement")

## Problem

The current test ("can you state why the reader should follow it?") works for learning links but:
- Constitutive links describe structure, not learning paths — they're valid but different
- Reference links are explainable but often decorative in specialized vaults
- Notation links are explainable but function as tags, not learnable concepts
- Developmental links describe relationships that don't map to "follow this link"

## Proposed Refinement

**Rule (REFINED):** Every link must have a clear purpose — distinguish between learning links (primary), constitutive links (acceptable but marked), reference links (decorative in specialized vaults), notation links (use tags instead), and developmental links (describe transformation, not destination).

**Why:** The original rule conflates different link purposes. Constitutive and learning links both have justification but serve different functions. Reference links may be explainable but add no value in specialized vaults. Notation patterns function as tags, not links.

**Test (REFINED):** For each link:
1. Is this basic assumed knowledge for your target audience? (Reference → remove or mark)
2. Is this notation shorthand (chord symbols, scale degrees)? (Notation → convert to tag)
3. Is this constitutive ("X is part of Y") or learning ("X helps understand Y")?
   - If constitutive: mark with `link-type: constitutive`
4. Can you state what the reader learns by following? (Learning → keep)

**Test (AI-executable):**
```python
def evaluate_link(link, note_context, target_audience):
    if is_basic_assumed_knowledge(link, target_audience):
        return "reference - likely decorative"
    if is_notation_shorthand(link):
        return "notation - convert to tag"
    if is_constitutive(link, note_context):
        return "constitutive - mark type"
    if can_state_learning_value(link):
        return "learning - keep"
    return "remove - no clear purpose"
```

## Edge Cases

**Music-specific:** In a composer's knowledge base, links to basic instruments (French horn, violin) are reference links — the composer already knows what these are. Keep only if the note discusses the instrument's role specifically.

**Notation patterns:** [[I-vi-IV-V]] should not be a wikilink unless it links to a specific note about that progression pattern. It functions like a tag.

**Circular links:** Linking to [[functional harmony]] from a note about functional harmony is neither learning nor constitutive — it's circular.

## Implementation

Use frontmatter to track link types:
```yaml
link-type: learning|constitutive|reference|notation|developmental
```

This enables filtering for link quality audits — constitutive links can be reviewed differently from learning links.

## See Also

- [[Seed Stress Test - Every Link Must Be Explainable in Music Composition]]
- [[Linking Principle]]
- [[Best Practice - Link Quality]]