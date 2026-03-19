---
last-reviewed: 2026-03-18
confidence: emerging
lifecycle: active
author-type: ai-assisted
schema-version: "1.0"
tags:
  - frontier-exploration
  - schema-design
  - metadata
  - taxonomy
  - vault-design
---

# Frontier Exploration - Knowledge Base Schema Design

> The Seed tells us WHAT to capture in notes but not HOW to design the note structure itself. Schema design is the meta-layer that governs how knowledge gets represented.

## The Gap

The Seed covers:
- **Note content** — atomicity, linking, templates
- **Note lifecycle** — verification, stale detection, maintenance
- **Note metadata** — confidence markers, verification status, knowledge types

But it does NOT cover:
- **Schema design** — how to choose and structure metadata fields for a new vault
- **Taxonomy design** — how to create a tagging system that scales
- **Schema evolution** — how to change metadata as the vault matures

## Why This Matters

A knowledge base without intentional schema design is like a database without a schema — data gets stored inconsistently, queries fail, and the structure degrades over time.

### Problems of No Schema Design

1. **Inconsistent metadata** — Some notes have `confidence:`, others don't; some use `tags:`, others use `topic:`
2. **Tag explosion** — Without taxonomy design, tags multiply uncontrollably (`cooking`, `cook`, `cooking-tip`, `cooking-advice`)
3. **Schema drift** — Early notes use different fields than later notes, making queries unreliable
4. **AI confusion** — AI agents can't infer metadata expectations without explicit schema

### Benefits of Intentional Schema Design

1. **Consistency** — Every note follows the same structure
2. **Queryability** — AI agents can reliably query by metadata
3. **Scalability** — Taxonomy design prevents tag explosion
4. **Onboarding** — New users/contributors understand the structure

## The Challenge

Schema design is a meta-problem — it's knowledge about how to organize knowledge. The Seed needs rules for:

1. **What fields to use** — Core fields every note should have
2. **How to name fields** — Naming conventions for metadata
3. **How to design tags** — Taxonomy structure and governance
4. **How to evolve** — Process for adding/changing fields
5. **How to document** — Making the schema discoverable

## Domain-Specific Considerations

### New Vaults (Bootstrap Phase)

New vaults need minimal schema:
- `purpose:` — Why this vault exists (in `_root.md`)
- `last-updated:` — When modified
- `tags:` — Topic categorization (loose, can evolve)

### Growing Vaults (Maturity Phase)

Mature vaults need more structure:
- `confidence:` — Reliability level
- `verification-status:` — How verified
- `lifecycle:` — Current state (evergreen, staging, deprecated)
- `knowledge-type:` — What kind of knowledge
- `domain:` — Primary domain (for multi-domain vaults)

### Specialized Domains

High-stakes domains need more:
- `jurisdiction:` — Legal/geographic scope
- `version:` — For technical knowledge
- `criticality:` — Safety implications
- `source-quality:` — Provenance tier

## Proposed Seed Rules

### Rule: Every vault should have a schema definition note documenting its metadata fields

**Why:** Without explicit schema documentation, both humans and AI agents guess at expected metadata. A schema note makes expectations explicit.

**Test:** (1) Does the vault have a `Schema.md` or `_schema.md` note? (2) Does it document all frontmatter fields in use? (3) Can an AI agent infer field expectations from it?

### Rule: Start with minimal schema (3-5 fields), add fields only when needed

**Why:** Over-engineering schema early creates adoption friction. Notes stay unwritten because the schema feels burdensome. Minimal viable schema enables capture; enrichment comes later.

**Test:** For a vault <50 notes: Are there 5 or fewer frontmatter fields in active use? For vaults >200 notes: Has schema been evaluated for needed additions?

### Rule: Use controlled vocabularies for taxonomy tags

**Why:** Free-form tags create chaos (`ai`, `a.i.`, `AI`, `artificial-intelligence`, `machine-learning`). Controlled vocabularies (exact strings, defined meanings) enable reliable queries.

**Test:** (1) Is there a `Taxonomy.md` or `_tags.md` note? (2) Do tags follow naming conventions (kebab-case, singular)? (3) Can you find 3+ similar tags that should be consolidated?

### Rule: Include schema version in frontmatter

**Why:** Schema evolves. Notes from 2024 may use different fields than notes from 2026. Version tracking enables backward compatibility and migration.

**Test:** Does frontmatter include `schema-version:` or similar? Can you determine which notes use which schema version?

### Rule: Document the "why" behind each metadata field

**Why:** Fields without rationale become cargo cult — used because they always were, not because they're useful. Documentation ensures intentionality.

**Test:** For each frontmatter field in use: (1) Is there documentation explaining its purpose? (2) Can someone new to the vault understand what to populate?

### Rule: Review schema quarterly for field usage

**Why:** Unused fields create noise. Fields added "just in case" often go unused. Regular review keeps schema lean.

**Test:** (1) Can you identify fields that are used on <10% of notes? (2) Are there fields with inconsistent values? (3) Has schema been reviewed in the last 90 days?

## Related Notes

- [[Note Types and Templates]] — Content templates (different from schema)
- [[Note Types and Templates]] — Content templates and tagging strategy
- [[Domain-Specific Knowledge Bases]] — Multi-domain vaults
- [[Knowledge Base Version Control and Change Tracking]] — Schema changes as vault version control
- [[AI-Assisted Knowledge Management Seed]] — The Seed this note extends

## Test Case: Designing a New Cooking Vault Schema

A new cooking vault needs to decide its metadata:

**Minimal (bootstrap):**
```yaml
tags:
  - breakfast
lifecycle: staging
```

**After 100 notes:**
```yaml
tags:
  - breakfast
  - quick-weeknight
knowledge-type: procedural
confidence: high
verification-status: verified
lifecycle: evergreen
```

**After 500 notes (specialized):**
```yaml
tags:
  - breakfast
  - quick-weeknight
  - make-ahead
knowledge-type: procedural
confidence: high
verification-status: verified
lifecycle: evergreen
cuisine-region: american-south
prep-time-minutes: 15
difficulty: easy
equipment-required: [cast-iron, blender]
dietary: [gluten-optional]
```

The schema GREW with the vault — minimal early, enriched as needs emerged.

## The Meta-Question

This note represents a meta-layer challenge: the Seed is a schema for knowledge bases, but who schemas the schema? The answer is ongoing refinement through heartbeat reviews and frontier exploration — the Seed improves its own meta-cognition over time.
