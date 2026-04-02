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
analysis-notes: "Seed has completion criteria for vaults but lacks guidance on domain-level coverage thresholds — when does a topic area have 'enough' notes?"
tags:
  - seed-gap
  - domain-coverage
  - completion-criteria
  - learning
  - prioritization
---

# Seed Gap - Domain Coverage Completion Thresholds

## The Gap

The Seed contains completion criteria at the vault level:
- "Declare construction complete when orphan rate <10%, core domains have hubs, verification ratio >50%, schema is stable (60+ days), and compliance score >85%"

But it lacks guidance at the **domain/topic level**:
1. When has a topic area been "covered enough" for basic competence?
2. When is it comprehensive enough for reference use?
3. How do you distinguish "enough foundational knowledge" from "diminishing returns"?

## Why This Matters

Without domain-level coverage guidance:
1. **Capture continues past usefulness** — agents add notes to a topic beyond where they provide value
2. **No clear stopping point** — no way to know when to move to another topic
3. **Resource misallocation** — effort goes to deepening already-covered areas when it should go to expanding coverage
4. **Learning vs reference confusion** — same metrics used for both purposes when they need different thresholds

## What the Seed Currently Covers

### Vault-Level Completion (Scattered)

- Construction completion criteria (line ~850)
- Completeness targets on hub notes (`completeness-target: core | comprehensive`)
- Diminishing returns test (utility + connection + uniqueness + effort)

### Domain-Level (Sparse)

- "For each major topic area (hub): Can you state what 80% core coverage looks like?"
- No actual threshold definition or measurement method

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

### 3. Learning vs Reference Differentiation

Different thresholds for different purposes:

| Metric | Learning KB | Reference KB |
|--------|-------------|--------------|
| Prerequisite chain | 100% complete | 80% acceptable |
| Example density | High (teaching) | Medium (lookup) |
| Edge cases | Core only | All known |
| Verification ratio | 70%+ | 50%+ |
| Hub depth | 3 hops max | 4 hops acceptable |

### 4. Coverage Assessment Test

**For a given domain hub:**
1. Can you identify the coverage level (foundational/competent/comprehensive)?
2. Does the hub have explicit coverage-target frontmatter?
3. Can you count required notes and compare to threshold?
4. Are prerequisite chains complete for the target level?
5. Does the verification ratio meet the threshold for the target level?

If you cannot answer questions 1-2, the domain lacks coverage planning.
If answers to 3-5 are below threshold, the domain is not yet complete.

### 5. Coverage-to-Diminishing Returns Bridge

When coverage thresholds are met:
- Apply diminishing returns test more strictly
- New notes must pass 4/4 tests (not just 3/5)
- Consider marking domain as "maintenance mode"

When coverage thresholds are NOT met:
- Apply diminishing returns test more leniently
- New notes can pass 2/4 tests if they fill prerequisite gaps
- Prioritize gap-filling over depth

## Gap Type

This is a **Prioritization** gap — the Seed covers what to capture but not when to stop capturing in a given domain.

## Test

Can you for any domain hub answer:
1. What is the target coverage level for this domain?
2. How many notes are required at each level?
3. What's the current coverage percentage?
4. Should effort go to expansion or deepening?

If no to 1-2, domain coverage planning is missing.

## Related Notes

- [[AI-Assisted Knowledge Management Seed#completion-criteria]]
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]
- [[Seed Refinement - Unified Diminishing Returns Rule]]
- [[Frontier Exploration - Learning Progression and Curriculum Design]]
