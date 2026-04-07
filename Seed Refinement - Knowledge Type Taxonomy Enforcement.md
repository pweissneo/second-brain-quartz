---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
verification-status: verified
knowledge-type: meta
access-pattern: decision
tags:
  - seed-refinement
  - knowledge-type
  - compliance
  - taxonomy
schema-version: "1.0"
---

# Seed Refinement - Knowledge Type Taxonomy Enforcement

> STATUS: APPROVED — Enforce standard knowledge-type taxonomy in the Seed with domain-extension mechanism.

## The Compliance Gap

During COMPLIANCE_AUDIT (2026-04-06), scanning revealed **widespread knowledge-type taxonomy violations** across the vault:

### Observed Violations

Many notes use non-standard knowledge-type values:
- `knowledge-type: career-development`
- `knowledge-type: budgeting|category|goal|recurring|period-review`
- `knowledge-type: destination-research`
- `knowledge-type: health-tracking`
- `knowledge-type: travel-lesson`
- `knowledge-type: taste-calibration`
- `knowledge-type: performance-psychology`
- And 40+ other custom types

### Why This Violates the Seed

The Seed explicitly defines the knowledge-type taxonomy (Section 1, Rule: Knowledge Type Taxonomy):

> **Knowledge Type Definitions:**
> | Type | Description |
> |------|-------------|
> | Procedural | How to do something |
> | Conceptual | Understanding why |
> | Factual | Discrete facts/data |
> | Experiential | Personal experience |
> | Relational | Relationships between things |
> | Meta-Knowledge | Knowledge about knowledge |

The Seed Test requires:
> (1) Can you classify each note by knowledge type (procedural/conceptual/factual/experiential/relational/meta)?

Notes with custom domain-specific types fail this test — they cannot be classified using the standard taxonomy.

## Root Cause

The Seed permits domain-specific extensions but doesn't clearly specify:
1. How to map domain types to base taxonomy
2. When domain types are appropriate vs. when base types should be used
3. Whether the base taxonomy is mandatory or optional

## Proposed Rule Enhancement

**Rule:** The standard knowledge-type taxonomy (procedural, conceptual, factual, experiential, relational, meta) is mandatory for all notes. Domain-specific types are permitted ONLY as secondary classifications via `knowledge-subtype:` frontmatter.

**Why:** Without mandatory base taxonomy, the vault becomes fragmented with incompatible classification systems. The standard taxonomy provides universal interoperability; domain types add precision where needed. Separating base type (mandatory) from subtype (optional) enables both standardization and specialization.

**Test:** (1) Can every note be classified by base knowledge-type? (2) Are domain subtypes in `knowledge-subtype:` not `knowledge-type:`? (3) Do queries using base types return complete results?

**Implementation:**
```yaml
# Required: base taxonomy
knowledge-type: procedural  # mandatory: procedural|conceptual|factual|experiential|relational|meta

# Optional: domain-specific precision
knowledge-subtype: career-development  # optional domain-specific classification
```

**Migration path:** For notes with non-standard `knowledge-type:` values:
1. Map to nearest base taxonomy category
2. Move original value to `knowledge-subtype:`
3. Example: `knowledge-type: career-development` → `knowledge-type: meta` + `knowledge-subtype: career-development`

**When domain subtypes add value:**
- Domain has significantly different verification requirements
- Domain has distinct retrieval patterns
- Domain requires specialized metadata

**When to skip domain subtype:**
- Base type is sufficient
- Note is cross-domain
- Complexity outweighs benefit

## Edge Cases

**Existing multi-type notes:** Notes with `knowledge-type: procedural|conceptual|factual|experiential|relational|meta` should be split — a note should have ONE primary type. Use subtypes for secondary classifications:
```yaml
knowledge-type: conceptual
knowledge-subtype: [domain1, domain2]
```

**Notes that don't fit base taxonomy:** If a note genuinely cannot be classified, use `knowledge-type: meta` (catch-all for knowledge about knowledge) with detailed `knowledge-subtype:`.

**Legacy notes:** Existing notes can be migrated gradually during regular review cycles. No immediate mass migration required.

## Related Seed Rules

- [[Knowledge Type Taxonomy and Retrieval Optimization]] (Seed Gap - resolved)
- [[Seed Refinement - Knowledge Type Taxonomy Implementation]]
- [[Knowledge Type Link Density Correlation]] (Seed Gap)

## Test Cases

### Test 1: Base Classification
Query: Count notes by knowledge-type using base taxonomy only. Result should be 100% coverage.

### Test 2: Subtype Mapping
For notes with `knowledge-subtype:`, verify original value moved from knowledge-type to subtype.

### Test 3: Query Compatibility
Query using base type "procedural" returns all procedural notes regardless of subtype.