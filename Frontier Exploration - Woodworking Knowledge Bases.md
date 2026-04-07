---
last-reviewed: 2026-03-19
status: probe
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - woodworking
  - craft-knowledge
  - experiential-knowledge
---

# Frontier Exploration: Woodworking Knowledge Bases

> Exploring gaps in the Seed for building a knowledge base about woodworking - a craft domain combining physical skills, tool knowledge, and material science.

## Domain Characteristics

Woodworking is a craft domain that combines:
- **Physical/embodied skills**: Hand tool techniques, machine operation
- **Material science**: Wood properties, grain behavior, moisture content
- **Tool knowledge**: Machine settings, blade geometry, jig design
- **Sequential processes**: Project workflows from rough lumber to finish
- **Judgment-based decisions**: "When the joint is ready," "when the finish is right"

## Current Seed Coverage

The Seed covers:
- Experiential knowledge domains (verification workflow)
- Tool/equipment dependencies
- Sequential workflow knowledge
- Construction phase adaptations
- Dimensional knowledge (measurements, tolerances)

## Potential Gaps

### Gap 1: Tool Setting Specificity

**Problem**: Woodworking procedures often depend on exact machine settings that vary by:
- Wood species (soft vs hard)
- Wood moisture content
- Specific machine model
- Blade/bit age and condition

**Example**: "Set the table saw fence to X" - but X depends on whether you're cutting pine vs walnut, dry vs green wood, new blade vs dull blade.

**Seed Gap**: The Seed's tool dependency rules don't address **parameter ranges** - when a setting is a single value vs. a range that depends on variables.

**Proposed Rule**: For tool settings that vary by context, capture the decision tree:
```yaml
tool-setting:
  parameter: "table-saw-fence-position"
  base-value: "reference-point"
  adjustments:
    - condition: "wood-hardness"
      options:
        soft-wood: "+1mm"
        hard-wood: "0mm"
    - condition: "cut-type"
      options:
        rough: "+3mm"
        finish: "0mm"
```

### Gap 2: Sensory Verification

**Problem**: Woodworking relies heavily on sensory feedback that text cannot capture:
- "When the saw sounds right" - audio cues
- "When the wood feels right" - tactile feedback  
- "When the shavings look right" - visual confirmation

**Seed Gap**: The Seed covers experiential verification but doesn't have specific guidance for **sensory-mode verification** - distinguishing between what you see, hear, feel, or smell as the verification method.

**Proposed Rule**: Add `sensory-mode` field for craft knowledge:
```yaml
verification-method: sensory
sensory-mode: audio  # saw tone, chisel sound
sensory-mode: tactile  # hand feel, resistance
sensory-mode: visual  # shavings, surface appearance
sensory-mode: olfactory  # smell of finish, burnt wood
```

### Gap 3: Tolerance and Precision Hierarchy

**Problem**: Different joinery requires different precision levels:
- Dovetail joints: <0.5mm tolerance, visible
- Mortise-and-tenon: 1mm tolerance, hidden
- Frame joints: 2mm tolerance, adjustable
- Rough cuts: 5mm tolerance

**Seed Gap**: The Seed doesn't have guidance on **precision-tier knowledge** - categorizing procedures by their tolerance requirements.

**Proposed Rule**: Add precision tier to procedural notes:
```yaml
precision-tier: visible-joint  # <0.5mm, any gap shows
precision-tier: structural  # 1-2mm, affects strength
precision-tier: rough  # >2mm, cosmetic or adjustable
```

### Gap 4: Safety-Critical Procedural Knowledge

**Problem**: Woodworking has serious safety risks:
- Table saw kickback (can cause severe injury)
- Router bit explosion
- Dust collection failures
- Chemical finish toxicity

**Seed Gap**: The Seed has general risk guidance but woodworking-specific safety knowledge needs domain-specific structuring.

**Proposed Rule**: For safety-critical procedures, require:
```yaml
safety-critical: true
hazard-type: [kickback, entanglement, dust, chemical]
ppe-required: [safety-glasses, dust-mask, hearing-protection]
emergency-procedure: "[[First Aid - Table Saw Injuries]]"
```

### Gap 5: Material Variability Handling

**Problem**: Wood is not homogeneous - grain direction, knots, reaction to moisture all vary:
- "Flat lumber" may have internal stress that cups after cutting
- "Dry wood" may have 6% or 15% moisture
- "Clear stock" may have hidden defects

**Seed Gap**: The Seed doesn't have rules for **inherent variability materials** - where each piece of the same "material" behaves differently.

**Proposed Rule**: For variable materials, require characterization:
```yaml
material-variability: high
characterization-required:
  - grain-direction  # radial vs tangential vs longitudinal
  - moisture-content  # MC percentage
  - defect-check  # knots, checks, warp
```

### Gap 6: Project Phase Knowledge

**Problem**: Woodworking projects have distinct phases with different knowledge needs:
1. Design/material selection
2. Rough milling/flattening
3. Dimensional milling
4. Joinery
5. Assembly
6. Sanding/preparation
7. Finishing

**Seed Gap**: The Seed covers sequential knowledge but not **phase-dependent knowledge** - where the same "skill" (e.g., "sanding") means completely different things in different phases.

**Proposed Rule**: Tag procedural knowledge with project phase:
```yaml
project-phase: rough-milling  # flattening, thicknessing
project-phase: dimensional  # to final dimensions
project-phase: joinery  # cut fitting
project-phase: assembly  # glue-up
project-phase: finishing  # surface prep, coating
```

### Gap 7: Jig and Fixture Knowledge

**Problem**: Woodworking relies heavily on jigs (repeatable setups) and fixtures (one-off holds). This is **meta-procedural knowledge** - knowledge about how to create reliable procedures.

**Seed Gap**: The Seed doesn't address **procedural infrastructure** - knowledge that enables other knowledge to be executed reliably.

**Proposed Rule**: For jig/fixture knowledge:
```yaml
knowledge-type: procedural-infrastructure
applicability: repeatable  # for multiple cuts
jig-components: [base, fence, guide]
repeatability: high  # consistent results
```

## Test Case: Building a Cutting Board

Using only current Seed rules, an AI would create:
- Notes on wood species (maple, walnut)
- Notes on joinery (end-grain glue-up)
- Notes on finishing (mineral oil)

But would NOT capture:
- How to determine if wood is flat (sensory: visual/tactile)
- What tolerance for glue-up gaps (precision tier)
- Which phase each technique applies to (phase knowledge)
- Safety considerations for the planer (safety-critical)
- How to handle wood with varying moisture (material variability)

## Related Notes

- [[Frontier Exploration - Craft Knowledge Bases]] - General craft handling
- [[Frontier Exploration - Tool and Equipment Maintenance Knowledge]] - Tool knowledge
- [[Frontier Gap - Embodied Knowledge]] - Tacit knowledge in crafts
- [[Frontier Exploration - Multi-Modal Knowledge Representation]] - Sensory knowledge capture
- [[Stress Test - Verification Status Rule in Home Repair]] - Similar safety/procedural issues

## Questions for Seed Incorporation

1. Should the Seed have a general "precision-tier" concept for all procedural domains?
2. Is "sensory-mode" too domain-specific or should it be a general pattern?
3. How should the Seed handle material variability in other domains (cooking, textiles)?

---

**Status**: This is frontier exploration. The rules proposed here are candidates for testing in other craft domains before Seed incorporation.
