---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - best-practice
  - maintenance
  - review
schema-version: "1.0"
counterpart-antipattern: [[Anti-Pattern - Neglecting Maintenance]]
---

# Best Practice - Regular Review

> Knowledge bases are living systems. Regular review keeps them healthy.

## The Principle

Neglecting maintenance is adding knowledge but never reviewing, updating, or verifying it. Regular review means scheduling consistent attention to vault health.

## Review Cadence

### Weekly (15-30 minutes)
- Process your inbox (staging area)
- Verify recently captured notes
- Add missing links to new notes

### Monthly (1-2 hours)
- Graph health check — find orphan notes
- Verify link quality
- Check verification ratio

### Quarterly (half day)
- Schema review — are fields still useful?
- Gap analysis — what's missing?
- Archive outdated content

## What to Check

During review, look for:
1. **Stale notes** — haven't been updated in >90 days, may be outdated
2. **Orphans** — notes with no incoming or outgoing links
3. **Broken links** — links to notes that were renamed or deleted
4. **Verification gaps** — unverified notes accumulating

## The Metrics

Track these to gauge health:
- **Verification ratio:** % verified within 30 days (target >50%)
- **Orphan rate:** notes without links (target <10%)
- **Stale content:** notes not reviewed in >90 days

## The Alternative to Review

Without regular review, vaults become:
- Full of outdated information
- Hard to navigate (broken links, orphans)
- Unreliable (unverified knowledge treated as fact)

Review is maintenance — it's how your knowledge base stays useful.

## Related

- [[Anti-Pattern - Neglecting Maintenance]] — What to avoid
- [[Graph Maintenance]] — Technical guidance
- [[Note Lifecycle Management]] — Note stages