---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
verification-status: verified
knowledge-type: meta
access-pattern: decision
tags:
  - seed-refinement
  - knowledge-type
  - taxonomy
  - compliance
  - implementation
schema-version: "1.0"
---

# Seed Refinement: Knowledge Type Taxonomy Complete

> Consolidated guidance on knowledge type classification, enforcement, and query disambiguation.
> Date: 2026-04-08 (merged from 3 redundant notes)

## Background

The Seed defines a knowledge-type taxonomy (Section 1, Rule: Knowledge Type Taxonomy):
- Procedural (how to do something)
- Conceptual (understanding why)
- Factual (discrete facts/data)
- Experiential (personal experience)
- Relational (relationships between things)
- Meta-Knowledge (knowledge about knowledge)

However, the Seed ALSO permits domain-specific extensions (e.g., `knowledge-type: troubleshooting`, `knowledge-type: embodied`, `knowledge-type: canonical|analysis|personal`). This apparent contradiction causes confusion.

## The Apparent Conflict Resolved

**The Seed allows both:**
1. **Base taxonomy** — Required for universal interoperability
2. **Domain extensions** — Permitted when domains have distinct categories

The key insight: base types are for vault-wide queries; domain types are for domain-specific precision. Use both together.

## Classification Guidance

### Step 1: Determine Base Type First

When creating a note, ask: "What question does this answer?"

| Question Type | Base Knowledge Type |
|---------------|-------------------|
| "How do I X?" | Procedural |
| "Why does X?" | Conceptual |
| "What is X?" | Factual |
| "What happened when I X?" | Experiential |
| "How does X relate to Y?" | Relational |
| "What do we know about X?" | Meta |

### Step 2: Add Domain Extension If Needed

**When to extend with domain-specific type:**
- Domain has significantly different verification requirements
- Domain has distinct retrieval patterns
- Base type loses meaning in the domain
- Domain's common queries don't map to base patterns

**Implementation:**
```yaml
# Both together
knowledge-type: procedural  # base taxonomy (mandatory)
knowledge-subtype: career-development  # domain-specific (optional)
```

### Step 3: Handle Ambiguous Queries

The query pattern test is too simplistic — same query structure can map to different types:

| Query | Context | Should Be |
|-------|---------|-----------|
| "What is subjunctive mood" | language learning | conceptual (grammar understanding) |
| "What does 'ser' mean" | language learning | vocabulary-receptive |
| "What is the past tense of X" | language learning | procedural (conjugation procedure) |

**Disambiguation rules:**
1. Look for context keywords (explain, understand, why → conceptual; use, apply, do → procedural)
2. Check domain-specific markers (in language: conjugation, tense, mood)
3. Infer from what's being asked (definition vs explanation vs procedure)

## Type-Specific Organization

| Type | Organization | Verification |
|------|-------------|--------------|
| Procedural | Sequential, with prerequisites | Does it work? (execute) |
| Conceptual | Dense link network | Logical consistency |
| Factual | Compact, source-linked | Source reliable? |
| Experiential | Context-rich (when/where/conditions) | Matches my experience? |
| Relational | Explicit relationships, direction indicators | Cross-check connections |
| Meta | Self-referential, categorized | Describes vault accurately? |

## Test Criteria

1. Can you classify any note by base knowledge-type?
2. For domain-specific notes, is the domain type in `knowledge-subtype:` (not `knowledge-type:`)?
3. Can you correctly disambiguate 5 ambiguous queries?
4. Do queries using base types return complete results?

## Migration Path

For notes with non-standard `knowledge-type:` values:
1. Map to nearest base taxonomy category
2. Move original value to `knowledge-subtype:`
3. Example: `knowledge-type: career-development` → `knowledge-type: meta` + `knowledge-subtype: career-development`

## Edge Cases

**Mixed types:** Mark primary (mandatory) and secondary:
```yaml
knowledge-type: procedural  # primary (mandatory)
knowledge-subtype: [factual, conceptual]  # secondary (optional)
```

**Type migration:** Track changes:
```yaml
knowledge-type-history:
  - 2026-01-01: conceptual
  - 2026-04-03: procedural
```

**Unknown type:** Default to "conceptual" — most flexible for refactoring.

## Vault-Wide Compliance Finding (2026-04-08)

Audit of vault knowledge-type values revealed non-standard usage:

| Current Value | Count | Should Map To |
|---------------|-------|---------------|
| analysis | 52 | conceptual |
| structural | 29 | conceptual |
| seed-refinement | 8 | meta |
| principle | 6 | conceptual |
| technical\|aesthetic\|hybrid | 4 | conceptual |
| troubleshooting | 2 | procedural |
| subjective-personal | 2 | experiential |
| career-development | 2 | meta |
| relational | 2 | relational (correct) |
| factual | 3 | factual (correct) |
| vocabulary-receptive | 1 | factual |

**Total requiring migration:** ~100+ notes

**Migration approach:**
1. Run grep to identify all non-standard values
2. Batch update by target type
3. Preserve any domain-specific nuance in `knowledge-subtype:`

**Example migration:**
```yaml
# Before
knowledge-type: analysis

# After
knowledge-type: conceptual
knowledge-subtype: analysis  # preserved for domain precision
```

This finding demonstrates the importance of the migration path — preserving useful domain nuance while achieving base taxonomy compliance.

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core taxonomy rule
- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]]
- [[Note Types and Templates]] — Note type by function (different from knowledge type)
- [[Note Lifecycle Management]] — Lifecycle stages (different from knowledge type)

---

*Consolidated 2026-04-08 from 3 redundant notes (Enforcement, Implementation, Query Pattern Nuance) via REDUNDANCY_SCAN heartbeat.*
