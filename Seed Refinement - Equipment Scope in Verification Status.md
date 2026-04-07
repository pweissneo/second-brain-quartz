---
last-reviewed: 2026-04-01
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - equipment
  - verification
  - craft-domains
related-seed-gaps:
  - Seed Gap - Equipment Scope in Verification Status
related-seed-rules:
  - Edge case (NEW - 2026-03-23): In workshop-dependent craft domains
  - Rule (NEW - 2026-03-26): verification-mode tool-dependent
schema-version: "1.0"
---

# Seed Refinement - Equipment Scope in Verification Status

## Problem

The Seed has equipment-tier (line 290) for craft domains and verification-mode: tool-dependent (line 438), but lacks explicit integration between verification-status and equipment-tier. A technique verified on professional equipment may not apply to hand-tools-only practitioners. Without equipment-scope in verification, users receive misleading verification signals about applicability.

## Existing Seed Rules

**Equipment-tier** (line ~290): For workshop-dependent craft domains, tag techniques with:
```yaml
equipment-tier: home-workshop  # professional | home-workshop | hand-tools-only | minimal
```

**Tool-dependent verification** (line ~438): For knowledge requiring physical tools to verify:
```yaml
verification-mode: tool-dependent
verification-tool: [specific-tool]
```

## Integration Gap

When verifying equipment-dependent knowledge:
1. The equipment-tier tells you what the technique requires
2. The verification-mode tells you how verification happened
3. But there's no explicit link between verification-status and equipment-tier

A user with hand-tools-only sees "verification-status: verified" and assumes the technique works for them — but the verification may have been performed on professional equipment.

## Proposed Rule Integration

Add equipment-scope to verification-status tracking:

**Rule (REFINED 2026-04-01):** For equipment-dependent knowledge, verification-status must include equipment-scope context — the equipment tier on which verification was performed.
**Why:** Knowledge verified on professional equipment may not apply to hand-tools-only practitioners. Without equipment-scope in verification, users receive misleading verification signals about applicability.
**Test:** For equipment-dependent notes: (1) Does verification-status include equipment-scope? (2) Can users determine if verification applies to their equipment tier? (3) Is equipment-tier documented for both knowledge content AND verification context?

**Implementation:** Extend verification metadata:
```yaml
# For the knowledge content
equipment-tier: home-workshop
equipment-tiers-required:
  - table-saw
  - jointer

# For the verification context
verification-status: verified
verification-mode: tool-dependent
equipment-scope: professional  # what tier verification was performed on
verification-tool: professional-table-saw
verified-by: user-experimentation
verification-equipment-notes: "Verified on 10" jointer with helical head"
```

**Verification scope mapping:**
| Equipment-scope | Description |
|-----------------|-------------|
| professional | Commercial-grade equipment (industrial saws, professional machines) |
| home-workshop | Consumer high-end (decent table saw, bandsaw, quality hand tools) |
| hand-tools-only | No powered equipment (hand planes, chisels, hand saws) |
| minimal | Primitive/no equipment (stone tools, natural materials) |

**Applicability test for users:**
- If equipment-tier == equipment-scope → verification directly applicable
- If equipment-scope > equipment-tier → may need adaptation (verified on better equipment)
- If equipment-scope < equipment-tier → cannot confirm applicability (verified on lesser equipment)

**Example:** A dovetail technique with:
```yaml
equipment-tier: hand-tools-only
equipment-scope: professional  # verified on professional equipment
tier-adaptations:
  - tier: professional
    adaptation: "No adaptation needed - verified at this tier"
```

The user sees verification was done on professional equipment but the technique claims to be hand-tools-only — this signals potential gap that needs verification at the claimed tier.

## Related Seed Sections

- [[Seed Rule - Vault Change Tracking]] — line ~290: Equipment tier edge case for craft domains
- [[Seed Refinement - Verification Mode Conflict Resolution]] — line ~438: Tool-dependent verification mode
- [[Seed Stress Test - Verification Status Rule in Home Repair]] — line ~449: Tool-dependent verification pathway
- [[Seed Stress Test - Woodworking Knowledge Base]] — domain example with equipment tiers

## Test Case

An AI builds a woodworking knowledge base using only current Seed rules:
1. Verifies "how to cut a dovetail joint" on professional equipment
2. Marks verification-status: verified
3. User with hand-tools-only applies the technique — it doesn't work

The refinement: Now the Seed requires equipment-scope in verification, so users can see verification was on professional equipment and decide whether to attempt with hand tools or adapt the technique.

## Implementation Priority

**When to apply:** For craft domain notes where equipment significantly affects technique outcome.

**When not to apply:** For purely conceptual knowledge (wood species characteristics, grain direction principles) that doesn't depend on equipment tier.

---
*This refinement merges and supersedes Seed Gap - Equipment Scope in Verification Status (2026-04-01) by adding equipment-scope to verification tracking while preserving existing equipment-tier and verification-mode rules.*