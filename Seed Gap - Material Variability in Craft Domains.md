---
gap-status: proposed
protected: false
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - stress-test
  - material-variability
  - woodworking
  - craft-knowledge
  - gap-type: seed-missing
  - resolved-by: [[Seed Refinement - Material Variability Handling]]
---
gap-status: proposed

# Seed Gap: Material Variability Handling in Craft Domains

## Stress Test Context

SEED_STRESS_TEST on 2026-03-26: Applied Seed rules to woodworking knowledge domain.

## What's Already in Seed

The Seed covers:
- `equipment-tier` for workshop tools (professional, home-workshop, hand-tools-only, minimal)
- `embodied-component` for tactile/kinesthetic knowledge
- `infrastructure-type` for hardware dependencies
- Verification workflow for experiential domains

## Gap Discovered

**Material Variability Handling** is not adequately covered.

In woodworking (and similar craft domains like leatherworking, metalworking, ceramics):
- Each piece of material behaves differently based on grain direction, moisture content, defects, species variation
- The same technique ("sanding", "jointing", "finishing") has completely different approaches and parameters depending on material state
- Unlike software or digital knowledge, raw materials are not homogeneous

### Why This Matters

1. **Technique applicability**: A technique that works on one piece of wood may fail on another due to grain direction, moisture, or defects
2. **Parameter selection**: Tool settings (blade height, feed rate, grit sequence) depend on material characteristics
3. **Failure mode understanding**: Why something failed depends on material state, not just tool setup

### What's Missing from Seed

1. **Material variability classification**: No frontmatter field to indicate how much material variation affects this knowledge
2. **Material characterization requirements**: No guidance on what properties to document (grain direction, MC%, density, defects)
3. **Phase-dependent knowledge**: Same technique has different meaning in different project phases (rough-milling vs. finishing)
4. **Material-specific vs. general principles**: No separation between knowledge that applies across materials vs. material-specific techniques

## Proposed Seed Rules

```yaml
# For material-dependent knowledge
material-variability: low|medium|high  # how much material state affects applicability
material-characterization:
  grain-direction: required|recommended|not-applicable
  moisture-content: required|recommended|not-applicable
  density: required|recommended|not-applicable
  defect-check: required|recommended|not-applicable

# For phase-dependent procedures
project-phase: rough-milling|dimensional|joinery|assembly|finishing

# For material-specific vs. general
applicability-material-scope: material-specific|multi-material|universal
```

## Test

For woodworking/craft notes about techniques:
1. Does frontmatter include `material-variability:`?
2. Can a reader determine what material properties affect this technique?
3. Is there guidance on parameter adjustments for different material states?
4. Are material-specific techniques distinguished from general principles?

## Related Notes

- [[Seed Gap - Craft and Medical Knowledge Base Rules]] — overlaps with craft-specific gap
- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[AI-Assisted Knowledge Management Seed]] — equipment-tier rule (line ~212)
- [[Frontier Exploration - Woodworking Knowledge Bases]]

## Action Items

1. Add `material-variability` frontmatter field to Seed
2. Add material characterization guidance under Construction/Schema
3. Add project-phase tagging under Atomicity/Procedural content
4. Separate material-specific from universal craft principles