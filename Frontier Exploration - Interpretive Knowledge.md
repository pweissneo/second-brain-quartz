---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - interpretive-knowledge
  - judgment
  - subjectivity
---

# Frontier Exploration - Interpretive Knowledge

> When knowledge requires judgment, taste, or personal perspective — and there's no single right answer.

## The Gap

The Seed handles:
- **Factual knowledge** (verifiable, objective)
- **Probabilistic knowledge** (explicitly uncertain)
- **Tacit knowledge** (can't be fully captured)
- **Procedural knowledge** (how to do things)

What's missing: **Interpretive knowledge** — knowledge that exists but requires personal judgment to apply.

## What Is Interpretive Knowledge?

Knowledge that requires taste, judgment, or perspective to evaluate. Examples:

| Domain | Interpretive Element |
|--------|---------------------|
| Literary criticism | Is this novel "good"? What makes it great? |
| Art critique | Is this painting effective? Why? |
| Film reviews | Is this movie worth watching? For whom? |
| Musical performance | What makes one interpretation better? |
| Wine tasting | What makes this vintage excellent? |
| Architecture | Is this building "beautiful"? |
| UX design | Is this interface "intuitive"? |

In each case, there's knowledge to capture — techniques, criteria, history — BUT the ultimate judgment is interpretive.

## Why This Matters for AI KBs

An AI building a knowledge base about literature needs to know:
- Literary techniques (factual)
- Critical frameworks (factual)
- Historical context (factual)
- BUT: How to EVALUATE a specific work? (interpretive)

Without handling interpretive knowledge, the vault either:
1. Avoids all judgment → not useful
2. Presents opinion as fact → misleading
3. Becomes endless debate → no resolution

## The Challenge

**Rule conflict:** The Seed requires every note to be "summarizable in one sentence" and "self-contained." But interpretive knowledge resists this:
- "This novel is great because..." — whose judgment?
- "The best interpretation is..." — says who?
- "This is quality work" — by what standard?

Interpretive knowledge is inherently:
- **Perspective-dependent** — depends on who is judging
- **Criteria-varying** — different frameworks yield different judgments
- **Non-consensus** — no single "right" answer

## Approaches to Capture

### Approach 1: Perspective-Tagged Judgments

Tag notes with the perspective/framework used:

```markdown
---
interpretive-framework: feminist-criticism
perspective: academic-voice
---

# The Handmaid's Tale

This novel critiques patriarchal power structures through [framework-specific analysis]...
```

**Test:** Can you identify what perspective the judgment comes from?

### Approach 2: Criteria-Based Evaluation

Instead of "good/bad," provide criteria:

```markdown
# Evaluating Fiction

## Criteria for Literary Merit
- [ ] Character development
- [ ] Narrative structure
- [ ] Language use
- [ ] Thematic depth

## Application Example
[Novel Name] scores high on X, moderate on Y...
```

**Test:** Can a reader apply these criteria themselves?

### Approach 3: Audience-Specific Guidance

"Not good/bad" but "good FOR X audience":

```markdown
# Film Recommendations

- Action fans: [Movie] delivers...
- Art-house seekers: [Movie] offers...
- Family viewing: [Movie] is appropriate for...
```

**Test:** Is the target audience clearly specified?

### Approach 4: Comparative Framework

Place interpretations on a spectrum:

```markdown
# Interpretive Spectrum: [Work]

Traditional values ←——→ Progressive values
Formal/Classical ←——→ Experimental/Modern
```

**Test:** Can you locate where different interpretations fall?

## Seed Rule Proposal

**New Rule:** For interpretive knowledge, notes must:
1. Clearly identify the perspective/framework being applied
2. Provide criteria rather than just conclusions
3. Acknowledge alternative interpretations exist

**Test:** Can a reader understand WHAT JUDGMENT is being made and FROM WHOSE PERSPECTIVE?

**Why:** Interpretive knowledge is valuable but easily misinterpreted as objective fact. Transparency about perspective prevents confusion.

## Edge Cases

### Edge Case 1: Personal Taste

"My favorite books" — this IS interpretive, explicitly personal. No framework needed, but should be labeled:
```markdown
---
type: personal-opinion
confidence: subjective
---
```

### Edge Case 2: Professional Consensus

Some interpretive domains have professional consensus:
- Wine ratings (sommelier consensus)
- Architectural awards (professional jury)
- Culinary ratings (chef consensus)

**When consensus exists:** Note it. "Generally regarded as excellent by critics/chefs/etc."

### Edge Case 3: Evolving Interpretations

Interpretations change over time:
- Once-canonical works become criticized
- Forgotten works are revived
- "Great" becomes "dated"

**Recommendation:** Add temporal markers. "Critically acclaimed in 1950s; now viewed as problematic for X reasons."

## Practical Implementation

### Frontmatter Extension

```yaml
interpretive: true
interpretive-type: evaluation  # evaluation | opinion | critique | review
perspective: required  # required | optional | personal
alternative-views: included  # included | referenced | omitted
```

### Note Template for Interpretive Notes

```markdown
# [Work/Subject]

## The Interpretation
[Core judgment from specific perspective]

## Criteria Used
- Criterion 1: [How it applies]
- Criterion 2: [How it applies]

## Alternative Interpretions
- [Other perspective]: [How it differs]
- [Other perspective]: [How it differs]

## For Further Reading
[[Frontier Exploration - Comparative Knowledge Structures]] | [[Handling Contradictory Sources]]
```

## What AI Agents Should Do

When capturing interpretive knowledge:
1. **Identify** if the knowledge is interpretive (judgment, taste, evaluation)
2. **Tag** with perspective/framework used
3. **Provide** criteria for the judgment, not just the conclusion
4. **Acknowledge** alternative interpretations exist
5. **Distinguish** personal opinion from professional consensus

## Related

- [[Frontier Exploration - Probabilistic Knowledge]] — Where certainty differs
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — Different audiences
- [[Frontier Exploration - Illustrative vs Factual Examples]] — Types of knowledge
- [[Confidence Markers]] — Expressing certainty levels
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules
