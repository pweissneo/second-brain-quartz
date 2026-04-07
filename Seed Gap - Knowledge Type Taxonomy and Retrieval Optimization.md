---
last-reviewed: 2026-04-04
last-updated: 2026-04-06
lifecycle: archived
confidence: medium
author-type: ai-assisted
knowledge-type: principle
verification-status: verified
gap-status: integrated
gap-priority: high
gap-type: seed-missing
discovered: 2026-04-02
analyzed: 2026-04-02
resolved-by: Seed
resolved: 2026-04-03
gap-phase: integrated
archived: 2026-04-04
archive-note: Content integrated into [[AI-Assisted Knowledge Management Seed]] (2026-04-03). See Seed rule "Knowledge Type Taxonomy" for the resolved guidance.
tags:
  - seed-gap
  - knowledge-type
  - taxonomy
  - retrieval
  - organization
  - archived
  - link-density
---

> **ARCHIVED (2026-04-04):** This gap has been resolved. The recommended rule has been integrated into the Seed. See [[AI-Assisted Knowledge Management Seed]] — search for "Knowledge Type Taxonomy".

# Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization

## Status: IDENTIFIED (2026-04-02)

## The Problem

The Seed provides excellent guidance on:
- How to create atomic notes
- How to link notes meaningfully
- How to verify and track confidence
- How to balance exploration vs exploitation
- How to organize by lifecycle stage

However, the Seed lacks an explicit **Knowledge Type Taxonomy** with type-specific organization and retrieval rules.

## Why This Matters

Different knowledge types require different:
- **Capture strategies** (procedures vs principles vs examples)
- **Storage structures** (hierarchical vs network vs flat)
- **Retrieval patterns** (search vs browse vs recognition)
- **Maintenance rhythms** (frequent updates vs rare updates)
- **Verification approaches** (empirical testing vs source verification vs social validation)

Without type awareness, an AI agent organizing a knowledge base must infer these distinctions implicitly — leading to:
1. **Suboptimal storage** — storing procedurals like concepts (or vice versa)
2. **Poor retrieval** — notes organized for search when browse would be better
3. **Mismatched maintenance** — applying frequent-update rhythms to stable knowledge
4. **Wrong verification** — testing declarative knowledge empirically when source verification is appropriate

## What's Missing from the Seed

### Knowledge Type Taxonomy

The Seed should define explicit knowledge types with type-specific rules:

1. **Procedural Knowledge** — How to do something
   - Examples: recipes, instructions, tutorials
   - Storage: keep complete workflows together (despite >300 word rule)
   - Retrieval: browse-oriented, sequential path
   - Verification: empirical (does it work when executed?)

2. **Conceptual Knowledge** — Understanding why something works
   - Examples: principles, theories, frameworks
   - Storage: atomic, highly linked
   - Retrieval: search-oriented, cross-referenced
   - Verification: logical consistency, source quality

3. **factual Knowledge** — Discrete facts and data
   - Examples: definitions, specifications, measurements
   - Storage: compact, reference-linked
   - Retrieval: exact-match search
   - Verification: source reliability

4. **Experiential Knowledge** — Knowledge from personal experience
   - Examples: lessons learned, personal experiments, tacit knowledge
   - Storage: context-rich, reflection-linked
   - Retrieval: browse-oriented, temporal context
   - Verification: self-consistency, pattern confirmation

5. **Relational Knowledge** — Knowledge about relationships between things
   - Examples: comparisons, trade-offs, dependencies
   - Storage: network structure, bidirectional links
   - Retrieval: graph traversal, comparison queries
   - Verification: logical relationships hold

6. **Meta-Knowledge** — Knowledge about knowledge itself
   - Examples: learning how to learn, memory techniques, knowledge management methods
   - Storage: principles + examples structure
   - Retrieval: search + browse hybrid
   - Verification: self-referential consistency

### Retrieval-Specific Rules Missing

Current Seed has navigation rules but lacks:

- **Query Type Recognition** — Given a question, what knowledge type answers it?
- **Retrieval Path Selection** — Search vs graph traversal vs browse
- **Organization by Retrieval Pattern** — Some knowledge is best organized for search, some for browsing
- **Hybrid Organization** — When to use both (e.g., procedures: sequential browse + keyword search)

### Domain Example: Cooking Knowledge Base

