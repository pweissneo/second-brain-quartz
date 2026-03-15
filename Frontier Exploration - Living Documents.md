---
last-reviewed: 2026-03-13
confidence: emerging
lifecycle: evergreen
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-types
  - maintenance
---

# Frontier Exploration - Living Documents

> Some notes are never "done." This note explores how to handle knowledge that is intentionally designed to be continuously updated.

## The Problem

The Seed emphasizes capturing finished, atomic knowledge. But some knowledge is inherently **living** - it evolves continuously and is never "complete":

- "My Tech Stack" - software, tools, and services I currently use
- "Questions I'm Exploring" - open questions I'm investigating
- "Current Projects" - ongoing work with no end date
- "People I Want to Connect With" - networking targets
- "Topics to Deep Dive Later" - a backlog of learning interests

These notes violate traditional atomicity because:
1. They have no natural "done" state
2. New items are added constantly
3. Items may be removed (completed, abandoned, outdated)
4. The note's purpose IS its incompleteness

## Existing Seed Rules That Partially Apply

- **Staging area** (inbox): Captures uncategorized captures, but intended for processing into finished notes
- **Temporal knowledge**: Covers time-sensitive data with validity periods, but not ongoing documents
- **Lifecycle stages**: Has draft → active → evergreen → deprecated, but living documents don't fit cleanly

## Key Questions

1. Should living documents exist at all, or should they be broken into individual atomic notes?
2. What distinguishes a living document from "organizational debt"?
3. How do you prevent living documents from becoming dumping grounds?
4. What metadata is needed to manage living documents?

## Observations

### When Living Documents Work

- **Centralized reference**: "My Current Software" is more useful than 50 separate notes about each tool
- **Low-stakes evolution**: Entertainment preferences, reading lists - no harm if slightly stale
- **Personal tracking**: Knowledge that's primarily for personal reflection, not public reference

### When They Become Problems

- No clear boundaries on what's included
- No process for removing stale items
- Mixes with atomic notes, confusing the graph
- Becomes a "catch-all" for things that should be processed

## Potential Seed Rules

### Rule: Distinguish living documents from atomic notes explicitly

**Rule:** Tag notes that are intentionally designed to be continuously updated with `lifecycle: living`; keep atomic notes with standard lifecycle stages (draft/active/evergreen/deprecated).

**Why:** Mixing living documents with atomic knowledge creates confusion about what's "finished" and what's intentionally incomplete.

**Test:** Can you categorize every note as either: (a) atomic/finished, (b) living document (continuously updated), or (c) staging (will become either a or b)?

### Rule: Living documents must have explicit entry and exit criteria

**Rule:** Living documents must include explicit `inclusion-criteria` and `removal-criteria` in frontmatter, defining what qualifies for inclusion and what triggers removal.

**Why:** Without criteria, living documents become dumping grounds. Clear rules about what goes in AND what triggers removal keep them useful.

**Test:** For a living document note, can you state: (1) What qualifies an item for inclusion? (2) What triggers an item's removal? (3) Is there a review process?

### Rule: Tag living documents with `lifecycle: living` and include `review-cadence`

**Rule:** Add `review-cadence:` frontmatter (daily/weekly/monthly/quarterly) to all notes tagged `lifecycle: living` to specify how often the document should be cleaned up.

**Why:** Living documents need different maintenance than finished notes. They need periodic cleanup rather than periodic review.

**Test:** Do living documents have explicit review cadence (weekly, monthly, quarterly)? Is stale content actively removed?

### Rule: Consider converting living documents to atomic notes when stable

**Rule:** When a living document's scope becomes stable (e.g., "My 2026 Reading List" after the year ends), convert it to an archived timestamped atomic note and create a new living document for ongoing content.

**Why:** Stable living documents contain valuable historical data that should be preserved as atomic notes while ongoing content continues in a fresh document.

**Test:** Can stable living documents be converted to timestamped historical records?

## Domain-Specific Examples

### Tech Stack

A "My Development Environment" note might contain:
- Current IDE and extensions
- Programming languages I use
- Cloud services I'm subscribed to
- CLI tools I rely on

This is legitimately living because:
- New tools appear constantly
- I abandon tools periodically
- No single tool is "complete" knowledge

**Suggested structure:**
```yaml
lifecycle: living
review-cadence: monthly
inclusion-criteria: "Tools I actively use at least weekly"
removal-criteria: "Not used in 2+ months or explicitly abandoned"
```

### Question Backlog

A "Questions to Research" note contains open questions. Unlike a finished note about a topic, this is explicitly incomplete - the point is to track uncertainty.

**Suggested structure:**
```yaml
lifecycle: living  
review-cadence: weekly
status-open-questions: [list of active investigations]
status-answered: [migrated to atomic notes when resolved]
```

## Edge Cases

### Living vs. Staging

A staging area (inbox) is for things that WILL be processed into finished notes. A living document is intentionally NEVER finished. The distinction:
- Staging = "I will decide what this becomes"
- Living = "This IS a collection, forever"

### Living Documents and Graph Quality

Living documents typically have high outbound links (to atomic notes) but low inbound links (other notes rarely link TO the list). This is acceptable but worth monitoring.

### Multiple Living Documents

A vault might have several living documents for different purposes. This is fine if each has clear scope - problematic if scopes overlap.

## Test for This Note

1. Does this note clearly explain the difference between living documents and other note types?
2. Are the proposed rules testable by an AI agent?
3. Would these rules apply across domains (tech, cooking, personal development)?

## Related

- [[Note Lifecycle Management]] - Covers draft → active → evergreen but not "living"
- [[Handling Temporal Knowledge]] - Time-sensitive data, but not ongoing collections
- [[Knowledge Base Workflow]] - Capture → process → maintain pipeline
- [[Frontier Exploration - Incomplete and Provisional Knowledge]] - Covers drafts and probes, but not intentionally permanent collections
