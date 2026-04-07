---
id: seed-gap-time-sensitive-knowledge-automation
title: Seed Gap - Time-Sensitive Knowledge Refresh Automation
note-type: exploratory
note-function: gap-documentation
gap-type: seed-missing
gap-status: integrated
gap-priority: medium
gap-source: frontier-exploration
gap-severity: useful
discovered: 2026-04-05
resolved: 2026-04-06
resolved-by: [[Seed Refinement - Time-Sensitive Knowledge Automated Refresh]]
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
---
---

# Seed Gap: Time-Sensitive Knowledge Refresh Automation

## Gap Description

The Seed has rules for marking time-sensitive knowledge with `validity-period` metadata (lines 1078-1108), but lacks guidance on **automated detection and refresh triggers** — how should an AI agent proactively identify what needs re-verification before it becomes outdated?

## Current Seed Coverage

Existing rules address:
- `validity-period` metadata for marking knowledge with inherent expiration
- `expiration-type: inherent` distinction from `outdated` knowledge  
- `applicability-status: active|expired|archived` tracking
- `was-valid-until` for retrospectively marked outdated knowledge

What's **missing**:
1. **Pattern recognition** — What content patterns indicate implicit time-sensitivity?
2. **Refresh triggers** — What events should cause re-verification prompts?
3. **Proactive alerts** — How to surface knowledge approaching expiration?
4. **Bulk audit capability** — How to scan vault for time-sensitive knowledge?

## Examples of Time-Sensitive Knowledge

| Domain | Time-Sensitive Content | Refresh Frequency |
|--------|----------------------|-------------------|
| Technology | Version numbers (Ubuntu, Node.js) | On new release |
| Financial | Stock exchange listings | Quarterly |
| Seasonal | Planting guides, travel recommendations | Annual |
| Legal | Tax deadlines, filing requirements | Annual |
| Medical | Treatment protocols | On new research |

## Proposed Rule (Rule/Why/Test format)

**Rule:** Implement automated time-sensitive knowledge detection and refresh triggers — scan for implicit time markers, set expiration-based reminders, surface knowledge needing verification.

**Why:** Manual tracking of time-sensitive knowledge doesn't scale. Without automation, vaults accumulate stale knowledge that appears verified but has expired. The Seed has metadata schema but no operational guidance for using it proactively.

**Test:**
1. Can you scan a vault and identify notes with implicit time-sensitivity (version numbers, "current" language, specific date references)?
2. Do time-sensitive notes have appropriate `validity-period` metadata?
3. Is there a mechanism to list knowledge approaching expiration?
4. Can you run a bulk audit identifying all knowledge past its validity period?

## Implementation Sketch

```yaml
# Frontmatter extension for refresh automation
refresh-trigger: on-release|scheduled|manual
refresh-interval: 30d|90d|1y
last-refreshed: 2026-04-05
next-refresh-due: 2026-05-05
auto-alert: true  # surface in dashboard
```

**Automation workflow:**
1. **Detection** — Scan for: version numbers, "current/best/latest" language, specific dates, "as of [date]" phrasing
2. **Classification** — Assign refresh frequency based on domain
3. **Monitoring** — Dashboard showing expiring/expired knowledge
4. **Alerting** — Pre-expiry notifications for critical knowledge

## Related Seed Sections

- [[AI-Assisted Knowledge Management Seed]] (Lines 1078-1080): `validity-period` metadata — foundation, needs automation layer
- [[AI-Assisted Knowledge Management Seed]] (Lines 792-804): Correction handling — reactive, not proactive
- [[AI-Assisted Knowledge Management Seed]] (Lines 278-282): Safety gap identification — could apply temporal checks to safety-critical knowledge
- [[Frontier Exploration - Automated Vault Health Monitoring]] — could include expiration checks
- [[Frontier Exploration - Knowledge Context Transition and Goal Drift]] — related temporal concerns
- [[Seed Gap - Knowledge Reorganization vs In-Place Updates]] — updating strategies

## Resolution Notes

(To be filled when resolved)
