---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-02
lifecycle: seed-refinement-proposal
confidence: emerging
tags:
  - seed-refinement
  - species-variation
  - domain-specific
  - veterinary
  - medical
  - multi-modal-knowledge
links-to:
  - Seed Development Hub
  - AI-Assisted Knowledge Management Seed
  - Seed Stress Test - Veterinary Medicine Knowledge Base
  - Seed Gap - Species-Variation and Compliance Knowledge Handling
  - Seed Refinement - Multi-Modal Knowledge Verification Extensions
---

# Seed Refinement - Species-Variation-Aware Knowledge Scope

This refinement builds on the [[Knowledge Base Schema Design]] principles for scope metadata, extending them for [[Frontier Exploration - Multi-Modal Knowledge]] domains like veterinary medicine.

## Trigger

Stress test analysis of `Seed Stress Test - Veterinary Medicine Knowledge Base.md` revealed that the Seed's `scope` metadata is insufficient for domains where knowledge validity varies across species, variants, or subtypes.

## Gap Identified

The Seed's current rule at line 2051 says:

> **Rule:** Knowledge whose validity depends on context should include scope metadata.

But this rule lacks:
1. **Negative scope** — what's NOT applicable (e.g., "toxic to cats")
2. **Transferability assessment** — can this knowledge transfer to related species?
3. **Modality requirements** — knowledge requiring tactile/visual/auditory confirmation

## Proposed New Rule

**Rule:** For domains with significant variation across species, variants, or subtypes (veterinary medicine, botany, materials science, regional knowledge), include comprehensive scope metadata.

**Why:** In veterinary medicine, a medication safe for dogs may be toxic to cats. In botany, planting advice valid for hardiness zone 7 may fail in zone 5. Without explicit negative scope and transferability assessment, knowledge can be dangerously misapplied.

**Test:** For a veterinary domain vault: (1) Can you identify which notes have species-specific scope? (2) Can you find notes where knowledge from one species was incorrectly applied to another (dangerous)? (3) Do notes include both positive scope (applicable to) and negative scope (NOT applicable to)?

**Implementation:**
```yaml
# Positive scope - what this applies to
scope-species: [canine, feline]
scope-variant: [breed-specific for Labrador Retriever]

# Negative scope - what this explicitly does NOT apply to
scope-excludes: [avian, equine]
scope-warning: "TOXIC to cats - do not extrapolate"

# Transferability assessment
cross-scope-transferability: none|low|medium|high
transfer-conditions: "Even similar species require verification"
```

**Edge case:** Some knowledge is universal (anatomy fundamentals) and should be marked as such to prevent over-scoping.

## Relationship to Existing Rules

- Extends: [[Knowledge Base Schema Design]] (scope metadata)
- Complements: [[Seed Rule - Distributed Understanding]] (critical knowledge exemption in high-stakes domains)
- Complements: [[Seed Refinement - Multi-Modal Knowledge Verification Extensions]] (knowledge-modalities for multi-modal domains)

## Test Scenario

Applied to [[Seed Stress Test - Veterinary Medicine Knowledge Base]]:
- "Acetaminophen dosing for dogs" → scope: [canine], excludes: [feline], warning: "toxic to cats"
- "Feline hypertension treatment" → separate note, scope: [feline]
- "Cardiac anatomy fundamentals" → scope: universal

If a note about "NSAID safety in dogs" is applied to cats without a warning note, the vault has a safety gap. See also [[Seed Gap - Species-Variation and Compliance Knowledge Handling]] for related gap context.

## Source

Derived from stress test findings in `Seed Stress Test - Veterinary Medicine Knowledge Base.md` - Section on "Species-Specific Knowledge Scope"