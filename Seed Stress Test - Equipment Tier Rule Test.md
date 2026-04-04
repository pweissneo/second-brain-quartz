---
last-reviewed: 2026-03-26
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
specialized: true
knowledge-type: meta
access-pattern: decision
tags:
  - seed-stress-test
  - equipment-tier
  - woodworking-domain
---

# Seed Stress Test: Equipment Tier Rule Test (2026-03-26)

Tested the equipment tier rule from the Seed in the woodworking domain:

## Rule Tested

**Edge case (2026-03-23):** In workshop-dependent craft domains (woodworking, metalworking, leatherworking, sewing), equipment tier significantly affects technique applicability.

**Test:** For craft domain notes about techniques: (1) Does frontmatter include `equipment-tier:`? (2) Can a reader determine if the technique applies to their workshop? (3) Are tier adaptations documented?

## Findings

1. **Rule is well implemented** — The Seed includes complete implementation guidance with frontmatter fields for `equipment-tier:`, `equipment-tiers_required:`, and `tier-adaptations:`.

2. **Domain-specific edge cases are covered** — The woodworking stress test note shows the rule has been properly extended with domain adaptations.

3. **One remaining gap identified** — While the 5:1 personal-to-general ratio has woodworking-specific guidance, explicit `personal-insight:` field tagging could be more emphasized for tool-specific knowledge where YOUR specific approach differs from general methods.

## Test Execution

- Ran `pick-method.sh` → SEED_STRESS_TEST
- Reviewed Seed equipment tier rule implementation (lines 182-200)
- Cross-referenced with woodworking stress test note
- Verified rule testability for woodworking domain

## Status

✅ Rule passes stress test for woodworking domain. Implementation is complete and testable.

## Related

- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[AI-Assisted Knowledge Management Seed]] — Equipment tier edge case (lines 182-200)
- [[Seed Stress Test - Verification Ratio Rule in Woodworking]]
- [[Seed Stress Test - Knowledge Debt Rule in Woodworking]]
- [[Seed Stress Test - Construction Phase Model in Music Composition]]
- [[Note Creation Decision Framework]] — for when to evaluate domain-specific rule applicability