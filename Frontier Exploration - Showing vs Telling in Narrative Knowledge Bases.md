---
last-updated: 2026-03-30
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
domain-familiarity: learning
tags: [seed-gap, creative-writing, narrative, frontier-exploration]
---

# Frontier Exploration: Showing vs. Telling in Narrative Knowledge Bases

## The Gap

The Seed has rules for:
- Creative composition principles (line 56-59)
- Fiction/literature organization (line 1861-1870)
- Multi-modal knowledge representation (line 2011+)
- Iterative-evaluative processes (line 2065+)

**Missing:** No rule addresses the foundational narrative principle of **showing vs. telling** — the distinction between dramatizing (making the reader experience) vs. summarizing (stating facts directly).

## Why It Matters

"Show, don't tell" is arguably the single most important principle in narrative craft, yet the Seed has no guidance for organizing knowledge around it:

- **Telling** = "She was angry" (statement of fact)
- **Showing** = "Her hands trembled as she gripped the edge of the table. She took a breath, then another, as if trying to contain something that threatened to spill over" (dramatized experience)

This distinction affects:
- How scene descriptions are captured
- How character emotions are documented
- How action is rendered vs. summarized
- How backstory is revealed vs. dumped

## Current Seed Limitations

1. **Atomicity rule doesn't distinguish narrative levels** — A note about "anger" could be either a telling statement or a showing technique, but the Seed treats both as equivalent atomic units.

2. **No guidance on dramatization vs. summary** — The Seed has no framework for distinguishing knowledge that's about *experiencing* a story vs. *knowing* information about a story.

3. **Multi-modal rule addresses media, not mental imagery** — The existing multi-modal rule (line 2011+) covers external media (video, audio) but not the internal mental imagery that prose creates in readers.

4. **Fiction/literature rule misses craft distinctions** — The fiction rule (line 1861+) covers spoiler management and character organization but not the fundamental showing/telling craft distinction.

## Knowledge Types This Creates

In a narrative craft knowledge base, this gap manifests as:

| Knowledge Type | Example | How It Should Be Tagged |
|---------------|---------|------------------------|
| Telling knowledge | "The setting is post-war England" | knowledge-type: factual, narrative-mode: telling |
| Showing knowledge | "Every building bore scars — boarded windows, pockmarked walls, gardens turned to weeds" | knowledge-type: procedural, narrative-mode: showing |
| Technique principle | "Emotion shown through physical reaction, not direct statement" | knowledge-type: principle, narrative-mode: showing |
| Hybrid | "He lied. She knew he was lying. But she said nothing." | knowledge-type: analysis, narrative-mode: layered |

## Proposed Seed Rule

**Rule:** For narrative and fiction knowledge bases, distinguish showing from telling with `narrative-mode` frontmatter.

**Why:** The showing/telling distinction is fundamental to narrative craft. Treating all story knowledge as equivalent loses critical craft knowledge about *how* to render experience vs. state facts.

**Test:** For notes about story craft: (1) Does this describe what happens (telling)? (2) Does this describe how to make readers experience (showing)? (3) Is the mode explicit in frontmatter?

**Implementation:**
```yaml
narrative-mode: showing|telling|hybrid
narrative-function: exposition|characterization|setting|action|theme
rendering-technique: physical-reaction|dialogue|scene|dream-flashback|etc
```

**Edge case:** Some telling is intentional — backstory dumps, summary passages, author intrusion. Tag these as `narrative-mode: telling` but with `intentional: true` to distinguish from unintentional telling.

**Edge case:** Literary fiction often plays with showing/telling boundaries. Tag experimental approaches with `narrative-mode: experimental` and include `framework:` for the specific approach.

**Edge case:** Genre conventions differ — literary fiction favors showing; genre fiction often uses more telling for pacing. Include `genre-context:` field.

## Related Notes

- [[Frontier Exploration - Fiction and Literature Knowledge Bases]] — Existing fiction rule that needs expansion
- [[Frontier Exploration - Multi-Modal Knowledge Representation]] — Related but covers external media
- [[Atomic Note Principle]] — Needs extension for narrative-specific atomicity
- [[Seed Stress Test - Creative Writing Knowledge Base]] — (hypothetical stress test needed)

## Questions for Further Exploration

1. Does showing/telling apply to screenwriting differently than prose?
2. How does this interact with "subtext" — showing what characters don't say?
3. Should visual media (film, TV) have separate rules?
4. How do genre conventions affect what counts as "good" showing?

---

**This is a frontier exploration note.** It identifies a gap in the Seed but does not yet contain a fully tested rule. The proposed rule needs stress-testing across multiple narrative knowledge bases before becoming part of the Seed.
