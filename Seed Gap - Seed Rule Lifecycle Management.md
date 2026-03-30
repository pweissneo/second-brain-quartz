---
last-reviewed: 2026-03-30
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-30
gap-source: frontier-exploration
gap-phase: discovery
gap-review-date: 2026-04-30
analysis-notes: "Seed has 100+ rules accumulated over time. No rules for managing the Seed itself — rule consolidation, deprecation, internal consistency, evolution tracking."
tags:
  - seed-gap
  - seed-maintenance
  - meta-knowledge
  - rule-lifecycle
---

# Seed Gap - Seed Rule Lifecycle Management

## The Gap

The Seed contains 100+ rules covering foundation, atomicity, linking, navigation, quality, verification, domain adaptation, and more. These rules have been added over time through heartbeats, stress tests, and gap analysis. However, **the Seed has no rules for managing itself** — no guidance on:

1. **Rule consolidation**: When two rules cover the same territory, should they be merged?
2. **Rule deprecation**: When does a rule become obsolete or redundant?
3. **Rule conflict detection**: Beyond the existing Seed Rule Conflict Resolution note, how do you identify conflicting rules proactively?
4. **Rule evolution tracking**: How does the Seed change over time? What's the history?
5. **Internal consistency auditing**: Does the Seed contradict itself?
6. **Rule pruning**: Can rules be removed, or do they only accumulate?

## Why This Matters

Without Seed lifecycle management:

1. **Rule bloat**: The Seed grows indefinitely, with overlapping and contradictory rules that confuse AI agents
2. **Stale rules**: Rules added in 2024 may no longer apply in 2026, but there's no mechanism to surface or update them
3. **Contradiction blindness**: Without proactive conflict detection, the Seed may contain rules that contradict each other in edge cases
4. **No consolidation path**: When a new insight is essentially a refinement of an existing rule, there's no guidance on whether to update the existing rule or add a new one
5. **Self-referential gap**: The Seed helps manage knowledge about any domain — but what helps manage knowledge about the Seed itself?

## What the Seed Currently Covers

### Seed Evolution (Scattered)

1. **Gap lifecycle**: "identified → analyzed → proposed → integrated → deprecated"
2. **Gap-to-Seed pathway**: When gap analysis reveals a missing rule, create a Seed Gap note documenting the proposed rule
3. **Seed Rule Conflict Resolution**: Priority hierarchy for resolving conflicts when they occur (2026-03-21)
4. **Self-Improvement Cycle**: The vault's feedback loop for improvement
5. **Knowledge Deprecation**: Rules for deprecating regular notes, but not Seed rules themselves

### What's Missing

1. **No Seed rule lifecycle** — rules don't have explicit creation, update, deprecation, or retirement paths
2. **No rule overlap detection** — two rules covering similar territory aren't flagged for consolidation
3. **No Seed audit mechanism** — no way to proactively check the Seed for internal consistency
4. **No rule version history** — no tracking of when rules were added, updated, or changed
5. **No consolidation criteria** — guidance on when to merge rules vs. keep them separate
6. **No deprecation pathway for rules** — unlike notes (which can be deprecated), rules only accumulate

## The Deeper Pattern: Self-Referential Knowledge

The Seed helps manage knowledge about any domain. But there's a specific category of knowledge that the Seed doesn't explicitly address: **meta-knowledge about the Seed itself**.

Examples of meta-knowledge the Seed might contain:
- "This rule was added after stress testing in the cooking domain"
- "These two rules were in tension until the 2026-03-21 update"
- "This rule is redundant with Rule X but kept for backward compatibility"
- "This rule applies to vaults >50 notes only"

This meta-knowledge is valuable for:
- Understanding why rules exist (helps AI agents apply them correctly)
- Tracking rule evolution (when did this rule change? why?)
- Resolving conflicts (knowing which rule is newer/more authoritative)
- Auditing for consistency (can identify conflicting rules programmatically)

## Real Examples in the Seed

The Seed already contains meta-knowledge about itself, but inconsistently:

