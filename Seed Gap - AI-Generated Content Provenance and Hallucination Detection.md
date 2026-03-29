---
last-reviewed: 2026-03-29
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-29
gap-source: frontier-exploration
gap-overlaps-with: AI Synthesis Provenance (partially covered)
tags:
  - seed-gap
  - ai-generated
  - provenance
  - hallucination
---

# Seed Gap - AI Hallucination Detection in Autonomous Knowledge Capture

## The Gap

The Seed covers synthesis provenance for content that combines multiple known sources, but lacks explicit guidance for **hallucination detection** — identifying when an AI agent generates claims not grounded in any captured source. This is distinct from synthesis (combining sources) and from verified direct capture.

## Why This Matters

When an AI agent builds a knowledge base autonomously:
1. **Ungrounded claims slip through** — The agent may generate plausible-sounding statements with no source backing
2. **Synthesis vs hallucination is unclear** — When AI "synthesizes," how do we know it's combining sources vs. inventing?
3. **Verification cannot work** — Without knowing what's grounded vs. ungrounded, verification is meaningless
4. **Confidence is miscalibrated** — Ungrounded claims shouldn't have any confidence score, not just "low"

## What the Seed Currently Covers

1. **Source citation** (line ~100): Notes must cite sources
2. **Confidence markers**: high/medium/low/emerging confidence
3. **Synthesis metadata** (line 694-717): For content combining sources:
   - `knowledge-source-type: synthesis`
   - `synthesis-sources:` list
   - `synthesis-type: cross-source|inductive|deductive|analogical`
   - `synthesis-confidence-calibration: high|medium|low` (typically medium or lower)
4. **Synthesis reliability heuristics** (line 711): Independent sources, explicit reasoning, convergence, recency
5. **Verification status**: unverified/pending/verified

## What's Missing

### 1. Hallucination Detection Criteria

How to identify content that has NO source grounding?

Current guidance: None — synthesis rules assume SOME source exists.

Missing guidance:
- What are detectable signs of completely ungrounded content?
- How to flag claims where AI cannot identify ANY source?
- What's the workflow when hallucination is detected?

### 2. Groundedness Scoring

Current confidence is about source quality. We also need groundedness (has ANY source vs. none).

Missing guidance:
- Add `groundedness: grounded|ungrounded|uncertain` field
- Ungrounded content should have explicit "cannot verify" status
- How to handle uncertain groundedness (AI thinks it has sources but isn't sure)

### 3. Autonomous Capture Confidence Defaults

When AI captures without human oversight, default confidence should be lower.

Missing guidance:
- What's the default confidence for AI-autonomous capture vs. human-assisted?
- When can AI-captured content achieve "high" confidence?
- What's the verification path for autonomous content?

## Proposed Seed Rule Addition

**Rule:** Tag all content with groundedness status — distinguish grounded (has identifiable source), ungrounded (no source), or uncertain (source unclear).

**Why:** Without groundedness tracking, verification is impossible. We need to know whether ANY source exists before we can assess its quality. The Seed covers source quality and synthesis, but not the prior question: does this have any source at all?

**Test:** (1) Can you identify content with no source? (2) Is there explicit `groundedness:` tracking? (3) Do ungrounded claims get different treatment than verified content? (4) Is there a workflow for handling detected hallucinations?

**Implementation:**
```yaml
groundedness: grounded|ungrounded|uncertain
source-count: 0  # number of sources (0 = ungrounded)
sources-identified:
  - [[Note Name]]  # only if grounded or uncertain
hallucination-detection:
  detected: true|false
  detection-method: source-count-zero|reasoning-gap|confidence-anomaly
  human-review-required: true|false
```

**Confidence hierarchy:**
- Grounded + high source quality = high confidence
- Grounded + low source quality = medium/low confidence  
- Ungrounded = no confidence (must flag for review or discard)
- Uncertain = pending verification

**Autonomous capture defaults:**
- AI-only capture: default confidence = medium (not high)
- Requires explicit verification to upgrade
- Human-reviewed capture: can start at high

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Foundation rules (synthesis covered at lines 694-717)
- [[Frontier Exploration - AI Synthesis Provenance]] — Synthesis tracking (assumes sources exist)
- [[Frontier Exploration - AI-Generated Knowledge Detection and Verification]] — Detection methods (may overlap)
- [[Confidence Markers]] — Confidence levels (doesn't address groundedness)
- [[Handling Contradictory Sources]] — Related but covers source conflicts, not absence of sources

---

*Discovered during: Frontier Exploration heartbeat (2026-03-29)*
*Note: Synthesis provenance is partially covered (lines 694-717). This gap focuses on the harder problem: detecting when there are NO sources.*
*Domain: AI-assisted knowledge management*