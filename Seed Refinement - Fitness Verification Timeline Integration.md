---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-refinement
confidence: medium
gap-status: resolved
gap-resolution: merged
merged-from:
  - Seed Gap - Fitness Verification Timeline.md
merged-date: 2026-04-04
tags:
  - seed-refinement
  - verification
  - fitness
  - medium-horizon
  - domain-adaptation
---

# Seed Refinement - Fitness Verification Timeline Integration

> Integrating the fitness verification timeline gap into the Seed's verification framework
> Date: 2026-04-03

## Problem Identified

From [[Seed Gap - Fitness Verification Timeline]]:

The Seed's verification timeline categories have a gap for fitness/exercise domains:

| Category | Timeline | Examples | Seed Status |
|----------|----------|----------|-------------|
| Standard | 30 days | Factual, conceptual | ✅ Covered |
| Practice-required | 30-90 days | Cooking, music performance | ✅ Covered |
| **Fitness (missing)** | **4-12 weeks** | Training protocols, exercise programs | ❌ GAP |
| Medium-long | 2-8 weeks | Pottery glazes, woodworking finishes | ✅ Covered (2026-04-02) |
| Long-horizon | 2-5 years | Gardening, tree fruits | ✅ Covered |

Fitness verification reality (from [[Seed Stress Test - Fitness Knowledge Base]]):
- **Strength gains:** 4-8 weeks to see measurable change
- **Muscle hypertrophy:** 8-12 weeks for visible change
- **Endurance adaptation:** 4-12 weeks depending on starting point
- **Body composition:** 12+ weeks to separate water weight from actual change

The existing categories don't fit:
- **Standard 30-day** is too short — can't verify fitness progress in 30 days
- **Practice-required** implies 30-90 days — fitness needs longer
- **Medium-long (2-8 weeks)** is close but fitness needs minimum 8 weeks
- **Long-horizon (years)** is too long

## Analysis: Why This Matters

The fitness verification gap causes real problems:
1. **False negatives** — Unverified fitness notes accumulate because the 30-day window is unrealistic
2. **Verification backlog inflation** — Fitness notes skew the verification ratio artificially low
3. **Incorrect status** — Notes marked "unverified" when they're actually "pending verification completion"

This is particularly problematic because:
- Fitness is a high-interest domain with many notes
- Individual variation means verification is more important (to confirm applicability)
- Equipment-dependent knowledge adds context requirements

## Proposed Seed Integration

### Option A: Extend "Medium-Long" Category

The 2026-04-02 refinement added medium-long verification (2-8 weeks). Fitness needs 4-12 weeks.

**Modification:** Expand the medium-long category's upper bound and add fitness-specific guidance.

### Option B: Add "Medium-Horizon" Sub-Category

Create a new sub-category under "medium-long" for verification >8 weeks but <6 months.

### Option C: Fitness-Specific Edge Case

Add a fitness-specific edge case to the verification ratio rule.

## Recommended Approach: Option C (Minimal Change)

The simplest integration is adding a fitness-specific edge case to the existing verification ratio rule. This maintains the Seed's structure while addressing the gap.

### Proposed Seed Addition

Add to the verification ratio section (around line 445-460):

> **Edge case (NEW - 2026-04-03):** For fitness/exercise domains where verification requires 4-12 weeks (longer than standard 30-day but shorter than long-horizon), apply medium-horizon verification parameters:
> - Use `verification-cycle: medium-horizon` field
> - Set `verification-minimum: 8-weeks` as baseline for strength/hypertrophy protocols
> - Use `verification-cycle: monthly` for progress tracking
> - Mark notes as `verification-status: testing` until minimum period completes
> - Apply modified verification ratio: (notes verified OR notes-in-progress) / notes added in last 90 days ≥0.5
> - Allow higher unverified backlog during capture phase (up to 40%)

**Why this works:**
- Minimal change to Seed structure
- Fitness gets appropriate timeline
- Sets precedent for other medium-horizon domains (habits, personal development)
- The 90-day ratio window accounts for the longer verification period

## Implementation Example

```yaml
# Fitness protocol note frontmatter
verification-modality: practice-required
verification-cycle: medium-horizon  # 4-12 weeks
verification-minimum: 8-weeks
verification-completion-target: 2026-07-01  # 3 months out
verification-status: testing
verification-progress: month-1-of-3

# Modified verification ratio calculation
# For fitness domain: (verified OR in-progress) / added in last 90 days ≥0.5
```

## Alternative Domains That Would Benefit

This approach would also work for:
- **Habit formation** — 4-8 weeks to establish, 12+ weeks to confirm
- **Personal development** — similar timeline to fitness
- **Skill acquisition (non-tacit)** — 4-12 weeks for competency assessment

## Seed Update Required

To integrate, add the edge case to:
- [[AI-Assisted Knowledge Management Seed.md]] — verification ratio section
- Consider adding to the verification timeline summary table (around line 965)

## Risk Assessment

- **Low risk:** Adding guidance to existing rule, not changing core behavior
- **Precedent value:** Establishes pattern for other medium-horizon domains
- **Compatibility:** Works with existing individual-variation, equipment-scope rules

## See Also

- [[Seed Stress Test - Fitness Knowledge Base]]
- [[Seed Refinement - Long-Horizon Verification Timeline]] (related medium-long category)
- [[AI-Assisted Knowledge Management Seed]] (verification ratio rules, lines 445-464)