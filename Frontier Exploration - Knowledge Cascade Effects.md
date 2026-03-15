---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-evolution
  - graph-dependencies
---

# Frontier Exploration - Knowledge Cascade Effects

> How to handle knowledge updates that require cascading changes across multiple notes

## The Problem

Some knowledge doesn't exist in isolation. Updating one note may require updating other notes to maintain consistency. The Seed covers:
- Note lifecycle (draft → active → evergreen → deprecated)
- Deprecation with replacement pointers
- Link rewiring when splitting notes

But it doesn't address: **cascade effects** — when one update necessitates multiple other updates.

## What Are Cascade Effects?

### Type 1: Terminology Changes
You rename a core concept:
- Note A: "Machine Learning" → "Statistical Learning"
- Notes B, C, D all link to "Machine Learning"
- All links must be updated

### Type 2: Scope Changes
A note's scope narrows or expands:
- Note A originally covered "All programming languages"
- Now only covers "Python"
- Related notes about Java, JS may need updates

### Type 3: Hierarchical Restructuring
You discover a better taxonomy:
- Note A was under Category X
- Now belongs under Category Y
- Navigation paths change

### Type 4: Truth Changes
A foundational claim is disproven:
- Note A claimed "X causes Y"
- New evidence shows "X does NOT cause Y"
- All notes citing Note A as evidence need review

### Type 5: Threshold Changes
Quantitative thresholds shift:
- Note A defined "high fever" as >101°F
- Medical guidance updates to >102°F
- All dependent notes need updating

## The Challenge

Current knowledge management treats notes as independent units with links. But knowledge is a network:
- Changing a node may affect its neighbors
- Changing a hub affects all spoke notes
- Changing a foundation affects the entire structure

Without cascade tracking, you get:
- Stale links (pointing to deprecated content)
- Inconsistent terminology (old names still in use)
- Logical contradictions (note A says X, note B says not-X)

## Seed Rule Proposal

**Rule:** Track explicit dependencies for notes that other notes depend on — when updating a foundational note, identify all dependent notes and review them.
**Why:** Cascade failures (stale links, contradictory claims, inconsistent terminology) erode vault credibility. Proactive dependency tracking prevents silent degradation.
**Test:** (1) Can you identify notes that depend on this note? (2) When this note changes, do you have a process to review dependents? (3) Are dependent notes tagged or linked for cascade review?

**Rule:** Use dependency metadata for foundational notes — notes that other notes rely on should have a `dependencies: [list of dependent notes]` field updated on significant changes.
**Why:** Without explicit dependency tracking, cascade effects go undetected until someone notices broken links or contradictions.
**Test:** For notes with >5 incoming links: (1) Is there a dependency list? (2) When was it last reviewed? (3) Can you quickly identify what would break if this note changed significantly?

## Implementation Approaches

### Approach 1: Manual Dependency Tracking
Maintain a `dependencies:` field in frontmatter. Update when significant changes occur.
```
dependencies:
  - [Related Note A]
  - [Related Note B]
```
Pros: Simple, no tooling required
Cons: Manual effort, easily out of date

### Approach 2: Automated Detection
Use graph analysis to find all notes linking to a note before editing.
- Query: `graph_get_backlinks(note)`
- Review all backlinks before making major changes
Pros: Always current
Cons: Requires tooling, doesn't catch semantic dependencies

### Approach 3: Version Anchoring
For stable knowledge, anchor dependent notes to specific versions:
```
version: 1.0
version-compatible-with: [Note Name|1.0+]
```
Changes to the source note trigger version review
Pros: Clear compatibility tracking
Cons: Version management overhead

### Approach 4: Semantic Dependence (Advanced)
Use typed relationships to distinguish:
- `supports:` — this note provides evidence for another
- `contradicts:` — this note disagrees with another
- `refines:` — this note narrows another
- `extends:` — this note builds on another

When any note changes, query for typed relationships and review.

## Detecting Cascade Failures

Regular audits to find:
1. **Contradiction scans**: Find pairs of notes where one contradicts the other
2. **Staleness detection**: Notes citing deprecated content without updated links
3. **Term drift**: Same concept referred to by different terms without redirects

## Related

- [[Note Lifecycle Management]] - Lifecycle stages
- [[Handling Contradictory Sources]] - Handling contradictory claims
- [[Self-Improvement Cycle]] - How knowledge evolves
- [[Graph Maintenance]] - Graph health checks
- [[Stress Test - Note Lifecycle Rule Across Domains]] - Testing lifecycle across domains

## Examples

### Example 1: Terminology Cascade
You discover "AI" is too broad and decide to use "ML" (Machine Learning) instead.
- Update the AI note to redirect to Machine Learning
- Review all notes linking to AI
- Update links or add redirect
- Track terminology decisions (hypothetical)

### Example 2: Foundational Claim Cascade
New research shows "LCD screens cause eye strain" is false.
- Update eye strain causes note with new evidence
- Mark old claim as deprecated 
- Review all notes that cited the old claim
- Update any advice that depended on the false claim (hypothetical)

### Example 3: Threshold Cascade
You change your definition of "enough sleep" from 7 to 8 hours.
- Update sleep requirements note
- Review all notes about productivity, health, learning that cited 7 hours
- Update recommendations or add scope markers (hypothetical)

## Test for AI Agents

Given a note proposed for modification:
1. Query all notes that link to this note (`graph_get_backlinks`)
2. Categorize links: causal support, examples, related, optional
3. For causal/essential links, flag for review after modification
4. After modification, re-audit dependent notes for consistency
