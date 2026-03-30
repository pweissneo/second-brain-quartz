---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-status: deprecated
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-29
resolved: 2026-03-29
gap-resolution-note: "Redundant with Seed Gap - AI-Synthesized Knowledge Provenance (resolved 2026-03-28). The Seed already handles ungrounded content via author-type tracking and confidence calibration. If no sources exist, synthesis-sources cannot be populated, which implies ungrounded. No separate groundedness field needed."
replaced-by: Seed Gap - AI-Synthesized Knowledge Provenance
tags:
  - seed-gap
  - ai-generated
  - provenance
  - hallucination
  - deprecated
  - redundant
---

# Seed Gap - AI Hallucination Detection in Autonomous Knowledge Capture

> **DEPRECATED: See [[Seed Gap - AI-Synthesized Knowledge Provenance]]**
> 
> Resolution: This gap is redundant with an existing resolved gap. The Seed's existing author-type and synthesis metadata fields already handle ungrounded content detection. When `synthesis-sources:` is empty or missing, this signals no source grounding — the same problem this gap proposed to solve.

## Original Gap Documentation (Archived)

### The Gap

The Seed covers synthesis provenance for content that combines multiple known sources, but lacks explicit guidance for **hallucination detection** — identifying when an AI agent generates claims not grounded in any captured source. This is distinct from synthesis (combining sources) and from verified direct capture.

### Why This Matters

When an AI agent builds a knowledge base autonomously:
1. **Ungrounded claims slip through** — The agent may generate plausible-sounding statements with no source backing
2. **Synthesis vs hallucination is unclear** — When AI "synthesizes," how do we know it's combining sources vs. inventing?
3. **Verification cannot work** — Without knowing what's grounded vs. ungrounded, verification is meaningless
4. **Confidence is miscalibrated** — Ungrounded claims shouldn't have any confidence score, not just "low"

### What the Seed Currently Covers

1. **Source citation** (line ~100): Notes must cite sources
2. **Confidence markers**: high/medium/low/emerging confidence
3. **Synthesis metadata** (line 694-717): For content combining sources:
   - `knowledge-source-type: synthesis`
   - `synthesis-sources:` list
   - `synthesis-type: cross-source|inductive|deductive|analogical`
   - `synthesis-confidence-calibration:` high|medium|low (typically medium or lower)
4. **Synthesis reliability heuristics** (line 711): Independent sources, explicit reasoning, convergence, recency
5. **Verification status**: unverified/pending/verified
6. **author-type** field (line 2051): Tracks if content is human-authored vs AI-generated

### Resolution Rationale

The proposed `groundedness:` field is unnecessary because:
- Empty `synthesis-sources:` list already indicates no sources
- `author-type: ai-assisted` or `ai-synthesized` marks AI-generated content for scrutiny
- Confidence defaults to `emerging` for AI-autonomous capture
- The workflow (flag for human review if uncertain) already applies

This gap should be closed as redundant rather than adding new frontmatter fields.

### Related Notes

- [[Seed Gap - AI-Synthesized Knowledge Provenance]] — The gap that covers this (resolved)
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules
- [[Confidence Markers]] — Confidence levels

---

*Deprecated: 2026-03-29 (heartbeat scan - redundant with resolved gap)*
