---
last-reviewed: 2026-03-13
lifecycle: evergreen
confidence: high
author-type: human
tags:
  - mcp
  - graph
  - tools
---

# Graph Navigation MCP

> **GitHub:** https://github.com/pascalweiss/vault-graph-mcp

The **vault-graph MCP server** enables the agent to navigate and analyze the knowledge graph.

## Available Tools

### graph_search
Find nodes by title or keywords.
```
graph_search(query: "atomic", limit: 5)
```

### graph_hubs
Find the most connected nodes (entry points).
```
graph_hubs(limit: 10)
```

### graph_get_neighbors
Get direct connections from a node.
```
graph_get_neighbors(node: "Concept.md", direction: "both")
```

### graph_get_neighbors_ranked
Get connections sorted by relevance.
```
graph_get_neighbors_ranked(node: "Concept.md", limit: 10)
```

### graph_related
Find connections 2 hops away.
```
graph_related(node: "Concept.md", limit: 5)
```

### graph_isolated_nodes
Find nodes without connections.
```
graph_isolated_nodes()
```

### graph_build_index
Rebuild the graph index after changes.
```
graph_build_index(force: true)
```

## Related
- [[Graph Maintenance]]
- [[Graph Navigation Best Practices]]
- [[Graph Traversal Efficiency]]
- [[AI-Assisted Knowledge Management Seed]]
