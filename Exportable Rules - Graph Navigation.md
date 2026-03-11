---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Exportable Rules - Graph Navigation

> Drop into any CLAUDE.md for knowledge graph navigation basics.

## Graph Traversal Efficiency
Maximum **3 hops** to reach any node from a hub. Use hub nodes as entry points.

```bash
# Find hubs
npx mcporter call vault-graph.graph_hubs

# Find isolated nodes  
npx mcporter call vault-graph.graph_isolated_nodes
```

**Demonstrated by:** `Graph Traversal Efficiency.md`

## Graph vs Hierarchy
Graph beats hierarchy because:
- No "where should I put this?" - just link
- Serendipitous discovery through connections
- No duplicate notes - one atomic note, many links
- Structure emerges from content, not rigid folders

**Demonstrated by:** `Graph vs Hierarchical Filing.md`

## Hub Node Creation
Hub nodes serve as entry points:
- Create for major topics
- Keep updated with current links
- Use as navigation anchors

**Demonstrated by:** `Hub Node Creation.md`

## Related
- [[Exportable Rules]]
- [[Graph Traversal Efficiency]]
- [[Graph vs Hierarchical Filing]]
- [[Hub Node Creation]]
