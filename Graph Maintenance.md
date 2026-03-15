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
1. **Isolated notes**: Find notes with <2 outgoing links — reconnect orphans
2. **Link density**: Ensure each note has 2-3+ links
3. **Note size**: Check for oversized notes — split if needed
4. **Index health**: Rebuild index after major changes

> **Note:** Graph analysis tools are environment-specific helpers. For vaults without specialized tools, use manual link analysis or generic graph visualization tools.

## Test Criteria (for AI Evaluation)
- [ ] Can you find all notes with < 2 links?
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
- [[Weekly Review Process]]
- [[Advanced Pattern Matching]]
