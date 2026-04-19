---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-06
lifecycle: seed-refinement
confidence: established
gap-status: identified
gap-priority: high
gap-phase: implementation
gap-severity: useful
gap-source: seed-stress-test
discovered: 2026-04-06
tags:
  - seed-refinement
  - access-pattern
  - entry-points
  - retrieval-optimization
---

# Seed Refinement: Access-Pattern Entry Points Gap

> Identified during SEED_STRESS_TEST on 2026-04-06

## Finding

The access-pattern rule (added 2026-04-03) is partially implemented but incomplete. While tagging works (69 notes have `access-pattern:` frontmatter), the **entry point** requirement is not fulfilled.

### What the Rule Says

> **Test:** (1) Can you filter notes by access-pattern tag? (2) Does the vault have reference indexes for lookup use cases? (3) Are learning paths available for understanding use cases? (4) Are decision trees available for choice-making use cases?

### What's Implemented

| Test Criterion | Status | Evidence |
|---------------|--------|----------|
| Filter by access-pattern | ✅ YES | 69 notes have `access-pattern:` frontmatter |
| Reference indexes for lookup | ❌ NO | No dedicated lookup index exists |
| Learning paths | ❌ NO | No sequential learning path structure |
| Decision trees | ❌ NO | No branching decision structures |

### Root Cause

The rule was added with implementation guidance for frontmatter tagging, but the **entry point types** (reference indexes, learning paths, decision trees, inspiration hubs) were treated as optional rather than required. Without explicit entry points, users must manually filter and traverse notes to find relevant content — defeating the purpose of access-pattern organization.

## Impact

- **Lookup users** must search and filter manually instead of using a curated index
- **Learning users** must discover connections organically instead of following structured paths
- **Decision users** must synthesize options from multiple notes instead of using decision trees
- **Inspiration users** get limited cross-domain recombination benefit

## Proposed Rule Refinement

**Rule (REFINEMENT):** Access-pattern tagging requires corresponding entry point structures — when implementing access-pattern organization, create at least one entry point for each pattern used in the vault.

**Why:** Tagging notes without providing entry points creates hidden content that users can only find via search or traverse. Entry points make access-pattern organization actionable, not just metadata.

**Test:** For each access-pattern with >10 notes, is there a corresponding entry point?
- Lookup → reference index (category-based or alphabetical)
- Learning → learning path (sequential note sequence)
- Decision → decision tree (branching structure)
- Inspiration → inspiration hub (cross-domain connections)

**Implementation:**

1. **Reference Index** (lookup):
   ```yaml
   # Create index note with this structure:
   access-pattern-index: lookup
   index-type: alphabetical|category|topic
   entries:
     - topic: "topic name"
       related-notes: [[Note1]], [[Note2]]
   ```

2. **Learning Path** (learning):
   ```yaml
   # Create path note with sequential structure:
   learning-path: true
   sequence:
     - [[Prerequisite Note]]
     - [[Foundation Note]]
     - [[Application Note]]
   prerequisites: [[Note requiring X]]
   ```

3. **Decision Tree** (decision):
   ```yaml
   # Create tree note with branching:
   decision-tree: true
   root-question: "What are you trying to decide?"
   branches:
     - condition: "If X"
       options: [[Option A]], [[Option B]]
   ```

4. **Inspiration Hub** (inspiration):
   ```yaml
   # Create hub note:
   inspiration-hub: true
   domains-connected: [domain1, domain2, domain3]
   recombination-patterns: [[Pattern1]], [[Pattern2]]
   ```

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Original rule (line ~36)
- [[Seed Refinement - Access Pattern Dominance Threshold]] — Related refinement
- [[Frontier Exploration - Knowledge Access Pattern Optimization]] — Original exploration
- [[Frontier Exploration - Decision-Tree Knowledge Organization]] — Decision structure reference

## Test Criteria (for AI Evaluation)

- [ ] Does this note clearly identify what's implemented vs. what's missing?
- [ ] Is the proposed rule refinement specific and testable?
- [ ] Are implementation examples actionable?
- [ ] Does this address a real user need (finding relevant knowledge by use case)?
