---
last-reviewed: 2026-04-03
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - fitness-domain
  - linking-rules
  - domain-adaptation
---

# Seed Stress Test: 2+ Links Rule in Fitness Domain

> Testing the "2+ outgoing links" rule in the fitness/exercise knowledge domain.
> Date: 2026-04-03

## Rule Under Test

**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.

**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag AND lacks the `specialized: true` tag.

---

## Fitness Domain Analysis

### Unique Characteristics of Fitness Knowledge

1. **Equipment-dependent knowledge** — gym equipment vs bodyweight vs resistance bands create different exercise variants
2. **Progressive overload is core** — tracking progress (weight, reps, sets, form) is THE fundamental principle
3. **Personal biometrics** — what constitutes "safe" varies by individual's height, weight, leverage, injury history
4. **Form is anatomy-dependent** — optimal form differs based on limb ratios, joint mobility, prior injuries
5. **Recovery context-dependent** — sleep, nutrition, stress, prior activity all affect recovery
6. **Progressive structure** — fitness knowledge builds in sequences (progressive overload cycles)

---

## Stress Test Questions

### Does this rule make sense for fitness?

**Yes, with modifications.** The concept is valid, but fitness has specific edge cases:

1. **Form notes naturally link to few sources** — A note like "Squat Form" might only naturally link to "Squat" (exercise) and "Lower Body" (muscle group). That's only 2 which meets minimum, but some form notes might only have 1 natural link.

2. **Personal biometric notes should NOT link to others** — Notes tracking YOUR specific measurements, PRs, or progress serve as personal reference. They don't enable navigation.

3. **Progressive overload tracking notes might only link to one target** — A "Squat Progress 2026" note links to "Squat" but has no natural second link. It's a time-series record, not a navigation point.

4. **Equipment-specific instructions** — "Leg Press Machine X" instructions might only naturally link to "Leg Press" as the exercise type.

---

## Edge Cases in Fitness

### 1. Personal Tracking Notes

**Problem:** Notes tracking personal metrics (personal records, body measurements, workout logs) may have zero or one outgoing link. But they're not orphaned — they're personal reference.

**Solution:** Add fitness-specific frontmatter:
```yaml
knowledge-type: personal-tracking
personal-record: true
```

The test: Is this note primarily for personal tracking? If yes, link count doesn't apply.

### 2. Form-Critical Notes

**Problem:** "Deadlift Form" might link to "Deadlift" and "Back Safety" — only 2. But form is critical for injury prevention.

**Analysis:** Form notes are safety-critical. They should have relaxed thresholds or explicit safety tagging.

**Solution:** Tag with `safety-critical: true` for form notes.

### 3. Equipment-Specific Notes

**Problem:** "Cable Machine Setup" might only link to the cable machine as equipment.

**Solution:** Equipment-specific notes can use `specialized: true` tag (already in Seed).

### 4. Progressive Overload Cycle Notes

**Problem:** "Mesocycle 1 - hypertrophy" links to the exercise program but has no second natural link. It's a time-bounded record.

**Solution:** Time-series notes (workout logs, cycle summaries) should use `temporal-record: true`frontmatter with relaxed link thresholds.

### 5. Anatomy-Dependent Form Notes

**Problem:** "Squat Form for Long Femurs" is specific to body proportions. It might only link to "Squat Form" and "Anatomy Variations."

**Solution:** Tag with `anatomy-specific: true` for notes targeting specific body proportions.

---

## Modified Test for Fitness

For fitness knowledge bases, the test becomes:

Run an orphan scan. Flag any note with fewer than 2 outgoing links that:
- Lacks `foundational: true` tag
- Lacks `specialized: true` tag  
- Lacks `personal-tracking: true`
- Lacks `temporal-record: true`
- Lacks `anatomy-specific: true`

Equipment-specific notes using `specialized: true` are already covered by existing Seed rule.

---

## Additional Frontmatter Requirements

```yaml
# For personal tracking
knowledge-type: personal-tracking
personal-record: true

# For progressive cycles
temporal-record: true
fitness-phase: hypertrophy|strength|peaking|deload

# For anatomy-specific form
anatomy-specific: true
body-proportion-type: long-torso|long-femurs|short-arms|etc

# For form safety
safety-critical: true
injury-risk: low|medium|high
```

---

## Conclusion

The 2+ Links Rule works for fitness with domain-specific frontmatter extensions:

| Note Type | Frontmatter | Link Minimum |
|----------|-------------|-------------|
| Foundational | `foundational: true` | 0 (exception) |
| Specialized (equipment) | `specialized: true` | 1 |
| Personal tracking | `personal-tracking: true` | 0 |
| Temporal record | `temporal-record: true` | 1 |
| Anatomy-specific form | `anatomy-specific: true` | 1 |
| Safety-critical form | `safety-critical: true` | 2 (strict - injury risk) |

The core insight holds: Orphaned notes are invisible. But fitness has legitimate single-context and personal-tracking note types that need relaxed thresholds.

---
See also:
- [[AI-Assisted Knowledge Management Seed]] (original rule with edge cases)
- [[Seed Stress Test - 2+ Links Rule Across Domains]] (cross-domain analysis)
- [[Frontier Exploration - Fitness and Exercise Knowledge Bases]]
- [[Seed Gap - Fitness Verification Timeline]]