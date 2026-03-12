---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - examples
  - knowledge-processing
---

# Frontier Exploration: Illustrative vs. Factual Examples

> How should a knowledge base distinguish between examples that illustrate a concept versus examples that demonstrate real-world application?

## The Problem

The Seed addresses source citation and factual claims, but treats "examples" as a monolithic category. In practice, examples serve fundamentally different purposes:

1. **Illustrative examples** — Hypothetical or simplified scenarios used to explain a concept
2. **Factual examples** — Real-world instances that demonstrate a principle in practice

 conflating these creates several problems:

- Illustrative examples get cited as factual knowledge
- Factual examples become outdated without notice
- Readers can't distinguish "this is how it works in theory" from "this is how it works in practice"

## The Gap in Current Seed Rules

The Seed has:
- Rules about citing sources (Rule: Cite sources)
- Rules about temporal data (Rule: Separate time-sensitive data)
- Rules about confidence markers

But missing:
- **No distinction** between illustrative and factual examples
- **No guidance** on dating factual examples
- **No guidance** on marking illustrative examples as hypothetical
- **No test** for whether examples are being used appropriately

## Domain Variations

This gap manifests differently across domains:

| Domain | Illustrative Example | Factual Example |
|--------|---------------------|------------------|
| Cooking | "Imagine a basic vinaigrette" | " recipe for classic vinaigrette" |
| Programming | "Consider a function that adds numbers" | "Array.prototype.reduce() in JavaScript" |
| Music | "A simple melodic interval" | "The opening of Beethoven's 5th" |
| Medicine | "How a vaccine works conceptually" | "Pfizer COVID-19 vaccine mechanism" |

The problem: Illustrative examples can be generic; factual examples must be accurate and may become obsolete.

## Proposed Seed Rules

### Rule: Distinguish Illustrative from Factual Examples

**Rule:** When including examples in notes, explicitly categorize them as either illustrative (hypothetical/simplified) or factual (real-world with source).

**Why:** Readers and AI agents need to know whether an example represents reality or a teaching abstraction. Misunderstanding this leads to citing illustrative examples as facts or missing when factual examples become outdated.

**Test:** Pick 5 notes with examples. Can you categorize each as illustrative or factual? Are factual examples dated?

### Rule: Date Factual Examples

**Rule:** Factual examples must include a date or time range in their frontmatter or inline, indicating when the example was verified.

**Why:** Facts change. A "real-world example" from 2020 may no longer be accurate in 2026. Dating helps readers assess relevance and triggers review when examples become stale.

**Test:** For notes with factual examples, can you determine when the example was last verified? Is there a review date?

### Rule: Mark Illustrative Examples as Hypothetical

**Rule:** Illustrative examples should be clearly marked as hypothetical, using phrases like "for example" or "imagine" rather than presenting them as real occurrences.

**Why:** An illustrative example of "how a nuclear reactor works" shouldn't be mistaken for a factual description of a specific reactor. Clear signaling prevents confusion.

**Test:** Can you distinguish illustrative from factual examples without clicking any links? Are illustrative examples clearly framed as hypothetical?

## Edge Cases

1. **Historical examples** — These are factual but historical. Treat as factual with explicit date range.
2. **Canonical examples** — Widely-known examples (Beethoven's 5th, Newton's apple) are factual but stable. Date of first verification is sufficient.
3. **Statistical examples** — "In a 2023 study..." are factual and must be dated.
4. **Tutorial examples** — Step-by-step guides are typically illustrative unless linking to real documentation. Mark as "example tutorial" rather than "how to."

## Domain-Specific Edge Cases

### Legal Knowledge

The legal domain provides particularly important edge cases due to high stakes:

1. **Teaching Hypotheticals** — Law school materials use hypotheticals extensively (e.g., "If Dr. Smith leaves a clamp in a patient's abdomen..."). These look like case summaries but never happened. Must be marked as illustrative.

2. **Modified Real Cases** — Teachers sometimes modify real cases for classroom discussion ("In a case *similar to* Johnson v. Hospital Corp..."). The base case may be real but the modification makes it hypothetical.

3. **Common Law Principles** — Notes citing multiple cases (e.g., "*Palsgraf v. Long Island Railroad* (1928) and *Bolitho v. Dodds* (1997)") are factual but may not apply in all jurisdictions.

4. **Model Laws and Uniform Acts** — Model laws (e.g., "The Uniform Commercial Code Section 2-207") aren't actual law yet. Mark with `status: proposed` or `status: pending`.

5. **International Law** — Comparative legal analysis (e.g., "Under English common law, consideration is required; under French civil code, it is not") is neither illustrative nor factual in the case-law sense—it's comparative. Mark with `example-type: comparative`.

6. **Pending Legislation** — Proposed laws (e.g., "The proposed EU AI Regulation would require...") are factual about the proposal but not about enacted law. Mark with `status: pending`.

## The Test (Combined)

1. Pick 5 random notes containing examples
2. For each: Is it illustrative or factual?
3. If factual: Is there a date when it was verified?
4. If illustrative: Is it clearly marked as hypothetical?

## Why This Matters for AI Agents

Without this distinction:
- An AI might cite a hypothetical example as evidence for a factual claim
- An AI might not flag outdated factual examples for review
- An AI might create new "factual" examples that are actually illustrative

With this distinction:
- AI can appropriately evaluate and cite examples
- AI can trigger timely reviews of factual examples
- AI can maintain clarity about what's real vs. teaching abstraction

## Related

- [[AI-Assisted Knowledge Management Seed]] — The rules this note extends
- [[Handling Contradictory Sources]] — Related to source quality
- [[Source Validation Over Time]] — Temporal data handling
- [[Confidence Markers]] — Signaling reliability
- [[Knowledge Base Workflow]] — How new knowledge enters
- [[Stress Test - Confidence Markers Rule Across Domains]] — Cross-domain stress test
