---
last-reviewed: 2026-04-04
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
verification-status: draft
integrated: 2026-04-04
integration-note: Knowledge Type Taxonomy now in Seed (2026-04-03). This note now focuses on taxonomy interaction gaps.
tags:
  - frontier-exploration
  - knowledge-types
  - verification
  - taxonomy
  - process-type
  - integrated
gap-status: identified
gap-type: seed-missing
gap-source: frontier-exploration
---

> **Note (2026-04-04):** Knowledge Type Taxonomy is now in the Seed. This frontier exploration focuses on interaction gaps between Knowledge Type and Process Type taxonomies.

# Frontier Exploration: Knowledge Type and Process Type Interaction Gaps

## The Gap

The Seed now has two taxonomies:

1. **Knowledge Type Taxonomy** (added 2026-04-03) — classifies notes by primary knowledge type:
   - Procedural, Conceptual, Factual, Experiential, Relational, Meta-Knowledge

2. **Process Type Taxonomy** — classifies knowledge by how it unfolds:
   - Linear-sequential, Iterative-evaluative, Cyclic-branching, Assembly

But these two taxonomies **interact in ways the Seed doesn't address**:
- A note can be both "procedural" AND "cyclic-branching" (musical arrangement procedures)
- Verification approaches differ by process type but Seed doesn't bridge them
- Retrieval modes should adapt to process type but this isn't explicit
- Knowledge type and process type combinations create edge cases

## Why This Matters

Without guidance on taxonomy interaction:
1. **Ambiguous classification** — A musical arrangement "how-to" could be procedural OR conceptual with no clear answer
2. **Verification mismatch** — Experiential knowledge in cyclic-branching processes needs different verification than linear-sequential
3. **Retrieval inefficiency** — Query patterns that span process types aren't optimized
4. **Unclear edge cases** — What happens when knowledge type and process type conflict?

## What the Seed Covers (Separately)

### Knowledge Type Taxonomy (2026-04-03)
- Storage patterns by type
- Retrieval modes by type  
- Verification approaches by type

### Process Type Taxonomy
- Linear-sequential (fixed order)
- Iterative-evaluative (decision loops)
- Cyclic-branching (repeated elements with variations)
- Assembly (interdependent steps)

## The Interaction Problem

**Example 1: Musical Arrangement Knowledge**
- Knowledge type: Could be conceptual (understanding structure) OR procedural (how to arrange)
- Process type: Cyclic-branching (verse 1, verse 2, verse 3 with variations)
- Current gap: No guidance on which knowledge type takes precedence

**Example 2: Recipe Development**
- Knowledge type: Procedural (how to develop a recipe)
- Process type: Iterative-evaluative (taste, adjust, repeat)
- Current gap: Iteration verification requires different approach than linear verification

**Example 3: Chess Opening Theory**
- Knowledge type: Conceptual (understanding principles) AND factual (specific moves)
- Process type: Cyclic-branching (repeated positions with different responses)
- Current gap: Verification approach unclear for branching knowledge

**Example 4: Craft Skill Progression**
- Knowledge type: Experiential (body knowledge, feel)
- Process type: Iterative-evaluative (practice, assess, adjust)
- Current gap: Embodied verification in iterative processes not addressed

## Proposed Seed Rules

### Rule 1: Knowledge Type × Process Type Classification Priority

**Rule:** When a note could be classified under multiple knowledge types due to process type interaction, use this priority:
1. If process-type is cyclic-branching: default to conceptual for structure notes, procedural for creation notes
2. If process-type is iterative: default to experiential for embodied domains, procedural for formal domains
3. If process-type is assembly: default to procedural

**Why:** Without priority rules, classification becomes ambiguous. The above priority reflects what makes the knowledge most usable and verifiable.

**Test:** For notes with ambiguous knowledge type: (1) Is process-type identified? (2) Does knowledge type follow the priority rules? (3) Can you explain why one type was chosen over another?

### Rule 2: Verification Approach Adaptation by Process Type

**Rule:** Adapt verification approach based on process type:
- Linear-sequential: Source verification, then sequential drill
- Iterative-evaluative: Multiple iteration cycles, evaluate each outcome
- Cyclic-branching: Verify representative cases across variants, not full exhaustiveness
- Assembly: Verify prerequisite steps before dependent steps

**Why:** Verification approaches appropriate for one process type may be inappropriate for another. Source verification works for linear, but cyclic-branching needs variant sampling.

**Test:** For each process type in your vault: (1) Does verification approach match the process type? (2) Can you identify verification method mismatches? (3) Are verification cycles appropriate to the process?

### Rule 3: Dual-Taxonomy Tagging

**Rule:** For notes where both knowledge-type and process-type significantly affect behavior, include both in frontmatter — don't force a single classification.

**Why:** Some knowledge genuinely has dual nature. Forcing single-type classification loses information.

**Implementation:**
```yaml
knowledge-type: conceptual  # what the knowledge IS
process-type: cyclic-branching  # how the knowledge UNFOLDS
# Both are true and useful
```

**Test:** For complex notes: (1) Can you identify both taxonomies? (2) Does dual-tagging improve retrieval? (3) Are both used in verification planning?

### Rule 4: Query Pattern Recognition by Process Type

**Rule:** Map query patterns to process types for retrieval optimization:
- "How do I create X?" → procedural + linear-sequential
- "How does X work?" → conceptual + any process type
- "What's the pattern in X?" → conceptual + cyclic-branching
- "What happens when I try X?" → experiential + iterative-evaluative

**Why:** Different process types generate different natural query patterns. Optimizing retrieval requires understanding how users naturally ask about each process type.

**Test:** For 5 common queries in your vault: (1) Can you identify the process type the query assumes? (2) Does retrieval optimize for that process type? (3) Are query patterns and process types aligned?

## Edge Cases

1. **Process type transitions** — A single note may transition between process types (linear at start, iterative later). How to tag?
2. **Nested process types** — Assembly processes contain sequential steps. Cyclic-branching contains iterative evaluation. Hierarchy unclear.
3. **Domain-specific process types** — Some domains have unique process types not covered by the four basics.
4. **Process type change over time** — What was linear becomes iterative as knowledge evolves. Version tracking needed?

## Gap Type

This is a **Taxonomy Integration** gap — the Seed has two valuable taxonomies but no rules for their interaction.

## Related Notes

- [[Frontier Exploration - Musical Arrangement Knowledge]] — Specific domain example
- [[Frontier Exploration - Iterative Creative Knowledge]] — Resolved but shows process type evolution
- [[AI-Assisted Knowledge Management Seed]] — Knowledge type taxonomy (2026-04-03)
- [[Seed Refinement - Verification Priority Hierarchy Edge Cases]] — Verification by process type
- [[Seed Stress Test - Chess Knowledge Base]] — Cyclic-branching domain stress test
- [[Seed Stress Test - Music Performance Knowledge Base]] — Another cyclic domain