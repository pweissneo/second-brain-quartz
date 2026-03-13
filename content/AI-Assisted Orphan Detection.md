---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# AI-Assisted Orphan Detection

AI can automatically detect orphaned notes in a knowledge base.

## Capability

AI systems can identify notes that:
- Have no incoming links (orphans)
- Have no outgoing links (isolates)
- Are unreachable from root in ≤3 hops

## Quality Criteria

**Test:** Is every note reachable and connected?
- Check: Run graph analysis to find notes with 0 incoming links
- Check: Verify all notes are reachable from `_root.md`
- Check: Identify notes with < 2 total connections

## Why Orphans Matter

- Orphans indicate gaps in knowledge structure
- Unlinked notes are effectively invisible in the graph
- They signal either: new content not yet connected, or content that doesn't fit

## Remediation Process

| Step | Action |
|------|--------|
| 1 | AI identifies orphan candidates |
| 2 | Human reviews each orphan |
| 3 | Decide: connect, merge, or remove |
| 4 | Update graph structure |

## Related
- [[Graph Maintenance]]
- [[Graph Traversal Efficiency]]
- [[AI-Assisted Knowledge Management]]
