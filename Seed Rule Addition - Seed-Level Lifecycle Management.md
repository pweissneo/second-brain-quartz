---
last-reviewed: 2026-04-03
lifecycle: seed-extension
confidence: medium
author-type: ai-assisted
status: seed-extension
review-by: 2026-05-03
level: seed-addition
tags:
  - seed-extension
  - seed-evolution
  - meta-knowledge
  - rule-management
---

# Seed Rule Addition - Seed-Level Lifecycle Management

> Addition to Section 9 (Self-Improvement) of the AI-Assisted Knowledge Management Seed.

## The Addition

The Seed covers vault-level self-improvement but lacks explicit rules for Seed-rule-level lifecycle management. This addition fills that gap.

### Rule: Track Seed rule provenance

**Rule:** Every Seed rule must have provenance metadata: when added, what triggered it, and its current status.

**Why:** The Seed accumulates rules over time from different sources (gap analysis, stress tests, conflicts). Without provenance tracking, it's impossible to understand why rules exist, when they were added, or what might be stale.

**Test:** For any Seed rule, can you answer:
1. When was this rule added?
2. What triggered its addition (gap-analysis, stress-test, conflict, manual)?
3. Has it been updated since?
4. Is it active, deprecated, or superseded?

**Implementation:** Use existing Seed metadata fields where possible:
```yaml
last-reviewed: 2026-04-03
lifecycle: active|deprecated|superseded  # use existing lifecycle field
rule-trigger: gap-analysis|stress-test|conflict|manual
rule-review-cycle: 180  # days
rule-superseded-by: [[Replacement Rule Name]]  # if superseded
```

**Note:** This proposal extends existing Seed conventions (`lifecycle:`, `last-reviewed:`) rather than introducing duplicate metadata fields.

### Rule: Audit Seed for internal consistency quarterly

**Rule:** Run quarterly audits to find overlapping, contradictory, or stale Seed rules.

**Why:** The Seed can develop internal issues over time. Without proactive auditing, rules accumulate redundancy and contradictions go undetected.

**Test:** Can you run an audit that finds:
- Rules with >80% keyword overlap (consolidation candidates)
- Rules that contradict each other
- Rules with no updates in >180 days (staleness)

**Implementation:** Create quarterly audit checklist:
- [ ] Run similarity scan for consolidation candidates
- [ ] Check for contradictory rule pairs
- [ ] Flag rules unchanged for >180 days
- [ ] Document findings in Seed Evolution Log

### Rule: Consolidate overlapping Seed rules rather than accumulating

**Rule:** When two Seed rules cover identical use cases, merge them into one stronger rule.

**Why:** The Seed should shrink over time (consolidate redundancy), but consolidation needs explicit criteria. Without it, similar rules accumulate indefinitely.

**Test:** Can you identify two rules that say the same thing? Have you merged them?

**Consolidation criteria:**
- Two rules cover identical use cases
- One rule's test is subset of another's
- Domain-specific extensions make general rule redundant

### Rule: Establish deprecation pathway for obsolete Seed rules

**Rule:** When a Seed rule becomes obsolete, follow a formal deprecation pathway rather than simply deleting it.

**Why:** Rules may be superseded but still referenced. Abrupt deletion breaks links and loses historical context.

**Test:** Is there a documented pathway for retiring obsolete rules?

**Deprecation pathway:**
1. Mark rule as `lifecycle: deprecated` (use existing field)
2. Add `rule-superseded-by:` with migration target
3. Add `last-updated:` timestamp
4. Update all links to point to replacement
5. Remove from active Seed after 180-day sunset

---

## Why This Matters

Without Seed-level lifecycle management:
- Rules accumulate without cleanup (Seed bloats)
- Overlapping rules go undetected (redundancy)
- Stale rules persist indefinitely (outdated guidance)
- No clear path to consolidate similar rules
- Seed growth outpaces Seed improvement

This addition ensures the Seed practices what it preaches for vaults.

## Domain Stress Test

Test this rule in a new domain (photography):
- A photography knowledge base Seed积累了50+ rules over months
- Without provenance: Which rules were added for cameras vs. lighting vs. composition?
- Without audit: Do "exposure triangle" rules overlap with "aperture" rules?
- Without consolidation: Are there 3 rules that could be one?

The rule passes if you can answer provenance questions, run consolidation audits, and follow deprecation pathways for the photography Seed.

## Related

- [[Seed Gap - Seed Meta-Knowledge Layer]] — Gap this addresses
- [[Seed Gap - Seed Rule Lifecycle Management]] — Related gap
- [[Seed Rule Conflict Resolution]] — Reactive handling (this makes proactive)
- [[AI-Assisted Knowledge Management Seed]] — Section 9 Self-Improvement

---

**Reviewed:** 2026-04-03  
**Confidence:** medium  
**Integration target:** Section 9 (Self-Improvement)