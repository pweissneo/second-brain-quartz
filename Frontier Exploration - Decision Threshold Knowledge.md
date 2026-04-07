---
last-reviewed: 2026-03-18
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
access-pattern: decision
tags:
  - frontier-exploration
  - decision-making
  - reasoning-strategies
  - knowledge-representation
related-notes:
  - "[[Seed Stress Test - Reasoning Strategies Rules]]"
  - "[[Frontier Exploration - Vault-Process Meta-Knowledge]]"
  - "[[Frontier Exploration Hub]]"
---

# Frontier Exploration - Decision Threshold Knowledge

> How do you capture knowledge about when to stop gathering information and make a decision?

## The Problem

The Seed covers:
- Prioritization (what to work on first)
- Completion criteria (when domain is "done")
- Deadline knowledge (time-bound decisions)
- Verification workflows (when knowledge is "ready")

But it lacks guidance for: **When do you have enough information to make a decision vs. when should you keep gathering data?**

This is distinct from all the above:
- Not about what to prioritize (that's priority order)
- Not about when the domain is complete (that's coverage completion)  
- Not about external deadlines (that's temporal)
- Not about knowledge verification (that's truth assessment)

This is about **decision threshold** - the point where additional information provides diminishing returns relative to the cost of waiting.

## Why It Matters

In domains like:
- **Medical diagnosis**: When is "one more test" not worth the delay?
- **Investment decisions**: When does more research become analysis paralysis?
- **Engineering decisions**: When is "good enough" better than "perfect"?
- **Project management**: When do you ship vs. keep refining?

The answer is rarely "never stop gathering" or "gather for a fixed time" - it's domain and context dependent.

## The Challenge

Decision thresholds depend on:
1. **Stakes** - High-stakes decisions warrant more research
2. **Reversibility** - Easy-to-reverse decisions warrant speed
3. **Information decay** - In fast-moving domains, waiting loses value
4. **Cost of waiting** - Time has opportunity cost
5. **Confidence calibration** - People are notoriously bad at judging their own uncertainty

## Proposed Rules

### Decision Threshold Frontmatter

**Rule:** For notes containing decision content, include explicit `decision-horizon:` frontmatter specifying how time-sensitive the decision is.

```yaml
decision-horizon: immediate    # Act now, waiting loses value
decision-horizon: flexible    # Time-bound but flexible  
decision-horizon: open        # No time pressure
decision-threshold: 3-confirmations  # Need X confirmations before deciding
```

### Reversibility Tagging

**Rule:** For decision notes, include `reversibility:` field to help prioritize speed vs. caution.

```yaml
reversibility: easy      # Can easily change course
reversibility: hard      # Significant cost to reverse
reversibility: one-shot  # Cannot reverse
```

### Threshold Evidence Requirements

**Rule:** For high-stakes decisions, document what evidence would be sufficient to decide.

**Why:** Without explicit thresholds, you keep gathering information indefinitely.

**Test:** Can you state: "If I find X, I'll decide Y"? Can you articulate what would change your mind?

### Cost of Waiting Documentation

**Rule:** For time-sensitive decisions, include explicit `waiting-cost:` frontmatter.

**Why:** The cost of waiting changes the optimal threshold.

```yaml
waiting-cost: low     # Little changes by waiting
waiting-cost: medium # Some value decay
waiting-cost: high   # Rapidly changing situation
waiting-cost: time-critical  # Every hour matters
```

## Related Seed Rules

- [[Seed Stress Test - Reasoning Strategies Rules]] - query decomposition
- [[Knowledge Base Utility Assessment]] - usefulness metrics

## Test Criteria

- [ ] Can you identify decisions with explicit thresholds?
- [ ] Do high-stakes decisions document reversibility?
- [ ] Is there guidance on when to stop gathering and decide?
- [ ] Can you calculate waiting cost for time-sensitive decisions?

---

**Note:** This is frontier exploration. The rules proposed here may not be fully mature.