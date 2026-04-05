---
last-reviewed: 2026-04-05
last-updated: 2026-04-05
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - verification
  - pottery
  - ceramics
  - embodied-knowledge
  - iterative-verification
---

# Seed Refinement - Iterative Verification for Craft Domains

> Integrating findings from Seed Stress Test - Pottery and Ceramics Knowledge Base

## Gap Identified

The pottery stress test revealed that pottery and ceramics require **multi-cycle iterative verification** that isn't captured by the existing verification timeline rules. The current rules cover:

- `verification-cycle: seasonal` (seasonal constraints)
- `verification-cycle: long-horizon` (creative writing, months+)
- `verification-cycle: medium-horizon` (fitness, 4-12 weeks)
- `verification-cycle: perennial` (gardening, multi-year)

But pottery needs something different: **multiple iterations within each cycle** because:
- A single glaze test is insufficient — results vary by kiln atmosphere
- Same recipe in electric vs gas vs wood kiln = different results
- Minimum 3 firings across contexts to confirm "verified" status
- Each firing takes 2-4 weeks (clay → dry → bisque → glaze → glaze fire)

## Proposed Rule Addition

**Rule:** For domains requiring iterative verification (multiple cycles to confirm), apply multi-iteration verification parameters.

**Why:** Some knowledge can only be verified through multiple test iterations across varying conditions. Single-pass verification creates false confidence in domains where context variation produces materially different results. The verification ratio test assumes knowledge improves with age, but iterative knowledge improves with REPEATED testing under varied conditions.

**Test:** For notes in iterative-verification domains: (1) Does frontmatter include `verification-cycle: iterative`? (2) Is `minimum-tests-required` specified? (3) Is `verification-cycles-completed` tracked? (4) Do verification status values include `iteration-in-progress`? (5) Is verification ratio calculated with (verified OR iteration-complete) / total, not just verified / total?

**Implementation:**
```yaml
verification-cycle: iterative
minimum-tests-required: 3
verification-cycles-completed: 1
verification-contexts-tested:
  - electric-kiln-oxidation
  - gas-kiln-reduction
verification-status: iteration-in-progress
# When cycles complete:
verification-status: verified
last-verified: 2026-04-05
```

**Modified verification ratio for iterative domains:**
- Standard: verified / total < 30%
- Iterative: (verified OR iteration-in-progress) / total < 40%
- Allow higher backlog during capture phase (up to 50%)

**Domain examples where this applies:**
- Pottery/ceramics (glaze testing across kiln types)
- Cooking (recipe testing across equipment, ingredients sources)
- Home repair (technique testing across materials)
- Craft domains (technique testing across material variations)

## Sensory Anchor Integration

The pottery stress test also provided domain-specific sensory anchors for embodied knowledge. These should be added to the Seed's embodied knowledge section.

**Pottery-specific sensory anchors to integrate:**

| Knowledge Type | Sensory Anchor Example |
|---------------|------------------------|
| Clay readiness (wedging) | "Like pressing a ripe avocado — slight give, no lumps" |
| Clay readiness (throwing) | "Ball springs back slowly when pressed" |
| Leather-hard stage | "Retains fingerprint impressions" |
| Wheel centering | "Clay doesn't wobble when touched" |
| Glaze consistency | "Like heavy cream, coats spoon" |
| Cone 04 (bisque done) | "Post bends to ~8 o'clock position" |
| Kiln cool enough | "No red visible, under 200°F" |

## Context Variables for Contradiction Detection

Pottery also revealed that many apparent "contradictions" are actually context-dependent. The Seed's contradiction handling should be extended:

**Proposed frontmatter extension:**
```yaml
contradiction-status: contextual  # not a real contradiction
context-variables:
  - kiln-type: electric vs gas vs wood-fired
  - clay-body: stoneware vs porcelain vs earthenware
  - technique: wheel-throwing vs hand-building
resolution: "Both valid — apply context-specific rule"
```

## Integration Point

This refinement should be integrated into the Seed at:
1. The verification timeline edge cases (around line 455-458)
2. The embodied knowledge section (around line 1139)
3. The contradiction detection section (around line 848)

## See Also

- [[Seed Stress Test - Pottery and Ceramics Knowledge Base]] — Original stress test
- [[AI-Assisted Knowledge Management Seed]] — The Seed being refined
- [[Seed Refinement - Context Window-Aware Knowledge Organization]] — Related refinement
- [[Frontier Exploration - Embodied Knowledge]] — Embodied knowledge handling
