---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - anti-pattern
  - quality
  - maintenance
---

# Anti-Pattern: Neglecting Maintenance

Only adding new notes without reviewing or updating existing ones.

## Problem

A knowledge base that only grows but never gets reviewed becomes:
- Stale with outdated information
- Full of broken links and inconsistencies
- Less reliable over time

## Signs

- Notes never get updated after creation
- Links break without correction
- Outdated information sits alongside current
- Verification status remains perpetually "unverified"

## Solution

Follow [[Graph Maintenance]] and [[Self-Improvement Cycle]]:

- Schedule regular review sessions
- Update notes when new information emerges
- Fix broken links promptly
- Verify unverified knowledge

## The Maintenance Rule

> **Rule:** Every note should have a `last-reviewed` date, updated on each review.
> **Why:** Without review tracking, stale notes accumulate undetected.
> **Test:** Do all notes have a `last-reviewed` field? Flag notes not reviewed in the last 30 days.

## Related

- [[Graph Maintenance]]
- [[Self-Improvement Cycle]]
- [[Note Lifecycle Management]]
- [[Anti-Pattern - Note Hoarding]]
- [[AI-Assisted Knowledge Management Seed]]
