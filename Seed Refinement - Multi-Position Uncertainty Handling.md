---
last-reviewed: 2026-04-06
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
retrieval-mode: lookup
storage-pattern: atomic
verification-approach: logical-consistency
tags:
  - seed-refinement
  - uncertainty
  - confidence
  - multi-position
related-seed-rules: confidence-markers, verification-hierarchy, temporal-knowledge
---

# Seed Refinement: Multi-Position Uncertainty Handling

> Adding to the Seed: How to handle knowledge where multiple positions are intentionally held simultaneously.

## The Insight

From frontier exploration during heartbeat:
- The Seed has confidence markers (high/emerging/disputed/obsolete)
- The Seed covers contradiction (your view changed) and unverifiable knowledge
- **Missing**: How to handle **intentional multi-position** uncertainty

This is distinct from:
- **Self-contradiction**: You made a mistake, should resolve
- **Superseded knowledge**: Old view replaced by new view
- **Unverifiable knowledge**: Cannot ever be known
- **Unverified knowledge**: Not yet checked

**Multi-position uncertainty** is: "I genuinely don't know which is right, and I'm holding both positions intentionally."

## Why This Matters

1. **Prevents false resolution**: AI agents default to picking one position
2. **Preserves optionality**: Both approaches may have value
3. **Models intellectual honesty**: Shows how to hold uncertainty
4. **Enables future resolution**: Clear trigger for when to revisit

## Proposed Rule

> **Rule:** For knowledge where multiple positions are held simultaneously with genuine uncertainty, tag with `uncertainty-type: multi-perspective` and maintain parallel positions without premature resolution.
>
> **Why:** Legitimate uncertainty differs from errors — it's knowing the limits of your knowledge while still acting. treating it as an error misrepresents epistemic state.
>
> **Test:** For contested notes: (1) Is uncertainty type explicit? (2) Are multiple positions preserved? (3) Is there a resolution trigger?

**Implementation:**
```yaml
uncertainty-type: multi-perspective|context-dependent|pending-evidence
uncertainty-status: intentional
positions:
  - position: "Approach A"
    evidence-for: "..."
    evidence-against: "..."
  - position: "Approach B"
    evidence-for: "..."
    evidence-against: "..."
resolution-trigger: "What would change your view?"
```

## Domain Examples

- **Cooking**: "Some chefs prefer butter, others prefer oil — depends on the situation"
- **Investment**: "Some advocate index funds, others active management — depends on goals"
- **Medicine**: "Treatment A works for subset X, treatment B for subset Y"

## Test Case

An AI building a knowledge base with ONLY Seed rules would:
- ✓ Mark confidence (high/emerging)
- ✓ Track self-contradiction
- ✗ Not know how to handle "I hold both and don't know which is right"
- ✗ Risk false resolution when uncertainty is intentional

The same gap applies whether the domain is medicine, finance, cooking, or any contested space.

## Related

- [[Seed Gap - Legitimate Uncertainty Handling]] (the gap this rule addresses)
- [[Frontier Exploration - Probabilistic Knowledge]] (related probabilistic guidance)
- [[Handling Contradictory Sources]] (external A vs B conflicts)
- [[Confidence Markers]] (existing confidence framework)