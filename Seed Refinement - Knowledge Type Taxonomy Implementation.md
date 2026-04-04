---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - knowledge-type
  - taxonomy
  - implementation
---

# Seed Refinement: Knowledge Type Taxonomy Implementation

> How to actually apply the knowledge-type taxonomy in practice.

## Background

The Seed (2026-04-03) introduced a Knowledge Type Taxonomy rule classifying notes as:
- Procedural (how to do something)
- Conceptual (understanding why)
- Factual (discrete facts/data)
- Experiential (personal experience)
- Relational (connections between things)
- Meta (knowledge about knowledge)

## The Gap

The Seed defines types but doesn't explain HOW to:
1. Classify a new note by type
2. Apply type-specific organization
3. Optimize retrieval for each type
4. Verify differently based on type

## Implementation Guidance

### Step 1: Classification at Creation

When creating a note, ask: "What question does this answer?"

| Question Type | Knowledge Type |
|---------------|----------------|
| "How do I X?" | Procedural |
| "Why does X?" | Conceptual |
| "What is X?" | Factual |
| "What happened when I X?" | Experiential |
| "How does X relate to Y?" | Relational |
| "What do we know about X?" | Meta |

**Frontmatter:**
```yaml
knowledge-type: procedural  # primary type
knowledge-type-history:  # track if type changes
  - 2026-04-03: created as procedural
```

### Step 2: Type-Specific Organization

**Procedural notes:**
- Sequential order matters
- Include prerequisites section
- Complete workflows, don't fragment

**Conceptual notes:**
- Highly linked to related concepts
- Include "why" explanations
- Connect to examples

**Factual notes:**
- Compact, reference-linked
- Include source attribution
- Date-stamped for temporal accuracy

**Experiential notes:**
- Include context (when, where, conditions)
- Connect to similar experiences
- Note personal verification status

**Relational notes:**
- Explicitly list relationships
- Include direction indicators
- Connect to both related entities

**Meta notes:**
- Self-referential links
- Document their own structure

### Step 3: Retrieval Optimization

| Type | Retrieval Mode | Optimization |
|------|---------------|--------------|
| Procedural | Sequential browse | Linear flow, clear steps |
| Conceptual | Cross-reference search | Dense link network |
| Exact-match search | Factual | Searchable by key fields |
| Context-rich | Experiential | Filter by conditions |
| Graph traversal | Relational | Start from known nodes |
| Index-style | Meta | Categorized structure |

### Step 4: Type-Specific Verification

**Procedural:** Does it work? (test by executing)
**Conceptual:** Is it logically consistent? (check against sources)
**Factual:** Is the source reliable? (verify authority)
**Experiential:** Does it match my experience? (self-consistency)
**Relational:** Are connections accurate? (cross-check)
**Meta:** Does it describe the vault accurately? (compare to actual)

## Test Criteria

For AI evaluation:
- [ ] Can you classify any note by knowledge type?
- [ ] Does frontmatter include knowledge-type field?
- [ ] Does organization match the type?
- [ ] Can you find retrieval-optimized paths for each type?
- [ ] Does verification approach match the type?

## Edge Cases

### Mixed Types
Some notes combine types. Mark primary and secondary:
```yaml
knowledge-type: procedural
also-includes:
  - factual  # contains specific parameters
  - conceptual  # explains why each step works
```

### Type Migration
Knowledge can change type over time:
```yaml
knowledge-type-history:
  - 2026-01-01: conceptual  # originally understood as theory
  - 2026-04-03: procedural  # now tried and verified as method
```

### Unknown Type
For new notes, default to "conceptual" until proven otherwise — conceptual notes are safest (they can be refactored to other types more easily).

## Integration with Seed

This refinement integrates with:
- Knowledge Type Taxonomy rule (Seed 2026-04-03)
- Verification priority hierarchy
- Access-pattern tagging
- Diminishing returns test

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core taxonomy rule
- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]] — Original gap
- [[Note Types and Templates]] — Note type by function (different from knowledge type)
- [[Note Lifecycle Management]] — Lifecycle stages (different from knowledge type)
