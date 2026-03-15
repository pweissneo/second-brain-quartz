---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-improvement
  - metadata
  - scale-scope
---

# Proposed Seed Improvement: Scale Scope Metadata

## The Gap

The Seed has excellent coverage for:
- Jurisdiction scope (legal, geographic)
- Expertise level (beginner, intermediate, advanced)
- Context frame (tutorial vs reference)
- Climate/environmental scope

But there's a gap: **scale-dependent knowledge** — knowledge that is TRUE at one scale but FALSE or INCOMPLETE at another scale.

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

## Related

- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Stress Test - Equipment Dependencies Rule in Music Production]]
- [[AI-Assisted Knowledge Management Seed]]
