---
tags:
  - frontier
  - capture
  - time-constrained
level: exploration
---

# Frontier Exploration - Time-Constrained Knowledge Capture

When an agent has limited time to capture knowledge, how should it prioritize what to capture first?

## The Problem

AI agents often operate under time constraints in production environments. Current Seed rules assume adequate time for processing and reviewing notes. However, in real-world usage, agents may have only minutes or seconds to capture knowledge before moving to the next task.

## Questions the Seed Doesn't Answer

1. When time is limited, what knowledge takes priority?
2. Should the agent capture less, but better? Or capture more, with lower quality?
3. How do we handle partial captures that will be completed later?
4. What is the minimum viable capture for different knowledge types?

## Initial Hypothesis

A potential rule: **When time-constrained, capture at least one link and one source, even if summary is incomplete.** This ensures basic connectivity and provenance even for quick captures.

Alternatively, time-budget as a frontmatter field: `time-budget: 5m|15m|30m|1h+`

## See Also

- [[Frontier Exploration - Anticipatory Knowledge Capture]] - related but about future needs, not current constraints
- [[Best Practice - Progress Over Perfection]] - quality vs completeness tradeoff

## Test

Pick a random note. Ask: If you had only 5 minutes to capture this insight, what would you capture?