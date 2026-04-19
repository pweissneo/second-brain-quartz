---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: emerging
confidence: emerging
tags:
  - seed-refinement
  - verification
  - long-horizon
  - pottery
  - gardening
  - craft
---

# Seed Refinement - Long-Horizon Verification Timeline

> Refinement for AI-Assisted Knowledge Management Seed — addressing verification timelines for domains where knowledge validation requires extended time periods.

## Problem Identified

The Seed's standard verification rules assume:
- **30-day verification window** for standard knowledge
- **Experiential domains** get 30-90 days for practice-required verification
- **Long-horizon domains** (gardening) get multi-year tracking with "verified" requiring 2+ growing seasons

However, there's a gap between "experiential" (weeks) and "long-horizon" (years) — **medium-long verification** domains where:
- Single verification cycle takes 2-8 weeks
- Multiple cycles needed to confirm (2-5 iterations)
- Results are context-dependent (equipment, materials, environment)

**Pottery** is the canonical example:
- Clay preparation → drying → bisque fire → glaze application → glaze fire → final result = 2-4 weeks minimum
- Same glaze recipe behaves differently in electric vs gas vs wood kiln
- Need 3+ firings across contexts to mark as "verified"

Similar patterns exist in:
- **Woodworking** — finish curing (weeks), glue cure (24-72 hours), moisture content acclimation
- **Leatherworking** — leather stretching, dye drying, edge coating cure
- **Food fermentation** — cheese aging (weeks-months), sauerkraut (weeks), bread levain (days-weeks)
- **Audio engineering** — plugin evaluation (hours), room treatment (weeks), plugin stacking (variable)
- **Photography** — film development (days), print aging (weeks), color calibration stability

## Current Seed Coverage

The Seed has:
1. **Long-horizon verification** (gardening, permaculture) — multi-year cycles, 2+ growing seasons required
2. **Experiential verification** (cooking) — practice-required, 30-day window often insufficient
3. **Drill-verified** (emergency knowledge) — practice frequency based on exposure

Missing: **Medium-long verification** — 2-8 week cycles, iteration-required, context-dependent results.

## Proposed Seed Rule Addition

**Rule (NEW - 2026-04-02):** For knowledge domains where verification requires extended time periods (2-8 weeks per cycle) AND multiple iterations across contexts, apply medium-long verification tracking with explicit cycle counting and context documentation.

**Why:** The existing verification timeline assumes single-pass verification. Medium-long domains need: (1) explicit cycle tracking (how many verification attempts completed), (2) context documentation (what conditions were tested), (3) minimum iteration thresholds before "verified" status. Without this, notes get marked "verified" after one context-specific test, producing false confidence.

**Test:** For notes in pottery, woodworking, leatherworking, fermentation, audio engineering, or similar medium-long domains: (1) Does frontmatter include `verification-cycle:` with values `short-cycle|medium-long|long-horizon`? (2) Is `verification-iteration-required: true` present when multiple cycles are needed? (3) Is `minimum-tests-for-verified:` specified (typically 2-3 for medium-long)? (4) Are contexts tested documented (equipment type, materials, environment)?

**Implementation:**
```yaml
verification-cycle: medium-long  # short-cycle | medium-long | long-horizon
verification-cycle-duration: 2-4-weeks  # expected time per cycle
verification-iteration-required: true
minimum-tests-for-verified: 3  # number of iterations to confirm
verification-contexts-tested:
  - electric-kiln-oxidation
  - gas-kiln-reduction
  - wood-firing-neutral
# For partial completion:
verification-cycles-completed: 2
expected-verify-when: "After next firing cycle"
```

**Cycle Duration Guidelines:**
| Domain | Typical Cycle | Min Iterations | Context Variables |
|--------|--------------|-----------------|-------------------|
| Pottery (glazes) | 2-4 weeks | 3 | kiln type, atmosphere, clay body |
| Woodworking (finishes) | 1-4 weeks | 2 | finish type, application method, wood species |
| Leatherworking | 1-2 weeks | 2 | leather type, dye, edge treatment |
| Fermentation | 1-8 weeks | 2 | temperature, culture, container |
| Audio engineering | hours-days | 3 | room, speakers, plugins used |

**Verification Status Values:**
- `pending-verification` — captured, not yet tested
- `cycle-1-testing` — first cycle in progress
- `cycle-1-complete` — first cycle done, awaiting next
- `cycle-n-testing` — iterative testing in progress
- `partially-verified` — some contexts tested, not all
- `verified` — minimum iterations completed across required contexts

**Note:** This is orthogonal to verification *mode* (source, empirical, embodied, drill-verified). A pottery glaze note could be both `verification-mode: embodied` AND `verification-cycle: medium-long`. The cycle tracks *timeline*, mode tracks *method*.

## Integration with Existing Rules

- **Verification ratio:** For medium-long domains, count `partially-verified` (1+ cycles completed) as partial progress toward ratio
- **Verification ceiling:** Allow higher unverified backlog (50%) for medium-long domains since verification is inherently slower
- **Diminishing returns:** Notes with `verification-cycle: medium-long` should be captured even if they fail utility tests, because testing takes time and early capture preserves the knowledge intent
- **Conflict resolution:** Verification conflicts in medium-long domains should account for context variables — "glaze A doesn't work" may be specific to one kiln type

## See Also

- [[Seed Stress Test - Pottery and Ceramics Knowledge Base]] — Original stress test
- [[Seed Stress Test - Gardening Knowledge Base]] — Long-horizon verification example
- [[Seed Stress Test - Woodworking Knowledge Base]] — Craft domain verification
- [[AI-Assisted Knowledge Management Seed]] — Base rules
