---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# AI-Assisted Note Splitting

AI can identify and split oversized notes into atomic units.

## Capability

AI systems can:
- Detect notes exceeding word count thresholds (200-300 words)
- Identify multiple ideas within a single note
- Create split notes with appropriate content
- Preserve and rewire links bidirectionally

## Quality Criteria

**Test:** Can AI split notes while maintaining graph integrity?
- Check: Are resulting notes truly atomic (one idea each)?
- Check: Are all original links preserved appropriately?
- Check: Are bidirectional links created where meaningful?

## Splitting Triggers

| Trigger | Threshold |
|---------|-----------|
| Word count | > 300 words |
| Multiple ideas | > 1 H2/H3 heading |
| Concept density | > 3 distinct concepts |

## Process

1. **Identify** — AI finds oversized/overfull notes
2. **Analyze** — AI identifies natural split points
3. **Create** — AI drafts new atomic notes
4. **Link** — AI creates bidirectional links
5. **Verify** — Human reviews split quality

## Related
- [[Note Splitting Principle]]
- [[Atomic Note Principle]]
- [[AI-Assisted Knowledge Management]]
