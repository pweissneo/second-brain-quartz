---
protected: true
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Graph Traversal Efficiency

The agent must be able to **quickly navigate** from any note to find requested information.

## Rule
- Maximum 3 hops to reach any note from a hub
- Use hub notes as entry points for broad topics
- Ensure every note is reachable from at least one hub

## Test Criteria (for AI Evaluation)
- [ ] Can any note be reached in ≤3 hops from a hub?
- [ ] Do hub notes exist for major topics?
- [ ] Are there any isolated notes with <2 links?
- [ ] Can you navigate from root to any note in ≤3 steps?

## Agent Navigation Strategy
```
1. Identify the query topic
2. Start from relevant hub note
3. Follow links through intermediate notes
4. Reach target note within 3 hops
```

## Hub Nodes
Hub notes are highly connected entries for broad topics:
- Use `graph_hubs` to find most connected notes
- Create hub notes for major themes
- Hub notes should link to sub-topic notes
- Keep hubs under 200 words — their job is navigation, not content

## Graph vs Hierarchy
Graph beats hierarchy because:
- No "where should I put this?" — just link
- Serendipitous discovery through connections
- No duplicate notes — one atomic note, many links
- Structure emerges from content, not rigid folders

## Why 3 Hops?
- Beyond 3 hops, relevance decreases rapidly
- 3 hops balance depth with discoverability
- Agents can traverse efficiently

## Maintenance
Regularly check:
- `graph_isolated_nodes` — find orphaned notes
- `graph_related` — find hidden connections
- Rebuild index if graph feels slow

## Related
- [[Hub Node Creation]]
- [[Graph Maintenance]]
- [[Note Insertion Strategy]]
