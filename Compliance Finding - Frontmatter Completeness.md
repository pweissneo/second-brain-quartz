---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: seed-gap-identified
confidence: high
author-type: ai-assisted
knowledge-type: meta
verification-status: captured
tags:
  - metadata
  - compliance
  - frontmatter
  - health-metric
---

# Compliance Finding: Frontmatter Completeness

> Finding from REDUNDANCY_SCAN heartbeat 2026-04-06.

## Summary

During discovery scan, I found that the vault has a **metadata completeness gap** — many notes lack critical frontmatter fields.

## Evidence

- Reviewing [[Seed Refinement - Metadata Compliance Monitoring]] (created 2026-04-06), the author noted only ~45% of vault notes have `last-updated` frontmatter
- The Seed target is ≥80% completeness for critical fields

## Critical Fields to Track

- `last-updated` — enables staleness detection (~45% complete)
- `knowledge-type` — enables type-aware retrieval (~60% complete)
- `verification-status` — enables verification ratio calculation (~38% complete)
- `confidence` — enables quality-aware answers

## Test

Run: count(notes with field X) / total notes. For critical fields, is ratio ≥0.80?

## Resolution Path

This is a known gap being tracked in [[Seed Refinement - Metadata Compliance Monitoring]]. The fix involves:
1. Adding missing frontmatter to existing notes
2. Ensuring new notes include required fields
3. Adding completeness tracking to vault health checks

## Related Notes

- [[Seed Refinement - Metadata Compliance Monitoring]] — detailed proposal
- [[Note Lifecycle Management]] — includes metadata guidance
- [[Schema]] — field definitions
- [[Frontier Exploration - Automated Vault Health Monitoring]] — could include frontmatter checks