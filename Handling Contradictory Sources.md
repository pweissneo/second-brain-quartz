---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
  - seed-rule
  - synthesis
  - contradiction
  - sources
---

# Handling Contradictory Sources

> When multiple credible sources disagree, how should an AI agent capture and organize the disagreement?

## The Problem

The Seed requires citing sources, but assumes sources agree. In reality:
- Scientific consensus shifts over time
- Different schools of thought exist in every field
- Studies sometimes produce conflicting results
- Expert opinions vary

An AI agent building a knowledge base needs rules for these situations.

## The Gap

The Seed has no guidance for:
1. **When sources contradict** — do you pick one? Capture both? Note the disagreement?
2. **How to organize contradiction** — separate notes? A single note with competing views?
3. **Confidence tracking** — how to signal "this is settled" vs "this is debated"
4. **Temporal shifts** — when consensus changes, how to update without orphaning the old view

## Objective vs Subjective Contradictions

When sources disagree, the response should depend on whether the contradiction is **objective** (fact-based) or **subjective** (preference-based).

### Objective Contradictions
- Food safety claims (one source says safe, another says dangerous)
- Scientific facts (chemistry, physics of cooking)
- Technical specifications (temperatures, times, ratios)
- Historical facts

**Action:** Must create synthesis. Present both viewpoints with source attribution. Do not choose one over the other.

### Subjective Contradictions
- Taste preferences ("best" ingredient, "most flavorful" technique)
- Style preferences (authentic vs. modernized)
- Personal opinions on quality

**Action:** Can present as options/preferences. "Some cooks prefer X, others prefer Y" is sufficient. Synthesis note not required.

### Why This Distinction Matters

- Objective contradictions: Getting it wrong has real consequences (health, safety)
- Subjective contradictions: Presenting as fact limits reader's own judgment
- Over-synthesizing subjective opinions makes the vault feel like it's avoiding taking stances

## The Test (Combined)

**For handling contradictory sources:**
Can you identify at least one note in the vault where sources disagreed? Does that note present multiple viewpoints rather than picking one?

**For objective vs subjective:**
For a note about a source contradiction:
1. **Is there an objective truth at stake?** (safety, correctness, accuracy)
2. **Could following the wrong side cause harm or significant error?**
3. **Do experts disagree because of incomplete data, or because of different preferences?**

If yes to 1-2 → Create synthesis note with balanced presentation
If yes to 3 → Present as multiple perspectives without synthesis

## Proposed Seed Rule

**Rule:** When sources contradict, create a synthesis note that presents both perspectives with source attribution, rather than choosing one side. Distinguish between objective contradictions (which require synthesis) and subjective ones (which can be presented as options).

**Why:** Choosing one side loses information. A knowledge base should represent reality accurately, including uncertainty and debate. Objective contradictions have real consequences if wrong; subjective ones should preserve reader autonomy.

**Test:** Can you identify at least one note in the vault where sources disagreed? Does it present multiple viewpoints appropriately based on whether the contradiction is objective or subjective?

## Alternative: Confidence Levels

Consider adding frontmatter to notes:
- `confidence: high` — established consensus
- `confidence: emerging` — newer findings, may change
- `confidence: disputed` — significant disagreement among experts
- `confidence: obsolete` — superseded by newer understanding

This helps readers understand the reliability of each piece of knowledge without reading the full source chain.

## Related
- [[AI-Assisted Knowledge Management Seed]] — The rules this note extends
- [[Knowledge Base Workflow]] — How new knowledge enters the vault
- [[Self-Improvement Cycle]] — Continuous improvement process
- [[Trust and Verify]] — Source verification and reliability
- [[Source Validation Over Time]] — Keeping sources accessible
- [[Confidence Markers]] — Signaling reliability
