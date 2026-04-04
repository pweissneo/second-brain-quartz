---
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-refinement-proposed
confidence: high
author-type: ai-assisted
gap-status: identified
tags:
  - seed-refinement
  - structural-health
  - note-classification
  - link-requirements
---

# Seed Refinement: Note-Type Based Link Requirements

**Source:** Structural Health Check - 2026-04-04
**Date:** 2026-04-04
**Method:** STRUCTURAL_HEALTH — analyzing vault structure and link patterns

## Discovery

During structural health analysis, I discovered that the Seed applies uniform link requirements (>=2 outgoing links) to ALL notes, but this fails to account for fundamentally different note types:

1. **Content notes** — Regular knowledge content, should have >=2 links
2. **Gap documentation notes** — Seed Gaps, Frontier Explorations that document missing rules, may have 0-1 links
3. **Seed stress tests** — Notes that verify rules in specific domains, may have 0-1 links

The current Seed says:
> **Implementation:** Use `note-type:` frontmatter field with values `exploratory|reference|safety|foundational|specialized|filter`.

These existing values focus on content purpose, not on link expectation classification.

## The Gap

When auditing low-link notes, the current approach flags Seed Gaps, Frontier Explorations, and Seed Stress Tests as "problems" when they're actually functioning as intended:
- Seed Gaps document missing rules — they reference the Seed but aren't referenced back
- Frontier Explorations explore new areas — may have limited connections until integrated
- Seed Stress Tests test specific rules in narrow domains — narrow purpose, not general reference

## Proposed Seed Addition

**Rule:** Distinguish note function for link requirement purposes — apply different minimum link thresholds based on note function rather than uniform 2-link requirement.

**Why:** Uniform link requirements treat all notes as equivalent content, but gap documentation notes and stress tests serve different functions. Flagging them as "low connectivity" creates noise in health checks and may prompt unnecessary refactoring.

**Test:** (1) Can you classify notes by function (content|gap-documentation|stress-test)? (2) Do health checks apply different thresholds based on function? (3) Are gap notes and stress tests exempted from standard link count requirements?

**Implementation:**

```yaml
note-function: content|gap-documentation|stress-test
```

Link requirement by function:
- **content:** minimum 2 outgoing links (current rule)
- **gap-documentation:** minimum 0 outgoing links (expected to reference Seed)
- **stress-test:** minimum 0 outgoing links (narrow domain focus)

**Relationship to existing note-type:**
The existing `note-type:` (exploratory|reference|safety|foundational|specialized|filter) describes content purpose. The new `note-function:` describes structural role. Both can coexist — a note can be `note-type: exploratory` AND `note-function: gap-documentation`.

## What I Learned

1. **Structural health checks need nuance** — Uniform rules flag valid patterns as problems
2. **Different note types serve different functions** — Gap notes and stress tests are structurally different from content
3. **Health checks should filter by function** — Skip low-link warnings for expected categories
4. **The Seed already has note-type** — Adding note-function complements rather than replaces it

This insight came from analyzing ~80 notes flagged as "orphans" or "low-link" that were actually functioning correctly for their note type.

## Related Notes

- [[Structural Health Check - 2026-04-04]] — Original discovery
- [[AI-Assisted Knowledge Management Seed]] — Current note-type implementation
- [[Seed Development Hub]] — Refinement tracking