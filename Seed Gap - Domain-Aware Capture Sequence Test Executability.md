---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: deprecated
confidence: high
author-type: ai-assisted
tags:
  - seed-gap
  - capture-sequence
  - stress-test
  - bootstrap
gap-status: resolved
resolved: 2026-04-07
resolved-by: [[Seed Refinement - Domain-Aware Capture Sequence Test Executability.md]]
resolution-type: test-refinement
resolution-note: "Test refined to check for explicit documentation rather than requiring domain knowledge. Frontmatter tracking added for bootstrap phase."
---

# Seed Gap: Domain-Aware Capture Sequence Test Not Executable by AI

## The Problem

The domain-aware capture sequence rule (added 2026-04-06) has a test that is not executable by AI in unfamiliar domains.

**Current test asks AI to:**
1. Identify the first 5 concepts to capture in the correct phase order
2. Explain WHY that sequence
3. Determine when to switch from foundations to applications

**The problem:** These require domain knowledge that AI doesn't have when bootstrapping an unfamiliar domain. The test assumes AI can identify "foundational concepts" in any domain, but this requires either existing expertise or consultation with domain experts.

## Root Cause

The test conflates two different things:
- **Explicit requirements** (safety in phase 1) — verifiable by AI
- **Domain-specific identification** (what are the foundations of pottery?) — not verifiable by AI

## Proposed Rule Refinement

### Option 1: Simplify Test to Explicit Requirements

Make the test check for explicit documentation rather than requiring domain knowledge:

**Rule:** Domain-aware capture sequence should be explicitly documented in frontmatter or a note.
**Why:** AI cannot identify domain fundamentals without existing knowledge or expert input.
**Test:**
1. Is there a `capture-sequence` field in frontmatter or a note documenting the sequence?
2. Does the first phase mention "safety" or "critical"?
3. Is there explicit phase transition criteria documented?

### Option 2: Add Implementation Tracking

```yaml
# In frontmatter
bootstrap-capture-phase: foundations|applications|transitioning
safety-documented-first: true|unknown
```

### Option 3: Provide Domain-Agnostic Identification Heuristics

How to identify foundations in ANY unfamiliar domain:
- Search for "getting started" / "beginner" / "first steps" resources
- Find safety warnings in domain literature
- Identify prerequisite chains
- Review what experts list as "must know first"

## Recommendation

Implement Option 1 + Option 2 — simplify test to check for explicit documentation while adding frontmatter tracking for capture sequence phase.

## Related

- [[Seed Stress Test - Domain-Aware Capture Sequence]] — Stress test that identified this gap
- [[Frontier Exploration - Capture Priority Sequence for Unfamiliar Domains]] — Original frontier note
- [[Seed Refinement - Bootstrap Phase Tracking]] — Future refinement (pending)
- [[AI-Assisted Knowledge Management Seed.md]] — Original rule
