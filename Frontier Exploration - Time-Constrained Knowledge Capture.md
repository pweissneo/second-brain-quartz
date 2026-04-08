---
last-reviewed: 2026-04-07
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - frontier-exploration
  - capture-priority
  - time-constraints
  - agent-behavior
---

# Frontier Exploration - Time-Constrained Knowledge Capture

> How AI agents should prioritize knowledge capture when operating under time constraints

## The Problem

AI agents often operate under time constraints in production environments. Current Seed rules assume adequate time for processing and reviewing notes. However, in real-world usage, agents may have only minutes or seconds to capture knowledge before moving to the next task.

The Seed lacks guidance for **time-budgeted knowledge capture** - how to produce maximum value under time pressure.

## Questions the Seed Doesn't Answer

1. When time is limited, what knowledge takes priority?
2. Should the agent capture less, but better? Or capture more, with lower quality?
3. How do we handle partial captures that will be completed later?
4. What is the minimum viable capture for different knowledge types?

## Initial Hypothesis

### Proposed Rule: Minimum Viable Capture

**Rule (PROPOSED):** When time-constrained, ensure every capture includes at minimum:
1. **One wikilink** - establishes connectivity in the graph
2. **One source or provenance** - establishes credibility
3. **A clear question or summary** - even if brief

These three elements ensure the capture is useful even if never completed. Everything else can be added later.

**Why:** Without connectivity and provenance, partial captures become orphans that are hard to complete later. With these baseline elements, even quick captures contribute to the graph structure.

**Test:** Can you complete this capture later with just the question/summary? Is there at least one incoming link from the note you referenced? Is there a source URL or author mentioned?

### Proposed Rule: Time-Budget Frontmatter

**Rule (PROPOSED):** For captures made under time pressure, include explicit `capture-budget:` frontmatter:

```yaml
capture-budget: 1m     # Quick capture (<2 minutes)
capture-budget: 5m     # Standard capture  
capture-budget: 15m    # Extended capture
capture-budget: 30m+   # Full processing
```

**Test:** Did you specify time budget in frontmatter? Does the capture quality match the stated budget?

### Proposed Rule: Completion Tracking

**Rule (PROPOSED):** Partial captures should be marked with `lifecycle: incomplete` for easy identification:

```yaml
lifecycle: incomplete
completion-priority: high|medium|low
estimated-completion: 5m|15m|30m|1h+
```

**Test:** Are incomplete notes identifiable via lifecycle? Is there a clear completion path?

## Why This Matters

Without time-constrained capture rules:
- Agents either capture nothing (perfectionism) or capture noise (quantity over quality)
- Quick captures become unfindable orphans
- The graph loses connectivity from partial captures

With time-budgeted capture:
- Agents can contribute under any time constraint
- Partial captures remain findable and completable
- The graph grows more robustly

## Related Seed Rules

- [[Seed Gap - Capture Method Optimization]]
- [[Best Practice - Progress Over Perfection]] - quality vs completeness tradeoff
- [[Frontier Exploration - Anticipatory Knowledge Capture]] - related but about future needs

## Test Criteria

- [ ] Can you identify notes made under time constraints (capture-budget frontmatter)?
- [ ] Do time-constrained notes have at least one link and one source?
- [ ] Are incomplete notes identifiable (lifecycle: incomplete)?
- [ ] Can you complete a 1m capture in under 5m?

---

**Note:** This is frontier exploration. The rules proposed here are hypotheses that need stress testing across domains.