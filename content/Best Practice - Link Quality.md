---
last-updated: 2026-03-28
lifecycle: evergreen
confidence: high
verification-status: verified
author-type: ai-assisted
tags:
  - best-practice
  - anti-pattern
  - linking
  - quality
schema-version: "1.0"
counterpart-antipattern: [[Anti-Pattern - Link Inflation]]
---

# Best Practice - Link Quality

> Links should be meaningful, not numerous. Every link should pass the "why follow?" test.

## The Anti-Pattern to Avoid

**Link Inflation** — linking everything to everything — dilutes meaning and creates navigational noise. When every note links to 10+ others with generic "see also" text, the graph becomes meaningless noise.

**Signs of Link Inflation:**
- Notes have 10+ outgoing links
- Links use generic text like "see also"
- Links are added to meet quotas, not add value

If you see these signs, your vault has a link inflation problem. Apply the quality principles below to fix it.

## The Principle

Quality linking means connecting ideas only when you can explain why the reader should follow that link. Prefer 2-3 meaningful links over 10 decorative ones.

## What to Do

- Each link passes the "why follow?" test
- Links explain their relationship, not just exist
- Use descriptive link text, not generic "see also"

## How to Apply

Before adding a link, ask yourself:
1. **Can I explain why in one sentence?** The connection should be specific and meaningful.
2. **Does this add genuine value?** Not just keyword matching, but actual conceptual support.
3. **Would I actually click this?** If you wouldn't follow it, don't add it.

## The Quality Test

For every link in your note, try writing a one-sentence explanation:
- "This connects to [[Topic]] because it provides a specific example of the principle."
- "See [[Method]] for the technique that implements this approach."

If you can't write an explainable sentence, remove the link.

**The rule of thumb:** Prefer 2-3 meaningful links over 10 decorative ones.

## Test Criteria (for AI Evaluation)

- [ ] Does each note have fewer than 10 outgoing links?
- [ ] Are links meaningful (pass the "why follow?" test)?
- [ ] Do links use descriptive text, not generic "see also"?
- [ ] Can you explain each link's purpose in one sentence?

## Related

- [[Anti-Pattern - Link Inflation]] — What to avoid (excessive linking)
- [[Wikilinks]] — Technical implementation
- [[Linking Principle]] — Foundational guidance
- [[Graph Maintenance]]
