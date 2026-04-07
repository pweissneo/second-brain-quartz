---
last-reviewed: 2026-04-06
lifecycle: refinement
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - link-density
  - note-type
  - note-function
  - structural-health
note-function: refinement
---

# Seed Refinement: Note-Type and Note-Function Implementation Gap

## The Stress Test

**Rule tested:** Note-type-aware link density and note-function taxonomy (added 2026-04-02/05)

**Domain applied:** General vault structural health

**Finding:** Rules are well-designed but severely under-implemented in the vault.

---

## Analysis

### Rule Design Quality

The note-type and note-function taxonomy rules are conceptually sound:

1. **Note-type** distinguishes: exploratory, reference, safety, foundational, specialized, filter
2. **Note-function** distinguishes: content, gap-documentation, stress-test, refinement, hub

These solve a real problem: uniform link requirements flag structural components as unhealthy.

### Implementation Gap

| Tag | Notes Using It | Expected (for 600+ note vault) |
|-----|---------------|-------------------------------|
| note-type: | 8 | ~100-200 |
| note-function: | 5 | ~50-100 |

### Why This Matters

Without implementation:
- Health checks generate false positives on gap notes, refinement notes, stress tests
- Foundational notes aren't distinguishable from regular content
- Link density rules can't distinguish exploratory notes from reference notes

---

## The Test Sharpening

**Original Test:** "Can you classify notes by note-type/note-function?"

**Problem:** The test checks if classification IS POSSIBLE, not whether it EXISTS. The vault may support note-type in principle but not actually USE it.

**Refined Test:**
1. Count notes with `note-type:` frontmatter — should be >10% of vault for meaningful coverage
2. Count notes with `note-function:` frontmatter — should be >5% of vault
3. Run health check with note-type/function awareness — false positives should drop to <5%

**Edge case:** Newly added rules (2026-04-05) need grace period. Test should allow 30-day ramp-up.

---

## Implementation Recommendation

Rather than retro-tagging all 600+ notes, apply progressively:
1. New notes from 2026-04-06 onward should include note-type/function
2. Existing gap documentation, refinements, stress tests should be tagged when encountered
3. Hub notes should be tagged during routine health checks

The rules are good; adoption should be organic, not forced.

---

## Related

- [[AI-Assisted Knowledge Management Seed]] — Original rules
- [[Seed Refinement - Note-Type-Aware Link Density Rules]] — canonical version, integrated into Seed 2026-04-02
- [[Graph Maintenance]]
- [[Structural Health]] — Related vault hygiene concept