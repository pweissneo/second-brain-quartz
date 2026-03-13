---
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
tags:
  - seed-extension
  - graph-density
---

# Graph Density Management

> This note elaborates on Seed rule about graph density. See [[AI-Assisted Knowledge Management Seed]] for the authoritative rule.

## The Problem

The Seed emphasizes increasing graph density over time (more edges, not just more nodes). But there's a tipping point where:
- Every note links to too many others → no clear entry point
- Information overload → readers can't prioritize
- Hubs become cluttered → no differentiation between important and peripheral connections

## The Density Spectrum

```
Low Density          Optimal Density          High Density
     |                      |                        |
Few links           Rich but navigable      Too many links
Isolated notes      Clear hierarchies       Noise overwhelms signal
Poor discovery      Emergence thrives      Discovery Paralysis
```

## Symptoms of Excessive Density

1. **Hub inflation** — A single note has 10+ outgoing links
2. **No specialization** — Every note tries to connect to everything
3. **Navigation confusion** — No clear path from point A to B
4. **Emergence fatigue** — Too many "connections" dilute real insights

## When Density Is Too High

A note likely has too many links when:
- You can't explain why each link matters in one sentence
- The note reads as an index rather than a concept
- Adding another link is motivated by meeting a quota, not adding value

## The Quality Over Quantity Test

For each link in a note, ask:
1. **Does this link add unique value?** (not already in other links)
2. **Would removing this link hurt understanding?**
3. **Can I explain why someone should follow this link?**

If no to any → consider removing or downgrading the link.

## Management Strategies

### 1. Prune Ruthlessly
Remove decorative links that don't add navigational or conceptual value. Better fewer strong links than many weak ones.

### 2. Introduce Intermediary Notes
When a hub connects to 10+ disparate topics, create intermediate hub notes:
```
Instead of: Hub → [A, B, C, D, E, F, G, H, I, J]
Do: Hub → [Topic 1, Topic 2] → [A, B, C, D] and [E, F, G, H]
```

### 3. Use Link Types
Distinguish between link types in your mind (even if not in metadata):
- Core dependencies (essential to understand this note)
- Optional exploration (interesting but not necessary)
- Tangential references (for deep dives only)

### 4. Set Density Caps
Consider informal caps:
- Maximum 7 outgoing links per note (cognitive load limit)
- Maximum 3 levels of hub nesting
- Minimum 2, target 3-5, maximum 7 links per note

## The Emergence Sweet Spot

Optimal density enables emergence:
- Enough connections for unexpected intersections
- Enough structure to navigate meaningfully
- Enough whitespace to see patterns

Too dense → noise overwhelms signal
Too sparse → no intersections possible

## Seed Reference

The Seed includes this rule:

> **Rule:** Monitor graph density and prune when links become decorative rather than navigational — a note with more than 7 outgoing links should trigger a review.
> **Why:** Excessive density reduces navigability and dilutes the signal of meaningful connections. Quality of links matters more than quantity.
> **Test:** Can you explain why each link in a random note matters? Are any links there only to meet a minimum count requirement?

This note provides elaboration and practical strategies for applying the Seed rule.

## Related

- [[Linking Principle]] — Meaningful connections
- [[Graph Maintenance]] — Regular health checks
- [[Hub Node Creation]] — When to create hubs
- [[Emergence in Knowledge Graphs]] — How connections create insights
- [[Graph Traversal Efficiency]] — Navigation within 3 hops
