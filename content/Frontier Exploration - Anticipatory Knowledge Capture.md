---
last-reviewed: 2026-03-27
last-updated: 2026-03-27
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - frontier-exploration
  - knowledge-anticipation
  - conditional-knowledge
  - pre-capture
---

# Frontier Exploration - Anticipatory Knowledge Capture

## The Problem Space

The Seed covers several knowledge types: factual, procedural, conceptual, contextual, and experiential. But there's a gap around knowledge captured in anticipation of future need — knowledge where the use case hasn't occurred yet.

### What's Different About Anticipatory Knowledge

- **Utility is hypothetical** — you can't verify utility until the anticipated situation arises
- **Confidence is difficult to assess** — without execution, you don't know if the knowledge is accurate
- **Timestamps matter** — when you captured it matters; stale anticipations may no longer apply
- **Priority is speculative** — importance is estimated based on predicted frequency/impact

### Examples

- First aid knowledge captured before starting a backpacking trip
- Contract templates captured before a negotiation
- Troubleshooting steps captured before a potential system failure
- Language phrases captured before traveling to a country
- Recipe techniques captured before attempting a complex dish

### Why It Matters for AI Knowledge Bases

AI agents are asked to anticipate user needs. Without rules for anticipatory capture:
1. Agents may capture too much speculative knowledge (inflation)
2. Agents may fail to capture knowledge that would be high-value if anticipated correctly
3. Stale anticipations remain in the vault without clear cleanup rules

## Current Seed Coverage

The Seed covers:
- Context-dependent knowledge (line ~2500): Knowledge that applies only under specific conditions
- Conditional knowledge (line ~2800): Trigger-based activation of knowledge
- Forward references: Planned knowledge not yet captured

But it doesn't explicitly address:
- When to capture knowledge speculatively vs. waiting for actual need
- How to tag anticipatory knowledge with predicted utility
- When to review/revalidate anticipations that haven't been used
- How to weight anticipated needs against confirmed current needs

## Proposed Seed Rule

**Rule:** For knowledge captured in anticipation of future need, use explicit anticipation metadata — tag with anticipated-context, expected-utility-timeline, and revalidation-deadline.

**Why:** Without anticipation tagging, speculative captures look identical to confirmed-need captures. This creates false confidence signals — a note with `verification-status: verified` might actually be untested speculation. Anticipation metadata allows appropriate confidence calibration and periodic revalidation.

**Test:** For recently captured notes: (1) Was this captured in response to a confirmed need or anticipated future need? (2) If anticipated, does it have anticipation metadata? (3) Has the anticipated context occurred yet? (4) Should revalidation occur?

**Implementation:**
```yaml
capture-type: confirmed|anticipated
anticipated-context: "The situation where this knowledge will be needed"
expected-timeline: near-term|medium-term|long-term|unknown
revalidation-deadline: 2026-06-01  # When to re-evaluate this anticipation
last-evaluated: 2026-03-27
times-anticipated-used: 0  # How many times the anticipated situation occurred
```

**Capture decision guidance:**
- Confirmed need: Capture immediately, standard verification applies
- Anticipated need (high confidence): Capture with anticipation metadata, lower initial confidence
- Anticipated need (low confidence): Note as forward reference, capture when confidence increases

**Revalidation triggers:**
- Timeline deadline reached
- Anticipated context occurs and knowledge is retrieved (update last-evaluated)
- New information changes the anticipated scenario

## Related Notes

- [[Frontier Exploration - Conditional-Triggered Knowledge]] — different angle on trigger-based knowledge
- [[Forward References and Planned Knowledge]] — planned capture without anticipated need
- [[Frontier Exploration - Context-Gated Knowledge]] — context-dependent activation
- [[Seed Gap - Knowledge with Inherent Expiration Windows]] — temporal limits on knowledge

## Edge Cases

**Edge case:** Some knowledge is captured speculatively because the alternative (waiting until needed) has high cost. Pre-trip first aid is better captured before you need it. Apply modified rule: If the cost of NOT capturing outweighs the cost of capturing untested knowledge, use anticipation metadata but prioritize revalidation.

**Edge case:** Anticipations can become self-fulfilling. Capturing "questions to ask the lawyer" increases the probability you'll consult a lawyer. This creates a feedback loop. Track whether the anticipation was external (prediction) or internal (planning).

**Edge case:** Anticipations can become obsolete without ever being used. A contract template captured for a negotiation that never happened. Set revalidation deadlines to prevent stale anticipations accumulating.

## Test for Closure

- [ ] Seed has explicit rule for anticipatory knowledge capture
- [ ] Anticipation metadata fields are documented (capture-type, expected-timeline, revalidation-deadline)
- [ ] Guidance exists for when to capture speculatively vs. wait
- [ ] Revalidation triggers are defined
- [ ] Related notes link to the Seed rule