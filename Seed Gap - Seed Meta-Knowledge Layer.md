---
lifecycle: seed-gap
confidence: medium
author-type: ai-assisted
gap-status: proposed
gap-priority: medium
gap-type: seed-missing
discovered: 2026-04-02
gap-phase: implementation
last-reviewed: 2026-04-03
analysis-notes: "While Section 9 (Self-Improvement) covers vault-level improvement, it doesn't address SEED-SPECIFIC lifecycle management - how to track, audit, consolidate, and evolve the Seed's rules as a distinct meta-layer. General vault self-improvement ≠ Seed rule lifecycle management."
tags:
  - seed-gap
  - meta-knowledge
  - seed-evolution
  - rule-management
---

# Seed Gap - Seed Meta-Knowledge Layer

## The Gap

The Seed's Section 9 covers self-improvement for the **vault** (notes, structure, quality metrics), but doesn't address self-improvement for the **Seed itself** as a ruleset.

### What's Covered (Vault-Level)
- Vault must follow its own rules
- Every rule must be demonstrated by at least one note
- If vault consistently violates a rule, the rule may be wrong
- Seed should shrink over time (consolidate redundancy)
- Track quality metrics over time
- Measure utility beyond structure

### What's Missing (Seed-Rule-Level)
1. **Seed rule provenance tracking** — When was each rule added? Why? By what trigger (gap analysis, stress test, conflict)?
2. **Seed rule audit** — How to proactively find overlapping, contradictory, or stale rules?
3. **Seed consolidation criteria** — When should two similar rules merge vs. stay separate?
4. **Seed deprecation pathway** — How to retire obsolete rules (vs. notes)?
5. **Seed evolution visibility** — What's changed in the Seed over time? What's the history?

### Why This Matters

The Seed has grown organically from ~50 rules to 100+ rules over months. Without Seed-specific lifecycle management:
- Rules accumulate without cleanup
- Overlapping rules go undetected
- Stale rules persist indefinitely
- No clear path to consolidate similar rules
- Seed growth outpaces Seed improvement

### Existing Related Content

- [[Seed Gap - Seed Rule Lifecycle Management]] — Gap note (not yet integrated)
- [[Seed Refinement - Seed Rule Lifecycle Management]] — Proposed refinement (not yet integrated)
- [[Seed Rule Conflict Resolution]] — Reactive conflict handling (not proactive detection)
- Section 9 Self-Improvement — Vault-level (not Seed-level)

## Proposed Seed Addition

### Rule: Track Seed rule provenance and evolution

**Why:** The Seed accumulates rules over time from different sources (heartbeats, stress tests, gap analysis). Without provenance tracking, it's impossible to understand why rules exist, when they were added, or what might be stale.

**Test:** For any Seed rule, can you answer:
1. When was this rule added?
2. What triggered its addition (gap analysis, stress test, conflict)?
3. Has it been updated since?
4. Is it active, deprecated, or superseded?

### Rule: Audit the Seed quarterly for internal consistency

**Why:** The Seed can develop internal contradictions, redundancies, and stale rules. Without proactive auditing, these issues accumulate.

**Test:** Can you run an audit that finds:
- Rules with >80% overlap (consolidation candidates)
- Rules that contradict each other
- Rules with no updates in >180 days (staleness)

### Rule: Consolidate overlapping Seed rules rather than accumulating

**Why:** The Seed should shrink over time (as per Section 9), but consolidation needs explicit criteria.

**Test:** Can you identify two rules that say the same thing? Have you merged them?

## Proposed Seed Rules

### Rule: Track Seed rule provenance and evolution

**Rule:** Each Seed rule must include frontmatter tracking: `rule-added` (date), `rule-trigger` (gap-analysis|stress-test|conflict|manual), and `rule-status` (active|deprecated|superseded).

**Why:** The Seed accumulates rules over time from different sources. Without provenance tracking, it's impossible to understand why rules exist, when they were added, or what might be stale.

**Test:** For any Seed rule: (1) Can you find `rule-added` date? (2) Can you identify `rule-trigger`? (3) Is `rule-status` current? Can you answer: "When added? Why? Still relevant?"

### Rule: Audit the Seed quarterly for internal consistency

**Rule:** Run a quarterly Seed audit to detect: (a) rules with >80% keyword overlap, (b) contradictory rule pairs, (c) rules unchanged for >180 days.

**Why:** The Seed can develop internal contradictions, redundancies, and stale rules. Without proactive auditing, these issues compound as the Seed grows.

**Test:** Can you run an audit that finds: overlapping rules? contradictory rules? stale rules? Does audit output identify specific rules by line number?

### Rule: Consolidate overlapping Seed rules rather than accumulating

**Rule:** When two Seed rules have >80% overlap or one's test is subset of another's, merge into single rule with expanded test.

**Why:** The Seed should shrink over time through consolidation, not grow indefinitely. Explicit consolidation criteria prevent rule bloat.

**Test:** For any overlapping rule pair: (1) Is overlap quantified? (2) Has merge been attempted? (3) Does the merged rule have the union of both tests?

### Rule: Deprecate obsolete Seed rules with explicit migration path

**Rule:** Mark deprecated rules with `rule-status: deprecated`, include `replaces:` (which rule replaced it) and `deprecated: YYYY-MM-DD` — keep deprecated rules visible but clearly superseded.

**Why:** Deprecation history helps understand Seed evolution. Deleting deprecated rules loses institutional knowledge about why rules changed.

**Test:** For a deprecated Seed rule: (1) Is `replaces` field present? (2) Does `replaces` point to the new rule? (3) Can you trace the evolution chain?

## Implementation Example

```yaml
# Example Seed rule frontmatter (proposed addition)
rule-added: 2026-04-02
rule-trigger: frontier-exploration
rule-status: active
rule-version: 1.0
```

```yaml
# Example deprecated rule
rule-added: 2026-03-15
rule-trigger: gap-analysis
rule-status: deprecated
deprecated: 2026-04-02
replaces: "[[Rule - Access Pattern Tagging]]"
```

## Gap Status

**Status:** proposed  
**Priority:** medium  
**Gap-phase:** implementation  
**Resolution target:** 2026-04-15

---

**Discovered via:** FRONTIER_EXPLORATION heartbeat (2026-04-02)

This gap is distinct from the existing Seed Gap - Seed Rule Lifecycle Management because it focuses on the meta-layer difference between vault self-improvement (covered) vs. Seed rule self-improvement (not covered).