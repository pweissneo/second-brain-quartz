---
protected: true
last-reviewed: 2026-03-08
lifecycle: evergreen
tags:
  - structure
confidence: high
author-type: ai-assisted
---

# Knowledge Graph Structure

A graph-based knowledge system outperforms hierarchical systems. This note covers **why** graphs work.

## Why Graphs Beat Folders

**Problems with folders:**
- Notes in different folders cannot see each other
- You must remember where you put things
- Cross-topic connections are impossible

**Power of graphs:**
- Any note connects to any note
- Discoverability through graph traversal
- Emergent structure from content itself

### Network Effects

As the graph grows:

| Growth | Folder System | Graph System |
|--------|---------------|--------------|
| 100 notes | Hard to navigate | Rich connections |
| 1000 notes | Overwhelming | Value increases |
| 10000 notes | Broken | Knowledge engine |

### The Serendipity Factor

Graphs enable unexpected discoveries:
- `graph_related` finds non-obvious connections
- Following backlinks reveals hidden patterns
- Hub nodes surface important concepts

See [[Emergence in Knowledge Graphs]] for how connections generate insights.

## Graph Metrics

These targets are defined in [[AI-Assisted Knowledge Management Seed]]:

| Metric | Target |
|--------|--------|
| Average links per node | 3-5 |
| Maximum hops to any node | 3 |
| Isolated nodes | 0 |

See [[Graph Traversal Efficiency]] for navigation rules.

## Implementation

We combine:
- [[Zettelkasten Method]] (atomic notes)
- [[Graph Navigation Best Practices]] (agent capability)
- [[Hub Node Creation]] (entry points)

## Visual Comparison

### Hierarchical Filing

```
Knowledge/
├── Topics/
│   ├── Science/
│   │   ├── Physics/
│   │   └── Biology/
│   └── History/
│       ├── Ancient/
│       └── Modern/
└── Projects/
```

**Characteristics:**
- Folder-based, location-dependent
- One parent per item
- Good for storage, bad for discovery

### Knowledge Graph (Our Approach)

```
[[Atomic Note Principle]] ←→ [[Linking Principle]] ←→ [[Note Insertion Strategy]]
       ↓                  ↓                  ↓
   [[Note Types and Templates]]    [[Graph Maintenance]] [[Emergence in Knowledge Graphs]]
```

**Characteristics:**
- Link-based, location-independent
- Multiple connections per node
- Good for discovery, emergent structure

## Hybrid Approach

Use hierarchy for broad categorization (PARA), graph for internal linking:

```
PARA/Resources/
├── Finance/
│   └── [All finance notes linked by graph]
└── Tech/
    └── [All tech notes linked by graph]
```

This combines the best of both: top-level organization without constraining cross-topic discovery.

## Related
- [[Zettelkasten Method]]
- [[Graph Traversal Efficiency]]
- [[Graph Maintenance]]
- [[Hub Node Creation]]
- [[Emergence in Knowledge Graphs]]
