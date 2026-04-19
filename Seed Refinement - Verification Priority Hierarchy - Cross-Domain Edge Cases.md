---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-09
lifecycle: draft
confidence: emerging
tags:
  - seed-refinement
  - verification-priority
  - edge-case
  - cross-domain
  - multi-domain
---

# Seed Refinement: Verification Priority Hierarchy — Cross-Domain Edge Cases

> **Status:** Draft — consolidated from multi-domain stress tests
> **Date:** 2026-04-09
> **Source:** Consolidated from physics, woodworking, cooking, creative-performance stress tests
> **Method:** REDUNDANCY_SCAN

## Background

The Verification Priority Hierarchy rule (added 2026-04-01, lines 404-441) establishes priority order:
- **Level 1 (Critical):** Safety-critical knowledge
- **Level 2 (High):** Hub notes, core principles, foundational definitions
- **Level 3 (Medium):** Frequently-searched notes, entry points
- **Level 4 (Low):** Expensive-to-verify knowledge, redundant notes

Stress testing this rule across multiple domains reveals consistent edge cases that need incorporation into the Seed.

## Consolidated Edge Cases (From Multi-Domain Testing)

### 1. Multi-Priority Tagging

**Domain Evidence:** Woodworking (tool tuning is both safety-critical AND frequently-referenced), Music (correct bow hold is both physical-safety AND artistic-safety).

**Rule:** For notes that fall into multiple verification priority levels, use multi-priority tagging and default to the higher priority level.

**Test:** Can you identify notes with multiple priority tags? Do they default to the higher priority level?

### 2. Verification Modality Distinction

**Domain Evidence:** Physics (theoretical vs experimental have different verification modalities), Music (interpretive verification requires teacher/audience feedback), Craft (embodied verification requires hands-on practice).

**Rule:** Distinguish verification modality in frontmatter — source (reading/watching), drill (hands-on practice), embodied (requires extensive experience to judge).

**Test:** For notes tagged `knowledge-type: experiential` or `embodied: true`, does verification status reflect appropriate modality?

### 3. Domain-Aware Verification Timeframes

**Domain Evidence:** Woodworking (finishing takes 2-4 weeks to verify), Gardening (seasonal), Physics (long-horizon theoretical work), Fitness (8-week adaptation cycles).

**Rule:** Apply domain-specific verification timeframes that override the default 30-day window.

**Implementation:**
```yaml
verification-timeframe: short-term|medium-term|long-term
# Domain defaults:
# - cooking: medium-term (recipes testable quickly)
# - woodworking: medium-to-long-term (finishing, large projects)
# - gardening: long-term (seasonal)
# - fitness: long-term (8-week adaptation cycles)
```

### 4. Source Quality Weighting

**Domain Evidence:** Woodworking (YouTubers with sponsorship have lower reliability than professionals), Physics (pre-prints vs peer-reviewed), Creative (aesthetic judgment requires different source types).

**Rule:** In craft/embodied domains, weight source verification by authority tier before counting toward verification status.

**Test:** For domain notes, does source quality get assessed before verification status is set?

### 5. Domain-Specific Authority Tiers

**Domain Evidence:** "Expert" means different things in academic medicine vs woodworking vs music performance. No unified guidance exists.

**Rule:** Define domain-specific authority tiers for knowledge domains where formal credentials don't exist.

**Implementation:**
```yaml
authority-tier-definitions:
  craft:
    professional: "Makes furniture for sale/commission"
    experienced-hobbyist: "10+ years, multiple completed projects"
    popular: "Large following, may have conflicts of interest"
  physics:
    peer-reviewed: "Journal publication"
    pre-print: "arxiv.org, requires additional verification"
    experimental-group: "Lab with published replication"
  music:
    verified-performer: "Professional performance career"
    teacher: "Certified instruction"
    influential-amateur: "Active community, no credential"
```

### 6. Safety Type Distinction

**Domain Evidence:** Physics (radiation, high voltage, cryogenic), Woodworking (mechanical vs respiratory vs ergonomic), Creative-performance (physical vs artistic damage).

**Rule:** Distinguish safety types — mechanical (immediate danger), respiratory/chemical (long-term), ergonomic (cumulative), artistic (habits that damage long-term development).

**Test:** For safety-critical notes, can you identify the safety type? Are verification priorities appropriate?

### 7. Verification ROI Framework

**Domain Evidence:** Woodworking (finishing verification may take 1000+ hours vs 2 hours for tool technique), Fitness (some metrics take weeks to verify).

**Rule:** Calculate verification ROI to prioritize: ROI = (note_impact × confidence_improvement) / verification_cost_hours.

**Test:** Can you calculate verification ROI? Does verification history prioritize high-ROI items?

### 8. Seasonal/Environmental Constraints

**Domain Evidence:** Woodworking (outdoor finishing only verifiable in summer), Gardening (seasonal growth), Physics (some experiments temperature-dependent).

**Rule:** Tag knowledge requiring specific conditions for verification. Track status appropriately during constraints.

**Test:** Can you identify seasonally-constrained knowledge? Is verification appropriately paused?

### 9. Foundational vs Hub Distinction

**Domain Evidence:** Physics (fundamental equations may have LOW backlinks because everything builds FROM them), Creative (core principles referenced but not linked).

**Rule:** Distinguish foundational notes (build FROM) from hub notes (link TO). Prioritize foundational for verification in new vaults.

**Test:** Can you identify notes that are foundational but lack high backlink counts?

### 10. Cross-Domain Safety Implications

**Domain Evidence:** Physics knowledge applies to engineering/medical/chemistry. A physics note about ionizing radiation is safety-critical for multiple domains.

**Rule:** For knowledge with cross-domain safety implications, verify once but flag for all applicable domains.

**Test:** Can you identify notes with multi-domain safety implications?

## Related Notes

- [[Seed Stress Test - Verification Priority in Physics]] — Original physics stress test
- [[Seed Stress Test - Verification Priority Hierarchy in Woodworking]] — Woodworking stress test
- [[Seed Refinement - Verification Priority in Cooking Domain]] — Cooking domain
- [[Seed Refinement - Verification Priority for Creative-Performance Domains]] — Music/performance
- [[AI-Assisted Knowledge Management Seed]] — Original rule (lines 404-441)

## Resolution

This note consolidates 10 edge cases identified across 4 domain stress tests. The original separate notes are now redundant and can be merged.

---

*Consolidated 2026-04-09 via REDUNDANCY_SCAN. Original notes merged:*
- *Seed Refinement - Verification Priority Hierarchy Edge Cases.md*
- *Seed Refinement - Verification Priority Hierarchy - Woodworking Edge Cases.md*
- *Seed Refinement - Verification Priority Hierarchy - Physics Edge Cases.md*
- *Seed Refinement - Verification Priority in Cooking Domain.md*
- *Seed Refinement - Verification Priority for Creative-Performance Domains.md*