---
protected: true
last-reviewed: 2026-03-13
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - graph
  - maintenance
  - health
---

# Graph Maintenance

Regular maintenance keeps the knowledge base **healthy and navigable**.

## Rule
Perform these checks regularly (using graph analysis tools or manual inspection):
1. **Isolated notes**: Find notes with <2 outgoing links unless tagged `foundational: true` or `specialized: true` — reconnect orphans
2. **Link density**: Ensure each note has 2-3+ links (or appropriate exception tags)
3. **Note size**: Check for oversized notes — split if needed
4. **Index health**: Rebuild index after major changes

> **Note:** Graph analysis tools are environment-specific helpers. For vaults without specialized tools, use manual link analysis or generic graph visualization tools.

## Test Criteria (for AI Evaluation)
- [ ] Can you find all notes with < 2 links (excluding those with `foundational: true` or `specialized: true`)?
- [ ] Are all notes reachable from root in ≤3 hops?
- [ ] Is link density between 2-5 per note?
- [ ] Are there any notes > 300 words that need splitting?
- [ ] Does each note have meaningful outgoing links?

## Maintenance Checklist
- [ ] Check for isolated notes weekly
- [ ] Review note sizes monthly
- [ ] Verify link density on new notes
- [ ] Rebuild graph index after bulk additions

## Self-Improvement Cycle
The knowledge base should **evolve and improve itself** through regular maintenance cycles:

```
Each maintenance cycle:
1. Pull latest changes (git pull)
2. Read graph structure (graph_hubs, graph_search)
3. Review health (isolated notes, link density)
4. Fix issues found
5. Commit and push improvements
```

> **Note:** The frequency of maintenance cycles depends on vault activity. For actively growing vaults, multiple cycles per day may be appropriate. For mature vaults, weekly checks may suffice. Adjust frequency based on vault size and growth rate.

## Agent Responsibilities
- Monitor graph health proactively
- Split notes that grow too large
- Reconnect orphaned notes
- Suggest new hub notes when needed
- Document improvements in the vault's commit history

## Related
- [[Atomic Note Principle]]
- [[Graph Traversal Efficiency]]
- [[Knowledge Graph Structure]]
- [[Frontier Exploration - Vault Health Automation]]
- [[Self-Improvement Cycle]]
- [[Best Practice - Regular Review]] — Weekly Review Process merged here (2026-04-05)
- [[Advanced Pattern Matching]] — Pattern detection techniques (merged 2026-04-07)

---

## Appendix: Pattern Detection Techniques

> Content merged from [[Advanced Pattern Matching]] (2026-04-07)

Beyond basic health checks (orphans, broken links), advanced pattern detection can reveal:
- Emerging topic clusters before they become hubs
- Isolation patterns that indicate gaps
- Over-linking that dilutes meaning
- Missing bidirectional connections

### Patterns to Detect

#### 1. Star Patterns
A note links to many but is linked from few.
```
A → B, C, D, E, F
```
**Interpretation:** A might be over-connected or acting as a poor hub.

#### 2. Chain Patterns
Linear sequences without cross-connections.
```
A → B → C → D
```
**Interpretation:** May indicate missing lateral links.

#### 3. Dense Subgraphs
Clusters of highly interconnected notes.
```
A ↔ B, C ↔ B, A ↔ C
```
**Interpretation:** Natural topic cluster or potential redundancy.

#### 4. Bridge Notes
Notes that connect otherwise separate clusters.
```
Cluster 1 — A — Cluster 2
```
**Interpretation:** Critical navigation points.

#### 5. Orphan Clusters
Small groups of 2-3 notes isolated from the main graph.
**Interpretation:** May indicate a nascent topic or missing links.

### When to Act

| Pattern | Action |
|---------|--------|
| Star | Review if links are meaningful |
| Chain | Add lateral connections |
| Dense | Consider merging or splitting |
| Bridge | Ensure bridge is well-linked |
| Orphan Cluster | Find natural integration point |

### Limitations

- Patterns are not always problems
- Context matters — some domains have natural chains
- Human judgment required for nuanced decisions
