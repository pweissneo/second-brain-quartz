---
last-reviewed: 2026-03-24
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
verification-status: unverified
evidence-tier: established-convention
tags:
  - frontier-exploration
  - equipment
  - tool-dependency
  - domain-agnostic
status: superseded-by-seed-rule
notes: "Gap partially addressed by Seed rules on infrastructure dependencies and equipment tier (2026-03-23)"
---

# Frontier Exploration - Equipment and Tool Dependencies in Knowledge Bases

## The Gap

The Seed covers:
- **Learning prerequisites** — what knowledge you need BEFORE learning something new (`prerequisites: []`)
- **Software version dependencies** — which software version knowledge applies to (`version:`, `eol-estimate`)

But it does NOT cover:
- **Physical equipment dependencies** — what tools/equipment you need TO EXECUTE the knowledge

## Why This Matters

Knowledge that requires specific physical tools is fundamentally different from knowledge that requires prior learning:

1. **Acquisition barrier**: You can learn woodworking theory without buying chisels, but you cannot PRACTICE it
2. **Verification differs**: Learning prerequisites can be verified through quizzes; equipment prerequisites require ownership
3. **Cost implications**: Equipment costs can be significant; readers need to know upfront what investment is required
4. **Safety dimensions**: Some equipment (power tools, chemicals, vehicles) carries safety requirements beyond just "having" the tool

## Examples by Domain

### Woodworking
- "How to cut a dovetail joint" requires: dovetail saw, chisels, marking gauge, coping saw
- "How to flatten a board" requires: hand plane, jointer, or belt sander

### Cooking  
- "How to make sourdough bread" requires: Dutch oven (for steam)
- "How to make emulsified sauces" requires: stand mixer or whisk and patience

### Auto Repair
- "How to change brake pads" requires: jack, jack stands, lug wrench, C-clamp
- "How to diagnose OBD-II codes" requires: OBD-II scanner

### Photography
- "How to use off-camera flash" requires: external flash, trigger, light stands
- "How to shoot in manual mode" requires: camera with manual controls

### Music
- "How to play piano" requires: piano or keyboard
- "How to record at home" requires: audio interface, microphone, DAW

## The Challenge

Equipment dependencies are:
- **Domain-specific**: Different domains have different standard equipment
- **Often expensive**: Unlike books, tools cost money
- **Sometimes optional**: Some techniques have workarounds; some require exact tools
- **Safety-critical**: Wrong equipment can cause injury

## Proposed Solution

Add an `equipment:` field to frontmatter for notes where physical tools are required:

```yaml
equipment:
  - name: "Stand mixer"
    required: true
    alternatives: "Hand mixer with whisk and patience"
    safety: "Watch for loose clothing near moving parts"
  - name: "Dutch oven"
    required: true  
    alternatives: "Covered baking sheet with steam pan (less effective)"
```

## Test Cases

For a knowledge base about woodworking:
1. Pick 10 technique notes. Can you identify what tools each requires?
2. Are tool requirements documented inline or in frontmatter?
3. Can a reader determine upfront what investment is needed before committing to learn?

For a knowledge base about home repair:
1. Pick 10 repair procedures. Do they list required tools?
2. Are safety equipment requirements (gloves, glasses, masks) documented?
3. Can you distinguish "nice to have" tools from "must have" tools?

## Update (2026-03-24)

This gap has been **partially addressed** by the Seed:

1. **Infrastructure dependencies rule** — Added 2026-03-21: For infrastructure-dependent domains (home automation, networking, IoT, energy systems), treat infrastructure configuration as a first-class dependency with `infrastructure-type:`, `infrastructure-scope:`, and `applicability-transferability:` fields.

2. **Equipment tier edge case** — Added 2026-03-23: For workshop-dependent craft domains (woodworking, metalworking, leatherworking, sewing), equipment tier significantly affects technique applicability. Use `equipment-tier:` field with values: `professional`, `home-workshop`, `hand-tools-only`, `minimal`.

The remaining gap: The Seed doesn't have a general equipment tracking rule for domains outside of workshop crafts and infrastructure. Consider whether this note's proposed solution should become a general Seed rule.

## Related Notes

- [[Prerequisite Knowledge Tracking]] — Learning prerequisites (what knowledge you need BEFORE)
- [[Frontier Exploration - Integrated Rules History]] — Software/framework version dependencies
- [[Frontier Exploration - Ingredient Substitution Knowledge]] — Ingredient alternatives when tools/ingredients unavailable
- [[Frontier Exploration - Knowledge Ethics and Exclusion]] — Equipment cost as vault boundary criterion
- [[AI-Assisted Knowledge Management Seed]] — Now includes equipment tier rules for workshop-dependent crafts (2026-03-23) and infrastructure dependencies for technical domains
- [[Frontier Exploration - Tool and Equipment Maintenance Knowledge]] — Ongoing care required to keep tools functional
