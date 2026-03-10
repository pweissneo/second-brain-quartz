---
last-reviewed: 2026-03-09
tags: [type:principle, process:workflow, aspect:structure]
confidence: emerging
lifecycle: active
---

# Forward References and Planned Knowledge

When building a knowledge base, you often need to reference concepts that don't exist yet — future topics, planned projects, or ideas you'll develop later. The Seed has no guidance on how to handle these forward references.

## The Problem

You write a note that would naturally link to a concept you're planning to create:

```
This approach requires understanding [[Advanced Pattern Matching]]
but we'll cover that in a future note.
```

Options:
1. Create a stub note immediately
2. Use a placeholder with explicit TODO markup
3. Write the content without the link, noting what was omitted
4. Create the link anyway (becomes a broken link)

## Why It Matters

Forward references are different from broken links:
- Broken links = mistakes, forgotten connections
- Forward references = intentional design, known future work

Treating them the same loses planning information.

## Rule

**Use stub notes with explicit `status: planned` for known future topics.** Don't leave dangling wikilinks that appear broken.

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
summary: Pattern matching techniques beyond basic regex
depends-on: [Atomic Note Principle, Linking Principle]
---

# Advanced Pattern Matching

> This note is planned. stub: planned

## Planned Content

- Advanced regex patterns
- Semantic vs syntactic matching
- Cross-domain applications
```

## Testing

1. Can you identify 3 forward references in your vault?
2. Do they have planned stub notes?
3. Are the stub notes still relevant (not abandoned)?

## Related

- [[Atomic Note Principle]]
- [[Note Lifecycle Management]]
- [[Graph Traversal Efficiency]]
