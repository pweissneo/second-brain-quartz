---
last-reviewed: 2026-03-15
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - heuristics
  - expertise
  - mental-shortcuts
---

# Frontier Exploration - Expert Heuristics and Rules of Thumb

> How should a knowledge base capture the informal decision-making shortcuts that experts use?

## The Gap

The Seed covers:
- Formal principles and frameworks
- Procedural knowledge (step-by-step)
- Conceptual knowledge (theories and definitions)
- Anti-patterns (what NOT to do)

But it lacks guidance on capturing **expert heuristics** - the informal, often unspoken rules that experts use to make fast decisions. These are neither formal principles nor anti-patterns; they're efficient mental shortcuts that work *most of the time*.

## What Are Expert Heuristics?

Heuristics are "rules of thumb" that experts develop through experience:

### Examples by Domain

**Cooking:**
- "If the sauce looks broken, keep whisking and it will come together"
- "Season throughout, not just at the end"
- "Hot pan, cold oil" for sautéing

**Programming:**
- "If you're copy-pasting code, you're doing it wrong"
- "First make it work, then make it fast"
- "Three strikes and you refactor"

**Writing:**
- "If you can't explain it simply, you don't understand it"
- "Cut 10% of every first draft"
- "Start in the middle of the action"

**Medicine:**
- "When you hear hoofbeats, think horses not zebras"
- "Common things are common"

### What Makes Heuristics Different from Principles?

| Formal Principles | Expert Heuristics |
|------------------|-------------------|
| Universally true | Usually true, sometimes wrong |
| Can be proven | Based on experience |
| Precise boundaries | Fuzzy applicability |
| Formal language | Colloquial, memorable |
| Explainable why | Often intuition-based |

## Why Heuristics Matter

1. **High utility** - Heuristics provide immediate value in decision-making
2. **Experience-locked** - They take years to develop and can't be learned from books alone
3. **Transferable** - Good heuristics can transfer across domains
4. **Action-oriented** - Unlike theories, heuristics tell you what to DO

## Where AI Agents Get Stuck

When building a knowledge base using only current Seed rules:

1. Heuristics look like opinions, not facts - do they belong in the vault?
2. Heuristics often lack sources - they're "things I've learned" not "things I read"
3. Heuristics can be wrong - how to mark confidence?
4. Heuristics are often context-dependent - when does the heuristic apply?
5. Heuristics can contradict each other - which one wins?

## Proposed Metadata Schema

```yaml
heuristic:
  origin: "How I learned this (experiment, mentor, failure)"
  applicability: "When does this apply?"
  limitations: "When does this NOT apply?"
  confidence: "How certain am I this is good advice?"
  test-cases: "Specific examples where this worked/failed"
```

## Seed Rule Proposal

**Rule:** Capture expert heuristics separately from formal principles. Tag with `knowledge-type: heuristic` and include `origin:`, `applicability:`, and `limitations:` fields.
**Why:** Heuristics are high-value but high-risk. They work because of context that must be preserved. Without origin and limitations, future users may apply heuristics inappropriately.
**Test:** For each heuristic: (1) Can you trace where it came from? (2) Can you describe when it DOESN'T apply? (3) Do you have a specific case where it failed?

## Test Case

Can you find 5 heuristics you've developed in a domain? For each:
- Origin (how did you learn this?)
- When to apply it
- When NOT to apply it
- A specific case where it was wrong

## Related Notes

- [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]] - thinking strategies
- [[Anti-Pattern - Missing Negative Knowledge]] - capturing failures
- [[Frontier Exploration - Personal Experimentation Results]] - learning from experience
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] - expertise-level context
- [[Confidence Markers]] - uncertainty signaling
