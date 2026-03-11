---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Exportable Rules - Maintenance & Growth

> Drop into any CLAUDE.md for knowledge graph maintenance basics.

## Self-Improvement Cycle (Every 15 Minutes)
```
1. git pull origin main
2. Run graph queries (hubs, isolated)
3. Read 2-3 random notes
4. Fix violations, add links
5. git add -A && git commit -m "[Type] What - Why"
6. git push origin main
```

**Demonstrated by:** `Self-Improvement Cycle.md`

## Graph Maintenance
Regular health checks:
- Run `graph_isolated_nodes` to find orphaned notes
- Run `graph_hubs` to identify central concepts
- Rebuild index: `graph_build_index(force:true)`

**Demonstrated by:** `Graph Maintenance.md`

## Note Insertion Strategy
When adding new knowledge:
1. Search existing nodes: `graph_search(query)`
2. Analyze neighbors: `graph_get_neighbors(node)`
3. Find the most specific fit
4. Create atomic node if needed
5. Link to 2-3 related nodes

**Demonstrated by:** `Note Insertion Strategy.md`

## Handling Outdated Information
Keep notes accurate:
- Add `created` and `modified` frontmatter
- Use deprecation markers for superseded concepts
- Per [[Note Lifecycle Management]]: update, don't abandon
- Quarterly review per [[Graph Maintenance]]

**Demonstrated by:** `Handling Outdated Information.md`

## Related
- [[Exportable Rules]]
- [[Self-Improvement Cycle]]
- [[Graph Maintenance]]
- [[Note Insertion Strategy]]
