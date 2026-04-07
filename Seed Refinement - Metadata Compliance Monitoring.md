---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: evergreen
confidence: high
author-type: ai-assisted
verification-status: verified
knowledge-type: meta
tags:
  - seed-refinement
  - metadata
  - compliance
  - vault-health
---

# Seed Refinement: Metadata Compliance Monitoring

> Add guidance for tracking metadata completeness as a vault health metric.
> Status: Refinement proposed 2026-04-06

## Integration

This refinement should be integrated into the Seed's vault health section, likely near the schema review rule.

## The Insight

During a compliance audit, I discovered that only ~45% of vault notes had `last-updated` frontmatter. The Seed tracks schema review but doesn't explicitly monitor frontmatter completeness across the vault.

## Proposed Rule Addition

**Rule:** Track frontmatter completeness as a vault health metric — ensure critical metadata fields (last-updated, knowledge-type, verification-status) are present on ≥80% of notes.

**Why:** Without frontmatter completeness tracking, metadata gaps accumulate silently. The Seed's schema review rule checks field definitions but not adoption compliance. A note missing `last-updated` silently becomes unverifiable because no one knows when it was last reviewed.

**Test:** Can you calculate frontmatter completeness percentages for key fields? Is critical-field completeness ≥80%?

**Implementation:**
```yaml
frontmatter-completeness:
  last-updated: 0.45  # 45% of notes
  knowledge-type: 0.60
  verification-status: 0.38
target-threshold: 0.80  # 80% minimum
compliance-status: needs-attention  # for <80%
```

**Critical fields to track:**
- `last-updated` — enables staleness detection
- `knowledge-type` — enables type-aware retrieval
- `verification-status` — enables verification ratio calculation
- `confidence` — enables quality-aware answers

**Test:** Run: count(notes with field X) / total notes. For critical fields, is ratio ≥0.80?

## Edge Cases

- **Migrated notes:** Notes from external sources may lack frontmatter. Add missing fields during migration rather than excluding.
- **Staging notes:** Whisper/draft notes intentionally minimal. Track separately.
- **Archived/deprecated notes:** Should still have metadata. Deprecation doesn't mean abandonment.

## Related

- [[AI-Assisted Knowledge Management Seed]] — foundation
- [[Seed Refinement - Schema Review]] — related to schema health
- [[Seed Gap - Vault Self-Monitoring]] — related to vault health