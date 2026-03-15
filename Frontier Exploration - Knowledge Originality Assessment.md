---
last-reviewed: 2026-03-12
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-type
  - originality
  - value
level: principle
---

# Frontier Exploration - Knowledge Originality Assessment

> How do we distinguish between general knowledge (facts anyone can find) vs. personal knowledge (unique insights, experiences, decisions)?

## The Problem

When building a knowledge base, there's a subtle but important distinction that the Seed doesn't address:

- **General knowledge**: Facts, definitions, widely available information. Can be looked up in seconds. Value = reference.
- **Personal knowledge**: Insights, experiences, decisions, lessons learned. Cannot be found elsewhere. Value = competitive advantage.

A common anti-pattern: vaults fill with general knowledge (the AI can Google that) while personal insights remain uncaptured.

## Why It Matters

The "second brain" concept isn't about storing facts — it's about capturing thinking that wouldn't exist otherwise.

A vault of general knowledge:
- Provides no edge over a web search
- Takes time to maintain but offers little unique value
- Becomes outdated quickly (facts change)

A vault with personal knowledge:
- Contains insights that don't exist anywhere else
- Captures hard-won lessons and decisions
- Grows more valuable over time as patterns emerge

## The Rule Gap

The Seed has no rule for:

> **Rule:** Capture personal knowledge (insights, decisions, experiences) at 5x the rate of general knowledge.
> **Why:** Personal knowledge compounds; general knowledge doesn't.
> **Test:** Of your last 20 notes, how many contain original insight vs. restated facts?

> **Rule:** Before adding a general knowledge note, ask: "Could I look this up in 30 seconds?"
> **Why:** General knowledge should exist as-needed, not stored preemptively.
> **Test:** Can you delete this note and reconstruct it from web sources in under a minute?

## Identifying Personal Knowledge

Personal knowledge takes many forms:

| Type | Example | Why It's Valuable |
|------|---------|-------------------|
| Decision logs | "Why I chose X over Y" | Captures reasoning |
| Lesson learned | "What I wish I'd known" | Prevents repeated mistakes |
| Experience notes | "What happened when..." | Builds pattern recognition |
| Opinion/stance | "I believe X because..." | Articulates mental models |
| Connection insights | "X relates to Y in way..." | Unique synthesis |
| Failure analysis | "What went wrong and why" | Prevents recurrence |

## The Originality Test

For any note, ask:

1. **Could someone else write this?** 
   - Facts: Yes, anyone can.
   - Personal: Only you can (your specific context).

2. **Would a web search return this?**
   - Facts: Yes, immediately.
   - Personal: No, it's your unique insight.

3. **Does this contain a decision or conclusion?**
   - Facts: Present information.
   - Personal: Show thinking that led to understanding.

## Practical Implementation

### Metadata for Originality

```yaml
---
knowledge-type: general | personal | hybrid
originality: high | medium | low
---

- general: Information available in standard sources
- personal: Unique insights, experiences, decisions
- hybrid: General facts + personal analysis/insight
```

### Capture Ratio

Track the ratio of personal to general knowledge:
- Target: 5:1 (5 personal notes per general note)
- If ratio inverted: vault is just a worse search engine

### When General Knowledge IS Appropriate

General knowledge belongs when:
- It saves frequent lookups (commonly used reference)
- It's domain-specific enough to be hard to find
- It's synthesized/combined with personal insight
- It's transformed into actionable steps

### Note Templates by Type

**General knowledge (minimal):**
```markdown
# [Topic]

> Key fact or definition

- Source: [link]
- Last verified: [date]
```

**Personal knowledge (expanded):**
```markdown
# My Insight on [Topic]

## Context
What situation prompted this?

## What I Learned
The insight or lesson

## Why It Matters
How this changes my thinking/action

## Related Decisions
What choices does this inform?
```

## Relationship to Seed

This extends the Foundation section:

- Current: "Define explicit vault boundaries — categorize what you keep..."
- Missing: Explicit guidance on personal vs. general knowledge ratio

Also relates to:
- Self-Improvement Cycle: Personal knowledge enables pattern recognition
- Knowledge Debt: General knowledge can become debt if not maintained

## Testing

1. **Originality audit**: Pick 10 random notes. For each, could a web search replace it?
2. **Capture ratio**: What's your personal-to-general ratio? Target 5:1
3. **Value assessment**: If you deleted your vault today, what would you lose that you couldn't rebuild from the web?

## Questions for Seed Update

1. Should the Seed include a rule about personal vs. general knowledge ratio?
2. What metadata should capture knowledge type?
3. How do we handle hybrid notes (general facts + personal analysis)?

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[The Knowledge Creator]]
- [[Self-Improvement Cycle]]
- [[Frontier Exploration - Knowledge Debt]]
- [[Note Types and Templates]]
