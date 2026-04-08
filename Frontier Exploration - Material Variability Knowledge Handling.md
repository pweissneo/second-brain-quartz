---
last-reviewed: 2026-04-07
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - material-variability
  - craft-knowledge
  - knowledge-types
domain: craft
knowledge-type: procedural
retrieval-mode: hybrid
storage-pattern: sequential
access-pattern: decision
---

# Frontier Exploration: Material Variability Knowledge Handling

## The Gap

The Seed has **equipment-tier** for tool availability, but lacks explicit handling for **material variability** — the inherent non-homogeneity of raw materials that affects technique applicability.

## What is Material Variability?

Unlike digital knowledge, physical materials are not uniform:

| Material Domain | Variability Sources |
|-----------------|---------------------|
| Woodworking | Grain direction, moisture content, density, defects, species |
| Leatherworking | Hide quality, tannage type, thickness, imperfections |
| Ceramics | Clay body, moisture level, organic content, firing behavior |
| Metalworking | Alloy composition, heat treatment, grain structure |
| Cooking | Ingredient freshness, fat content, humidity, temperature |

## Why This Matters for Knowledge Management

1. **Technique parameters change**: Same technique ("sanding", "gluing", "cutting") requires different settings based on material state
2. **Failure diagnosis depends on material**: Why something failed often stems from material properties, not tool settings
3. **Knowledge applicability is material-scoped**: A technique works on one material but not another
4. **Material characterization is prerequisite**: Before applying technique, you must assess material properties

## What's Already in Seed

- `equipment-tier` — tool availability
- `embodied-component` — tactile knowledge
- Verification workflow for experiential domains

## What's Missing

**Material Variability Classification:**

```yaml
material-variability: low|medium|high
# low: homogeneous materials (sheet metal, fabric bolts)
# medium: some variation (construction lumber, leather)
# high: significant variation (natural wood, hides, clay bodies)
```

**Material Characterization Requirements:**

```yaml
material-characterization:
  grain-direction: required|recommended|not-applicable
  moisture-content: required|recommended|not-applicable  
  density: required|recommended|not-applicable
  defect-assessment: required|recommended|not-applicable
```

**Material Scope Tagging:**

```yaml
applicability-material-scope: material-specific|multi-material|universal
# material-specific: applies to specific material (e.g., end-grain cutting board)
# multi-material: applies to category (e.g., all hardwoods)
# universal: applies broadly (e.g., measuring twice, cutting once)
```

**Phase-Dependent Procedures:**

```yaml
project-phase: rough-milling|dimensional|joinery|assembly|finishing
# Same technique has different parameters in different phases
```

## Test for AI Agent

An AI building a craft knowledge base should:

1. Classify techniques by `material-variability` level
2. Document what material properties affect each procedure
3. Distinguish material-specific principles from universal guidelines
4. Tag procedures by project phase with relevant parameters

## Connection to Seed

This gap connects to:
- [[Seed Gap - Material Variability in Craft Domains]] — existing gap note
- [[Seed Stress Test - Woodworking Knowledge Base]] — stress test revealed this gap
- [[AI-Assisted Knowledge Management Seed]] — equipment-tier rule addresses tools, not materials

## Proposed Seed Rule

> **Rule:** For craft and material-working domains, include material variability classification in note frontmatter — tag with `material-variability: low|medium|high` and document required material characterization properties.
>
> **Why:** Raw materials are non-homogeneous in ways that fundamentally affect technique applicability. Without explicit material variability classification, AI agents cannot determine if a technique applies to their specific material, leading to failed procedures or missed failure diagnosis.
>
> **Test:** For craft domain notes about techniques: (1) Does frontmatter include `material-variability:`? (2) Can a reader determine what material properties affect this technique? (3) Are material-specific techniques distinguished from universal principles?

## Related Notes

- [[Frontier Exploration - Woodworking Knowledge Bases]]
- [[Seed Gap - Craft and Medical Knowledge Base Rules]]
- [[Seed Refinement - Knowledge Type Taxonomy Enforcement]]