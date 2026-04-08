---
last-reviewed: 2026-04-07
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - material-variability
  - craft-knowledge
  - knowledge-types
---

# Seed Refinement: Material Variability Handling

## Gap Source

[[Frontier Exploration - Material Variability Knowledge Handling]] — discovered during FRONTIER_EXPLORATION

## Proposed Rule Addition

**Rule (NEW - 2026-04-07):** For craft and material-working domains, include material variability classification in note frontmatter — tag with `material-variability: low|medium|high` and document required material characterization properties.

**Why:** Raw materials (wood, leather, clay, metal) are inherently non-homogeneous in ways that fundamentally affect technique applicability and parameters. The Seed's `equipment-tier` addresses tool availability but not material state. Without explicit material variability classification, AI agents cannot determine if a technique applies to their specific material, leading to failed procedures or incomplete failure diagnosis.

**Test:** For craft domain notes about techniques: (1) Does frontmatter include `material-variability: low|medium|high`? (2) Does `material-characterization` document which properties matter (grain direction, moisture content, density, defects)? (3) Are material-specific techniques distinguished from universal principles via `applicability-material-scope:`?

**Implementation:**
```yaml
# For material-dependent knowledge
material-variability: medium  # low|medium|high — how much material state affects this technique
material-characterization:
  grain-direction: required|recommended|not-applicable
  moisture-content: required|recommended|not-applicable
  density: required|recommended|not-applicable
  defect-assessment: required|recommended|not-applicable

# For technique applicability scope
applicability-material-scope: material-specific|multi-material|universal
# material-specific: only applies to specific material (e.g., end-grain cutting board wood)
# multi-material: applies to material category (e.g., all hardwoods, all leather types)
# universal: applies broadly (e.g., "measure twice, cut once")

# For phase-dependent procedures (same technique, different parameters)
project-phase: rough-milling|dimensional|joinery|assembly|finishing
```

**Why this works:**
- `material-variability` signals how much material state matters for this knowledge
- `material-characterization` tells readers what to assess before applying technique
- `applicability-material-scope` distinguishes material-specific vs universal principles
- `project-phase` handles that same technique has different parameters in different project stages

**Edge cases:**
- Low variability materials (sheet goods, manufactured materials) may skip characterization
- Mixed materials (laminated wood, composite) require multi-material handling
- Some universal principles apply even in high-variability domains

## Integration

Add to Seed section on "Knowledge Type Taxonomy" or create new "Craft Domain Extensions" section alongside existing equipment-tier guidance.

## Test in Woodworking Domain

Apply to [[Seed Stress Test - Woodworking Knowledge Base]]:

1. Sanding techniques → `material-variability: high` (wood species, grain direction, hardness vary)
2. Measurement techniques → `material-variability: low` (applies universally)
3. Finish selection → `material-variability: medium` (depends on wood porosity, end-grain vs face)

## Related

- [[Seed Gap - Material Variability in Craft Domains]] — original gap documentation
- [[Seed Gap - Craft and Medical Knowledge Base Rules]] — related craft gap
- [[Seed Refinement - Knowledge Type Taxonomy Enforcement]] — taxonomy enforcement