---
knowledge-type: meta
access-pattern: mixed
last-reviewed: 2026-04-05
last-updated: 2026-04-05
lifecycle: evergreen
confidence: high
verification-status: verified
author-type: ai-assisted
tags:
  - best-practice
  - maintenance
  - review
schema-version: "1.0"
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

## The Weekly Review Protocol

For practical implementation, use this structured approach:

### Phase 1: Health Check (5 min)

1. **Orphan scan:** Are there notes with no incoming or outgoing links?
2. **Depth check:** Can all notes reach root in ≤3 hops?
3. **Link quality:** Any notes with >10 outgoing links (hub candidates)?

### Phase 2: Gap Assessment (10 min)

1. **Backlog review:** Are there items in the backlog >7 days old?
2. **Prerequisite audit:** Any undefined wikilinks (links to non-existent notes)?
3. **Retrieval test:** Can you find specific knowledge when needed?

### Phase 3: Quality Audit (10 min)

1. **Recent notes:** Review notes created in last 7 days for Seed compliance
2. **Stale notes:** Any notes not reviewed in >30 days?
3. **Conflict check:** Any unresolved contradictions in the vault?

### Phase 4: Prioritization (5 min)

Based on findings, prioritize next week's work:

| Finding | Action |
|---------|--------|
| Many orphans | CONNECT mode |
| Broken links | FIX or create missing notes |
| Stale content | VERIFY or DEPRECATE |
| Backlog buildup | REFLECT on priorities |

After each review, log:
- **Date:** When review completed
- **Health metrics:** Orphan rate, average depth, link count
- **Issues found:** List of specific problems
- **Actions taken:** What was fixed
- **Next priorities:** 3 focus areas for next week

## The Alternative to Review

Without regular review, vaults become:
- Full of outdated information
- Hard to navigate (broken links, orphans)
- Unreliable (unverified knowledge treated as fact)

Review is maintenance — it's how your knowledge base stays useful.

> **Note:** Review frequency should match knowledge volatility. See [[Frontier Exploration - Knowledge-Aware Review Cycles]] for domain-specific guidance on matching review cycles to how fast knowledge changes.

## Daily Review Protocol (Optional Supplement)

For those who want more frequent engagement, add daily reviews:

**Morning (5 min)**
1. Check inbox — process new captures
2. Review 3 random notes
3. Add 1 new link if possible

**Evening (5 min)**
1. Add new notes from today
2. Check for gaps in recent notes
3. Update any stale notes

The 10-Minute Rule: 10 minutes daily can be more effective than 1 hour weekly for retention. Daily catches updates, weekly provides structure.

## Tracking Template

```
Week: 2026-WXX
Notes added: X
Links added: X
Issues fixed: X
Insights: [Brief notes]
```

Track with frontmatter:
```yaml
---
knowledge-type: meta
last-reviewed: 2026-03-29
review-count: N
---
knowledge-type: meta
```

## Adjust to Your Pace

- New users: Start with 15 min/week
- Growing vault: 30 min/week
- Mature vault: 20 min/week maintenance

## Related

- [[Graph Maintenance]] — Technical guidance
- [[Note Lifecycle Management]] — Note stages
- [[Anti-Patterns in Knowledge Management]]
- [[The Forgetting Curve]] — Why review matters
- [[Frontier Exploration - Knowledge-Aware Review Cycles]] — Volatility-based review frequency
- [[Self-Improvement Cycle]] — The broader cycle this implements
- [[Weekly Review Process]] — Redirected here (merged 2026-04-05)