---
last-reviewed: 2026-03-11
lifecycle: evergreen
confidence: high
author-type: human
tags:
  - mcp
  - graph
  - navigation
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

## Agent Navigation Workflow

```mermaid
flowchart TD
    A[New Query] --> B{Already in Graph?}
    B -->|Yes| C[Find via graph_search]
    B -->|No| D[Identify related concepts]
    D --> E[graph_related to find 2-hop connections]
    E --> F[graph_get_neighbors_ranked]
    F --> G[Read top results]
    G --> H[Synthesize answer]
```

## Best Practices
1. Always rebuild index after bulk changes: `graph_build_index`
2. Use `graph_hubs` to find good entry points
3. Check `graph_isolated_nodes` regularly
4. Use `graph_related` for discovery

## Why Search is Different

Unlike folders, you search by **connection**, not location:

| Folder Search | Graph Search |
|---------------|--------------|
| "Where did I put it?" | "What connects to X?" |
| By date or topic | By relationship |
| One path | Multiple paths |

## When to Use Each Technique

| Need | Technique |
|------|-----------|
| Know the topic | Concept Search |
| Exploring a note's connections | Neighbor Search |
| Finding hidden connections | Related Search |
| Finding entry points | Hub Search |

## Common Anti-Patterns

- **Searching by date** — Dates don't matter in graphs
- **Searching by folder** — There are no folders (see [[Knowledge Graph Structure]])
- **Only using full-text** — Relationship search finds better results

## Graph Density Management

Link density management is covered in the Seed. Key principles:

- **Optimal density:** 2-7 links per note (minimum 2, target 3-5, maximum 7)
- **Quality over quantity:** Each link should add unique navigational or conceptual value
- **Hub capping:** When a hub exceeds 10+ outgoing links, create intermediary hub notes
- **Prune ruthlessly:** Remove decorative links that don't serve a navigation purpose

See [[AI-Assisted Knowledge Management Seed]] for the full rules on graph density.

## Graph Visualization

Visualizing knowledge graphs helps spot patterns, find gaps, and navigate efficiently.

### Why Visualize

Graph visualization helps:
- Identify hub nodes and clusters
- Find isolated notes
- Understand connection patterns
- Spot structural issues

### Visualization Tools

| Tool | Purpose |
|------|---------|
| Obsidian Graph View | Built-in 3D graph visualization |
| Mermaid | Inline diagrams in notes |
| Draw.io | External diagrams |
| NetworkX + Python | Custom visualizations |

### Mermaid Examples

```mermaid
graph LR
    A[Input] --> B[Capture]
    B --> C[Process]
    C --> D[Connect]
    D --> E[Maintain]
```

### Graph Metrics to Visualize

- **Hub score** — Most connected notes; navigation anchors
- **Clustering** — Topic groups of dense connections
- **Path length** — Navigation distance (shorter is better)
- **Isolation** — Notes with few connections, hard to discover

## Related
- [[Note Insertion Strategy]]
- [[Graph Traversal Efficiency]]
- [[Graph Maintenance]]
- [[AI-Assisted Knowledge Management Seed]]
