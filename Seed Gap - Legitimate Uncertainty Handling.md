---
last-reviewed: 2026-04-04
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-phase: discovery
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-04-04
tags:
  - seed-gap
  - knowledge-evolution
  - uncertainty
related-seed-rules: perspective-evolution, temporal-knowledge, unverifiable-knowledge
---

# Seed Gap: Legitimate Uncertainty Handling

## The Problem

The Seed covers:
- Self-contradiction tracking (your view changed over time)
- Unverifiable knowledge (cannot be verified by any method)
- Verification method unavailability (method exists but inaccessible)

But missing: **knowledge where you intentionally hold multiple positions simultaneously**.

## The Gap

Some knowledge legitimately has no single "correct" answer:
- "Approach A works for X, approach B works for Y — I use both depending on context"
- "Source A claims X, source B claims Y — I don't know which is right, but I can explain both"
- "My intuition says X, but evidence suggests Y — I'm genuinely uncertain"

This is NOT:
- **Self-contradiction** (mistake, should be resolved)
- **Superseded knowledge** (old view replaced by new)
- **Unverifiable** (cannot ever be known)
- **Unverified** (not yet checked)

This is **legitimate uncertainty** — you know the limits of your knowledge and hold the tension.

## Why It Matters for AI Knowledge Bases

1. **Prevents false confidence** — AI agents might pick one position and treat it as settled
2. **Preserves optionality** — Both approaches may have value; premature resolution loses options
3. **Models intellectual honesty** — Shows how to hold uncertainty without avoiding the topic
4. **Enables future resolution** — When new information arrives, you can evaluate against both positions

## Current Workarounds

- Some notes use `confidence: low` but this doesn't capture the multi-position nature
- Contradictory Sources handling addresses A vs B disagreement but not "I hold both"
- Personal taste calibration (Seed line ~2712) touches on "context determines best" but not general uncertainty

## Proposed Rule

> **Rule:** For knowledge where multiple positions are held simultaneously with genuine uncertainty, document each position explicitly with `uncertainty-type: multi-perspective` and maintain parallel positions without premature resolution.
> 
> **Why:** Legitimate uncertainty differs from errors (self-contradiction), superseded views, and unverifiable claims — it's knowing the limits of your knowledge while still acting. Treating it as an error to fix or a gap to fill misrepresents the epistemic state.
> 
> **Test:** Can you identify notes that: (1) Present multiple positions without resolution, (2) Explicitly mark uncertainty type, (3) Avoid false confidence in any single position? For notes with uncertainty: Are positions documented equally, or does one dominate?

**Implementation:**
```yaml
uncertainty-type: multi-perspective|context-dependent|pending-evidence
uncertainty-status: intentional  # not "unresolved error"
positions:
  - position: "Position A"
    evidence-for: "evidence supporting this"
    evidence-against: "what challenges this"
    confidence: 0.4
  - position: "Position B"
    evidence-for: "evidence supporting this"
    evidence-against: "what challenges this"  
    confidence: 0.6
resolution-trigger: "What would change your view?"
last-evaluated: 2026-04-04
```

## Gap-to-Seed Candidate

Rule: For knowledge where you intentionally hold multiple positions without resolution, use `uncertainty-type: multi-perspective` frontmatter to distinguish from errors (self-contradiction), superseded views, unverifiable claims, or unverified pending checks.

Why: Without explicit uncertainty tagging, AI agents default to picking one position as "the" answer, overconfidently resolving legitimate uncertainty. This misrepresents epistemic state and loses the optionality value.

Test: For notes covering contested topics: (1) Is uncertainty type documented? (2) Are multiple positions presented without premature resolution? (3) Does uncertainty-status show intentional vs. error? (4) Is there a resolution-trigger for when to revisit?

## Related
- [[Frontier Exploration - Self-Contradiction and Evolved Perspective]] (covers your view changing over time)
- [[Handling Contradictory Sources]] (external A vs B conflict)
- [[Seed Gap - Unverifiable Knowledge Handling]] (cannot ever be verified)
- [[Seed Rule Addition - Seed-Level Lifecycle Management]] (note status transitions)