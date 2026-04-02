---
last-reviewed: 2026-04-02
lifecycle: compliance-audit
confidence: high
author-type: ai-assisted
tags:
  - compliance-audit
  - seed-gap
  - maintenance
  - workflow
compliance-status: gap-identified
compliance-area: operational-maintenance
audit-method: compliance-audit
audited: 2026-04-02
---

# Compliance Audit: Operational Maintenance Workflow Gap

**Date:** 2026-04-02  
**Method:** COMPLIANCE_AUDIT (heartbeat pick-method)  
**Auditor:** heartbeat-2026-04-02

## Summary

The Seed contains comprehensive rules for maintenance-related concepts (burden evaluation, version control, evolution patterns, deprecation workflow), but lacks a **consolidated operational maintenance workflow rule** with executable test criteria.

## Compliance Status

**Status:** GAP IDENTIFIED  
**Severity:** Medium  
**Type:** Missing consolidated rule

## What the Seed Has

The Seed contains scattered maintenance-related guidance:

1. **Maintenance burden evaluation** (line 839) — when to exclude volatile/low-utility knowledge at capture time
2. **Evolution patterns** — how knowledge changes (discrete, slow, cyclical, deepening)
3. **Version control** — tracking change lineage for knowledge with dependencies
4. **Deprecation workflow** (lines 2147-2182) — what to do when knowledge is superseded
5. **Staleness detection** — 30-day rule and categorization (time-stale, reality-obsolete, context-shift)

## What's Missing

An explicit **operational maintenance workflow** rule that provides:
- Scheduled review triggers beyond time-based staleness
- Decision framework for update vs. archive vs. delete
- Maintenance batching strategy
- Obsolescence handling process

**Current test gap:** There's no single test that checks "Does the vault have an operational maintenance system?" The existing tests check individual aspects (staleness detection, deprecation metadata, version control) but not the integrated workflow.

## The Gap in Detail

From [[Seed Gap - Operational Knowledge Maintenance Workflow]]:

> When applying Seed rules to an established vault (100+ notes):
> 1. **Maintenance scheduling** — The Seed says "exclude high-maintenance knowledge" but once captured, how do we systematically schedule reviews?
> 2. **Review triggers** — What indicators should prompt a maintenance review?
> 3. **Decision framework** — For notes needing updates: when to update in-place vs. create new version vs. archive vs. delete?
> 4. **Maintenance batching** — Can maintenance be batched or must it be ad-hoc?
> 5. **Obsolescence handling** — Beyond "mark as deprecated," what's the operational process?

## Seed Rule Test

Checking if Seed has consolidated operational maintenance workflow rule:

- **Test:** Does the Seed have a single rule with test: "Does the vault have: (1) scheduled review triggers? (2) a decision framework for update/archive/delete? (3) maintenance batching strategy? (4) obsolete knowledge handling process?"
- **Result:** NO — individual concepts exist but no consolidated rule with this test

## Recommendation

The Seed Gap note [[Seed Gap - Operational Knowledge Maintenance Workflow]] is well-formed with proposed rules. The gap-status is "analyzed" which means it's ready for:
1. Proposed rule creation in Rule/Why/Test format
2. Seed integration consideration

This compliance audit validates the gap. The next step would be Seed integration (creating a new Seed rule or adding to existing maintenance section).

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Maintenance-related sections (lines 839, 2147-2182)
- [[Seed Gap - Operational Knowledge Maintenance Workflow]] — Source gap note (analyzed, ready for integration)
- [[Seed Gap - Knowledge Deprecation and Obsolescence Management]] — Related gap (resolved)

---

**Audited by:** heartbeat-2026-04-02  
**Method:** COMPLIANCE_AUDIT
