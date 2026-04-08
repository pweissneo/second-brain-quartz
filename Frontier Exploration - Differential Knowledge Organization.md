---
last-reviewed: 2026-04-08
confidence: medium
lifecycle: seedling
author-type: ai-assisted
tags:
- frontier-exploration
- differential-reasoning
- knowledge-structure
- diagnostic-knowledge
- troubleshooting
---

# Frontier Exploration - Differential Knowledge Organization

> How to structure knowledge around competing possibilities, hypotheses, or alternatives when multiple valid options exist for a single problem or question.

## The Problem

In many domains, knowledge isn't about finding a single right answer — it's about systematically evaluating multiple possibilities:

- **Medical diagnosis:** "Could be pneumonia, could be bronchitis, could be pleurisy"
- **Troubleshooting:** "Could be power supply, could be motherboard, could be software"
- **Decision analysis:** "Option A vs Option B vs Option C"
- **Prognostic:** "These are the likely outcomes and their probabilities"

Without structured differential organization, consumers face:
- Unorganized option lists without comparison criteria
- No way to systematically eliminate possibilities
- Lost learning from ruled-out alternatives

## Core Insight

**Differential reasoning requires comparing like with like.** The key is shared evaluation criteria that apply to all alternatives equally. Without this, you're just listing options — not reasoning differentially.

## Structural Requirements

### Shared Criteria First

All alternatives in a differential should be evaluated against the **same** criteria:

```
Differential: Root Cause Analysis for System Failure
├── Option A: Power supply failure
├── Option B: Software crash  
├── Option C: Hardware malfunction

Evaluation Criteria (shared by all):
├── Likelihood: How common is this cause?
├── Severity: Worst-case impact if missed?
├── Reversibility: Can it be easily corrected?
├── Testability: Can we verify this quickly?
```

### Document Eliminated Options

Keep ruled-out alternatives with their elimination rationale:

```
Option B: Software crash - ELIMINATED
├── Elimination rationale: "System logs show power fluctuation 0.5s before crash"
├── Evidence: "[[System Log Analysis]]"
├── Lesson learned: "Power fluctuations preceded all three incidents"
```

This is valuable learning that would be lost if you just "narrowed to the answer."

### Threshold-Based Narrowing

Don't narrow prematurely. Use explicit confidence thresholds:

```yaml
differential-narrowing:
  threshold: 0.8  # 80% confidence before narrowing
  minimum-evidence: 3  # At least 3 data points
  keep-open-conditions:
    - "Time-constrained situation"
    - "Reversibility favors trying multiple paths"
    - "Evidence insufficient for any option"
```

## Relationship to Existing Seed Rules

| Related Rule | Relationship |
|--------------|--------------|
| [[Handling Contradictory Sources]] | Source evaluation (which source is reliable), NOT structural organization of options |
| [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]] | General diagnostic approach, but doesn't cover option-set structure |
| [[Frontier Exploration - Decision-Tree Knowledge Organization]] | Sequential choice structure, but doesn't address competing alternatives at same level |
| [[Frontier Exploration - Threshold Knowledge]] | Related - threshold-based narrowing applies here too |

## Domains Where This Matters Most

1. **Medical/Clinical:** Differential diagnosis is foundational
2. **Technical Troubleshooting:** Root cause analysis
3. **Decision Analysis:** Multi-criteria decision making
4. **Legal:** Alternative legal theories/strategies
5. **Financial Planning:** Investment alternatives, retirement scenarios
6. **Creative Problem-Solving:** Multiple approaches to a creative challenge

## Test Criteria

A well-structured differential:

- [ ] Has 3+ alternatives for a single problem/question
- [ ] All alternatives reference common evaluation criteria
- [ ] Has explicit prioritization framework (likelihood, severity, cost, etc.)
- [ ] Documents eliminated options with rationale
- [ ] Uses threshold-based narrowing logic
- [ ] Keeps differential open when evidence is insufficient

## Open Questions

1. **How many alternatives is too many?** Is there a cognitive load threshold?
2. **When to use differential vs. decision tree?** Sequential vs. simultaneous options
3. **Probability vs. possibility?** Should differentials include probability estimates?
4. **Group vs. individual context?** Do shared criteria need personalization?

## Seed Integration

See [[AI-Assisted Knowledge Management Seed]] — Differential Knowledge Organization rule (added 2026-04-07).

---

## Related Notes
- [[AI-Assisted Knowledge Management Seed]] - The Seed file
- [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]] - General diagnostic approaches
- [[Frontier Exploration - Decision-Tree Knowledge Organization]] - Sequential structure
- [[Frontier Exploration - Threshold Knowledge]] - Threshold concepts
