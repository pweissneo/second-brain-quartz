---
last-reviewed: 2026-04-08

id: time-sensitive-knowledge-refresh-automation
title: Time-Sensitive Knowledge Refresh Automation
note-type: exploratory
note-function: gap-documentation
tags: [knowledge-expiration, refresh-automation, temporal-knowledge, seed-gap]
created: 2026-04-05
status: identified
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
---

# Gap: Automated Refresh Triggers for Time-Sensitive Knowledge

## The Problem

The Seed has rules for marking knowledge as time-sensitive (`validity-period`, `expiration-type: inherent`), but lacks guidance on **automated detection and refresh** — how should an AI agent proactively identify what needs re-verification?

## Gap Description

Current Seed covers:
- Metadata for marking time-sensitive knowledge (`validity-period`, `applicability-status`)
- Distinction between "outdated" (wrong) vs "expired" (context passed)

What's missing:
1. **Automatic detection** — What patterns indicate knowledge is time-sensitive? (no explicit guidance)
2. **Refresh triggers** — What events/cycles should cause automatic re-verification prompts?
3. **Proactive aging** — How to set up reminders before knowledge expires?
4. **Bulk refresh** — How to audit vault for time-sensitive knowledge needing review?

## Specific Gaps

### 1. Time-Sensitive Pattern Recognition
The Seed doesn't tell agents WHAT knowledge to flag as time-sensitive. Examples that should trigger:
- References to specific dates/years (not "2023" but "April 15, 2026")
- Version numbers (Ubuntu, Node.js, etc.)
- "Current best practices" language
- Price information
- Seasonal content

### 2. Refresh Schedule Logic
No guidance on how often different knowledge types should be re-verified:
- Annual (tax deadlines, seasonal events)
- Quarterly (financial, technology versions)
- On-event (when a new version releases)

### 3. Proactive Notification
How should the vault surface knowledge approaching expiration? No Seed rule covers:
- Dashboard/monitoring for expiring knowledge
- Pre-expiry alerts
- Bulk review workflows

## Test Criteria (for future rule)

1. Can you scan a vault and identify notes with implicit time-sensitivity (version numbers, "current" language, date references)?
2. Do time-sensitive notes have appropriate refresh schedules?
3. Is there a mechanism to list knowledge approaching expiration?
4. Can you run a bulk audit identifying all knowledge past its validity period?

## Related Notes

- [[Seed Refinement - Context-Dependence Utility Calibration]] — covers applicability scope
- [[Frontier Exploration - Automated Vault Health Monitoring]] — could include expiration checks
- Seed section lines 1078-1080: validity-period metadata (already exists but not automated)
