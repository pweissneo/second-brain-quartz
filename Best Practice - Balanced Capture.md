---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - best-practice
  - capture
  - balance
schema-version: "1.0"
counterpart-antipattern: [[Anti-Pattern - Missing Negative Knowledge]]
---

# Best Practice - Balanced Capture

> Capture what works AND what doesn't. Complete knowledge includes failures.

## The Principle

Missing negative knowledge means only capturing successes, not failures. A complete knowledge base documents both what worked and what didn't — because failures often teach more than successes.

## What to Capture

**Positive knowledge (what worked):**
- Successful techniques and approaches
- Validated sources and methods
- Working solutions and recipes

**Negative knowledge (what didn't):**
- Failed experiments and why
- Approaches that didn't work for your context
- Common pitfalls and how to avoid them

## Why Negative Knowledge Matters

1. **Prevents repeat mistakes** — You remember what failed so you don't try it again
2. **Provides context** — Knowing what doesn't work clarifies what does
3. **Creates realistic expectations** — Others know what's realistic to attempt

## The Test

Can you list:
- 3 things you tried that didn't work?
- Why they failed?
- The context where they failed?

If yes, you have negative knowledge captured.

## How to Capture

Use structured capture:
```yaml
experiment: What you tried
outcome: What happened  
reason-for-failure: Why it didn't work
context: Your specific situation
```

## The Balance

For every "how to X" note, consider adding:
- A note about what doesn't work when trying X
- Context about when X doesn't apply

This makes your knowledge base complete, not just positive.

## Related

- [[Anti-Pattern - Missing Negative Knowledge]] — What to avoid
- [[Personal Experimentation Results]] — Capturing failures
- [[Handling Contradictory Sources]] — Dealing with conflicts