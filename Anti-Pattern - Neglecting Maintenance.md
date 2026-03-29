---
last-reviewed: 2026-03-28
last-updated: 2026-03-28
lifecycle: evergreen
confidence: high
verification-status: verified
author-type: ai-assisted
tags:
  - anti-pattern
  - maintenance
  - workflow
level: pattern
counterpart-bestpractice: [[Best Practice - Regular Review]]
---

# Anti-Pattern: Neglecting Maintenance

Only adding new notes, never reviewing or pruning them, degrades vault quality over time.

## Problem

A knowledge base that only grows without maintenance becomes:
- Full of outdated information
- Hard to navigate (broken links, orphan notes)
- Unreliable (unverified knowledge treated as fact)
- Cluttered with stale content

Without review, errors propagate and quality decays.

## Signs

- No notes have been verified in >30 days
- Orphan rate exceeds 15%
- Broken links accumulate
- Stale content (>90 days old) never reviewed
- Verification ratio below 30%

## Solution

Follow [[Best Practice - Regular Review]] — schedule consistent review cycles.

- Weekly: Process inbox, verify new notes
- Monthly: Check graph health, fix broken links
- Quarterly: Archive outdated content, schema review

## The Maintenance Mindset

A knowledge base is a living system, not a static archive. Notes need:
- Verification (is this still accurate?)
- Pruning (is this still relevant?)
- Linking (does it connect to the graph?)

Without maintenance, the vault becomes a dumping ground.

## Test Criteria (for AI Evaluation)

- [ ] Are there notes older than 90 days without recent review?
- [ ] Is orphan rate >10%?
- [ ] Are broken links accumulating?
- [ ] Is verification ratio >50% for recent captures?
- [ ] Is there a scheduled review cadence?

## Related

- [[Best Practice - Regular Review]] — What to do instead
- [[Graph Maintenance]] — Technical guidance
- [[Note Lifecycle Management]] — Note stages
- [[Anti-Patterns in Knowledge Management]]
- [[AI-Assisted Knowledge Management Seed]]