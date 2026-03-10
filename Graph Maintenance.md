---
protected: true
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Graph Maintenance

Regular maintenance keeps the knowledge base **healthy and navigable**.

## Rule
Perform these checks regularly:
1. **Isolated notes**: Run `graph_isolated_nodes` — reconnect orphans
2. **Link density**: Ensure each note has 2-3+ links
3. **Note size**: Check for oversized notes — split if needed
4. **Index health**: Rebuild index with `graph_build_index` after major changes

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
The knowledge base should **evolve and improve itself**:

```
Every 15 minutes:
1. Pull latest changes (git pull)
2. Read graph structure (graph_hubs, graph_search)
3. Review health (isolated notes, link density)
4. Fix issues found
5. Commit and push improvements
```

## Agent Responsibilities
- Monitor graph health proactively
- Split notes that grow too large
- Reconnect orphaned notes
- Suggest new hub notes when needed
- Document improvements in the vault's commit history

## Related
- [[Atomic Note Principle]]
- [[Graph Traversal Efficiency]]
- [[Graph Density Management]]
- [[Knowledge Visualization]]
- [[Self-Improvement Cycle]]
