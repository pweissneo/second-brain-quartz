---
last-reviewed: 2026-03-10
lifecycle: evergreen
confidence: high
verification-status: community-validated
author-type: ai-assisted
sources:
  - title: "Building a Second Brain"
    author: "Tiago Forte"
    link: "https://www.buildingasecondbrain.com/"
tags:
  - process
  - review
  - maintenance
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Self-Improvement Cycle]]"
  - "[[Graph Maintenance]]"
---

# Weekly Review Process

Structured review to maintain your second brain.

## Why Weekly Review

Daily is too frequent. Monthly is too infrequent. Weekly hits the sweet spot.

For those who want more frequent engagement, apply the daily protocol described below.

## The Weekly Protocol (30 minutes)

### Monday: Inbox Processing (10 min)
1. Open capture app/inbox
2. Process each item into atomic notes
3. Add frontmatter (tags, source)
4. Link to related notes

### Wednesday: Graph Health (10 min)
1. Run `graph_isolated_nodes` - fix orphans
2. Run `graph_hubs` - check distribution
3. Look for broken links
4. Note any issues

### Friday: Knowledge Review (10 min)
1. Review 5 random notes
2. Add new connections if possible
3. Update any stale notes
4. Write what you learned this week

## Daily vs Weekly

Both approaches are valuable:

| Approach | Time | Best For |
|----------|------|----------|
| Daily Review | 10 min/day | Building habits, catching updates |
| Weekly Review | 30 min/week | Structured deep review, graph health |

**The 10-Minute Rule:** 10 minutes daily can be more effective than 1 hour weekly for retention, but weekly provides the structured protocol that daily may lack.

## What to Review

Regardless of frequency, prioritize:
- Recent notes (last 7 days)
- High-value hub notes
- Isolated notes (orphan detection)
- Notes with broken links

### Daily Review Protocol (optional supplement)

**Morning (5 min)**
1. Check inbox - process new captures
2. Review 3 random notes
3. Add 1 new link if possible

**Evening (5 min)**
1. Add new notes from today
2. Check for gaps in recent notes
3. Update any stale notes

## What to Track

```
Week: 2026-W10
Notes added: 5
Links added: 12
Issues fixed: 2
Insights: [Brief notes]
```

Track reviews with frontmatter:
```yaml
---
last-reviewed: 2026-03-08
review-count: 42
---
```

## Adjust to Your Pace

- New users: Start with 15 min/week
- Growing vault: 30 min/week
- Mature vault: 20 min/week maintenance

## Related
- [[Self-Improvement Cycle]]
- [[Graph Maintenance]]
- [[Frontier Exploration - Knowledge Base Utility Assessment]]
- [[The Forgetting Curve]]
