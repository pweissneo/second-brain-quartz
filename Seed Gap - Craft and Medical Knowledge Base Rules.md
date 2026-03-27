---
protected: false
last-reviewed: 2026-03-25
last-updated: 2026-03-25
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - craft-knowledge
  - material-variability
  - project-phase
  - jig-knowledge
  - medical-knowledge
---

# Seed Gap: Craft-Specific and Medical Knowledge Base Rules

## Summary

This note documents two frontier gaps discovered during FRONTIER_EXPLORATION: (1) craft-specific knowledge rules for woodworking that are not yet in the Seed, and (2) medical/health knowledge base rules that need more comprehensive coverage.

## Gap 1: Craft-Specific Knowledge (Woodworking)

### What's Already in Seed

The Seed covers:
- Embodied knowledge with `embodied-component` and `sensory-modes` fields
- Equipment-tier for workshop tools
- Verification workflow for experiential domains
- Construction phase adaptations

### What's Missing

1. **Material Variability Handling**: Wood (and similar materials like leather, fabric, clay) is not homogeneous — each piece behaves differently based on grain direction, moisture content, defects, etc. The Seed lacks rules for inherently variable materials.

2. **Project Phase Tagging**: The same technique ("sanding") has completely different meaning in rough-milling vs. finishing phase. No guidance for phase-dependent knowledge.

3. **Jig and Fixture Knowledge**: Meta-procedural knowledge about repeatable setups — how to create reliable procedures — is not addressed.

4. **Tool Setting Specificity**: Parameter ranges vs. fixed values — when a setting depends on variables (wood species, moisture, blade condition).

### Proposed Seed Rules

```yaml
# For variable materials
material-variability: low|medium|high
characterization-required:
  - grain-direction  # radial vs tangential vs longitudinal
  - moisture-content  # MC percentage
  - defect-check  # knots, checks, warp

# For phase-dependent procedures
project-phase: rough-milling|dimensional|joinery|assembly|finishing

# For procedural infrastructure
knowledge-type: procedural-infrastructure
jig-components: [base, fence, guide]
repeatability: high|medium|low

# For tool settings that vary
tool-setting:
  parameter: "name"
  base-value: "reference-point"
  adjustments:
    - condition: "variable-name"
      options:
        value1: "adjustment"
```

## Gap 2: Medical Knowledge Base Rules

### What's Already in Seed

The Seed covers:
- High-stakes domain verification ratios (≥0.7 for medical)
- Criticality tagging for exemption from diminishing returns
- Privacy and harm potential assessment
- Evidence tier classification

### What's Missing

1. **Medical Disclaimer Requirements**: No explicit requirement for disclaimers on medical notes

2. **PHI Handling**: No specific guidance on protecting Protected Health Information

3. **Medical Source Verification Tiers**: No distinction between peer-reviewed, clinical guidelines, professional consensus, anecdotal

4. **Temporal Guidelines**: No requirement for guideline-date/review-date on medical protocol notes

5. **Conflicting Sources**: No protocol for documenting medical controversy

### Proposed Seed Rules

```yaml
# For medical notes
disclaimer-required: true
source-verification-tier: peer-reviewed|clinical-guideline|professional-consensus|anecdotal
guideline-date: 2026-01
review-date: 2026-06
contradiction-status: acknowledged
contradiction-with: [[Note Name]]
```

## Synthesis

Both gaps represent domain-specific knowledge that the Seed handles inadequately:
- **Craft domains** need material variability, phase tagging, procedural infrastructure
- **Medical domains** need disclaimer requirements, PHI handling, source tiers, temporal dating

These should be added to the Seed as:
1. Edge cases under existing rules (verification, atomicity)
2. New domain-specific sections for high-value specialty domains

## Related Notes

- [[Frontier Exploration - Woodworking Knowledge Bases]]
- [[Frontier Exploration - Medical and Health Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed]] — Sections needing update
- [[Frontier Exploration - Craft Knowledge Bases]]

## Action Items

1. Add material-variability to Seed under Construction/Schema rules
2. Add project-phase to Seed under Atomicity/Procedural content
3. Add jig/fixture knowledge to Seed under Knowledge Types
4. Add medical disclaimer requirements to Seed under High-Stakes Domains
5. Add medical source verification tiers to Seed under Verification
6. Add temporal guidelines dating to Seed under Verification
- [[_root]]
