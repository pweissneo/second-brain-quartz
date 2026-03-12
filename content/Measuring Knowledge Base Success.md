---
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
tags:
  - metrics
  - quality
  - measurement
sources:
  - title: "Building a Second Brain"
    author: "Tiago Forte"
    link: "https://www.buildingasecondbrain.com/"
  - title: "The Zettelkasten Method"
    author: "Sascha Fast"
    link: "https://zettelkasten.de/introduction/"
---

# Measuring Knowledge Base Success

How to evaluate if your second brain is working.

> **Plain-language guide:** This note uses some technical terms. "Link density" = how well your notes connect to each other. "Hub" = a popular note that many other notes point to. "Isolated note" = a note no other note links to.

## Quantitative Metrics

### Growth Metrics
- **Note count** - More notes = more knowledge captured
- **Link density** - (Links ÷ Notes) ratio; higher means notes are better connected
- **Hub balance** - Top hubs shouldn't dominate the entire graph

### Health Metrics
- **Isolated notes** - Should be minimal (except CLAUDE.md which serves a special purpose)
- **Broken links** - Should be zero
- **Average connectivity** - Each note should link to 2-3 others

## Qualitative Metrics

### Utility
- Can you find information when you need it?
- Do notes connect to form insights?
- Is your writing/thinking enhanced?

### Engagement
- Are you adding notes regularly?
- Do you review your graph?
- Are connections emerging naturally?

## Tools for Measurement

```bash
# Graph health - find most connected nodes
graph_hubs(limit: 10)

# Graph health - find isolated nodes
graph_isolated_nodes()

# Search for concepts
graph_search(query: "keyword", limit: 5)
```

## Warning Signs

| Sign | Meaning |
|------|---------|
| No new notes in months | System not working |
| Many isolated notes | Not linking enough |
| One dominant hub | Imbalance |
| Decreasing links | Connections lost |

## The Ultimate Test

Can you answer a question using your knowledge graph that you couldn't answer before?

## Related
- [[Graph Maintenance]]
- [[Self-Improvement Cycle]]
- [[Graph Traversal Efficiency]]
- [[Exportable Rules]]
