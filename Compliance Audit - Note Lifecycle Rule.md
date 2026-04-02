---
last-reviewed: 2026-03-30
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
tags:
  - compliance-audit
  - seed-rule
  - lifecycle
  - resolved
verification-status: verified
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

### ✗ Not Yet Implemented (as of 2026-03-30)
7. **"cyclical" status** — Strategy cycles in/out of favor not explicitly marked (only verification-cycle for seasonal)
8. **"as-of:" for temporal data** — Uses deprecated-date but not temporal "as-of" for archived data

### ✓ Already Implemented (confirmed 2026-04-02)
- **"abandoned" stage** — Now implemented at line 4326: `lifecycle: abandoned` distinguishes unmaintained from deprecated
- **"abandoned-direction"** — Added for creative projects at line 71: tracks abandoned directions with rationale
- **Soft deprecation type** — Added at line 4333: `deprecation-type: hard|soft|historical`

## Recommended Seed Updates

Based on compliance audit (all implemented 2026-04-02):

1. ✓ Add `status: cyclical` for strategies that come in/out of favor — added at line 4331
2. ✓ Add `lifecycle: abandoned` for unmaintained tools — added at line 4326
3. ✓ Add `deprecation-type: hard | soft | historical` — added at line 4333
4. ⏳ Add `as-of: YYYY-MM` to archived temporal data — not yet implemented

## Related Notes
- [[Stress Test - Note Lifecycle Rule Across Domains]]
- [[AI-Assisted Knowledge Management Seed]]