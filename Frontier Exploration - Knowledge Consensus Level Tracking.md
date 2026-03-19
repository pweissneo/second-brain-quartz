---
last-reviewed: 2026-03-19
last-updated: 2026-03-19
confidence: emerging
author-type: ai-assisted
lifecycle: emergent
knowledge-type: frontier-exploration
verification-status: unverified
tags:
  - frontier-exploration
  - knowledge-quality
  - consensus-tracking
---

# Frontier Exploration - Knowledge Consensus Level Tracking

## The Gap

The Seed currently tracks:
- **Confidence** (source reliability: high/medium/low)
- **Verification status** (verified/unverified/disputed)
- **Contradictions** (when two credible sources conflict)

But it lacks explicit tracking for the **state of agreement within a field** - whether knowledge represents:
- Established mainstream consensus
- Active scholarly/practitioner debate
- Emerging but not yet widely accepted view
- Minority or fringe position

## Why This Matters

When an AI agent presents knowledge, knowing the consensus level affects:
1. **Presentation** - Present consensus as settled, debate as contested
2. **Weight** - Consensus knowledge deserves more weight in decision-making than minority views
3. **Synthesis** - When combining knowledge from multiple sources, consensus level should inform how much certainty to express
4. **Updating** - Consensus can shift; tracking the current state helps identify when old consensus is being challenged

## How This Differs From Existing Concepts

| Concept | What It Tracks |
|---------|----------------|
| Confidence | Is the source reliable? |
| Verification | Has this been checked? |
| Contradiction | Do two sources conflict? |
| **Consensus Level** | **What does the field agree on?** |

## Proposed Implementation

```yaml
consensus-level: mainstream|debated|emerging|fringe
# mainstream: widely accepted in the field
# debated: active disagreement among experts
# emerging: gaining traction but not settled
# fringe: minority view, not mainstream

consensus-scope: global|regional|disciplinary
# global: worldwide consensus
# regional: varies by region/culture
# disciplinary: differs across specialties

consensus-sources:
  - authority: "who agrees"
    position: "what they say"
```

## Edge Cases

1. **Framework-dependent knowledge** - Some fields have multiple valid frameworks (value vs momentum investing). This isn't debate - it's legitimate pluralism. Track as `framework-dependent: true`.

2. **Temporal shifts** - Consensus changes over time. A note might have been mainstream in 1950 but fringe today. Need temporal tracking.

3. **Domain variation** - What counts as "mainstream" varies by field. Physics consensus is stronger than psychology consensus.

## Test for AI Agents

For any factual claim in the vault:
1. Can you identify the consensus level?
2. Does presenting this knowledge appropriately reflect the level of agreement?
3. If adding new knowledge, what consensus level does it claim?

## Related Seed Rules

- [[Handling Contradictory Sources]] — contradiction handling (could use consensus level to prioritize which source to prefer)
- [[Stress Test - Confidence Markers Rule Across Domains]] — confidence calibration (could extend to include consensus context)
- [[Frontier Exploration - Multi-Perspective Knowledge]] — closely related - tracks different viewpoints
