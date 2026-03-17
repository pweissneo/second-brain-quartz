---
last-reviewed: 2026-03-16
lifecycle: merged
confidence: high
author-type: ai-assisted
status: incorporated
review-by: 
knowledge-type: analysis
tags:
  - seed-improvement
  - metadata
  - scale-scope
---

# Proposed Seed Improvement: Scale Scope Metadata

> **STATUS:** This note's content has been incorporated into the Seed (see "applicability-scope" references).
> 
> This note remains for historical context and detailed rationale.

## The Gap

The Seed has excellent coverage for:
- Jurisdiction scope (legal, geographic)
- Expertise level (beginner, intermediate, advanced)
- Context frame (tutorial vs reference)
- Climate/environmental scope

But there's a gap: **scale-dependent knowledge** — knowledge that is TRUE at one scale but FALSE or INCOMPLETE at another scale.

## Why This Matters

Knowledge valid at one scale may be wrong, incomplete, or dangerous at another. Without scale scope metadata:
1. AI agents cannot determine if knowledge applies to the user's context
2. A hobbyist could follow professional-scale advice unsafely
3. Commercial-scale knowledge appears applicable to home use when it's not

## Evidence from Domain Stress Tests

The **Brewing Knowledge Base** stress test identified this gap:

> "Some advice that works in 5-gallon batches fails commercially and vice versa — scope matters."

Similar patterns exist in:
- **Woodworking**: Professional cabinetry vs hobbyist furniture
- **Photography**: Smartphone vs DSLR vs medium format
- **Cooking**: Home cooking vs restaurant production
- **Programming**: Scripting vs enterprise systems

## Proposed Rule Addition

**Rule:** For knowledge domains where practice differs by scale (amateur/hobbyist, professional, commercial, industrial), include explicit `scale-scope` metadata.
**Why:** Knowledge valid at one scale may be wrong, incomplete, or dangerous at another. Without scale scope, AI agents cannot determine applicability.
**Test:** Pick 10 notes in a craft/professional domain. Can you categorize each as hobby-scale, professional-scale, commercial-scale, or scale-independent?

### Example Test Case

| Note | Current State | Required Scale-Scope |
|------|---------------|---------------------|
| "Cast iron seasoning" | No scale metadata | hobby, professional |
| "Restaurant queue management" | No scale metadata | commercial, industrial |
| "Knife skills fundamentals" | No scale metadata | all-scales |

## Implementation

```yaml
scale-scope: amateur|hobby|professional|commercial|industrial|all
# Or for knowledge that works at multiple scales:
scale-scope: [hobby, professional]
```

## Edge Cases

1. **Scale-dependent but direction-independent**: Some knowledge works at all scales but requires different approaches
2. **Equipment-first scales**: Scale is often determined by equipment capability
3. **Regulatory thresholds**: Commercial food production has regulations that home cooking doesn't

## Reviewed

This improvement was reviewed during the 2026-03-16 heartbeat. The concept is well-developed and ready for Seed integration consideration.

## Related

- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Stress Test - Equipment Dependencies Rule in Music Production]]
- [[AI-Assisted Knowledge Management Seed]]
