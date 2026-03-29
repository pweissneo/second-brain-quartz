---
last-reviewed: 2026-03-27
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
tags:
  - compliance-audit
  - seed-rule
  - lifecycle
  - refinement-needed
verification-status: unverified
---

# Compliance Audit: Note Lifecycle Rule

**Audit target:** Seed Stress Test - Note Lifecycle Rule Across Domains vs. current Seed

## Findings

The stress test identified 9 refinements needed for the Note Lifecycle rule. Current Seed status:

### ✓ Already Implemented
1. **"archived" for temporal data** — Added at line 3770
2. **"living" documents** — Added at line 3773 with review-cadence
3. **Deprecation workflow** — Implemented with full metadata (deprecated-date, deprecated-reason, replaced-by)
4. **Evolution tracking** — Has evolution-history frontmatter

### ⚠️ Partially Implemented
5. **Conditional/context-dependent advice** — Has `knowledge-type: conditional` and some scope tags, but no explicit lifecycle marker
6. **Version-specific frontmatter** — Has `applies-to:` in some contexts but not systematic

### ✗ Not Yet Implemented
7. **"cyclical" status** — Strategy cycles in/out of favor not explicitly marked (only verification-cycle for seasonal)
8. **"abandoned" stage** — No distinction between deprecated and abandoned/unmaintained
9. **Soft deprecation type** — No hard/soft/historical distinction in deprecation-type
10. **"as-of:" for temporal data** — Uses deprecated-date but not temporal "as-of" for archived data

## Recommended Seed Updates

Based on compliance audit:

1. Add `status: cyclical` for strategies that come in/out of favor (not deprecated, just unfashionable)
2. Add `lifecycle: abandoned` for unmaintained tools (distinct from deprecated)
3. Add `deprecation-type: hard | soft | historical` to deprecation metadata
4. Add `as-of: YYYY-MM` to archived temporal data for clarity

## Related Notes
- [[Stress Test - Note Lifecycle Rule Across Domains]]
- [[AI-Assisted Knowledge Management Seed]]