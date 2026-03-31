---
last-reviewed: 2026-03-30
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-30
gap-source: redundancy-scan
analysis-notes: "Merged from Seed Gap - Domain Coverage Completion Thresholds + Seed Gap - Functional Threshold for Knowledge Bases — both addressed when knowledge is 'enough' from different angles"
tags:
  - seed-gap
  - completion-criteria
  - threshold
  - learning
  - prioritization
---

# Seed Gap - Knowledge Base Completion Thresholds

## The Gap

The Seed contains completion criteria at the vault level:
- "Declare construction complete when orphan rate <10%, core domains have hubs, verification ratio >50%, schema is stable (60+ days), and compliance score >85%"

But it lacks guidance on:
1. **Domain-level coverage** — When has a topic area been "covered enough" for basic competence?
2. **Functional readiness** — When can the knowledge base actually answer real questions?
3. **Learning vs reference differentiation** — Same metrics for both purposes when they need different thresholds

## Why This Matters

Without completion threshold guidance:
1. **Capture continues past usefulness** — agents add notes to a topic beyond where they provide value
2. **No clear stopping point** — no way to know when to move to another topic
3. **Structural ≠ functional** — vault can be structurally sound but unusable
4. **Resource misallocation** — effort goes to deepening already-covered areas when it should go to expansion

## What the Seed Currently Covers

### Vault-Level Completion (Scattered)

- Construction completion criteria (orphan rate <10%, hub coverage >80%, verification ratio >50%, schema stable 60+ days, compliance score >85%)
- Completeness targets on hub notes (`completeness-target: core | comprehensive`)
- Diminishing returns test (utility + connection + uniqueness + effort)

### The Problem in Practice

Consider two vaults with 50 notes:

**Vault A:**
- 5 hub notes with good structure
- 50% verification ratio
- Schema stable for 60 days
- BUT: No entry point, no common questions answered, orphan-like connections

**Vault B:**
- 30 notes, messy structure
- 20% verification ratio
- Unstable conventions
- BUT: Has clear entry point, answers 10+ common questions, useful for daily work

**Current Seed says:** Vault A is more "complete" (passes construction criteria)
**Reality:** Vault B is more useful

## Proposed Seed Enhancement

### 1. Domain Coverage Taxonomy

```yaml
coverage-level: foundational | competent | comprehensive | exhaustive
# foundational: enough for basic understanding and simple tasks
# competent: enough for routine work without external lookup
# comprehensive: enough for reference, edge cases covered
# exhaustive: all known variations, rare conditions included
```

### 2. Coverage Threshold Definition

For each hub note, define explicit thresholds:

```yaml
coverage-thresholds:
  foundational:
    required-notes: 5-10
    required-links: 3+ outbound per note
    prerequisite-completeness: 80%
    hub-distance: 2
  competent:
    required-notes: 15-25
    error-coverage: common-errors documented
    practice-routines: 2+ documented
    verification-ratio: 50%+
  comprehensive:
    required-notes: 30+
    edge-case-count: 10+
    controversy-documentation: present
    historical-variants: documented
```

### 3. Functional Threshold (MVKB - Minimum Viable Knowledge Base)

A functional knowledge base should be able to answer:

**Entry-Level Questions (Newcomer Test)**
- "What is this vault about?" → Can find purpose statement
- "Where do I start?" → Can find 2+ entry points
- "How is this organized?" → Can find navigation guidance

**Common Questions (Utility Test)**
- Can answer 5+ questions someone in this domain would actually ask
- Answers are self-contained (don't require external lookup)
- At least one answer connects 2+ notes together

**Breadth Test**
- Covers at least 2 distinct topic areas
- Each area has a hub with 3+ incoming links
- Cross-topic connections exist

### 4. MVKB Criteria

A vault passes MVKB when:
- ✅ All Entry Point Tests pass
- ✅ 3+ Utility Tests pass
- ✅ All Breadth Tests pass
- ✅ At least 20 notes exist

**After passing MVKB:** Transition from bootstrap mode to active curation.

### 5. Learning vs Reference Differentiation

Different thresholds for different purposes:

| Metric | Learning KB | Reference KB |
|--------|-------------|--------------|
| Prerequisite chain | 100% complete | 80% acceptable |
| Example density | High (teaching) | Medium (lookup) |
| Edge cases | Core only | All known |
| Verification ratio | 70%+ | 50%+ |
| Hub depth | 3 hops max | 4 hops acceptable |

### 6. Coverage-to-Diminishing Returns Bridge

When coverage thresholds are met:
- Apply diminishing returns test more strictly
- New notes must pass 4/4 tests (not just 3/5)
- Consider marking domain as "maintenance mode"

When coverage thresholds are NOT met:
- Apply diminishing returns test more leniently
- New notes can pass 2/4 tests if they fill prerequisite gaps
- Prioritize gap-filling over depth

## Combined Test

**For completion assessment at any level:**

1. **Structural Test:** Orphan rate <10%, hub coverage >80%, verification ratio >50%
2. **Functional Test:** Can answer 5+ real questions, has clear entry points
3. **Coverage Test:** Can identify coverage level (foundational/competent/comprehensive)
4. **Breadth Test:** 2+ topic areas with cross-topic connections

Pass all four = vault is structurally AND functionally complete.

## Gap Type

This is a **Prioritization** gap — the Seed covers what to capture but not when there's enough.

## Related Notes

- [[AI-Assisted Knowledge Management Seed#completion-criteria]]
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]
- [[Seed Refinement - Unified Diminishing Returns Rule]]
- [[Frontier Exploration - Learning Progression and Curriculum Design]]
- [[Frontier Exploration - Knowledge Base Utility Assessment]]

---

*Merged 2026-03-30 from:*
- *Seed Gap - Domain Coverage Completion Thresholds*
- *Seed Gap - Functional Threshold for Knowledge Bases*