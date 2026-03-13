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
Perform these checks regularly (using graph MCP tools or manual inspection):
1. **Isolated notes**: Run `graph_isolated_nodes` MCP tool — reconnect orphans
2. **Link density**: Ensure each note has 2-3+ links
3. **Note size**: Check for oversized notes — split if needed
4. **Index health**: Rebuild index with `graph_build_index` MCP tool after major changes

> **Note:** Graph MCP tools (`graph_isolated_nodes`, `graph_hubs`, `graph_search`, `graph_build_index`) are environment-specific helpers. For vaults without MCP access, use manual link analysis or generic graph visualization tools.

## Test Criteria (for AI Evaluation)
- [ ] Can you find all notes with < 2 links?
- [ ] Are all notes reachable from root in ≤3 hops?
- [ ] Is link density between 2-5 per note?
- [ ] Are there any notes > 300 words that need splitting?

## Maintenance Checklist
- [ ] Check for isolated notes weekly
- [ ] Review note sizes monthly
- [ ] Verify link density on new notes
- [ ] Rebuild graph index after bulk additions

## Self-Improvement Cycle
The knowledge base should **evolve and improve itself** through regular heartbeat checks (a few times per day):

```
Each heartbeat (several times daily):
1. Pull latest changes (git pull)
2. Read graph structure (graph_hubs, graph_search)
3. Review health (isolated notes, link density)
4. Fix issues found
5. Commit and push improvements
```

> **Note:** The 15-minute cycle in earlier versions was aspirational. Realistically, 3-4 heartbeats per day (morning, midday, afternoon, evening) provides regular maintenance without burnout.

## Agent Responsibilities
- Monitor graph health proactively
- Split notes that grow too large
- Reconnect orphaned notes
- Suggest new hub notes when needed
- Document improvements in the vault's commit history

## Related
- [[Atomic Note Principle]]
- [[Graph Traversal Efficiency]]
- [[Graph Navigation Best Practices]]
- [[Graph Visualization]]
- [[Frontier Exploration - Vault Health Automation]]
- [[Self-Improvement Cycle]]
- [[Weekly Review Process]]
- [[Advanced Pattern Matching]]