1. **Rule dating**: Some rules have dates ("NEW - 2026-03-29"), others don't
2. **See also links**: Rules reference each other, but without version context
3. **Edge case attribution**: Edge cases are dated ("stress test 2026-03-21") but rules aren't
4. **Gap lifecycle**: Seed Gaps have lifecycle stages, but integrated rules don't have corresponding metadata

## Proposed Seed Rules

### Rule: Treat Seed rules as first-class knowledge with lifecycle metadata

**Why:** The Seed guides all other knowledge management. If the Seed is unreliable, inconsistent, or bloated, the entire vault degrades. Seed rules deserve the same lifecycle management as regular notes.

**Test:** Can you answer these questions about any Seed rule?
1. When was this rule added?
2. When was it last updated?
3. What was the trigger (gap analysis, stress test, conflict resolution)?
4. Is this rule currently active, deprecated, or superseded?
5. Does this rule overlap with any other rule?

**Implementation:** Add standard metadata to each Seed rule:
```yaml
seed-rule:
  added: 2026-03-21
  last-updated: 2026-03-29
  added-via: gap-analysis|stress-test|conflict-resolution|seed-gap
  trigger-note: [[Seed Gap - Creative Project Phase Knowledge]]
  status: active|deprecated|superseded
  supersedes: [[Old Rule Name]]  # if replacing an old rule
  related-rules:
    - [[Rule Name]]  # rules that overlap or relate
  version-history:
    - date: 2026-03-21
      change: "Initial addition"
    - date: 2026-03-29
      change: "Added edge case for domain-X"
```

### Rule: Audit the Seed for internal consistency quarterly

**Why:** The Seed accumulates rules over time. Without periodic audits, contradictions, redundancies, and stale rules go undetected. The Seed should hold itself to the same standards it applies to knowledge bases.

**Test:** 
1. Can you run an audit that finds overlapping rules?
2. Can you find rules that haven't been updated in >180 days?
3. Can you identify rules that contradict each other?
4. Is there a Seed audit report accessible?

**Audit checklist:**
- [ ] Find rules with >80% overlap in scope (suggest for consolidation)
- [ ] Find rules with contradictory recommendations
- [ ] Find rules with no recent updates (>180 days) that might be stale
- [ ] Find rules that reference non-existent other rules
- [ ] Find rules with missing or incomplete metadata
- [ ] Check that "NEW" markers are removed after 30 days

### Rule: Consolidate overlapping rules rather than accumulating them

**Why:** When two rules cover similar territory, the Seed should consolidate rather than add more rules. Overlapping rules create confusion about which to follow and bloat the Seed unnecessarily.

**Consolidation criteria:**
- Two rules address the same fundamental principle
- The rules don't contradict but add complexity
- Combining them produces a clearer, more complete rule

**When NOT to consolidate:**
- Rules address different aspects of the same topic (keep separate)
- Rules are domain-specific vs. general (keep separate)
- Rules serve different purposes (one is preventive, one is corrective)

**Test:** Can you find 3+ pairs of rules that should be consolidated? After consolidation, is the Seed clearer and more actionable?

### Rule: Deprecate rules that have been superseded or made redundant

**Why:** Rules should not only be added — they should also be retired when appropriate. A Seed with 100+ rules that includes deprecated ones is harder to navigate and trust.

**Deprecation triggers:**
- Rule was superseded by a more comprehensive rule
- Rule contradicts a newer rule (and the newer rule should win)
- Rule was added for a specific context that's no longer relevant
- Rule is redundant with another rule (and consolidation happened)

**How to deprecate:**
```yaml
seed-rule:
  status: deprecated
  deprecated: 2026-03-30
  deprecated-reason: superseded-by-better-approach
  replaced-by: [[New Rule Name]]
  preserve-history: true  # keep deprecated rules in archived section
```

**Deprecation vs. deletion:** Keep deprecated rules in an archived section of the Seed (not removed entirely) to preserve history and reasoning.

### Rule: Track rule evolution as explicit history in the Seed

**Why:** Understanding why a rule exists helps AI agents apply it correctly. A rule added after stress testing in medical domain carries different weight than a rule added via gap analysis in a single heartbeat.

