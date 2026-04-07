---
last-reviewed: 2026-03-22
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
schema-version: "1.0"
tags:
  - frontier-exploration
  - decision-making
  - framework-selection
  - meta-knowledge
  - thinking-tools
---

# Frontier Exploration - Decision Framework Selection Knowledge

> How should a knowledge base structure knowledge about choosing between different decision-making approaches?

## The Problem

The Seed covers:
- Thinking tools and metacognitive strategies
- Framework-dependent knowledge (different frameworks produce different answers)
- Decision threshold knowledge (when to stop gathering information)
- Prescriptive vs. descriptive knowledge distinctions

But there's a gap: **How do you choose which framework to use in the first place?**

An AI building a knowledge base encounters many decision-making approaches:
- Cost-benefit analysis
- First principles thinking
- Reversibility/irreversibility assessment
- Expert intuition vs. data-driven decision
- Minority rule (Venture capital style)
- Satisficing vs. optimizing
- Options creation (before choosing)
- FOCUS (saying no to good ideas)

Each framework has its place. But when should you use which?

## Why It Matters

Without framework selection knowledge:

1. **Analysis paralysis** — You try to apply every framework to every decision
2. **Wrong framework, wrong answer** — Using cost-benefit on value-based decisions yields wrong results
3. **Redundant analysis** — Multiple frameworks applied when one would suffice
4. **Lost time** — Time spent choosing frameworks instead of deciding

Framework selection is meta-knowledge — knowledge about which decision approach to use.

## Framework Categories

### By Decision Type

| Category | Frameworks | When to Use |
|----------|------------|-------------|
| Reversible decisions | Satisficing, rapid iteration | Easy to change course, low stakes |
| Irreversible decisions | First principles, extensive analysis | Hard to undo, high impact |
| Time-sensitive | 10/10/10 rule, countdown | Deadline pressure, regret minimization |
| Value-based | Stakeholder impact, principles test | No clear optimization target |
| Resource-constrained | Options creation, MVP approach | Limited resources, need to prioritize |
| High-uncertainty | Monte Carlo, scenario planning | Many unknowns, range of outcomes |

### By Stakeholder Impact

| Stakeholder Type | Framework | Rationale |
|------------------|-----------|-----------|
| Self only | Personal utility maximization | Your preferences only |
| Team | Consensus, decision rights | Group alignment matters |
| Organization | RACI, authority levels | Formal accountability |
| Customer | Jobs-to-be-done | External value creation |

## Proposed Structure

### Framework Metadata

```yaml
decision-framework: first-principles
framework-type: analytical|intuitive|accelerated
applies-when:
  - decision-type: irreversible
  - stakes: high
  - time_available: sufficient
  - domain: well-understood
doesn't-apply-when:
  - time_available: limited
  - expertise: low
  - reversible: true
complexity: high  # cognitive load to apply
time_required: hours
common_mistakes:
  - "Applying to reversible decisions"
  - "Not checking assumptions"
```

### Decision Context Template

For each decision, document:

1. **Decision characteristics**
   - Reversible? (yes/no/mixed)
   - Stakes (low/medium/high/critical)
   - Time available (minutes/hours/days/weeks)
   - Reversibility cost (low/medium/high)
   - Stakeholders affected (self/team/org/external)

2. **Framework selection rationale**
   - Primary framework chosen
   - Why this framework fits
   - Alternative frameworks considered
   - Why alternatives rejected

3. **Post-decision review**
   - Was framework appropriate?
   - What would change next time?
   - What did we learn about framework selection?

## Framework Selection Heuristics

### Reversibility as Primary Filter

**Rule:** Start with reversibility assessment.

- If reversible → Use fast framework (satisficing, gut check)
- If irreversible → Use thorough framework (first principles, analysis)

### Stakes as Secondary Filter

**Rule:** Adjust depth based on stakes.

- Low stakes → Don't overthink, move fast
- Medium stakes → Standard analysis
- High stakes → Double-check with alternative framework

### Time as Third Filter

**Rule:** Account for time constraints.

- Minutes → Rely on intuition/experience
- Hours → Standard frameworks apply
- Days/weeks → Deep analysis possible, but set deadline

### Expertise as Fourth Filter

**Rule:** Match framework to expertise level.

- Expert (thousands of relevant decisions) → Trust intuition
- Experienced (dozens) → Supplement intuition with analysis
- Novice → Default to frameworks, seek advice

## Framework Failure Modes

### Common Mistakes

| Framework | Failure Mode | Detection |
|----------|-------------|-----------|
| Cost-benefit | Incommensurable values | Can't quantify everything |
| First principles | Overconfidence in assumptions | Haven't verified basics |
| Expert intuition | Expertise doesn't match domain | Expert is wrong in this area |
| Optimizing | Analysis paralysis | Decision never made |
| Consensus | Groupthink | Silenced minority opinions |
| Reversibility | Wrong reversibility assessment | Thought it was reversible, wasn't |

### When Frameworks Conflict

Sometimes different frameworks recommend different actions:

> **Example:** Cost-benefit says don't invest (low ROI). First principles says the long-term potential is huge. Reversibility says we can exit later if it fails.

**Resolution approach:**
1. Identify which frameworks agree vs. disagree
2. Weight by decision characteristics (irreversibility overrides cost-benefit?)
3. Default to most conservative when still uncertain
4. Document the conflict for post-decision review

## Seed Rule Proposal

**Rule:** For decisions requiring explicit reasoning, include `framework-selection` metadata documenting which frameworks were considered and why the chosen framework fits the decision characteristics.

**Why:** Without explicit framework selection, it's impossible to review whether the right approach was used. Future decisions can't learn from past framework choices.

**Test:** For major decisions documented in the vault: (1) Is there framework-selection metadata? (2) Does it list alternatives considered? (3) Does it explain why the chosen framework fits? (4) Is there post-decision review of framework appropriateness?

**Edge case:** For routine decisions (low stakes, reversible), explicit framework selection may be overkill. Apply only to decisions that warrant documented reasoning.

## Related Notes

- [[Frontier Exploration - Decision-Tree Knowledge Organization]] — Comprehensive guide to decision-tree knowledge structure and troubleshooting
- [[Frontier Exploration - Thinking Tools and Metacognitive Strategies]] — Thinking tools that can be applied
- [[Frontier Exploration - Decision Threshold Knowledge]] — When to stop gathering information
- [[Frontier Exploration - Framework-Dependent Knowledge]] — When different frameworks give different answers
- [[Frontier Exploration - Comparative Knowledge Structures]] — Comparing different knowledge structures
- [[AI-Assisted Knowledge Management Seed]] — Primary Seed rules
