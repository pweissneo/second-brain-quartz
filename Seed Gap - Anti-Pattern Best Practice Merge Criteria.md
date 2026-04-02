---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - anti-pattern
  - best-practice
  - merge-pattern
  - redundancy
gap-status: integrated
gap-priority: medium
gap-source: redundancy-scan-2026-04-01
gap-phase: implementation
analyzed: 2026-04-01
resolved: 2026-04-01
resolved-by: [[AI-Assisted Knowledge Management Seed]]
integration-notes: "Rule added to Seed section 5 (Quality Maintenance) after 'Never delete notes' rule. Anti-Pattern - Over-Organization also merged on 2026-04-01."
---

# Seed Gap: Anti-Pattern to Best Practice Merge Criteria

> Identified gap: The Seed lacks explicit guidance on when to merge an anti-pattern into its corresponding best practice vs. when to keep them as separate notes.

## The Gap

The Seed's anti-pattern handling doesn't address:
1. **Merge criteria** — When should an anti-pattern be merged into its best practice counterpart?
2. **Content duplication detection** — How to identify when anti-pattern and best practice contain identical content
3. **Redirect requirements** — What metadata is needed when deprecating an anti-pattern
4. **Distinct content guidelines** — When does the anti-pattern provide unique value that justifies keeping it separate

The [[Seed Refinement - Anti-Pattern Merge Pattern]] note provides a pattern for the merge, but it's buried in refinements rather than being explicit Seed guidance.

## Why This Matters

Without merge criteria:
- Redundant anti-pattern/best practice pairs accumulate
- Maintenance burden increases (two places to update identical content)
- Conflicting guidance may emerge
- AI agents cannot autonomously determine merge eligibility

## Current State

The vault has at least one anti-pattern (`Anti-Pattern - Note Hoarding`) that was merged into its best practice (`Best Practice - Selective Capture`). The pattern works but:
- It's not codified as a Seed rule
- The criteria for when to apply it are implicit
- AI agents doing redundancy scans need explicit guidance

## Proposed Seed Rule

**Rule:** When an anti-pattern and its corresponding best practice share >50% identical content, merge into the best practice and redirect the anti-pattern.

**Why:** Identical content in both notes creates maintenance burden and confusion. Positive framing (best practice) is more actionable than negative framing (anti-pattern).

**Test:** 
1. Can you identify anti-pattern/best practice pairs with >50% content overlap?
2. Have redirects been created with appropriate metadata?
3. Is the best practice the primary reference?

### Merge Criteria

Apply merge when ALL of:
1. Anti-pattern is purely framing (same content as best practice, just negative)
2. Both notes pass the same test criteria
3. Best practice provides more actionable guidance
4. Keeping both creates maintenance burden

Keep separate when ANY of:
1. Anti-pattern has unique content (specific failure modes, examples)
2. Both notes have distinct test criteria
3. Anti-pattern provides value as a distinct warning pattern
4. Domain-specific anti-pattern content differs from generic best practice

### Required Redirect Metadata

```yaml
redirect_to: [[Best Practice - Name]]
lifecycle: deprecated
correction-type: merged
correction-date: YYYY-MM-DD
corrected-by: [[Best Practice - Name]]
```

## Example Applied

**Anti-Pattern - Note Hoarding** → merged into **Best Practice - Selective Capture**:
- Both contained identical "two-phase workflow" content
- Best practice had more comprehensive guidance
- Anti-pattern had redirect metadata added
- Links preserved via redirect

**Anti-Pattern - Missing Negative Knowledge** → kept separate:
- Contains unique content (types of negative knowledge table, specific failure modes)
- Has distinct test criteria focused on negative knowledge presence
- Provides unique value as a distinct warning pattern

## Related

- [[Seed Refinement - Anti-Pattern Merge Pattern]] — Pattern documentation
- [[Anti-Patterns in Knowledge Management]] — Anti-pattern hub
- [[Best Practices Hub]] — Best practice hub
- [[AI-Assisted Knowledge Management Seed]] — Source of merge guidance needed
- [[Seed Gap - Seed Gap Note Lifecycle Management]] — How gap notes evolve