**What to track:**
```yaml
seed-rule-evolution:
  rule-name: "Rule about X"
  additions:
    - date: 2026-03-21
      source: "Seed Gap - Domain-X Analysis"
      reason: "Missing rule for handling Y"
    - date: 2026-03-29
      source: "Stress test in cooking domain"
      reason: "Edge case discovered"
  modifications:
    - date: 2026-03-28
      before: "Original text"
      after: "Updated text with edge case"
      reason: "Refinement based on testing"
  deprecations:
    - date: 2026-03-30
      replaced-by: "[[New Rule]]"
      reason: "Consolidated with overlapping rule"
```

## Edge Cases

### Edge Case: Rule that seems redundant but serves different purposes

Some rules may appear to overlap but serve different needs:
- "Use controlled vocabularies for tags" vs. "Use consistent note naming"
Both are about consistency, but different types. Don't consolidate rules that serve different consistency needs.

### Edge Case: Domain-specific rules vs. general rules

The Seed has domain-specific edge cases (medical verification 70%, woodworking equipment tiers). These are part of the general rule, not separate rules. Don't confuse "edge case in rule" with "separate rule."

### Edge Case: Seed Rule vs. Seed Gap

A Seed Gap is a proposal. A Seed Rule is an adopted standard. The lifecycle should be:
1. Gap identified → Gap analyzed → Gap proposed (as Seed Rule)
2. Seed Rule added → Seed Rule tracked → Seed Rule updated/deprecated

The current gap lifecycle ends at "integrated" but doesn't document the full rule lifecycle after integration.

### Edge Case: Backward Compatibility

When deprecating a rule that users may depend on, provide a migration path:
- Mark as deprecated but functional for 90 days
- Add `deprecated-warning:` frontmatter
- Link to replacement rule

### Edge Case: The Seed Is Self-Managing

The Seed manages knowledge about any domain. If the Seed also manages itself, there's a self-referential loop. This is acceptable as long as:
- Meta-rules are clearly marked as Seed-internal
- The Self-Improvement Cycle handles Seed management
- Heartbeat compliance audits include Seed audit

## Implementation Questions

1. **Where to store archived/deprecated rules?** In the Seed itself (archived section) or in separate notes?
2. **How to handle rule version numbers?** The Seed doesn't use versioning — should it?
3. **Who approves rule additions/deprecations?** Currently automated; should humans review?
4. **How to prevent Seed bloat?** Is there a maximum rule count? Maximum age for rules without review?

## Relationship to Existing Seed Rules

- Complements: [[Frontier Exploration - Seed Rule Conflict Resolution]] — adds proactive detection
- Complements: [[Frontier Exploration - Knowledge Deprecation and Retirement Criteria]] — extends deprecation to Seed rules
- Complements: [[Self-Improvement Cycle]] — the cycle should include Seed maintenance tasks
- Distinct from: Gap lifecycle — gap lifecycle is pre-integration, rule lifecycle is post-integration
- Distinct from: Note lifecycle — notes and rules have different management needs

## Test for Gap Closure

Can you:
1. Generate a list of all Seed rules with lifecycle metadata (added, updated, status)?
2. Run an audit that finds overlapping rules for consolidation?
3. Identify rules that haven't been updated in >180 days?
4. Find rules that reference non-existent other rules?
5. Produce a Seed health report (rule count, deprecation rate, last audit date)?

If yes to all 5, the gap is closed.

## Related Notes

- [[Frontier Exploration - Seed Rule Conflict Resolution]] — conflict detection (already exists)
- [[Frontier Exploration - Knowledge Deprecation and Retirement Criteria]] — deprecation framework
- [[Self-Improvement Cycle]] — should include Seed maintenance
- [[Seed Gap Analysis Methodology]] — gap lifecycle
- [[Seed Gap - Vault Self-Monitoring and Health Intelligence]] — health monitoring

---

**Note discovered during:** FRONTIER_EXPLORATION heartbeat (2026-03-30)

**This is a Seed Gap note**: Proposes a missing area the Seed doesn't fully address. If validated, should become Seed rules for managing the Seed itself.