---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: medium
---

# Seed Refinement - Knowledge Base Scope Boundaries

## Context

The Seed Gap "Knowledge Base Scope Boundaries" identified that the Seed lacked explicit rules for **what** knowledge belongs in a vault and what **doesn't**. Two rules were added:
- "Define explicit vault boundaries" (categorize keep/tolerate/exclude)
- "Define explicit exclusion criteria" (document what's systematically excluded)

However, two aspects from the original gap remain incompletely addressed:

1. **Completion indicators** — what signs suggest a domain is "complete enough"
2. **Scope evolution** — how to adjust boundaries as the vault matures

## Refinement

### Completion Indicators

**Rule (ADD):** Define domain completion indicators — a domain is "complete enough" when new captures fail the diminishing returns test consistently, foundational hub notes exist, and verification ratio stabilizes above 60%.

**Why:** Without completion indicators, domains grow indefinitely even when they're functionally complete. The Seed's "never declare complete" applies to the vault overall, but individual domains within a vault can reach maturity. Completion indicators enable shifting maintenance effort from capture to verification and depth.

**Test:** For a specific domain (e.g., cooking techniques): (1) Do new notes consistently fail diminishing returns test (3+ fails in last 10)? (2) Do hub notes exist for major sub-topics? (3) Is verification ratio >60%? (4) Do new captures primarily add incremental detail rather than new concepts? If yes to 3+, the domain is complete enough for maintenance-mode focus.

**Implementation:**
```yaml
domain-completion-status: expanding|maturing|complete
completion-indicators:
  diminishing-returns-fail-rate: 0.7  # 70% of recent captures fail
  hub-coverage: 0.8  # 80% of sub-topics have hubs
  verification-ratio: 0.65
  capture-type: incremental  # vs. conceptual
last-completion-assessment: 2026-04-03
```

### Scope Evolution

**Rule (ADD):** Review and adjust scope boundaries annually — as vault purpose evolves, boundaries must evolve to match. Document boundary changes with rationale.

**Why:** Vaults serve changing needs. A vault that started as "programming notes" may evolve to include career development, industry trends, or adjacent technical domains. Without explicit scope evolution, boundaries become stale and misaligned with actual usage.

**Test:** (1) Has scope been reviewed in the last 12 months? (2) Are current boundaries documented? (3) Do boundary changes have documented rationale? (4) Can you identify 2+ areas where current boundaries feel misaligned?

**Implementation:** Annual scope review checklist:
- Re-read `_root.md` purpose statement
- Review capture patterns for the past 6 months
- Identify domains that grew significantly vs. stagnated
- Assess whether original boundaries still serve the vault's purpose
- Document any boundary changes in a `Scope Evolution` note or in frontmatter

```yaml
scope-evolution-history:
  - date: 2026-04-03
    change: "Added career development as explicit scope"
    rationale: "Vault usage shifted toward career planning"
  - date: 2025-06-01
    change: "Narrowed from 'all programming' to 'web development'"
    rationale: "Domain velocity too high for broader scope"
```

**Boundary evolution triggers:**
- Capture ratio skews >70% toward a new domain
- Multiple new domains emerge with high capture activity
- Original purpose feels misaligned with actual usage
- Cross-domain knowledge exceeds 20% of total

## Related Notes

- [[Seed Gap - Knowledge Base Scope Boundaries]] — original gap (now partially addressed)
- [[AI-Assisted Knowledge Management Seed.md]] — contains the base boundary rules
- [[Frontier Exploration - Knowledge Exclusion and Boundary Management]] — frontier note on boundaries
- [[Seed Refinement - Domain-Level Allocation Edge Cases]] — domain-level resource allocation

## Stress Test

- **Recipe vault:** When is the "ingredients" domain complete? When new ingredient notes fail diminishing returns consistently
- **Programming vault:** How do scope boundaries evolve as languages/frameworks change? Annual review triggers boundary adjustment
- **Personal vault:** How to handle scope creep into adjacent areas (e.g., programming vault adding career advice)? Document as scope evolution with rationale