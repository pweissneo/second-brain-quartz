---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: evergreen
confidence: high
verification-status: verified
author-type: ai-assisted
tags:
  - best-practice
  - anti-pattern
  - negative-knowledge
  - balance
schema-version: "1.0"
counterpart-antipattern: _Anti-Pattern - Missing Negative Knowledge (merged 2026-04-02)_
x-source-gaps: verified through redundancy scan
---

# Best Practice - Balanced Capture

> Capture what works AND what doesn't. Complete knowledge includes failures.

## The Anti-Pattern to Avoid

**Missing Negative Knowledge** — only capturing successes, not failures — creates an incomplete picture:

- No anti-patterns documented
- No lessons learned from mistakes
- No warnings about what doesn't work

The vault only shows one side of the story.

### Signs of Missing Negative Knowledge

- Every note describes what works
- No "don't do this" warnings
- Mistakes get deleted, not documented

If you see these signs, apply the balance principles below.

## The Principle

A complete knowledge base documents both what worked and what didn't — because failures often teach more than successes.

## What to Capture

**Positive knowledge (what worked):**
- Successful techniques and approaches
- Validated sources and methods
- Working solutions and recipes

**Negative knowledge (what didn't):**
- Failed experiments and why
- Approaches that didn't work for your context
- Common pitfalls and how to avoid them

## Types of Negative Knowledge

| Type | Description |
|------|-------------|
| Anti-patterns | Seem like good ideas but aren't |
| Failure modes | How things can go wrong |
| Mistakes | Specific errors made |
| Dead ends | Paths explored that yielded nothing |
| Warnings | Things to avoid |

## Why Negative Knowledge Matters

1. **Prevents repeat mistakes** — You remember what failed so you don't try it again
2. **Provides context** — Knowing what doesn't work clarifies what does
3. **Creates realistic expectations** — Others know what's realistic to attempt

## The Tests

**The Balance Test:** For every dedicated negative knowledge note, include a link to the positive alternative. Don't let the negative overwhelm the positive.

**Can you list:**
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

## The Balance Rule

For every "how to X" note, consider adding:
- A note about what doesn't work when trying X
- Context about when X doesn't apply

This makes your knowledge base complete, not just positive.

See [[Best Practice - Selective Capture]] for how to apply the diminishing returns test to ensure every capture is worth maintaining.

## Test Criteria (for AI Evaluation)

- [ ] Does the vault contain anti-pattern notes?
- [ ] Are failure modes and warnings documented?
- [ ] Is negative knowledge linked to positive alternatives?
- [ ] Can you find at least 3 examples of documented failures or mistakes?

## Related

- [[Anti-Patterns in Knowledge Management]]
- [[Frontier Exploration - Personal Experimentation Results]]
- [[Note Lifecycle Management]]
- [[Seed Stress Test - Confidence Markers Rule Across Domains]] — for signaling reliability of negative knowledge
- [[Handling Contradictory Sources]] — when negative knowledge conflicts with positive
- [[Frontier Exploration - Knowledge Maintenance]] — accumulated gaps in knowledge quality
- [[AI-Assisted Knowledge Management Seed]]

---

**Note (2026-04-02):** Content from Anti-Pattern - Missing Negative Knowledge has been merged here. The anti-pattern note has been deprecated with a redirect. See [[Seed Gap - Anti-Pattern Best Practice Merge Criteria]] for merge criteria.