---
protected: true
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
---

# AI-Assisted Knowledge Management

How AI enhances each stage of the knowledge management pipeline.

## AI-Assisted Enhancements

| Task | Human Only | AI-Assisted |
|------|------------|-------------|
| Capture | Manual entry | Autonomous ingestion |
| Processing | 5-15 min/note | AI can draft, human refines |
| Linking | Manual search | AI suggests connections |
| Maintenance | Weekly checks | Continuous monitoring |

## Capabilities

**Capture:** Agents autonomously collect from APIs, web searches, document processing
**Processing:** AI drafts atomic notes, humans refine
**Linking:** AI suggests connections based on semantic similarity
**Maintenance:** Continuous monitoring of graph health

### Connection Suggestion

AI systems can analyze notes and suggest meaningful connections that humans might miss:

- **Semantic analysis** — AI reads notes, identifies key concepts
- **Similarity scoring** — AI compares concepts across notes
- **Suggestion generation** — AI proposes connections above threshold
- **Human validation** — Human confirms or rejects suggestions

**Quality Criteria:** Can AI suggest connections humans would value?
- Check: Are suggested connections surprising but valid?
- Check: Can you explain why the connection makes sense?
- Check: Do suggestions increase graph density without inflation?

### Orphan Detection

AI can automatically detect orphaned notes in a knowledge base:

- Notes with no incoming links (orphans)
- Notes with no outgoing links (isolates)
- Notes unreachable from root in ≤3 hops

**Why Orphans Matter:**
- Orphans indicate gaps in knowledge structure
- Unlinked notes are effectively invisible in the graph
- They signal either: new content not yet connected, or content that doesn't fit

**Remediation Process:**

| Step | Action |
|------|--------|
| 1 | AI identifies orphan candidates |
| 2 | Human reviews each orphan |
| 3 | Decide: connect, merge, or remove |
| 4 | Update graph structure |

## Quality Evaluation Capabilities

| Capability | Purpose |
|-----------|---------|
| Link Quality Evaluation | Detect weak/decorative links (see [[Linking Principle]]) |
| Orphan Detection | Find disconnected notes |
| Connection Suggestion | Recommend meaningful links |
| Atomic Note Splitting | Identify oversized notes |
| Graph Health Monitoring | Track overall metrics |

## Human-in-the-Loop Principle

AI evaluates, recommends, alerts—but human confirms for:
- Deleting orphans (might lose subtle value)
- Merging notes (might lose granularity)
- Splitting notes (might misjudge atomicity)

Auto-action risks losing context AI can't fully appreciate.

## Related
- [[Linking Principle]]
- [[Atomic Note Principle]]
- [[Knowledge Base Workflow]]
- [[Self-Improvement Cycle]]
