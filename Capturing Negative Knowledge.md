---
tags:
  - frontier-exploration
  - knowledge-quality
  - anti-patterns
  - lessons-learned
confidence: emerging
lifecycle: evergreen
last-reviewed: 2026-03-09
---

# Capturing Negative Knowledge

> Knowledge about what doesn't work is as valuable as knowledge about what works. A knowledge base that only captures successes is incomplete.

## The Gap

The Seed focuses on:
- What to include (atomic notes)
- How to link (meaningful connections)
- How to process (capture → refine → integrate)
- How to evolve (lifecycle stages)

But it's silent on: **What about failures, mistakes, and anti-patterns?**

## Why Negative Knowledge Matters

1. **Prevents repeated mistakes** - The most expensive mistakes are the ones you make twice
2. **Builds judgment** - Knowing what doesn't work is crucial for decision-making
3. **Realistic picture** - A KB that only shows success is misleading
4. **Teaches through failure** - Often more memorable than success stories

## Forms of Negative Knowledge

| Type | Description | Example |
|------|-------------|---------|
| Anti-patterns | Things that seem like good ideas but aren't | "Add more links to improve the graph" (when links are decorative) |
| Failure modes | How things can go wrong | Note that breaks when source URL becomes 404 |
| Mistakes | Specific errors made | "I originally thought X but learned Y" |
| Dead ends | Paths explored that yielded nothing | "Tried organizing by date, abandoned - too rigid" |
| Warnings | Things to avoid | "Don't use this approach for beginners" |

## Integration with Seed Rules

Negative knowledge should still follow atomicity - one failure/anti-pattern per note.

Links in negative knowledge notes should:
- Link to the related positive knowledge (what TO do instead)
- Link to any sources that documented the failure
- Be tagged with `type: negative-knowledge` for filtering

## Test

Can you answer: What are 3 things you tried that didn't work in building this knowledge base? If not, the vault is missing negative knowledge.

## Related

- [[Anti-Patterns in Knowledge Management]] - Anti-patterns specific to KM methodology
- [[Note Lifecycle Management]] - When notes become obsolete (related to "dead" knowledge)
- [[Handling Contradictory Sources]] - Handling conflicting positive knowledge
- [[AI-Assisted Knowledge Management Seed]] - The rule that captures this principle
