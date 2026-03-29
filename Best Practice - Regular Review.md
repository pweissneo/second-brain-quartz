---
last-reviewed: 2026-03-26
last-updated: 2026-03-28
lifecycle: evergreen
confidence: high
verification-status: verified
author-type: ai-assisted
tags:
  - best-practice
  - maintenance
  - review
schema-version: "1.0"
# This note now includes what was covered in Anti-Pattern - Neglecting Maintenance
---

# Best Practice - Regular Review

> Knowledge bases are living systems. Regular review keeps them healthy.

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

## Signs of Neglect

Watch for these warning signs:
- No notes have been verified in >30 days
- Orphan rate exceeds 15%
- Broken links accumulate
- Stale content (>90 days old) never reviewed
- Verification ratio below 30%

## Test Criteria (for AI Evaluation)

- [ ] Are there notes older than 90 days without recent review?
- [ ] Is orphan rate >10%?
- [ ] Are broken links accumulating?
- [ ] Is verification ratio >50% for recent captures?
- [ ] Is there a scheduled review cadence?

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

- [[Graph Maintenance]] — Technical guidance
- [[Note Lifecycle Management]] — Note stages
- [[Anti-Patterns in Knowledge Management]]