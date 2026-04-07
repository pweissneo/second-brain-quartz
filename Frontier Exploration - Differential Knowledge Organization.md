---
last-updated: 2026-04-07
knowledge-type: conceptual
retrieval-mode: hybrid
access-pattern: decision
confidence: medium
lifecycle: draft
author-type: ai-assisted
tags:
- frontier-exploration
- reasoning-structure
- hypothesis-management
- diagnostic-knowledge
- decision-knowledge
seealso:
- "[[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]]"
- "[[Frontier Exploration - Ambiguous Query Handling and Uncertainty Communication]]"
- "[[Frontier Exploration - Decision-Tree Knowledge Organization]]"
- "[[Handling Contradictory Sources]]"
---

# Frontier Exploration - Differential Knowledge Organization

> How should a knowledge base structure knowledge when multiple competing possibilities exist?

## The Gap

The Seed provides rules for:
- Atomic note creation
- Knowledge type classification
- Source evaluation
- Linking principles

But it lacks guidance for **structural knowledge organization when multiple hypotheses compete for a single answer**. This appears in:

- **Medical diagnosis** — "chest pain could be cardiac, pulmonary, GI, or musculoskeletal"
- **Troubleshooting** — "printer won't print could be driver, cable, hardware, or software"
- **Decision analysis** — "strategic options A, B, or C each has trade-offs"
- **Technical debugging** — "system crash could be memory, CPU, storage, or thermal"

Current rules treat knowledge as statements to capture, not structures to organize around competing possibilities.

## The Problem

When a knowledge base consumer faces a decision point needing differential reasoning:

1. **Fragmented hypotheses** — Each possible cause/option exists as separate notes without guidance on how they relate to each other
2. **No prioritization framework** — Notes don't explain how to rank alternatives (likelihood? severity? reversibility?)
3. **Missing decision criteria** — Trade-offs exist as separate notes but criteria for choosing aren't made explicit
4. **No escalation paths** — No guidance on when to narrow to single hypothesis vs. keep differential open

## What a Seed Rule Would Need

**Rule:** Structure differential knowledge as explicit option sets with shared criteria.

**Why:** Differential reasoning requires comparing like with like. Without shared evaluation criteria, consumers get unorganized options. Structured differentials enable systematic comparison.

**Test:** Can you identify a differential (3+ alternatives for single problem)? Do all alternatives reference common evaluation criteria? Can you explain the prioritization framework?

**Implementation:**
```yaml
differential-type: diagnostic|troubleshooting|decision|prognostic
prioritization-framework: likelihood|severity|cost|reversibility|time-urgency
common-criteria:
  - criterion: "likelihood"
    evaluation: "frequency in population/experience"
  - criterion: "severity"
    evaluation: "worst-case if missed"
  - criterion: "reversibility"
    evaluation: "ease of intervention"
escalation-condition: "when single option emerges above threshold"
```

## Distinction from Existing Notes

- **[[Handling Contradictory Sources]]** — Source evaluation (which source is reliable)
- **[[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]]** — General diagnostic approach
- **[[Frontier Exploration - Decision-Tree Knowledge Organization]]** — Sequential choice structure
- **This note** — How to organize a SET of competing possibilities as a cohesive reasoning structure

## Edge Cases to Consider

1. When should differential be narrowed? (threshold criteria)
2. When should alternatives be kept open deliberately? (ambiguity intentional)
3. How to handle overlapping but not identical alternatives? (differential subsets)
4. How to document eliminated hypotheses? (learning from ruled-out options)

## Questions for Seed Integration

- Should differential structure be a separate knowledge type?
- How does this interact with decision-optimized access pattern?
- What's the relationship to hypothesis confidence calibration?

---

*This note explores whether differential knowledge organization warrants a Seed rule. The concept is distinct from existing guidance on source contradiction handling or sequential decision trees.*