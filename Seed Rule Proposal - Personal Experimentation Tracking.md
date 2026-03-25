---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-proposal
  - experimentation
  - personal-knowledge
  - verification
---

# Seed Rule Proposal: Personal Experimentation Tracking

> Proposing a new Seed rule based on frontier exploration in fitness and personal health domains.

## Gap Identified

In domains requiring personal experimentation to validate knowledge (fitness, nutrition, productivity, health), the Seed has verification workflows but doesn't explicitly cover **systematic experimentation tracking**.

## Proposed Rule

**Rule:** For domains requiring personal experimentation to validate knowledge (fitness, nutrition, productivity, health), track experiments with structured format: hypothesis, variables, duration, outcome, conclusion.

**Why:** Personal knowledge in these domains is often wrong for your specific body/system. Systematic tracking distinguishes anecdotal from validated personal knowledge. Without structured experimentation notes, it's impossible to distinguish what "works for you" from what you've simply tried.

**Test:** Can you list 3+ personal experiments with documented variables and outcomes? For each: (1) What was the hypothesis? (2) What variables were controlled? (3) How long did the experiment run? (4) What was the outcome? (5) What conclusion was drawn?

**Implementation:** Use frontmatter and structured format:
```yaml
experiment-tracking: true
experiment-hypothesis: "What you expected to happen"
experiment-variables:
  - variable: "What you changed"
  - control: "What you kept constant"
  - duration: "How long"
experiment-outcome:
  result: "What happened"
  conclusion: "What this means for your knowledge"
  confidence: high|medium|low
verification-method: personal-experimentation
```

## Related Notes

- [[Frontier Exploration - Fitness and Exercise Knowledge Bases]]
- [[Frontier Exploration - Personal Health Metrics and Body Knowledge]]
- [[Frontier Exploration - Personal Experimentation Results]]
- [[AI-Assisted Knowledge Management Seed#Verification]]