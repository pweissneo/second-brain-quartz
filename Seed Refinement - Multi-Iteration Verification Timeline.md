---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - verification-timeline
  - multi-iteration
  - craft-domain
---

# Seed Refinement - Multi-Iteration Verification Timeline

> For domains requiring extended verification cycles (pottery, woodworking,皮革, chemistry), the standard Seed verification timeline is insufficient. This refinement adds multi-iteration verification support.

## Original Seed Rule

The Seed's verification timeline assumes days-to-months for typical verification:
- 48-hour initial processing
- 30-day verification window
- Ongoing verification ratio maintenance

## Problem Discovered (Pottery Stress Test)

In pottery/ceramics, verification requires:
1. **Multi-week cycles** — clay → dry → bisque fire → glaze → glaze fire → final result (2-4 weeks minimum)
2. **Context-dependent results** — same glaze fires differently in electric vs gas vs wood kiln
3. **Iteration required** — single test is insufficient (need multiple firings to confirm)

Similar issues exist in:
- Woodworking (finish cure times, glue set times)
- Leather craft (dye drying, finish curing)
- Chemistry (reaction times, purification cycles)
- Home repair (paint cure, adhesive set)

## Proposed Rule Addition

**Rule (NEW - 2026-04-07):** For domains with inherently iterative verification requirements, track multi-iteration verification cycles explicitly. Distinguish between single-verification knowledge (can be verified in one pass) and multi-iteration knowledge (requires repeated testing across contexts).

**Why:** Applying single-verification rules to multi-iteration domains creates false confidence (marked verified after one test fire) or inappropriate effort (attempting completion in days rather than weeks). Without explicit iteration tracking, AI agents optimize for single-cycle completion.

**Test:** For verification-status updates: (1) Can you identify notes requiring multi-iteration verification? (2) Is iteration count tracked? (3) Are context variables (equipment, materials, conditions) documented? (4) Is there a minimum iteration threshold for "verified" status?

**Implementation:**
```yaml
verification-cycle-type: single|iterative
verification-iteration-required: true
verification-cycles-completed: 3
verification-iteration-threshold: 3  # minimum to reach "verified"
verification-contexts-tested:
  - electric-kiln-oxidation
  - gas-kiln-reduction
expected-verify-when: "After next firing cycle (2-3 weeks)"

# For single-iteration domains, omit these fields or set:
verification-cycle-type: single
verification-iteration-required: false
```

**Iteration threshold guidance by domain:**
| Domain | Typical Iteration Threshold | Cycle Duration |
|--------|---------------------------|----------------|
| Pottery/Ceramics | 3-5 firings | 2-4 weeks |
| Woodworking Finishes | 3-5 applications | 1-2 weeks |
| Leather Craft | 2-3 treatments | 1-2 weeks |
| Chemistry | Varies by reaction | Hours to days |

**Verification status transitions for iterative knowledge:**
```
unverified → testing (iteration 1) → testing (iteration 2) → ... → verified (threshold met) OR failed
```

**Edge cases:**
- **Accelerated iteration:** Some iterations can run in parallel (multiple glaze tests in same firing). Count firing cycles, not individual tests.
- **Context shift:** Changing kiln type resets iteration count for that context (new context = new testing needed).
- **Partial verification:** A note can be "verified for electric kiln" but "unverified for gas kiln." Track by context.

## Related Notes

- [[Seed Stress Test - Pottery and Ceramics Knowledge Base]] — Original stress test
- [[Seed Stress Test - Craft Knowledge Bases]] — Cross-domain craft testing
- [[Seed Refinement - Iterative Verification for Craft Domains]] — Related refinement
- [[AI-Assisted Knowledge Management Seed]] — Seed being refined
