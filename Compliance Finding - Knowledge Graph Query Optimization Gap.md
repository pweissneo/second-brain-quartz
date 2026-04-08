---
last-reviewed: 2026-04-08
lifecycle: compliance-finding
confidence: high
author-type: ai-assisted
knowledge-type: meta
tags:
  - compliance
  - seed-gap
  - retrieval-optimization
---

# Compliance Finding - Knowledge Graph Query Optimization Gap

**Date:** 2026-04-08
**Type:** COMPLIANCE_AUDIT (heartbeat method)
**Finding:** Seed gap identified - missing rule for retrieval optimization

## Summary

The Seed includes guidance on storage optimization (atomicity, linking, graph structure) but lacks guidance on **retrieval optimization** - how to make knowledge access efficient as vault grows.

## Gap Analysis

### What's Covered
- 3-hop navigation rule (graph traversal)
- Access-pattern tagging (lookup, learning, decision, inspiration)
- Link density requirements
- Hub node creation

### What's Missing
1. **Query efficiency** - How to measure and optimize retrieval paths
2. **Index structures** - When to create dedicated lookup indexes
3. **Caching strategies** - How to handle frequently accessed knowledge
4. **Access frequency tracking** - Which notes are accessed most

### Evidence from Vault

The note [[Frontier Exploration - Knowledge Graph Query Optimization]] explores this gap but remains a frontier exploration (lifecycle: budding) rather than a Seed rule.

The Seed covers storage organization but not retrieval performance.

## Proposed Resolution

The Seed should include a rule on retrieval optimization for large vaults:

**Rule (PROPOSED):** For vaults exceeding 200 notes, implement retrieval optimization - track access patterns, create index structures for frequent lookups, and measure average retrieval depth.

**Why:** The 3-hop rule assumes equal traversal cost, but in large vaults, some paths are significantly slower. Without retrieval optimization guidance, vaults become inefficient as they grow.

**Test:** Can you measure average retrieval depth for 10 random queries? Is there a caching or index strategy for frequently accessed knowledge?

**Implementation considerations:**
- Access frequency tracking for notes >200
- Hot path optimization for frequently accessed notes
- Index notes for commonly needed facts
- Query path caching

## Related Seed Rules

- [[Graph Traversal Efficiency]] - 3-hop navigation rule
- [[Seed Refinement - Access Pattern Dominance Threshold]] - when to create dedicated entry points
- [[Frontier Exploration - Multi-Representation Knowledge]] - different representation formats

## Vault Status

This finding does not require immediate action - it's a Seed gap identification, not a vault compliance violation. The vault structure is healthy.

---
*Created during COMPLIANCE_AUDIT heartbeat 2026-04-08*