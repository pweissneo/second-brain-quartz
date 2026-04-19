---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-02
lifecycle: seed-refinement
confidence: high
refinement-type: seed-gap-integration
integrates: [[Seed Gap - Seed Rule Lifecycle Management]]
status: proposed
discovered: 2026-03-30
tags:
  - seed-refinement
  - seed-lifecycle
  - meta-knowledge
  - rule-management
---

# Seed Refinement - Seed Rule Lifecycle Management

## Overview

This refinement integrates the Seed Rule Lifecycle Management gap into the Seed. The gap identifies that the Seed has 100+ rules but no internal management system for those rules.

## Integrated Rules

### Rule: Add lifecycle metadata to Seed rules

**Why:** The Seed guides all other knowledge management. If the Seed is unreliable, inconsistent, or bloated, the entire vault degrades. Seed rules deserve the same lifecycle management as regular notes.

**Test:** Can you answer these questions about any Seed rule?
1. When was this rule added?
2. When was it last updated?
3. What was the trigger (gap analysis, stress test, conflict resolution)?
4. Is this rule currently active, deprecated, or superseded?
5. Does this rule overlap with any other rule?

**Implementation:** Add standard metadata to Seed rules:
```yaml
seed-rule:
  added: 2026-03-21
  last-updated: 2026-03-29
  added-via: gap-analysis|stress-test|conflict-resolution|seed-gap
  status: active|deprecated|superseded
  related-rules:
    - [[Rule Name]]
```

**Note:** This metadata should be added to the Seed's frontmatter section, not inline in each rule. The Seed's frontmatter already includes `last-updated` - extend it to track rule-level changes.

### Rule: Audit the Seed for internal consistency quarterly

**Why:** The Seed accumulates rules over time. Without periodic audits, contradictions, redundancies, and stale rules go undetected.

**Test:** 
1. Can you run an audit that finds overlapping rules?
2. Can you find rules that haven't been updated in >180 days?
3. Can you identify rules that contradict each other?
4. Is there a Seed audit report accessible?

**Implementation:** Add Seed self-audit to heartbeat compliance checks. The quarterly audit should:
- Find rules with >80% overlap in scope (suggest for consolidation)
- Find rules with contradictory recommendations
- Find rules with no recent updates (>180 days) that might be stale
- Find rules that reference non-existent other rules

### Rule: Consolidate overlapping rules rather than accumulating them

**Why:** When two rules cover similar territory, the Seed should consolidate rather than add more rules. Overlapping rules create confusion.

**Consolidation criteria:**
- Two rules address the same fundamental principle
- The rules don't contradict but add complexity
- Combining them produces a clearer, more complete rule

**When NOT to consolidate:**
- Rules address different aspects of the same topic
- Rules are domain-specific vs. general
- Rules serve different purposes (preventive vs. corrective)

### Rule: Deprecate rules that have been superseded or made redundant

**Why:** Rules should not only be added — they should also be retired when appropriate.

**Deprecation triggers:**
- Rule was superseded by a more comprehensive rule
- Rule contradicts a newer rule
- Rule was added for a specific context that's no longer relevant
- Rule is redundant with another rule

**Implementation:** Deprecated rules should be moved to an archived section within the Seed (not deleted) to preserve history.

## Relationship to Existing Seed Rules

- Complements: [[Seed Rule Conflict Resolution]] — adds proactive detection to reactive conflict resolution
- Extends: [[Knowledge Deprecation and Retirement Criteria]] — applies deprecation framework to Seed rules specifically
- Integrates with: [[Self-Improvement Cycle]] — Seed maintenance should be part of improvement cycle

## Gap Status

This refinement addresses Seed Gap - Seed Rule Lifecycle Management (discovered 2026-03-30, gap-status: identified).

**Status:** The gap remains identified until these rules are integrated into the Seed. This note serves as the "proposed" stage of the gap lifecycle.

---

**Integrated via:** FRONTIER_EXPLORATION heartbeat (2026-04-02)

**This is a Seed Refinement note**: Proposes rules to integrate a Seed Gap into the Seed. If adopted, update the original gap note's status to "integrated" and resolved-by reference.