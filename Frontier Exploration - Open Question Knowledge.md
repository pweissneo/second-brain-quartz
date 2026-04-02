---
lifecycle: evergreen
confidence: emerging
level: frontier
last-reviewed: 2026-03-18
last-updated: 2026-03-18
author-type: ai-assisted
verification-status: unverified
schema-version: "1.0"
tags:
  - frontier-exploration
  - open-question
  - uncertainty
  - knowledge-management
---

# Frontier Exploration - Open Question Knowledge

> How should a knowledge base handle genuine uncertainty — questions where the answer is unknown, not just unverified?

## The Problem

The Seed covers:
- **Unverified knowledge** — captured but not yet tested
- **Staging states** — whisper, draft, probe notes
- **Confidence levels** — high, medium, low, emerging
- **Contradictory sources** — when two credible sources disagree

But there's a gap: **open questions** — genuine unknowns where there's no answer yet, not just an untested answer.

Examples:
- "What causes X?" — research question without consensus
- "Which approach works better?" — A/B question without data
- "Is this even possible?" — fundamental uncertainty
- "What would happen if...?" — speculative scenarios

This is fundamentally different from:
- **Unverified knowledge** — answer exists, just not confirmed
- **Contradictory sources** — multiple answers, at least some are correct
- **Stub/planned** — note you'll write later

## Why It Matters

Knowledge bases tend to capture what's known. But:

1. **Unanswered questions have value** — they represent research directions, decision points, and genuine gaps
2. **They prevent redundant effort** — if you've already wondered something, future-you shouldn't wonder again
3. **They enable systematic exploration** — structured unknowns become research agendas
4. **They distinguish ignorance from uncertainty** — knowing what you don't know is meta-knowledge

## The Test

For open question knowledge:
1. Is there a genuine absence of answer, not just unconfirmed presence?
2. Is the question specific enough to guide future investigation?
3. Would documenting this prevent future redundant thinking?

## Proposed Handling

```yaml
knowledge-type: open-question
question-state: active|stalled|abandoned
question-type: empirical|philosophical|practical
research-status: unexplored|preliminary|in-progress
expected-answer-form: boolean|quantitative|qualitative
```

**Active** — genuinely being investigated
**Stalled** — important but not currently pursuing  
**Abandoned** — no longer relevant or worth pursuing

## Link Strategy

Open questions should link to:
- Related known knowledge (what this builds on)
- Potential answer sources (where to look)
- Similar questions (question clusters)

They should NOT link to "answers" that don't exist yet.

## Distinction from Other States

| State | What's Unknown? | Example |
|-------|-----------------|---------|
| Unverified | Answer exists, not confirmed | "Recipe: try it" |
| Probe | Hypothesis, testing needed | "Maybe X works?" |
| Open Question | No answer exists | "What causes Y?" |
| Contradiction | Multiple answers exist | "A says X, B says not-X" |

## When to Capture

Capture as open question when:
- You've spent >30 min researching with no resolution
- The question is specific enough to investigate
- The answer would change your decisions/actions
- You've asked experts who don't know

Don't capture as open question when:
- Answer is a quick search away
- Question is too vague to investigate
- It's idle curiosity without action implications

## Seed Rule Proposal

**Rule:** Track open questions as distinct from unverified or contradictory knowledge — use `knowledge-type: open-question` with explicit question-state.

**Why:** Without explicit open-question handling, genuine uncertainties get conflated with unverified claims or forgotten entirely. Open questions represent research opportunities that deserve systematic tracking.

**Test:** For knowledge domains with genuine unknowns: (1) Is there a `knowledge-type: open-question` tag? (2) Are questions categorized by state (active/stalled/abandoned)? (3) Do open questions link to related knowns and potential sources? (4) Is there a process for updating when answers emerge?

## Related

- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] — where much knowledge starts as open questions
- [[Frontier Exploration - Vault-Process Meta-Knowledge]] — tracking what you don't know about your own vault
- [[Stress Test - Probabilistic Knowledge Rule Across Domains]] — confidence with genuine uncertainty
