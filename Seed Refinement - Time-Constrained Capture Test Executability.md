---
last-reviewed: 2026-04-09
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - time-constrained-capture
  - test-executability
---

# Seed Refinement: Time-Constrained Capture Rule - Music Performance Stress Test

> Testing the time-constrained capture rule against a music performance knowledge base reveals significant test executability issues.

## The Problem

The current Seed rule (NEW - 2026-04-08) states:

> When operating under time constraints, ensure every capture includes minimum viable elements: one wikilink, one source or provenance, and a clear question or summary... prioritize by: (1) dependency-critical knowledge, (2) verification-expiring knowledge, (3) foundation-enabling knowledge, (4) unique-to-this-source knowledge, (5) hard-to-recover knowledge.

**Current Test:** "Can you identify time-constrained captures via capture-budget? Do they have ≥1 link, ≥1 source, clear summary? Can you rank capture candidates by priority factors?"

## Stress Test: Music Performance Domain

### Scenario: Quick practice session capture (5 minutes)

A musician has 5 minutes before a lesson and wants to capture something from a YouTube video about finger technique.

**Candidate A:** "Fingernail shape for classical guitar" - 2 videos watched, user specifically wanted this
**Candidate B:** "Warm-up routine discovered in forum" - mentioned in passing, may not come back
**Candidate C:** "Specific piece difficulty notes" - could be reconstructed from sheet music later

### Problems Found

1. **Priority ranking is not executable**: "dependency-critical" requires graph analysis that isn't defined. How does an AI know what's "foundation-enabling" without analyzing the full graph?

2. **No threshold for "expiring"**: What does "verification-expiring" mean? Hours? Days? The rule doesn't specify.

3. **No time-budget to priority mapping**: If I have 1 minute vs 5 minutes vs 15 minutes, how does that change what I capture?

4. **Music performance adds complexity**:
   - Embodied knowledge: Can't capture "how it feels" in 5 minutes
   - Temporal knowledge: Technique videos have process-state cues that are hard to capture briefly
   - Multi-modal: Video (visual), audio (what it sounds like), tactile (hand position)

### What Happens When Everything Is Priority 1?

In practice, ALL knowledge captured in music performance during a time window often feels "important." The rule provides no guidance when:
- All candidates seem dependency-critical
- Multiple items are verification-expiring
- User has 1 minute, not 5

## Proposed Refinement

### Rule (REFINEMENT DRAFT):

**For time-constrained capture, define explicit time-budget thresholds:**

```yaml
capture-budget-thresholds:
  1m:
    max-notes: 1
    requirements: [wikilink, summary]
    priority: dependency-only
  5m:
    max-notes: 2-3
    requirements: [wikilink, source, summary]
    priority: dependency + verification-expiring
  15m:
    max-notes: 5-8
    requirements: [wikilink, source, summary, follow-up-plan]
    priority: all-factors
```

**Define "expiring" explicitly:**

```yaml
verification-expiring:
  temporal-window: 24h|7d|30d  # depends on domain
  triggers:
    - source-becomes-unavailable
    - event-occurs-and-expires
    - time-sensitive-updates
```

**Test becomes executable:**

1. Given `capture-budget`, can you determine max notes to capture?
2. Given candidate list, can you score each by priority factor?
3. Can you rank candidates using explicit scoring algorithm?
4. Do captured notes have required elements for their budget tier?

### Edge Cases to Add

- **Emergency capture (literally no time)**: Just capture the question/summary, defer source/link to follow-up queue
- **Multi-source time slice**: When time-constrained but multiple valuable sources, capture "source reference" + "what to look for" rather than full notes
- **Embodied knowledge special case**: Time-constrained capture of embodied knowledge is inherently incomplete; tag with `incomplete-reason: embodied-requires-practice`

## Test Executability Check

For the rule to be truly testable, an AI must be able to:
1. ✓ Identify capture budget from frontmatter
2. ✗ Score candidates by priority factors (no scoring algorithm defined)
3. ✗ Rank candidates deterministically (subjective ordering)
4. ✗ Determine what's "verification-expiring" (no definition)

**Recommendation:** Add explicit scoring algorithm to make test executable.

---

**Related notes:**
- [[Seed Stress Test - Music Performance Knowledge Base]]
- [[AI-Assisted Knowledge Management Seed]] (time-constrained capture rule)
- [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]]
