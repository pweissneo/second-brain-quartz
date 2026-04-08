---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
knowledge-type: meta
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - frontier-exploration
  - ai-knowledge
  - attribution
  - authorship
  - knowledge-creation
---

# Frontier Exploration - AI Original Knowledge Attribution

> How to attribute and handle knowledge content that AI agents generate as original contributions, distinct from synthesized or sourced knowledge.

## The Problem

The Seed addresses:
- **Sourced knowledge**: Direct citations from external sources
- **Personal knowledge**: Insights from direct experience
- **AI-synthesized knowledge**: Novel insights combining multiple sources

But there's a gap: **AI-original knowledge** — knowledge content that an AI agent generates as a net-new contribution, not derived from any specific source, not personal experience (since AI doesn't have experiences), but original insight created by the AI itself.

## What Is AI-Original Knowledge?

AI-original knowledge differs from:
- **Sourced knowledge**: Direct quotes/paraphrases from external sources
- **Synthesized knowledge**: Combining multiple sources into new insight (traceable to sources)
- **Personal knowledge**: Human experience-based insight

AI-original examples:
- An AI generates a novel mnemonic for remembering a concept
- An AI creates an original analogy to explain a principle
- An AI invents a decision framework not found in any source
- An AI proposes a new classification scheme
- An AI generates practice exercises or examples from scratch

## Why Attribution Matters

### Intellectual Honesty
When an AI generates original content, presenting it as "knowledge" (implying sourced origin) is misleading. Users may assume human expertise or source verification that didn't occur.

### Confidence Calibration
AI-original content should have different confidence levels than sourced content:
- Sourced: Confidence based on source reliability
- Synthesized: Confidence based on source convergence
- AI-original: Lower default confidence (not verified by human experts)

### Verification Expectations
Users who retrieve knowledge may have different verification expectations:
- "Is this factually correct?" (sourced → check sources)
- "Is this logically valid?" (synthesized → check reasoning)
- "Is this useful?" (AI-original → test applicability)

Without attribution, users apply wrong verification frameworks.

## The Seed Gap

### Gap 1: Attribution Metadata
When an AI generates original knowledge content, how should it be marked?

**Current state:** No explicit frontmatter field for AI-original content attribution.

**Proposed Rule:**
> For knowledge content that is AI-generated (not derived from sources), use `author-type: ai-original` in frontmatter to distinguish from `ai-assisted` (human-created with AI help) and `human` (traditional authorship).

**Test:** Can you identify which notes contain AI-original content vs AI-assisted vs purely human?

### Gap 2: Confidence Defaults
What default confidence should AI-original knowledge have?

**Proposed Rule:**
> AI-original knowledge should default to `confidence: emerging` unless subsequently verified by domain experts or empirical testing.

**Test:** Is AI-original content appropriately tagged with lower confidence?

### Gap 3: Verification Expectations
How should users know what verification the knowledge has received?

**Proposed Rule:**
> AI-original knowledge should include `verification-status` indicating what verification (if any) it has undergone:
> - `unverified`: AI-generated only
> - `self-verified`: AI checked for consistency
> - `externally-verified`: Human expert reviewed
> - `empirically-tested`: Tested in practice

**Test:** Can users determine verification status from frontmatter?

### Gap 4: Separation from Sourced Knowledge
Should AI-original and sourced knowledge be mixed in the same note?

**Proposed Rule:**
> AI-original content in notes should be explicitly distinguished from sourced content, using clear labeling so users can evaluate appropriately.

**Test:** Can you distinguish AI-original claims from sourced claims within notes?

## Implementation Questions

### Question 1: What counts as "AI-original"?
Is an AI-generated analogy "original"? What about mnemonics? What about practice problems?

**Boundary proposal:**
- **Original**: Novel combinations, invented examples, new frameworks
- **Not original**: Summaries, translations, direct applications of sourced rules

### Question 2: When is AI-original knowledge valuable?
Not all AI output is valuable. The value lies in:
- Novel perspectives a human might not consider
- Speed of generation for practice materials
- Cross-domain connections humans might miss

### Question 3: Evolution potential
Can AI-original knowledge become "real" knowledge over time?
- If verified by experts → becomes standard knowledge
- If empirically tested → becomes validated knowledge
- If disproven → becomes discredited knowledge (with proper attribution)

## Related Notes

- [[Frontier Exploration - AI-Synthesized Knowledge]] — Synthesis vs original distinction
- [[AI-Assisted Knowledge Management Seed]] — Source attribution rules
- [[Confidence Markers]] — Confidence level definitions
- [[Seed Gap - AI-Synthesized Knowledge Provenance]] — Related gap

## Open Questions

1. Should vaults distinguish AI-original notes from AI-assisted notes in structure?
2. How should AI-original knowledge link to source material it was informed by (but not derived from)?
3. Is there a threshold where AI-original content becomes "sourced" through community validation?

---

**This is a frontier exploration note — rules are proposed, not validated. Test and refine before incorporating into the Seed.**
