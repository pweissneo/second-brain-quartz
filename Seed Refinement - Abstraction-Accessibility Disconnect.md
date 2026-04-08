---
last-reviewed: 2026-04-07
confidence: emerging
author-type: ai-assisted
lifecycle: seedling
knowledge-type: synthesis
tags:
  - seed-refinement
  - abstraction-levels
  - accessibility
  - domain-challenge
domain: cross-domain
---

# Seed Refinement - Abstraction-Accessibility Disconnect

## The Gap

The Seed's abstraction levels rule (concrete → pattern → principle → philosophy) assumes higher levels = more advanced/less accessible. But some domains invert this relationship:

- **Philosophy:** "What is knowledge?" (philosophy level) is MORE accessible than "Gettier's 1963 counterexamples" (concrete level)
- **Theoretical physics:** "What is quantum entanglement?" (high abstraction) is more accessible than specific experimental setups
- **Mathematics:** General theorems often more accessible than specific proofs

## The Insight

Abstraction level and accessibility are ORTHOGONAL dimensions. The Seed treats them as correlated, but they can disconnect.

## Proposed Seed Rule Addition

**Rule:** For domains where abstraction level does not correlate with accessibility (e.g., philosophy, theoretical domains), add `accessibility: high|medium|low` metadata orthogonal to `level:` metadata.

**Why:** Level tagging enables filtering by abstraction, but users often need to filter by accessibility. In domains where higher abstraction = more accessible, level alone misleads. Orthogonal metadata resolves this.

**Test:** (1) Can you identify notes accessible to beginners regardless of abstraction level? (2) Can experts find specialized content without filtering out high-level notes? (3) Do the two dimensions provide independent filtering capability?

**Edge case:** Some notes span multiple accessibility levels depending on use context. Use `accessibility-range: low-high` for such notes.

## Implementation

Add to Seed's abstraction levels rule:
```
**Edge case (2026-04-07):** In domains where higher abstraction = more accessible (philosophy, theoretical domains), add `accessibility: high|medium|low` as orthogonal metadata. Level and accessibility may not correlate.
```

## Related Notes

- [[Seed Stress Test - Knowledge Abstraction Levels Rule in Philosophy]]
- [[AI-Assisted Knowledge Management Seed]] - Abstraction levels rule
- [[Frontier Exploration - Domain-Specific Knowledge Bases]]