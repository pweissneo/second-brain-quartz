---
last-updated: 2026-04-03
last-reviewed: 2026-04-03
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
verification-status: unverified
evidence-tier: stress-test-derived
knowledge-source-type: deductive
applicability: multi-domain
recurring: false
utility-type: proven
tags: [seed-refinement, verification-priority, edge-case, foundational-vs-hub]
gap-status: analyzed
gap-priority: medium
gap-phase: implementation
seealso: [[Seed Stress Test - Verification Priority in Physics.md], [AI-Assisted Knowledge Management Seed]]
---

# Seed Refinement: Verification Priority Hierarchy - Foundational vs Hub Distinction

> **Date:** 2026-04-03
> **Method:** SEED_STRESS_TEST
> **Source:** Seed Stress Test - Verification Priority in Physics.md
> **Rule Refined:** Verification Priority Hierarchy (lines 404-441)

---

## Problem Identified

The current Verification Priority Hierarchy rule conflates "frequently referenced" with "hub notes" (high backlink count), but these are fundamentally different things in knowledge bases:

- **Hub notes** have high backlink counts because many notes link TO them
- **Foundational notes** have LOW backlink counts because everything builds FROM them
- Both are important for verification but require different approaches

This creates verification errors:
- Hub notes get verified first (high visibility) but foundational correctness matters more
- A wrong foundational note corrupts everything built upon it
- The rule doesn't distinguish between "referenced often" and "foundational"

---

## Edge Cases from Physics Stress Test

### Edge Case 1: Foundational in Physics
- Fundamental equations (Maxwell's equations, Schrödinger equation) are referenced constantly
- But may have LOW backlink counts in small vaults — everything builds FROM them
- The rule prioritizes hub (high backlinks) over foundational (low backlinks but critical)

### Edge Case 2: Implicit Safety-Critical
- Many physics notes contain safety-relevant content without `safety-critical: true` frontmatter
- "Capacitor Discharge Procedures" contains safety info but might not have the tag
- Current rule relies on explicit frontmatter, missing implicit safety knowledge

### Edge Case 3: Small Vault Verification
- Test asks to check "verification history" for priority ordering
- New vaults don't have verification history
- Rule assumes established usage patterns that don't exist yet

### Edge Case 4: Theoretical vs Experimental
- Theoretical physics has virtually no safety-critical but major decision-critical
- Experimental physics has significant safety concerns
- Rule doesn't distinguish domain TYPE within physics

---

## Proposed Refinement

**Rule Update:** Distinguish foundational verification from hub verification:

### Foundational Notes (low backlinks, high dependency)
- **What:** Core equations, fundamental laws, base definitions
- **Verification approach:** Correctness check (does the fundamental hold?)
- **Priority:** Level 1 if foundational is also safety/decision-critical
- **Detection:** Notes with many forward references but few backlinks

### Hub Notes (high backlinks, high connectivity)
- **What:** Topic summaries, reference pages, overview notes
- **Verification approach:** Completeness check (are links valid? is it current?)
- **Priority:** Level 3 (frequently-referenced) unless also safety/decision-critical
- **Detection:** Notes with high backlink counts

### Small Vault Adaptation
- Use **expected frequency** as proxy for "frequently-referenced":
  - Ask: "How often would a practitioner need this?"
  - Foundational notes (fundamental laws) get priority even with zero backlinks
  - Apply expected-frequency scoring for notes without usage history

### Test Update

Original test:
> Do hub notes (high backlink count) get verified before peripheral notes?

Updated test:
> (1) Can you distinguish foundational notes (low backlinks, high forward refs) from hub notes (high backlinks)? (2) Do foundational notes get verified for correctness before hubs get verified for completeness? (3) For small vaults: does expected-frequency scoring replace historical usage? (4) Are safety-critical notes detected by content scanning, not just frontmatter?

---

## Implementation

```yaml
# Foundational vs Hub detection
note-type-analysis:
  foundational-indicators:
    - low-backlinks (< 3)
    - high-forward-references (> 5)
    - fundamental-law: true
    - core-equation: true
  hub-indicators:
    - high-backlinks (> 5)
    - topic-summary: true
    - reference-page: true

# Verification approach by note type
verification-approach:
  foundational:
    method: correctness-check
    focus: "Is this fundamentally correct?"
  hub:
    method: completeness-check  
    focus: "Are links valid? Is content current?"

# Small vault adaptation
small-vault-verification:
  use-expected-frequency: true
  expected-frequency-scoring:
    foundational: high
    procedural: medium
    reference: low
```

---

## Why This Matters

The goal is reliable knowledge. A hub note with broken links is annoying but correctable. A foundational note with wrong information corrupts everything built upon it. The current rule prioritizes visible hub problems over invisible foundational corruption.

This refinement ensures:
1. Foundational correctness gets priority over hub completeness
2. Small vaults can apply the rule without historical data
3. Safety-critical knowledge is detected by content, not just tags

---

## Related Refinements

- [[Seed Refinement - Verification Priority Adaptations]] (general verification priority)
- [[Seed Refinement - Verification Priority Hierarchy Edge Cases]] (existing edge cases)
- [[Seed Stress Test - Verification Priority in Physics.md]] (source stress test)
