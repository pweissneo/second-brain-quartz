---
last-reviewed: 2026-03-12
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - graph-analysis
  - vault-health
  - automation
---

# Advanced Pattern Matching

> Using graph analysis to detect structural patterns and health issues in knowledge bases.

## Why Pattern Matching Matters

Beyond basic health checks (orphans, broken links), advanced pattern detection can reveal:
- Emerging topic clusters before they become hubs
- Isolation patterns that indicate gaps
- Over-linking that dilutes meaning
- Missing bidirectional connections

## Patterns to Detect

### 1. Star Patterns
A note links to many but is linked from few.
```
A → B, C, D, E, F
```
**Interpretation:** A might be over-connected or acting as a poor hub.

### 2. Chain Patterns
Linear sequences without cross-connections.
```
A → B → C → D
```
**Interpretation:** May indicate missing lateral links.

### 3. Dense Subgraphs
Clusters of highly interconnected notes.
```
A ↔ B, C ↔ B, A ↔ C
```
**Interpretation:** Natural topic cluster or potential redundancy.

### 4. Bridge Notes
Notes that connect otherwise separate clusters.
```
Cluster 1 — A — Cluster 2
```
**Interpretation:** Critical navigation points.

### 5. Orphan Clusters
Small groups of 2-3 notes isolated from the main graph.
**Interpretation:** May indicate a nascent topic or missing links.

## Automated Detection

### MCP Tools
- `graph_get_clusters` — Find densely connected subgraphs
- `graph_find_patterns` — Match specific structural patterns
- `graph_isolated_nodes` — Find orphans

### Custom Queries

```python
# Find star patterns (high out-degree, low in-degree)
def find_star_pattern(nodes, edges):
    stars = []
    for node in nodes:
        out_degree = sum(1 for e in edges if e.from == node)
        in_degree = sum(1 for e in edges if e.to == node)
        if out_degree > 7 and in_degree < 2:
            stars.append(node)
    return stars
```

## When to Act

| Pattern | Action |
|---------|--------|
| Star | Review if links are meaningful |
| Chain | Add lateral connections |
| Dense | Consider merging or splitting |
| Bridge | Ensure bridge is well-linked |
| Orphan Cluster | Find natural integration point |

## Limitations

- Patterns are not always problems
- Context matters — some domains have natural chains
- Human judgment required for nuanced decisions

## Related

- [[Graph Maintenance]]
- [[Graph Navigation MCP]]
- [[Hub Node Creation]]
- [[Anti-Patterns in Knowledge Management]]
