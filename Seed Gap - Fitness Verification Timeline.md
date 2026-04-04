---
last-reviewed: 2026-04-03
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
verification-status: testing
tags:
  - seed-gap
  - fitness
  - verification-timeline
  - domain-adaptation
---

# Seed Gap: Intermediate Verification Timeline for Fitness Domains

> Identifying a gap in the Seed's verification timeline handling for fitness/exercise knowledge
> Date: 2026-04-03

## Gap Summary

The Seed has verification timeline rules for:
- **Standard domains:** 30-day verification window
- **Long-horizon domains:** Multi-year verification (gardening, permaculture, tree fruits)
- **Practice-required domains:** 30-day window with execution tracking

**Missing:** An intermediate verification timeline for fitness/exercise domains that require weeks-to-months (not days or years) to verify results.

---

## Problem Description

### Fitness Verification Reality

Fitness knowledge verification timelines fall into a gap:

| Domain | Verification Timeline | Seed Handling |
|--------|----------------------|---------------|
| Medical | Days to weeks | Standard 30-day |
| Fitness/Exercise | 4-12 weeks | **GAP - too long for standard, too short for long-horizon** |
| Gardening/Perennial | 2-5 years | Long-horizon rules |

The Seed's current rules either:
1. Apply standard 30-day verification (unrealistic for fitness protocols)
2. Apply long-horizon multi-year rules (overkill for fitness)

### Fitness Stress Test Findings

From [[Seed Stress Test - Fitness Knowledge Base.md]]:

- **Strength gains:** 4-8 weeks to see measurable change
- **Muscle hypertrophy:** 8-12 weeks for visible change
- **Endurance adaptation:** 4-12 weeks depending on starting point
- **Body composition:** 12+ weeks to separate water weight from actual change

The stress test proposes:
```yaml
verification-cycle: monthly  # for fitness protocols
verification-completion-target: YYYY-MM+3  # 3 months minimum
verification-minimum: 8-weeks  # minimum testing period
```

---

## Current Seed Coverage Analysis

### What's Already Covered

1. **Individual Variation (line 1482):** Fitness is explicitly listed as an "extreme individual variation" domain requiring `individual-variation: high` tagging.

2. **Equipment Scope (line 4181+):** Fitness is equipment-dependent - the Seed has comprehensive equipment-scope handling.

3. **Practice-Required Verification (line 977):** The Seed has `verification-modality: practice-required` for cooking, music performance, physical skills.

4. **Long-Horizon Verification (line 965):** The Seed has explicit rules for multi-year verification.

### What's Missing

**No intermediate verification timeline category** for domains that need:
- Longer than standard 30-day (can't verify fitness in 30 days)
- Shorter than multi-year (fitness verifies in weeks/months, not years)
- Explicit minimum verification periods (8-12 weeks for fitness protocols)

---

## Proposed Seed Refinement

### Option 1: Extend Existing Practice-Required Rule

Extend the practice-required verification rule to include fitness-specific parameters:

> **Additional guidance for fitness/exercise domains:**
> - Set `verification-minimum: 8-weeks` as baseline for strength/hypertrophy protocols
> - Use `verification-cycle: monthly` for progress tracking
> - Mark notes as `verification-status: testing` until minimum period completes
> - Allow higher unverified backlog (up to 40%) during initial capture phase

### Option 2: New Intermediate Verification Rule

Add a new rule category for "medium-horizon verification":

> **Rule:** For domains with medium-horizon verification (weeks to months), use intermediate verification parameters.
> **Why:** Domains like fitness, personal development, and habit formation verify in 4-12 weeks - too long for standard 30-day rules, too short for long-horizon (multi-year) rules. Without intermediate parameters, AI agents apply incorrect verification timelines.
> **Test:** For fitness/personal development notes: (1) Is `verification-cycle: monthly` or `weekly` used? (2) Is `verification-minimum:` set to reflect domain reality? (3) Is `verification-completion-target:` set to 3-6 months out? (4) Is unverified backlog allowance increased (35-40%)?

### Recommended Approach

**Option 1** is preferred - extend the existing practice-required rule with fitness-specific parameters. This keeps the Seed's structure intact while adding domain-specific guidance.

---

## Implementation Example

```yaml
# For fitness protocol notes
verification-modality: practice-required
verification-cycle: monthly
verification-minimum: 8-weeks
verification-completion-target: 2026-07-01
verification-status: testing
verification-progress: month-1  # track which month of testing

# Allow higher backlog during capture phase
# fitness: verification-ratio: 0.35  (vs standard 0.50)
```

---

## Impact Assessment

- **Low risk:** Adding guidance to existing rule, not changing core behavior
- **High value:** Enables realistic verification expectations for fitness knowledge
- **Precedent:** Could extend to other medium-horizon domains (habits, personal development, skill acquisition)

---

## See Also

- [[Seed Stress Test - Fitness Knowledge Base.md]]
- [[AI-Assisted Knowledge Management Seed]] (line 965 - long-horizon verification)
- [[Seed Refinement - Long-Horizon Verification Timeline]]
- [[Frontier Exploration - Fitness and Exercise Knowledge Bases]]
- [[Seed Stress Test - Gardening Knowledge Base]] (long-horizon for comparison)