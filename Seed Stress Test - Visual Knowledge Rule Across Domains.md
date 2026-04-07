---
last-reviewed: 2026-03-27
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - visual-knowledge
  - cross-domain
  - edge-case
level: frontier
---

# Seed Stress Test: Visual Knowledge Rule Across Domains

Testing the Visual Knowledge rule (added 2026-03-26) across different knowledge domains to identify edge cases, test executability, and refine the rule.

## The Rule Under Test

**Rule:** For knowledge that depends on visual representation (diagrams, charts, maps, architectural drawings, genealogical charts, molecular structures, musical notation, engineering schematics), include visual format alongside text explanation. For other knowledge, default to text unless visual clearly adds value.

**Test:** (1) Does this knowledge depend on spatial or structural relationships that text cannot capture? (2) Would a visual representation make this understandable in under 10 seconds? (3) Is there an established visual standard for this domain (flowcharts, UML, family trees, circuit diagrams)? If yes to any, include visual format.

---

## Domain Analysis

### Does This Rule Make Sense for Each Domain?

**Software Architecture:** Yes, strongly. System diagrams communicate structural information text cannot. Architecture diagrams, sequence diagrams, ER diagrams, class diagrams, data flow diagrams all require visual format.

**Genealogy:** Yes, strongly. Family trees are inherently visual. The Seed already includes edge case for this.

**Mathematics:** Yes, with nuance. Notation and graphs convey meaning textually but have visual components (geometric figures, graphs, diagrams). Standard notation is visual by convention.

**Chemistry:** Yes. Molecular structures, orbital diagrams, reaction mechanisms require visual representation.

**Music:** Yes. Musical notation, chord diagrams, arrangement visualizations require visual format.

**Electrical Engineering:** Yes. Circuit diagrams, schematics, PCB layouts require visual.

**Process Documentation:** Yes. Workflows, flowcharts, decision trees require visual.

**General Conceptual Knowledge:** No. Most conceptual notes don't require visual - text suffices.

---

## Edge Cases Identified

### Edge Case 1: When Visual Format is Available but Creates Accessibility Barriers

**Problem:** A knowledge base about data structures includes red-black tree diagrams. Visual format helps understanding, but the vault must serve screen-reader users.

**Test Executability:** Can an AI agent determine when accessibility concerns override visual inclusion?

**Analysis:** The Seed includes edge case for accessibility: "Use `visual-accessibility: full|partial|text-only` frontmatter." But the rule doesn't provide guidance on which takes precedence.

**Recommendation:** Add hierarchy to the rule: safety-critical > accessibility > visual preference. For knowledge that BOTH requires visual AND serves screen-reader users, include both visual AND text alternatives.

---

### Edge Case 2: Visual Migration Risk Across Platforms

**Problem:** A knowledge base uses Mermaid diagrams embedded in markdown. The vault might migrate to a platform that doesn't support Mermaid rendering.

**Test Executability:** Can an AI agent detect platform-dependent visual formats and flag for migration planning?

**Analysis:** The Seed includes migration guidance (SVG over PNG, standard notation over proprietary) but doesn't address platform-dependent embedding (Mermaid, PlantUML, etc.).

**Recommendation:** Add frontmatter for visual portability:
```yaml
visual-portability: high|medium|low
visual-dependency: mermaid|plantuml|excalidraw|native-svg|native-png
migration-action: convert-to-svg|export-as-png|text-only|keep-as-is
```

---

### Edge Case 3: When "Text Alternative" Defeats the Purpose

**Problem:** A genealogy vault has a 5-generation family tree. Including "text alternative" that says "John married Jane, had children Bob and Mary, Bob married..." defeats the visual purpose.

**Test Executability:** Is there a threshold where text alternatives become impractical?

**Analysis:** The rule says "include text alternatives for all visual knowledge" but doesn't define scope. For complex visuals, text alternatives become unreadable.

**Recommendation:** Clarify: Text alternatives should provide SEARCHABLE summary, not complete visual transcription. For family trees: include names and relationships as searchable text; don't try to recreate the tree structure in text.

---

### Edge Case 4: Visual Knowledge in Temporal Knowledge Bases

**Problem:** A knowledge base about historical events includes timelines. Timelines are visual, but also temporal.

**Test Executability:** Does visual rule apply to temporal structures?

