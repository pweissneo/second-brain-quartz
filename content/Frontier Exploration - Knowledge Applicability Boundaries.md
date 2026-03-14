---
last-reviewed: 2026-03-13
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - applicability
  - boundaries
  - edge-cases
  - limitations
---

# Frontier Exploration - Knowledge Applicability Boundaries

> Capturing when knowledge doesn't apply — the inverse of scope tags

## The Problem

The Seed covers:
- Scope tags (`jurisdiction:`, `hardiness-zone:`, `expertise-level:`) — when knowledge APPLIES
- Trade-off knowledge — choosing between options
- Contradictory sources — handling disagreements

But there's a gap: **explicit documentation of when knowledge DOESN'T apply** — applicability boundaries, edge cases, and known limitations that aren't just "it's wrong" but "it's right but not here."

## Why This Matters

1. **Preventing misapplication**: Knowledge that's correct in one context can cause harm in another. Explicit boundaries prevent this.

2. **Building trust**: A knowledge base that honestly admits its limitations is more trustworthy than one that implies universal applicability.

3. **Saving time**: Readers (and AIs) shouldn't try approaches that are known to fail for their situation.

4. **Advancing understanding**: Documenting why knowledge doesn't apply often reveals deeper insights than documenting what works.

## What Makes This Different From Existing Rules

| Concept | What's Covered | What's Missing |
|---------|---------------|----------------|
| Scope tags | What jurisdictions/zones apply | What explicitly doesn't apply |
| Negative knowledge | What doesn't work (universal) | What doesn't work for THIS context |
| Trade-offs | Choosing between options | Knowing when NO option applies |
| Confidence markers | How certain we are | Where certainty breaks down |

## Types of Applicability Boundaries

### 1. Contextual Boundaries

Knowledge that works in one context but not another:
- "This pruning technique works for fruit trees, not ornamental"
- "This teaching method works for beginners, not advanced learners"
- "This financial advice applies to employees, not business owners"

### 2. Boundary Conditions

Knowledge that's correct at certain scales or thresholds:
- "Newtonian physics works at everyday speeds, not at relativistic speeds"
- "Linear regression works when relationships are linear, not for curved data"
- "This recipe serves 4, not scalable below 2 servings"

### 3. Precondition Boundaries

Knowledge that requires specific conditions:
- "This solution works only when you have X equipment"
- "This approach requires Y amount of time"
- "This advice applies only if you have Z background"

### 4. Temporal Boundaries

Knowledge that was correct but conditions changed:
- "This worked in 2020 market conditions, not in 2024"
- "Pre-pandemic travel advice no longer applies"
- "This tool was free, now it's subscription-only"

### 5. Combinatorial Boundaries

Knowledge that fails when combined with other things:
- "X and Y both work separately, but not together"
- "This medication interacts with these other drugs"
- "These two frameworks conflict when used simultaneously"

## Proposed Structure

```yaml
---
applicability:
  applies-to: [list of contexts where this works]
  does-not-apply-to: [list of known non-applicable contexts]
  boundary-conditions:
    - condition: "What must be true"
      threshold: "At what point it breaks"
  preconditions:
    required: [what's needed]
    incompatible: [what conflicts]
---
```

## Example Note

### Pruning Fruit Trees

**What works:** Summer pruning for fruit trees to control growth and encourage fruiting.

**Does NOT apply to:**
- Ornamental trees (different goals)
- Late summer pruning (stimulates growth, not fruit)
- Diseased trees (requires different approach)

**Boundary conditions:**
- Temperature: above 50°F (growth must be active)
- Tree age: works on mature trees, not on young saplings

**Preconditions:**
- Requires: clean, sharp pruners
- Incompatible with: heavy杖 pruning in same season

## Edge Cases to Consider

1. **Unknown boundaries**: Sometimes you know something works but don't know why it doesn't work elsewhere. Document the gap.

2. **Boundaries that shift**: Some boundaries are stable (jurisdiction), others shift (technology). Mark accordingly.

3. **False boundaries**: Sometimes we think something doesn't apply but it actually does. Document when boundaries are uncertain vs. established.

4. **Boundary interactions**: Multiple boundaries can interact. "This works in zone 7 AND in summer" — both must be true.

## The Inverse Test

For any absolute statement (always/never/every/none), ask:
- "Always? Under what conditions?"
- "Never? In what contexts?"
- "What would make this false?"

If you can't answer, the boundary may be undocumented.

## Gap Analysis: Where would an AI get stuck?

An AI building a knowledge base on gardening using only current Seed rules would:
- ✓ Create notes on planting, watering, pruning
- ✓ Tag with hardiness zones
- ✓ Note trade-offs between methods

But would NOT capture:
- "This doesn't work with clay soil" (unless explicitly documented)
- "This variety is only for cooking, not eating raw" 
- "Don't combine this with that fertilizer"
- "This technique fails above 90% humidity"

## Related Notes

- [[Frontier Exploration - User Situational Constraints]] — Similar but focuses on user situation, not knowledge applicability
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — Related to jurisdiction/context
- [[Frontier Exploration - Trade-off Knowledge Capture]] — When multiple options exist
- [[Anti-Patterns in Knowledge Management]] — Universal failures (different from contextual non-applicability)
