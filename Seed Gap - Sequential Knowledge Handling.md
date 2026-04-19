---
last-reviewed: 2026-04-09
lifecycle: seed-gap-analyzed
confidence: medium
gap-type: seed-missing
gap-severity: useful
gap-source: seed-stress-test
---

# Seed Gap: Sequential Knowledge Handling

## Gap Description

The Seed covers:
- **Static knowledge** — concepts, facts that don't change
- **Procedural knowledge** — how to do things in sequence
- **Time-sensitive data** — temporal information that changes

But the Seed lacks explicit guidance for **sequential knowledge** where the **order itself IS the knowledge**:
- Historical narratives (causes → effects)
- Musical compositions (note sequences)
- Story structures (plot progressions)
- Learning progressions (prerequisites)
- Biological processes (metabolic pathways)

## Current Limitations

An AI applying current Seed rules to a sequential domain (music, history, biology) would:
1. Create atomic notes for each element
2. Link between concepts
3. **Miss that the sequential relationship is the core knowledge**
4. Not distinguish prerequisite links from relevance links
5. Not know when to preserve sequence vs. atomize

## Proposed Seed Rule

**Rule:** For knowledge domains where sequence IS the knowledge (historical narratives, compositional forms, learning progressions, biological processes), explicitly preserve order as a first-class concern alongside atomicity.

```yaml
# For sequential knowledge notes:
knowledge-structure: sequential|atomic|mixed
sequential-type: narrative|compositional|prerequisite|process|causal
key-moments: ["list of critical points in sequence"]
chain-dependency: "[[Previous Note]]"  # for sequential links
prerequisite-link: true  # distinguish from relevance links
```

**Test:** For a sequential domain note: (1) Is knowledge-structure tagged? (2) Are key moments identified? (3) Can you distinguish prerequisite links from relevance links? (4) Does the note preserve the sequence that IS the knowledge?

## Edge Cases

1. **Mixed sequential + atomic**: A music theory vault needs both sequential (compositional form) and atomic (chord definitions) notes — distinguish with knowledge-structure
2. **Sequential within static**: A history note on a battle (static) contains sequential narrative about how it unfolded — allow nested knowledge-structure
3. **Prerequisite chains exceed normal hop limits**: Learning progressions naturally exceed 4 hops (A→B→C→D→E→F) — allow hop depth up to 6 for genuine learning paths

## Relationship to Existing Seed Rules

- Extends: Knowledge Type Taxonomy (adds sequential as storage pattern)
- Complements: Temporal Knowledge Rule (covers time-data, not sequence-structure)
- Supports: Learning Progression Organization (prerequisite chains need explicit handling)

## Test Scenario

Build a music composition knowledge base using only current Seed rules vs. enhanced rules:

**Current rules:**
- ✓ Atomic notes on chords, scales, intervals
- ✓ Cross-reference links between concepts
- ✗ No guidance on capturing chord progressions (sequence = knowledge)
- ✗ No distinction between "relates to" and "comes after"

**Enhanced rules:**
- ✓ Capture progressions with knowledge-structure: sequential
- ✓ Mark key moments in the sequence
- ✓ Distinguish prerequisite links from conceptual links

---

## Related Notes
- [[Handling Temporal Knowledge]] — covers time-sensitive data, not sequential structure
- [[Seed Refinement - Temporal-Sequential Knowledge Handling]] — existing refinement
- [[Seed Stress Test - Music Performance Knowledge Base]] — domain stress test