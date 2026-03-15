---
last-reviewed: 2026-03-13
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - anti-pattern
  - quality
  - linking
---

# Anti-Pattern: Link Inflation

Linking everything to everything dilutes meaning and creates navigational noise.

## Problem

Excessive linking creates:
- Every note links to 10+ others
- Links without context ("see also")
- No meaningful connections

The graph becomes meaningless noise.

## Signs

- Notes have 10+ outgoing links
- Links use generic text like "see also"
- Links are added to meet quotas, not add value

## Solution

Follow [[Linking Principle|quality over quantity]].

- Each link must pass the "why follow?" test
- Prefer 2-3 meaningful links over 10 decorative ones
- Links should explain relationship, not just exist

## The Quality Test

For each link, can you explain in one sentence why the reader should follow it? If not, remove the link.

## Test Criteria (for AI Evaluation)

- [ ] Does each note have fewer than 10 outgoing links?
- [ ] Are links meaningful (pass the "why follow?" test)?
- [ ] Do links use descriptive text, not generic "see also"?
- [ ] Can you explain each link's purpose in one sentence?

## Related

- [[Linking Principle]]
- [[Graph Maintenance]]
- [[Anti-Patterns in Knowledge Management]]
