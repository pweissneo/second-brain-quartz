---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-05
last-updated: 2026-04-05
lifecycle: seed-refinement
confidence: emerging
gap-status: proposed
gap-priority: medium
gap-source: frontier-exploration
gap-severity: useful
discovered: 2026-04-05
resolved: 
resolved-by: 
tags:
  - seed-refinement
  - knowledge-expiration
  - automation
  - proactive-verification
---

# Seed Refinement - Time-Sensitive Knowledge Automated Refresh

## Overview

During frontier exploration on 2026-04-05, the vault identified that the Seed has rules for **decay functions** and **attention priority** but lacks guidance on **automated detection and refresh triggers** for time-sensitive knowledge.

This note proposes a Seed refinement to integrate the automation layer.

## Current Seed Coverage

The Seed already includes:

1. **Decay function rules** (lines ~2970-2990):
   - `decay-rate: static|time-sensitive|event-triggered`
   - Review triggers for time-sensitive knowledge
   - Domain-specific decay rates

2. **Attention priority rules** (lines ~2960-2965):
   - `attention-priority: critical|high|medium|low`
   - Critical: needs immediate review
   - High: review within 1 week

3. **Validity period metadata** (lines ~1078-1100):
   - `validity-period` for inherent expiration
   - `expiration-type: inherent`
   - `applicability-status: active|expired|archived`

4. **Advisory validity tracking** (lines ~3005-3010):
   - `advisory-validity-period` for prescriptive advice

**What's missing:** How to implement **automated scanning** for time-sensitive knowledge — the operational layer that actually detects and surfaces knowledge needing refresh.

## The Gap

The Seed provides the **schema** for time-sensitive knowledge but not the **automation** to use it proactively:

| What exists | What's missing |
|-------------|----------------|
| Decay rate field definition | How to scan vault and categorize notes by decay rate |
| Attention priority field | How to generate prioritized review list |
| Validity period metadata | How to detect notes approaching expiration |
| Advisory validity period | How to surface expired advisory notes |

## Proposed Seed Extension

**Rule (NEW - 2026-04-05):** Implement automated time-sensitive knowledge refresh workflow — scan for implicit time markers, classify by decay rate, surface knowledge approaching expiration.

**Why:** Manual tracking of time-sensitive knowledge doesn't scale. The Seed has metadata schema (decay-rate, attention-priority, validity-period) but no operational guidance for using it proactively. Without automation, vaults accumulate stale knowledge that appears verified but has expired. The automation layer transforms static metadata into actionable alerts.

**Test:** Can you:
1. Scan vault for notes with implicit time-sensitivity (version numbers, "current" language, specific date references)?
2. Automatically classify notes by decay rate?
3. Generate a dashboard of knowledge approaching expiration?
4. Run bulk audit identifying all knowledge past its validity period?

**Implementation:**
```yaml
# Extended frontmatter for automation
auto-detect-patterns:
  - pattern: "version \\d+\\.\\d+"
    decay-rate-inferred: time-sensitive
  - pattern: "current|latest|best"
    decay-rate-inferred: time-sensitive
  - pattern: "as of [A-Z][a-z]+ \\d{4}"
    decay-rate-inferred: time-sensitive

# Automation workflow metadata
auto-refresh: enabled
scan-frequency: weekly|monthly
last-scan: 2026-04-05
expiration-alert-threshold: 30  # days before expiration
```

**Automated detection patterns:**
- Version numbers (Ubuntu 22.04, Node.js v18)
- Temporal language ("current", "latest", "as of", "now")
- Specific date references in content
- "Best practice" without temporal qualifier
- Links to deprecated documentation

**Alert generation:**
- Daily: Critical attention-priority notes
- Weekly: High attention-priority + expiring validity-period
- Monthly: Full vault scan for decay-rate reclassification

**See also:**
- [[Seed Gap - Time-Sensitive Knowledge Refresh Automation]] — Original gap note
- [[AI-Assisted Knowledge Management Seed]] (lines 2965-3010) — Decay function and attention priority rules
- [[AI-Assisted Knowledge Management Seed]] (lines 1078-1100) — Validity period metadata

---

*Refinement note created during FRONTIER_EXPLORATION heartbeat (2026-04-05)*