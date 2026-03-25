---
last-reviewed: 2026-03-23
last-updated: 2026-03-23
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
verification-status: unverified
tags:
  - seed-gap
  - evidence-weighting
  - knowledge-sources
  - frontier-exploration
schema-version: "1.0"
---

# Seed Gap: General Evidence Hierarchy for Non-Domain-Specific Knowledge

> Identifying the missing framework for evidence weighting in general-purpose knowledge bases.

## The Gap

The Seed currently addresses evidence hierarchies in high-stakes domains (medicine, law, science) but lacks guidance for general knowledge that doesn't fit these domain-specific structures.

### What's Covered

The Seed includes:
- **Medical domain:** Systematic Review → RCT → Case Study → Expert Opinion
- **Legal domain:** Primary sources (statutes) → Secondary (commentary) → Tertiary (summaries)
- **Source quality tracking:** `verification-type: source-based`, `source-credentials:`, `source-count:`
- **Knowledge source type:** intuition, analysis, authority, experiment

### What's Missing

For general-purpose knowledge bases (personal knowledge, creative domains, hobby expertise, technical skills), there's no framework for distinguishing evidence strength. The Seed assumes you can always apply domain-specific hierarchies, but most knowledge doesn't fit neatly into medicine/law/science.

**Example scenarios the Seed doesn't address:**

1. **Cooking techniques:** Is "simmer for 20 minutes" backed by recipe testing, expert intuition, or just convention?
2. **Programming best practices:** Is "use const in JavaScript" based on analysis, authority (someone's blog), or experiment?
3. **Woodworking tips:** Is "always joint before planing" tested methodology or folk wisdom?
4. **Writing advice:** Is "show don't tell" empirically validated or just craft consensus?

### The Problem

Without general evidence hierarchy, AI agents treat all knowledge as equally credible by default. This leads to:
- Treating folk wisdom same as tested methodology
- Unable to distinguish "this works because I tried it" from "this works because it's objectively verified"
- No way to weight knowledge appropriately for decisions
- Missing the calibration step between source type and verification method

## Proposed Seed Rule

**Rule:** For general-purpose knowledge bases, establish evidence tier classification that applies to any domain.

**Why:** Domain-specific hierarchies (medical, legal) don't apply to most personal knowledge. Without a general framework, AI agents cannot appropriately weight knowledge or select verification methods. General evidence tiers fill this gap.

**Test:** Can you categorize any piece of knowledge by evidence tier? Do high-stakes decisions reference higher-tier knowledge?

### Proposed Evidence Tiers

| Tier | Name | Description | Verification Method |
|------|------|-------------|---------------------|
| 1 | **Tested Methodology** | Directly verified through controlled execution or experiment | Reproduce the test |
| 2 | **Documented Experience** | Multiple instances of successful application, tracked outcomes | Cross-reference with documented cases |
| 3 | **Expert Consensus** | Widely agreed within community of practice, no known contradictions | Verify consensus exists |
| 4 | **Authoritative Source** | Single trusted source, credible credentials | Verify source credibility |
| 5 | **Established Convention** | Commonly accepted practice, origin unclear | Verify widespread use |
| 6 | **Personal Discovery** | Individual's own findings, untested by others | Track personal verification |

### Comparison to Domain-Specific Hierarchies

```
Domain-Specific (Medical):
  Systematic Review → RCT → Case Study → Expert Opinion

General Purpose:
  Tested Methodology → Documented Experience → Expert Consensus → Authoritative → Convention → Personal

Law (different axis):
  Primary Source → Secondary → Tertiary (but source quality is orthogonal)
```

Note: These tiers are orthogonal to source quality. A Tier 1 tested methodology could be in a blog post (low source quality, high evidence strength). A Tier 6 personal discovery could be from a world-renowned expert (high source quality, low evidence strength because untested).

### Implementation

```yaml
evidence-tier: tested-methodology  # 1-6 from table above
evidence-basis: "Multiple controlled tests across 3+ recipes"
verification-method: experimental  # experimental|documented|consensus|authoritative|cross-reference
replication-status: replicated|partial|unreplicated
```

### Distinguishing from Existing Fields

- **Confidence:** How certain we are about correctness (high/low/medium)
- **Verification-status:** Whether truth claims have been checked (verified/unverified/pending)
- **Knowledge source type:** How knowledge was derived (intuition/analysis/authority/experiment)
- **Evidence tier:** How strong the supporting evidence is (tested methodology vs convention)

These fields are complementary:
- A note can have `knowledge-source-type: experiment` + `evidence-tier: tested-methodology` + `confidence: high`
- Another note might have `knowledge-source-type: intuition` + `evidence-tier: personal-discovery` + `confidence: emerging`

## Edge Cases

### Tier Inflation

Knowledge can "inflate" tiers over time:
- Tier 6 (personal discovery) gets shared and becomes Tier 5 (convention)
- Tier 5 gets documented and becomes Tier 4 (authoritative)
- Tier 4 gets tested and becomes Tier 1 (tested)

Track this with `evidence-history:` field showing tier progression.

### Contradictory Tiers

What happens when Tier 1 (tested methodology) contradicts Tier 3 (expert consensus)?

**Rule:** Default to higher-tier evidence when conflicts exist, but document the conflict explicitly.

The conflict might indicate:
- Tier 1 test was flawed
- Tier 3 consensus is wrong
- Domain context matters (might work in lab, not in practice)

### Subjective Domains

In creative domains (art, writing, cooking), "tested methodology" may not apply the same way. A/B testing results, reader feedback, and taste panels can serve as experimental proxies.

Add `domain-adjustment:` field for subjective domains:
```yaml
evidence-tier: tested-methodology
domain-adjustment: subjective  # applies tier differently in creative domains
```

## Stress Test: Applying to Cooking Knowledge

**Question:** "Should you salt pasta water?"

| Source | Evidence Tier | Reasoning |
|--------|---------------|-----------|
| "My grandmother always did" | 5 (Established Convention) | Origin unclear, widespread practice |
| Food Network chef says | 4 (Authoritative Source) | Single credible source |
| "Cook's Illustrated tested" | 1 (Tested Methodology) | Controlled experiment with variables |
| "I tried it and it worked" | 6 (Personal Discovery) | Individual experience |
| "Every Italian cookbook agrees" | 3 (Expert Consensus) | Multiple authoritative sources align |

**Result:** Salted pasta water has strong evidence (Tier 1 from Cook's Illustrated, Tier 3 from consensus) — the Seed rule correctly identifies this as well-supported knowledge.

## See Also

- [[Frontier Exploration - Intuition vs Analysis Knowledge]] — Source type distinction
- [[Handling Contradictory Sources]] — When evidence conflicts
- [[Seed Stress Test - Cooking Knowledge Base]] — Domain-specific stress test
- [[Seed Stress Test - Source Reliability vs Verification in Medical Domain]] — Domain-specific hierarchy
- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — Subjective evidence calibration