**Analysis:** Yes - timelines combine visual structure with temporal knowledge. The rule should apply.

**Recommendation:** Add edge case: "For timeline-based knowledge, visual format (Gantt chart, timeline graphic) is appropriate; text alternatives should capture key dates and events as searchable data."

---

### Edge Case 5: AI-Generated Visual Content

**Problem:** A knowledge base includes AI-generated diagrams (from tools like DALL-E, Midjourney). These are visual but may be incorrect or misinterpreted.

**Test Executability:** Does visual knowledge rule apply to AI-generated visuals?

**Analysis:** The rule doesn't distinguish between human-created and AI-generated visuals. Both are "visual knowledge."

**Recommendation:** Add provenance frontmatter:
```yaml
visual-source: human-created|ai-generated|hybrid
ai-generation-tool: [tool name if applicable]
visual-verification-status: verified|unverified  # does the visual accurately represent the concept?
```

---

### Edge Case 6: Visual Knowledge in Embodied Knowledge Domains

**Problem:** A cooking knowledge base includes technique photos showing knife cuts, dough stages, doneness indicators. These are visual but convey embodied knowledge.

**Test Executability:** Can the AI agent distinguish "visual for structure" from "visual for sensory embodiment"?

**Analysis:** The rule addresses structural visual (diagrams, charts) but embodied visual (photos of techniques) serves different purpose - capturing sensory cues.

**Recommendation:** Add categorization:
```yaml
visual-purpose: structural|embodied|decorative
visual-essential: true  # for structural and embodied
```
Embodied visual knowledge should link to sensory anchor notes per the embodied knowledge rules.

---

### Edge Case 7: When Text Actually Works Better

**Problem:** A chemistry knowledge base includes orbital diagram for electron configuration. For some learners, text "1s² 2s² 2p⁶" is clearer than visual orbital shape.

**Test Executability:** Can the AI agent determine when text is actually better despite domain convention?

**Analysis:** The rule uses "if yes to any, include visual" - but doesn't address when visual HURTS comprehension.

**Recommendation:** Add test criterion: (4) Does visual format obscure rather than clarify for typical users? If yes to this AND no to 1-3, use text.

---

### Edge Case 8: Cost-Benefit Threshold for Visual Creation

**Problem:** Creating a visual for a concept takes significant time. Is it worth it?

**Test Executability:** Can the AI agent assess when visual creation cost exceeds benefit?

**Analysis:** The rule addresses what to include but not when creating new visuals is worth the maintenance burden.

**Recommendation:** Add threshold: Create visual if (a) it significantly improves understanding AND (b) the note has high retrieval frequency AND (c) the visual will be reused across multiple notes. Low-utility, one-off visuals add maintenance burden without proportional value.

---

## Test Execution Summary

| Test Criterion | Executable by AI? | Notes |
|----------------|-------------------|-------|
| Does knowledge depend on spatial/structural relationships? | Yes, with domain knowledge | AI needs domain context to assess |
| Would visual be understandable in <10 seconds? | Yes | Subjective but manageable |
| Established visual standard in domain? | Yes | Can query domain conventions |
| Accessibility vs visual preference | Partial | Needs explicit priority guidance |
| Platform migration risk | Yes | Can detect embedding dependencies |
| Text alternative scope | Partial | Needs clearer scope guidance |
| Visual purpose categorization | Yes | Structural/embodied distinction |

---

## Recommendations for Seed Update

1. **Add visual-purpose field:** `structural|embodied|decorative` to distinguish visual types
2. **Add visual-portability field:** Track migration risk for different visual formats
3. **Add accessibility hierarchy:** Explicit priority when accessibility conflicts with visual
4. **Clarify text alternative scope:** Searchable summary, not complete transcription
5. **Add visual provenance field:** For AI-generated content, track source and verification
6. **Add cost-benefit threshold:** When to create vs. skip visual creation
7. **Add negative criterion:** When text actually works better despite domain convention

---

## Related Notes

- [[Seed Stress Test - Software Architecture Knowledge Base]] (already has diagram edge case)
- [[Seed Stress Test - Mathematics Knowledge Base]] (needs visual rule integration)
- [[Frontier Exploration - Visual Knowledge Representation in Knowledge Bases]]
- [[Frontier Exploration - Multi-Modal Knowledge]]