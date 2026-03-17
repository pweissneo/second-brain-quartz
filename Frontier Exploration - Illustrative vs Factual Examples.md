---
last-reviewed: 2026-03-16
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - examples
  - knowledge-processing
---

# Frontier Exploration - Illustrative vs Factual Examples

> How to distinguish examples that illustrate concepts from examples demonstrating real-world application.

## The Problem

The Seed treats "examples" as monolithic, but they serve different purposes:

1. **Illustrative** — Hypothetical scenarios explaining concepts
2. **Factual** — Real-world instances demonstrating principles

Conflating these causes: illustrative examples cited as facts, factual examples become outdated unnoticed, readers can't distinguish theory from practice.

## Gap in Seed Rules

- No distinction between illustrative and factual
- No guidance on dating factual examples
- No guidance on marking illustrative as hypothetical

## Proposed Rules

### Distinguish Example Types
**Rule:** Categorize examples as illustrative (hypothetical) or factual (real-world with source).
**Test:** Can you categorize 5 random examples?

### Date Factual Examples
**Rule:** Factual examples must include verification date.
**Test:** Can you determine when factual examples were verified?

### Mark Illustrative as Hypothetical
**Rule:** Use "for example" or "imagine" rather than presenting as real.
**Test:** Can you distinguish types without clicking links?

## Why It Matters

Without distinction: AI cites hypotheticals as evidence, misses outdated facts.
With distinction: AI evaluates appropriately, triggers reviews, maintains clarity.

---

## Domain Variations

| Domain | Illustrative Example | Factual Example |
|--------|---------------------|------------------|
| Cooking | "Imagine a basic vinaigrette" | "Recipe for classic vinaigrette" |
| Programming | "Consider a function that adds numbers" | "Array.prototype.reduce() in JavaScript" |
| Music | "A simple melodic interval" | "The opening of Beethoven's 5th" |
| Medicine | "How a vaccine works conceptually" | "Pfizer COVID-19 vaccine mechanism" |
| Law | "A hypothetical breach of contract" | "Hadley v. Baxendale (1854) case facts" |
| Finance | "How compound interest works conceptually" | "S&P 500 returns 2015-2024" |
| Science | "Imagine atoms as tiny spheres" | "Water molecule H2O structure" |

**Key Insight:** Illustrative examples can be generic; factual examples must be accurate and may become obsolete.

---

## Edge Cases

### General Edge Cases

1. **Historical examples** — These are factual but historical. Treat as factual with explicit date range.

2. **Canonical examples** — Widely-known examples (Beethoven's 5th, Newton's apple) are factual but stable. Date of first verification is sufficient.

3. **Statistical examples** — "In a 2023 study..." are factual and must be dated.

4. **Tutorial examples** — Step-by-step guides are typically illustrative unless linking to real documentation. Mark as "example tutorial" rather than "how to."

### Domain-Specific Edge Cases

#### Legal Knowledge

The legal domain provides particularly important edge cases due to high stakes:

1. **Teaching Hypotheticals** — Law school materials use hypotheticals extensively (e.g., "If Dr. Smith leaves a clamp in a patient's abdomen..."). These look like case summaries but never happened. Must be marked as illustrative.

2. **Modified Real Cases** — Teachers sometimes modify real cases for classroom discussion ("In a case *similar to* Johnson v. Hospital Corp..."). The base case may be real but the modification makes it hypothetical.

3. **Common Law Principles** — Notes citing multiple cases (e.g., "*Palsgraf v. Long Island Railroad* (1928) and *Bolitho v. Dodds* (1997)") are factual but may not apply in all jurisdictions.

4. **Model Laws and Uniform Acts** — Model laws (e.g., "The Uniform Commercial Code Section 2-207") aren't actual law yet. Mark with `status: proposed` or `status: pending`.

5. **International Law** — Comparative legal analysis (e.g., "Under English common law, consideration is required; under French civil code, it is not") is neither illustrative nor factual in the case-law sense—it's comparative. Mark with `example-type: comparative`.

6. **Pending Legislation** — Proposed laws (e.g., "The proposed EU AI Regulation would require...") are factual about the proposal but not about enacted law. Mark with `status: pending`.

---

## Implementation Guidance

For marking examples:

```yaml
example-type: illustrative | factual | comparative
example-date: YYYY-MM-DD  # for factual examples
example-status: verified | pending | proposed  # as appropriate
hypothetical: true  # for illustrative examples
```

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Confidence Markers]]
- [[Handling Temporal Knowledge]] — Temporal knowledge, outdated information, and discredited knowledge handling
- [[Handling Contradictory Sources]] — Source verification for factual examples
