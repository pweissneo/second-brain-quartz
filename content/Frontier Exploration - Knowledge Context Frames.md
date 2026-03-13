---
last-reviewed: 2026-03-12
confidence: emerging
author-type: ai-assisted
lifecycle: active
tags:
  - frontier-exploration
  - knowledge-structure
  - context-framing
related:
  - Knowledge Abstraction Levels
  - Expertise-Level Dependent Knowledge
  - User Situational Constraints
---

# Frontier Exploration - Knowledge Context Frames

> When does the same core knowledge need different presentations for different contexts? How do you handle purpose-specific variants without fragmenting the vault?

## The Problem

The Seed addresses expertise levels (beginner/intermediate/advanced) and user constraints (time, budget, equipment). But there's another dimension it doesn't explicitly cover: **context frames** — the purpose or perspective that shapes how knowledge should be presented.

Consider:
- Medical knowledge: "What every patient should know" vs. "What physicians need to know" — same facts, different implications and depth
- Technical concepts: API documentation vs. architecture decision records — same system, different purposes
- Historical events: "What happened" (facts) vs. "why it matters" (analysis) vs. "how to learn from it" (lessons)

The same atomic knowledge unit can legitimately need multiple contextual presentations.

## Why This Matters

Without explicit context frame handling:
1. Notes become bloated trying to serve multiple purposes
2. Readers waste time filtering irrelevant context
3. AI agents can't determine which presentation is appropriate for a given use case

## Existing Rules That Are Close

- **Expertise-level** — addresses "who can understand this"
- **User situational constraints** — addresses "what can the user do"
- **Knowledge-type (canonical/analysis/personal)** — addresses "what kind of knowledge is this"

Context frames are different: they address **"for what purpose is this knowledge being presented?"**

## Proposed Approach

### Option A: Frame-Specific Variants

Create separate atomic notes for different frames, linked to a core canonical note:

```
[[Heart Disease - Core Concepts]] (canonical, framework-independent)
  ↳ [[Heart Disease - Patient Guide]] (purpose: patient-education)
  ↳ [[Heart Disease - Clinical Reference]] (purpose: medical-professional)
  ↳ [[Heart Disease - Public Health Context]] (purpose: policy-planning)
```

**Pros:** Each note is optimized for its purpose; clear separation
**Cons:** More notes to maintain; core must stay in sync with variants

### Option B: Frame Tags on Single Notes

Keep one note but tag sections or the whole note with purpose:

```yaml
context-frame: patient-education
# vs
context-frame: medical-professional
```

**Pros:** Single source of truth; easier maintenance
**Cons:** Notes become less atomic; harder to maintain purpose-specific depth

### Option C: Hub + Variants

Core note contains framework-independent facts; purpose-specific notes link to it and add context:

```
[[Statistical Significance]] (core, 100 words)
  → [[Statistical Significance - for Researchers]] (200 words, links to core)
  → [[Statistical Significance - for Business Analysts]] (200 words, links to core)  
  → [[Statistical Significance - for General Audience]] (150 words, links to core)
```

**Pros:** Avoids duplication; each variant adds purpose-specific value
**Cons:** Requires careful linking; variants can drift from core

## Test Cases

1. **Medical knowledge bases**: Should patient-education notes be separate from clinical notes?
2. **Technical documentation**: Are API reference and getting-started guides the same note or different?
3. **Legal knowledge**: Is "what the law says" different from "how to comply" from "what exceptions apply"?

## Seed Rule Proposal

**Rule:** For knowledge that legitimately requires different presentations for different purposes, use hub + variants pattern with explicit `context-frame` tagging.
**Why:** Context frames are orthogonal to expertise level and user constraints. Treating them separately prevents note bloat while ensuring each purpose gets appropriate presentation.
**Test:** Pick 5 notes that could serve multiple purposes. Can you identify: (1) Is the core knowledge the same across purposes? (2) Would splitting improve clarity? (3) Is there a hub pattern that preserves atomicity while serving multiple contexts?

**Rule:** Distinguish context frames from expertise levels — frame is about purpose, level is about complexity.
**Why:** A beginner can have a professional purpose (junior developer reading architecture docs). Conflating frame with level loses important distinction.
**Test:** For a note tagged with expertise-level AND context-frame: Can you explain why both are needed? Does changing one without the other make sense?

## Questions for Further Exploration

1. When does the overhead of multiple variants outweigh the clarity benefits?
2. How do you keep variants in sync with core as knowledge evolves?
3. Can AI agents reliably determine which frame is appropriate for a given query?
4. Should context frames be vault-level conventions or note-level decisions?

## Related Notes

- [[Knowledge Abstraction Levels]] — vertical tiers (concrete → pattern → principle)
- [[Expertise-Level Dependent Knowledge]] — who can understand this
- [[User Situational Constraints]] — what can the user actually do
- [[Canonical vs Analysis Knowledge]] — what kind of knowledge is this
