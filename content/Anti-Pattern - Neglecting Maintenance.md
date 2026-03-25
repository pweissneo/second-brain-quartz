---
last-reviewed: 2026-03-18
last-updated: 2026-03-20
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - anti-pattern
  - quality
  - maintenance
level: pattern
verification-status: verified
schema-version: "1.0"
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
- New notes are added but old notes show no activity for 90+ days
- Knowledge marked as temporary ("to be verified later") never gets verified

## Solution

Follow [[Graph Maintenance]] and [[Self-Improvement Cycle]]:

- Schedule regular review sessions (weekly 15-min scans, monthly deeper reviews)
- Update notes when new information emerges
- Fix broken links promptly
- Verify unverified knowledge within 30 days of capture
- Use the heartbeat protocol to systematically cycle through old notes
- Set reminder triggers when notes exceed 60 days without review

## The Maintenance Rule

> **Rule:** Every note should have a `last-reviewed` date, updated on each review.
> **Why:** Without review tracking, stale notes accumulate undetected.
> **Test:** Do all notes have a `last-reviewed` field? Flag notes not reviewed in the last 30 days.

## Related

- [[Graph Maintenance]]
- [[Self-Improvement Cycle]]
- [[Note Lifecycle Management]]
- [[Handling Temporal Knowledge]]
- [[Anti-Pattern - Note Hoarding]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]] — Knowledge requiring hands-on testing
