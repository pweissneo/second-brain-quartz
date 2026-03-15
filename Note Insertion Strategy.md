---
protected: true
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - methodology
  - workflow
  - insertion
---

# Note Insertion Strategy

The agent must be able to find the **correct place** in the graph to insert new knowledge.

## Rule
When adding new information:
1. **Search existing nodes** using `graph_search` to find related concepts
2. **Analyze the graph** using `graph_get_neighbors` and `graph_related` to understand the context
3. **Identify the most specific node** where the new information naturally belongs
4. **Create a new atomic node** if no existing node fits the atomic principle
5. **Link appropriately** to existing related nodes

## Process
```
1. Receive new information
2. Search: graph_search(keywords)
3. Analyze: graph_get_neighbors_ranked(relevant_node)
4. Decide: Create new? Or add to existing?
5. Link: Connect to 2-3 related nodes
6. Register: Use vault-sources if tracking provenance
```

## Why It Matters
- Prevents duplicate nodes
- Ensures new knowledge integrates into the existing graph
- Makes the graph navigable by both humans and agents

## Related
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Graph Traversal Efficiency]]
- [[Progressive Summarization]]
