---
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
tags:
  - seed-gap
  - pottery
  - ceramics
  - verification
  - embodied-knowledge
  - iterative-verification
schema-version: "1.0"
discovery-method: SEED_STRESS_TEST
---

# Seed Gap: Pottery and Ceramics Verification Timeline

> Adding verification timeline guidance for craft domains requiring multi-week iterative verification cycles — pottery, glass, blacksmithing, and similar embodied knowledge domains where verification requires physical execution plus extended processing time.

**Date:** 2026-04-04
**Discovery Method:** SEED_STRESS_TEST — Tested Seed verification rules against pottery domain
**Status:** EMERGING — New edge case for Seed verification rules

---

## Overview

The Seed has verification timeline edge cases for:
- Seasonal verification (cooking, gardening)
- Long-horizon verification (creative writing)
- Medium-horizon verification (fitness/exercise)

Missing: **Iterative verification** — domains where a single verification requires multiple complete cycles, each spanning weeks, where each cycle produces intermediate results that must be evaluated before the next begins.

Pottery is the canonical example:
- Clay preparation → Drying → Bisque fire → Glaze application → Glaze fire → Final result
- Full cycle: 2-4 weeks minimum
- Context-dependent: same glaze fires differently in electric vs gas vs wood-fired kilns

---

## The Gap

**Current Seed verification rules assume:**
- 30-day verification window (standard)
- 90-day window for long-horizon domains
- Single-pass verification is sufficient

**Pottery verification reality:**
- Multi-week cycle (2-4 weeks minimum)
- Multiple firings needed to confirm (same recipe behaves differently in different kilns)
- Context-dependent results (electric kiln ≠ gas kiln ≠ wood-fired)
- Intermediate evaluation points (bisque result informs glaze decisions)
- Seasonal constraints overlap (some glazes only fire properly in certain atmospheres available seasonally)

**Result:** The Seed's verification ratio calculation produces false negatives for pottery vaults — notes marked "unverified" after 30 days are actually "awaiting next firing cycle."

---

## Proposed Edge Case

**Edge case (NEW - 2026-04-04):** In craft domains requiring iterative verification with extended processing time between cycles (pottery/ceramics, glass-making, blacksmithing, enameling, paint-making), apply iterative-cycle verification parameters:

1. Use `verification-cycle: iterative` field for notes requiring multi-cycle verification
2. Set `verification-minimum: 3-firings` as baseline for confirming glazes/formulations
3. Use `verification-timeline: 8-12-weeks` as minimum for complete verification
4. Track `verification-cycles-completed:` (number of complete execution cycles)
5. Track `verification-contexts-tested:` (different conditions: kiln type, atmosphere, etc.)
6. Mark notes as `verification-status: testing` until minimum cycles complete
7. Apply modified verification ratio: (notes verified OR notes-in-progress) / notes added in last 120 days ≥0.4
8. Allow higher unverified backlog during capture phase (up to 50%)

**Why this differs from existing edge cases:**

| Domain | Verification Timeline | Cycles Required | Reason |
|--------|----------------------|-----------------|--------|
| Seasonal (cooking) | 6-month window | 1-2 | Waiting for ingredient season |
| Long-horizon (creative) | 90+ days | 1 | Feedback cycle length |
| Medium-horizon (fitness) | 8-12 weeks | 1 | Physical adaptation time |
| **Iterative (pottery)** | **8-12 weeks** | **3+** | **Multiple firings to confirm** |

The key distinction: fitness verification is "did my body adapt over 8 weeks?" (single evaluation at end). Pottery verification is "did this glaze work in electric AND gas AND wood-fired?" (multiple evaluations, different contexts, iterative refinement).

---

## Proposed Frontmatter Fields

```yaml
# Core fields for iterative verification
verification-cycle: iterative  # vs standard, seasonal, long-horizon, medium-horizon
verification-iteration-required: true
verification-cycles-completed: 0
verification-minimum-cycles: 3  # baseline for confirmation
verification-timeline-weeks: 10  # minimum timeline for full cycle

# Context tracking
verification-contexts-tested:
  - electric-kiln-oxidation
  - gas-kiln-reduction
  # Add as cycles complete

# Status values
verification-status: unverified|testing|partial|verified|failed
# partial = some cycles complete, not yet full confirmation
```

---

## Test Criteria

For notes in iterative-verification domains:

- [ ] Can you identify which notes require iterative verification?
- [ ] Do notes have appropriate verification-cycle value (iterative)?
- [ ] Is the 120-day verification window applied instead of 30-day?
- [ ] Are notes marked testing during verification, not unverified?
- [ ] Does verification ratio calculation exclude "awaiting cycle" notes from numerator?
- [ ] Are contexts-tested tracked to show verification breadth?

---

## Integration Path

**Where to add in Seed:** After the fitness/medium-horizon edge case (line ~458 in Seed):

```
**Edge case (NEW - 2026-04-04):** For craft domains requiring iterative verification with extended processing time between cycles...
```

**Seeds to update:**
- Verification timeline edge cases section
- Domain-specific verification guidance
- Knowledge Type Taxonomy (add `iterative` to verification-cycle options)

---

## Related

- [[Seed Stress Test - Pottery and Ceramics Knowledge Base]] — Stress test that identified this gap
- [[AI-Assisted Knowledge Management Seed]] — The Seed rules being extended
- [[Seed Gap - Sensory Anchor Standardization]] — Related pottery/craft gap
- [[Seed Stress Test - Craft Knowledge Bases]] — Cross-domain craft testing