Using current Seed to build a cooking vault:
- ✓ Atomic notes for techniques
- ✓ Linking between techniques and recipes
- ✓ Confidence markers for recipe quality
- ✗ No guidance on: How to organize recipes vs techniques vs ingredients differently
- ✗ No guidance on: Retrieval use case ("what can I make with X?" requires ingredient-based organization, not technique-based)
- ✗ No guidance on: Recipe adaptation knowledge (substitutions, modifications)

The Seed tells us **how to structure notes** but not **how to structure knowledge for retrieval**.

## Related Existing Notes

- [[Frontier Exploration - Knowledge Retrieval vs Recognition]] — discusses retrieval modes but doesn't propose Seed rules
- [[Frontier Exploration - Multi-Representation Knowledge]] — different representations for same knowledge
- [[Note Types and Templates]] — existing note type system but not integrated into Seed as first-class taxonomy
- [[Seed Stress Test - Cooking Knowledge Base]] — stress test that would reveal this gap
- [[Seed Gap - Knowledge Domain Allocation Strategy]] — resolved by adding domain-level rules
- [[Frontier Exploration - Domain Jargon vs Plain Language]] — terminology handling

## Proposed Seed Extension

**Rule:** Define and apply a Knowledge Type Taxonomy — classify every note by its primary knowledge type (procedural/conceptual/factual/experiential/relational/meta) and apply type-specific storage, retrieval, and verification rules.

**Why:** Knowledge types are fundamental — they determine how knowledge should be captured, organized, verified, and retrieved. Without explicit type taxonomy, AI agents must infer these distinctions imperfectly, leading to suboptimal knowledge base structure. Type-aware organization enables retrieval optimization for realistic use cases.

**Test:** (1) Can you classify each note in your vault by knowledge type? (2) Does each type follow type-specific organization rules? (3) Can you answer "what knowledge type answers this question?" for 5 common queries? (4) Are retrieval paths optimized for the knowledge type's natural query pattern?

**Implementation:**

```yaml
knowledge-type: procedural|conceptual|factual|experiential|relational meta
retrieval-mode: search|browse|hybrid
storage-pattern: atomic|sequential|compact|network
verification-approach: empirical|source|social|self-consistency
```

**Type-specific rules:**

| Type | Storage | Retrieval | Verification |
|------|---------|-----------|--------------|
| Procedural | Complete workflows together | Sequential browse | Empirical (does it work?) |
| Conceptual | Atomic, highly linked | Cross-reference search | Logical consistency |
| Factual | Compact, reference-linked | Exact-match search | Source reliability |
| Experiential | Context-rich | Browse + temporal | Self-consistency |
| Relational | Network structure | Graph traversal | Logical relationships |
| Meta-Knowledge | Principles + examples | Hybrid | Self-referential |

**Query Type Recognition:**

```yaml
query-patterns:
  "how do I X": procedural
  "why does X": conceptual
  "what is X": factual
  "what happened when I X": experiential
  "X vs Y": relational
  "how to learn X": meta-knowledge
```

## Edge Cases

1. **Multi-type notes** — Some notes contain multiple types. Rule: Primary type determines storage; secondary types get explicit sections.

2. **Type migration** — Knowledge can change type over time. Rule: Track `knowledge-type-history` in frontmatter.

3. **Domain-specific types** — Some domains have unique types. Rule: Allow domain extensions to the base taxonomy.

4. **Hybrid queries** — Some questions require multiple types. Rule: Optimize primary type; link to secondary types explicitly.

## Status

**RESOLVED (2026-04-03):** This gap has been addressed. The Seed now includes:
- **Knowledge Type Taxonomy** — explicit classification for procedural/conceptual/factual/experiential/relational/meta
- **Type-specific rules** — storage patterns, retrieval modes, verification approaches
- **Query type recognition** — mapping common queries to knowledge types

See [[AI-Assisted Knowledge Management Seed]] for the integrated rules (search for "Knowledge Type Taxonomy").

## Historical Context

The following section was written before resolution and is preserved for reference:

### Why This Was a Gap

- No existing Seed rule addressed knowledge type taxonomy
- Note Types and Templates existed but wasn't elevated to Seed-level principle
- The gap affected retrieval quality, not just structure
- Domain-specific stress tests revealed this gap when applied to knowledge type organization

**Resolution date:** 2026-04-03 — integrated into Seed as new rule
