---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
gap-status: resolved
gap-priority: medium
discovered: 2026-04-03
resolved: 2026-04-04
resolved-by: [[Seed Refinement - Context Window-Aware Knowledge Organization]]
tags:
  - seed-refinement
  - context-window
  - ai-constraints
  - scalability
---

# Seed Refinement - Context Window-Aware Knowledge Organization

## Gap Resolution

**Original Gap:** The Seed lacks guidance for organizing knowledge bases when AI agents have limited context windows.

**Root Cause:** The Seed assumes AI agents can process entire vaults, run graph queries, and evaluate notes holistically. But real AI deployments have context windows ranging from 8K tokens (local models) to 1M tokens (cloud models).

## Proposed Rule

**Rule (NEW - 2026-04-04):** For vaults exceeding 50% of typical context window capacity, implement context-budgeting strategies — chunked analysis, progressive loading, or summarization layers.

**Why:** Without context-budgeting, large vaults become unmanageable for AI agents with limited context, breaking automated maintenance. The same knowledge organization principles should work regardless of agent context capacity.

**Test:** (1) Can the vault be analyzed in under 50K tokens using key summaries? (2) Is there a chunking strategy for full coverage (per-domain or per-module)? (3) Is a summarization layer available for overview tasks? (4) Does the vault have entry points that enable partial loading?

## Implementation

**Context-budgeting strategies:**

1. **Chunked analysis:** Divide vault into logical segments (by domain, lifecycle status, or alphabetical ranges). Process segments sequentially, tracking state between chunks.

2. **Progressive loading:** Use hierarchical summaries — high-level vault overview first, then drill into specific domains as needed.

3. **Summarization layers:** Maintain compressed vault representations:
   - Graph topology summary (hub nodes, connectivity stats)
   - Domain allocation summary (percentage by domain)
   - Verification backlog summary (pending items by priority)
   - Gap audit summary (identified gaps by status)

4. **Entry point optimization:** Ensure key entry points (root, hubs, domain indexes) contain enough context to load relevant subsets without loading full vault.

**Frontmatter for context-aware processing:**
```yaml
context-budget: 
  estimated-tokens: 45000
  chunking-strategy: domain-based
  chunks: [core-principles, domain-woodworking, domain-cooking, gaps-refinements]
  summarization-available: true
  entry-points: [_root, Anti-Patterns in Knowledge Management, Seed Development Hub]
```

## Edge Cases

1. **Vault below threshold (<50% context):** No special handling needed — standard processing works.
2. **Mixed-context agents:** Use lowest common denominator for compatibility, or detect agent capacity and adapt.
3. **Real-time vs batch processing:** Real-time queries need tighter budgets; batch can load more.
4. **Multi-agent scenarios:** Each agent needs independent context budget management.

## Test Scenarios

| Scenario | Context Capacity | Expected Behavior |
|----------|-----------------|-------------------|
| Small vault | 100K tokens | Full analysis possible |
| Medium vault (300 notes) | 100K tokens | Chunk by domain sequentially |
| Large vault (800 notes) | 50K tokens | Summarization layer required |
| Embedded/local model | 8K tokens | Ultra-compact summaries only |

## Related

- [[Seed Refinement - Vault Self-Monitoring and Health Intelligence]] — health checks that need context
- [[Seed Gap - Multi-Agent Knowledge Base Coordination]] — related scalability concern
- [[AI-Assisted Knowledge Management Seed]] — foundation rules