---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# AI-Assisted Link Quality Evaluation

AI can automatically evaluate link quality in a knowledge base.

## Capability

AI systems can analyze links and assess:
- Are links meaningful or decorative?
- Do links pass the "why follow?" test?
- Is there link inflation (too many weak links)?

## Quality Criteria

**Test:** Can AI identify weak links?
- Check: Does each linked note connect meaningfully?
- Check: Can you explain WHY the link exists in one sentence?
- Check: Are there decorative links added for bulk but no substance?

## Implementation

| Check | AI Capability |
|-------|----------------|
| Link necessity | AI reads both notes, evaluates if connection adds value |
| Link reciprocity | AI checks if backlinks exist where meaningful |
| Link density | AI flags notes with >5 outgoing links (inflation risk) |

## Human-in-the-Loop

AI evaluates, human confirms. Auto-deletion risks losing subtle connections that AI can't appreciate.

## Related
- [[Link Quality Rule]]
- [[AI-Assisted Knowledge Management]]
- [[Self-Improvement Cycle]]
