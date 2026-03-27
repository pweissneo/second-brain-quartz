---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - best-practice
  - anti-pattern
  - linking
  - quality
schema-version: "1.0"
---

# Link Quality: Best Practice and Anti-Pattern

> Links should be meaningful, not numerous. Every link should pass the "why follow?" test.

## The Principle

Link inflation occurs when notes link to everything that might be related, creating a dense but meaningless graph. Quality linking means connecting ideas only when you can explain why the reader should follow that link.

## Anti-Pattern: Link Inflation

**What it looks like:** Excessive linking creates:
- Every note links to 10+ others
- Links without context ("see also")
- No meaningful connections
- Links added to meet quotas, not add value

The graph becomes meaningless noise. Readers can't distinguish signal from clutter.

## Best Practice: Quality Over Quantity

**What it looks like:**
- Each link passes the "why follow?" test
- Prefer 2-3 meaningful links over 10 decorative ones
- Links explain their relationship, not just exist

## How to Apply

Before adding a link, ask yourself:
1. **Can I explain why in one sentence?** "This note explains why the concept matters" isn't enough — the connection should be specific and meaningful.
2. **Does this add genuine value?** Not just keyword matching, but actual conceptual support.
3. **Would I actually click this?** If you wouldn't follow it, don't add it.

## The Quality Test

For every link in your note, try writing a one-sentence explanation:
- "This connects to [[Topic]] because it provides a specific example of the principle."
- "See [[Method]] for the technique that implements this approach."

If you can't write an explainable sentence, remove the link.

**The rule of thumb:** Prefer 2-3 meaningful links over 10 decorative ones.

## Examples

**Link Inflation (Avoid):**
- Linking "recipe" to 15 different topics just because the word appears
- Adding links to every synonym or related term
- Creating "hub" notes that link to everything in the vault

**Quality Linking (Do):**
- Linking a concept to its primary example
- Connecting a principle to a specific application
- Linking troubleshooting steps to the relevant diagnostic guide

## Test Criteria (for AI Evaluation)

- [ ] Does each note have fewer than 10 outgoing links?
- [ ] Are links meaningful (pass the "why follow?" test)?
- [ ] Do links use descriptive text, not generic "see also"?
- [ ] Can you explain each link's purpose in one sentence?

## Related

- [[Wikilinks]] — Technical implementation
- [[Linking Principle]] — Foundational guidance
- [[Graph Maintenance]]
- [[Anti-Patterns in Knowledge Management]]
