---
last-reviewed: 2026-03-31
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-type: seed-missing
gap-status: integrated
gap-priority: medium
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-03-30
resolved-by: [[Seed Refinement - Evaluative Knowledge in Creative Domains]]
analysis-date: 2026-03-31
integration-date: 2026-03-31
---

# Seed Gap - Evaluative Knowledge Organization in Creative Domains

> Gap: The Seed lacks guidance on organizing evaluative knowledge (craft criticism vs. aesthetic judgment) within creative domain knowledge bases.
> 
> **Analysis (2026-03-31):** A frontier exploration note already exists covering this topic: [[Distinguishing Craft Criticism from Aesthetic Judgment]]. The gap is not about discovering the concept but about enforcing it via Seed rules that mandate tagging evaluative claims.

## The Problem

In creative domains (art, music, writing, photography, cooking as craft, design), knowledge bases often contain evaluative claims that fall into two fundamentally different categories:

1. **Craft criticism** — Claims about technical execution (verifiable, objective): "This sculpture has anatomical errors"
2. **Aesthetic judgment** — Claims about beauty, taste, preference (subjective): "This sculpture is beautiful"

The Seed addresses:
- Verification status (unverified, verified, correction-needed)
- Unverifiable knowledge handling
- Confidence markers
- Subjective knowledge types

But it lacks explicit guidance for:
1. **Coexisting evaluation types** — Notes containing both craft and aesthetic claims
2. **Domain-specific evaluation criteria** — What counts as "good" varies by creative domain
3. **Transferable vs. style-bound knowledge** — Craft skills transfer; aesthetic preferences don't
4. **Utility measurement for subjective content** — How to measure usefulness when "usefulness" is subjective

## Why This Is a Seed Gap

Without explicit guidance:
- AI agents may treat aesthetic judgments as verifiable claims
- Notes mix craft and aesthetic without clear separation
- Evaluation criteria become arbitrary or domain-specific without explanation
- The 5:1 ratio rule may not apply cleanly to creative domains where aesthetic content is core

## Distinction from Existing Seed Coverage

| Concept | Covered? | How |
|---------|----------|-----|
| Unverifiable knowledge | Yes | "unverifiable-type" field |
| Practice-required knowledge | Yes | "verification-modality" field |
| Subjective knowledge types | Partial | References in edge cases |
| Personal taste calibration | Frontier | No Seed rule yet |
| Craft vs. aesthetic distinction | No | Gap |

## Proposed Seed Rule

**Rule:** For creative domain knowledge bases, explicitly distinguish craft criticism from aesthetic judgment — tag evaluative claims appropriately, separate verifiable from subjective content, and acknowledge when evaluation criteria are style-bound.

**Why:** Creative domain knowledge bases contain evaluative claims with fundamentally different truth values. Treating aesthetic judgments as if they're verifiable leads to false confidence; conflating personal preference with craft evaluation confuses users. Explicit separation enables appropriate confidence assignment and transferability assessment.

**Test:** For notes in creative domains containing evaluative claims:
1. Can you identify which claims are craft (verifiable) vs. aesthetic (subjective)?
2. Are craft claims supported by measurable criteria?
3. Are aesthetic claims tagged as subjective or marked with consensus level?
4. Does the note acknowledge when evaluation criteria are style-dependent?

**Implementation:**
```yaml
evaluative-claim: craft|aesthetic
craft-criteria: "list of measurable criteria"
aesthetic-basis: "personal|prefessional-community|cultural"
transferability: high|limited|none  # craft transfers; aesthetic doesn't
style-dependency: minimal|moderate|high  # does evaluation apply across styles?
```

**Edge cases:**
- Hybrid claims ("Technically proficient AND beautiful") should be split or clearly separated
- Domain-specific evaluation criteria should be documented (what makes "good code" vs. "good prose")
- Cultural/aesthetic norms change — note when evaluation criteria are era-dependent

## Related Notes

- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — Already exists in vault
- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — Frontier exploration on personal preferences
- [[Seed Stress Test - Philosophy Knowledge Base]] — Has relevant discussion on evaluative claims
- [[Best Practice - Subjective Personal Knowledge Handling]] — Related but about personal knowledge, not evaluative knowledge
- [[Frontier Exploration - Interpretive Knowledge]] — Related framework

## Stress Test

### Test 1: Photography Knowledge Base

A note evaluates a photographer's work: "The composition follows rule of thirds (craft), and the moody lighting creates emotional depth (aesthetic). The desaturation feels intentional rather than lazy."

- Which claims are verifiable?
- Which are subjective?
- How should this be tagged?

### Test 2: Music Composition Knowledge

A note discusses a composition: "The counterpoint is structurally sound (craft), but the harmonic choices feel conservative (aesthetic preference). The piece would benefit from more rhythmic variation."

- Can an AI agent distinguish what's verifiable from what's opinion?
- Does the note help a user apply the craft principles without inheriting the aesthetic preferences?

### Test 3: Cooking Knowledge Base

A recipe note evaluates outcomes: "The sauce was well-balanced (aesthetic judgment from taste), the technique execution was correct (craft), but the portion size was too large for the plate (presentation craft)."

- Does the Seed provide guidance on separating these claim types?
- Can a user distinguish what they should follow vs. what is subjective?

---

*This is a Seed Gap note. The solution should be a Seed rule with Rule/Why/Test format that addresses evaluative knowledge organization in creative domains.*

## Vault Inventory

The vault already contains a foundational note on this topic:
- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — established evergreen note with `verification-status: verified`

This existing note provides the conceptual foundation. The gap is about making the distinction **enforceable via Seed rules** rather than just **documented as guidance**.

## Proposed Seed Integration

The Seed should include a rule mandating that evaluative claims in creative domain notes be tagged:

```markdown
**Rule:** For notes containing evaluative claims about creative work, tag each claim type explicitly — use `claim-type: craft` for verifiable technical claims, `claim-type: aesthetic` for subjective judgments, and separate them within the note.

**Why:** Without explicit tagging, AI agents cannot distinguish verifiable craft claims from subjective aesthetic judgments, leading to false confidence markers and confused users.

**Test:** For notes about creative domains: (1) Are evaluative claims tagged by type? (2) Is there separation between craft and aesthetic content? (3) Does the note acknowledge style dependency?
```
