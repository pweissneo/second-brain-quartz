---
last-reviewed: 2026-03-17
lifecycle: deprecated
confidence: high
author-type: ai-assisted
level: principle
redirects-to: [[AI-Assisted Knowledge Management Seed]]
tags:
  - seed-extension
  - metadata
  - confidence
  - deprecated
---

# DEPRECATED: Confidence Markers

> ⚠️ **This note is deprecated.** The content has been integrated into the [[AI-Assisted Knowledge Management Seed]]. All confidence, attention priority, decay rate, and calibration rules are now in the Seed itself.
> 
> This note is kept for historical reference only. Please use the Seed for all confidence-related rules.

## Summary

The Seed now includes all concepts previously in this note:

| Concept | Frontmatter Field |
|---------|-------------------|
| Confidence markers | `confidence: high \| emerging \| disputed \| obsolete` |
| Attention priority | `attention-priority: critical \| high \| medium \| low` |
| Decay rate | `decay-rate: static \| time-sensitive \| event-triggered` |
| Calibration status | `calibration-status: pre-calibrated \| calibrated-yes \| calibrated-no \| calibrated-uncertain` |

## Migration

All notes using these frontmatter fields should continue to work. The Seed provides the canonical definitions and usage guidelines.

## Related

- [[AI-Assisted Knowledge Management Seed]] — Canonical source for all confidence rules
- [[Handling Contradictory Sources]] — Using confidence markers when sources disagree
- [[Note Lifecycle Management]] — Note stages and progression
