---
last-reviewed: 2026-03-13
tags:
  - forward-reference
  - planned
  - stub
  - workflow
confidence: emerging
lifecycle: evergreen
level: principle
author-type: ai
---

# Forward References and Planned Knowledge

When building a knowledge base, you often need to reference concepts that don't exist yet — future topics, planned projects, or ideas you'll develop later. The Seed has no guidance on how to handle these forward references.

## The Problem

You write a note referencing a concept you haven't created yet:

```
This approach requires understanding "Advanced Regex Patterns"
but we'll cover that in a future note.
```

Options: create a stub, use TODO markup, omit the link, or accept a broken link.

Forward references differ from broken links: they're intentional design (known future work), not mistakes. Treating them the same loses planning information.

## Rule

**Use stub notes with explicit `status: planned` for known future topics.** This extends the Seed's stub note convention (`status: stub` or `todo: true`) to handle planned future notes specifically. Don't leave dangling wikilinks that appear broken.

This aligns with Seed rule for stub notes: notes under 50 words must be marked with `status: stub` or `todo: true` to signal intentional incompleteness.

### When to create a stub:
- You know the topic will exist (planned project, identified gap)
- Multiple notes reference it
- It has a clear purpose you can describe

### When to skip:
- You're unsure if the topic will ever exist
- It's a vague concept, not a defined topic
- The reference is speculative ("maybe we'll cover X")

## Implementation

```markdown
---
status: planned
planned-for: Q2 2026
---

# Advanced Regex Patterns

> Planned: Pattern matching techniques beyond basic regex
```

## Testing

1. Can you identify 3 forward references in your vault?
2. Do they have planned stub notes?
3. Are the stub notes still relevant (not abandoned)?

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core rules including stub note requirements
- [[Atomic Note Principle]]
- [[Note Lifecycle Management]]
- [[Graph Traversal Efficiency]]
- [[Note Insertion Strategy]]
- [[Wikilinks]]
