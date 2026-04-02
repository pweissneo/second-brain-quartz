---
last-reviewed: 2026-03-31
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - verification
  - equipment-dependent
gap-status: proposed
gap-priority: medium
gap-phase: implementation
gap-source: seed-stress-test
discovered: 2026-03-29
analyzed: 2026-04-01
proposed: 2026-04-01
proposed-resolution: |

  The Seed has equipment-tier (line 290) for craft domains and verification-mode: tool-dependent (line 415), but lacks explicit integration between verification-status and equipment-tier.

  The gap: A technique verified on professional equipment should carry that context in verification-status, so users with hand-tools-only can see the applicability limitation.

  Proposed rule addition (to integrate with existing equipment-tier rule at line 290):

  **Rule (PROPOSED):** For equipment-dependent knowledge, verification-status must include equipment-scope context — the equipment tier on which verification was performed.
  **Why:** Knowledge verified on professional equipment may not apply to hand-tools-only practitioners. Without equipment-scope in verification, users receive misleading verification signals about applicability.
  **Test:** For equipment-dependent notes: (1) Does verification-status include equipment-scope? (2) Can users determine if verification applies to their equipment tier? (3) Is equipment-tier documented for both knowledge content AND verification context?

  This integrates with existing `equipment-tier:` frontmatter and `verification-mode: tool-dependent` by adding `equipment-scope:` to verification-status tracking.
schema-version: "1.0"
---

# Seed Gap: Equipment Scope in Verification Status

> How should verification status account for equipment-specific knowledge?

## The Problem

Verification of tool-executable knowledge may depend on specific equipment. A technique verified on a professional table saw may not apply to hand-tool-only practitioners. Verification without equipment scope misleads users about applicability.

## Proposed Rule

**Rule:** For equipment-dependent knowledge, track equipment scope in verification metadata — specify which equipment tier the verification applies to (professional, home-workshop, hand-tools-only).
**Why:** Without equipment-scope tagging, AI agents cannot distinguish knowledge verified on professional equipment from knowledge verified on consumer/home equipment. Users applying knowledge to their specific setup receive misleading verification signals.
**Test:** For equipment-dependent notes: (1) Does verification-status include equipment-scope field? (2) Can users determine if knowledge applies to their tool set? (3) Is equipment-type documented?

## Equipment Tiers

| Tier | Description | Examples |
|------|------------|----------|
| professional | Commercial-grade equipment | Industrial saws, professional lathes |
| home-workshop | Consumer high-end | Decent table saw, band saw |
| hand-tools-only | No powered equipment | Hand planes, chisels, hand saws |

## Implementation

```yaml
verification-status: verified
equipment-scope: home-workshop
equipment-type: table-saw
verified-by: user-experimentation
```

This allows filtering knowledge by user equipment tier.

## Test Case

An AI builds a woodworking knowledge base using only current Seed rules:
1. Verifies "how to cut a dovetail joint" on professional equipment
2. Marks verification-status: verified
3. User with hand-tools-only applies the technique — it doesn't work

The gap: The Seed doesn't require equipment-scope in verification, so knowledge verified on professional equipment misleads home-workshop practitioners.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Verification Hierarchy]]
- [[Frontier Exploration - Place-Specific Verification Knowledge]]
- [[Seed Stress Test - Tool-Dependent Verification in Medical Knowledge]]