---
last-reviewed: 2026-03-27
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - best-practice
  - subjective-knowledge
  - epistemic
  - confidence
---

# Best Practice - Subjective Personal Knowledge Handling

> Guidelines for managing opinions, preferences, and beliefs in a knowledge base.

## The Problem

The Seed's confidence system (high, emerging, speculative, disputed) conflates:
- **Epistemic confidence**: How certain we are that a claim matches reality
- **Belief strength**: How strongly an individual holds a personal view

A personal opinion marked "high confidence" misleadingly implies external verification.

## The Solution

Separate epistemic confidence from belief strength for subjective knowledge:

### Rule: Use `belief-strength` for subjective knowledge

**Why:** "I strongly believe X" is different from "X is verified." Personal certainty and external verifiability are orthogonal dimensions.

**Test:** Pick 5 notes containing personal opinions. Do they use `belief-strength:` (strong/moderate/weak) instead of `confidence:` for subjective claims?

### Rule: Set verification-status to `not-applicable` for purely subjective knowledge

**Why:** Subjective personal knowledge cannot be "verified" — it can only be acknowledged or held. Applying verification logic creates false precision.

**Test:** Can you query for notes where `verification-status: not-applicable`?

### Rule: Track `knowledge-type: subjective-personal` for opinions and preferences

**Why:** Enables filtering, retrieval awareness, and prevents treating opinions as facts.

**Test:** Do subjective notes include `knowledge-type: subjective-personal`?

## Frontmatter Template

```yaml
knowledge-type: subjective-personal
subjectivity-type: opinion|preference|belief|perspective
belief-strength: strong|moderate|weak
verification-status: not-applicable
personal-validity: personal-only
evolves: true|false
held-since: 2026-03-27
```

## Examples

| Note Content | Correct Tagging | Incorrect Tagging |
|--------------|-----------------|-------------------|
| "I prefer medium roast" | `knowledge-type: subjective-personal`, `subjectivity-type: preference`, `belief-strength: strong` | `confidence: high` |
| "200°F produces better results" | `knowledge-type: subjective-personal`, `subjectivity-type: opinion`, `belief-strength: moderate` | `confidence: high`, `verification-status: verified` |
| "The recipe uses 200°F" | `knowledge-type: factual`, `confidence: high`, `verification-status: verified` | `knowledge-type: subjective-personal` |

## When Subjective Knowledge Conflicts with Expert Consensus

Use the existing inverse authority rule, plus additional tracking:

```yaml
conflict-documentation:
  external-position: "What experts say"
  personal-position: "What I believe" 
  resolution: hold-personal|defer-to-experts
```

## Related

- [[Confidence Markers]]
- [[Seed Gap - Subjective Personal Knowledge Handling]]
- [[Frontier Exploration - Personal Taste Calibration Knowledge]]
