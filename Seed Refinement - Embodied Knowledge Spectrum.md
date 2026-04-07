---
last-reviewed: 2026-04-05
lifecycle: emerging
confidence: medium
author-type: ai-assisted
verification-status: unverified
tags:
  - seed-refinement
  - embodied-knowledge
  - sensory-anchors
  - domain-agnostic
gap-status: proposed
related-stress-tests:
  - Seed Stress Test - Pottery and Ceramics Knowledge Base
  - Seed Stress Test - Embodied Knowledge Rule
  - Seed Stress Test - Cooking Knowledge Base
---

# Seed Refinement - Embodied Knowledge Spectrum

> The Seed's three-value embodied system (essential/nice-to-have/none) doesn't capture the full spectrum of embodied knowledge types. Different modalities require different development timelines, verification approaches, and transfer strategies.

## Problem

The current Seed rule uses a 3-value system:
```yaml
embodied-component: essential|nice-to-have|none
```

But stress testing reveals this is insufficient. Different embodied knowledge types have fundamentally different properties:

| Type | Can Be Described | Can Be Practiced | Must Be Experienced |
|------------------------|------------------|------------------|---------------------|
| Glaze recipe (materials) | Yes | In theory | No |
| Wheel throwing posture | Partially | Yes | Yes - muscle memory |
| Clay wedging technique | Partially | Yes | Yes - feel is unique |
| Kiln sound interpretation | Partially | Limited | Yes - intuitive |
| Glaze application feel | Partially | Yes | Yes - thickness/touch |
| Kiln atmosphere reading | Partially | Limited | Yes - complex signals |

All are marked as `embodied-component: essential` but they differ in:
- **Describability** — how well the knowledge can be conveyed in text
- **Practability** — whether someone can practice without special equipment/access
- **Experience-dependency** — how much hands-on experience is required
- **Development timeline** — days (readable), weeks (practicable), months (experiential)

## Proposed Rule Addition

**Rule:** Extend `embodied-component:` to include modality and development timeline.

```yaml
embodied-component:
  # Legacy values still supported for backward compatibility:
  - essential
  - nice-to-have
  - none
  
# New extended values:
  - tactile-only        # Can describe, can verify from description alone
  - tactile-kinesthetic # Requires physical practice to develop (weeks-months)
  - auditory-interpretive # Requires pattern recognition from experience (months)
  - visual-intuitive    # Requires visual exposure over time (months-years)
```

And add explicit metadata:
```yaml
embodied-developmental-time: "6+ months regular practice"
verification-modality: embodied
verification-pathway: execution-required  # cannot verify from sources alone
sensory-anchors:
  - "Like pressing a ripe avocado — slight give indicates doneness"
```

## Rationale

The original rule captures that embodied knowledge exists but doesn't distinguish between types that require weeks vs years to develop, or between types that are describable vs purely experiential. This causes:
- **Overconfidence** — marking all embodied notes equally means treating "glaze recipe materials" same as "kiln atmosphere reading" 
- **Poor expectation setting** — users don't know how long it takes to develop the skill
- **Verification mismatches** — assuming source-checking can verify what requires practice

## Test

For notes tagged with `embodied-component: tactile-kinesthetic` or more:
1. Does the note include a developmental timeline estimate?
2. Are sensory anchors provided to help recognition?
3. Is the verification pathway explicitly execution-required?

For the pottery domain: Can a note about "proper clay wedging technique" be considered verified without hands-on practice? No — tactile-kinesthetic knowledge requires physical experience.

## Domains This Affects

- Cooking (knuckle-soft test for doneness)
- Music performance (bow pressure feel)
- Woodworking (grain reading, tool sharpness feel)
- Athletics (kinesthetic awareness)
- Medical (palpation, physical examination)

## See Also

- [[Seed Stress Test - Embodied Knowledge Rule]]
- [[Seed Stress Test - Pottery and Ceramics Knowledge Base]]
- [[Frontier Gap - Embodied Knowledge]]
- [[Seed Gap - Sensory Anchor Standardization]]