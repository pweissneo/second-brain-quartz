---
last-reviewed: 2026-04-05
last-updated: 2026-04-05
confidence: medium
lifecycle: exploratory
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-lifecycle
  - ephemeral-knowledge
  - temporary-content
level: frontier
gap-status: open
---

# Frontier Exploration - Ephemeral Knowledge Handling

> How should AI agents handle knowledge that is inherently temporary, session-bound, or meant to be discarded?

## The Gap

The Seed covers:
- Note lifecycle (whisper → draft → refined → evergreen)
- Note deletion criteria
- Trade-off lifecycle (active/resolved/superseded)
- Forward references with `status: planned`

What's missing: **explicit handling for knowledge that is intentionally temporary or ephemeral by design** — not temporary in the "we'll get to it later" sense, but temporary in the "this knowledge has a built-in expiration and should be discarded."

## Examples of Ephemeral Knowledge

| Type | Example | Current Handling |
|------|---------|-----------------|
| Session-bound reasoning | Reasoning trace for a query | "Default: ephemeral (discard after response)" — but how? |
| Temporary credentials | API keys, passwords | Not covered |
| Time-limited opportunities | Conference CFPs, sale deadlines | Not explicitly covered |
| Draft content being worked on | Notes in active drafting | Handled via lifecycle |
| Temporary workarounds | Bug workarounds awaiting fix | Not explicitly covered |
| Event-based knowledge | Live event notes | Not explicitly covered |

## What the Seed Needs

### Rule: Tag knowledge with explicit expiration

**Why:** Some knowledge has a built-in validity window that's shorter than "note lifecycle." The Seed's temporal validity bounds handle "this information might become stale," but not "this information WILL be obsolete at timestamp X."

**Test:** (1) Can you identify notes with explicit expiration? (2) Is there automation to surface or delete expired notes? (3) Do notes link to permanent alternatives where applicable?

### Rule: Handle session-bound reasoning traces

**Why:** The Seed mentions reasoning traces should be "ephemeral (discard after response)" but provides no mechanism. AI agents need clear guidance: what to keep (insights that generalize), what to discard (session-specific path).

**Test:** (1) Can you distinguish session-specific reasoning from reusable insights? (2) Is there a mechanism to extract reusable knowledge from reasoning traces before discarding? (3) Are extracted insights linked to permanent notes?

### Rule: Distinguish "temporary by design" from "stale but possibly useful"

**Why:** A conference CFP deadline is TEMPORARY (delete after deadline passes). A technical article is STALE (may become useful again if updated). Treating temporary as stale creates maintenance burden; treating stale as temporary loses potentially useful knowledge.

**Test:** (1) Can you categorize notes as "temporary by design" vs "stale but potentially useful"? (2) Are they handled differently? (3) Is the category explicit in frontmatter?

## Proposed Implementation

```yaml
# For knowledge with explicit expiration
expiration-type: session-bound|time-limited|event-bound|conditional
expires-at: "2026-04-15T23:59:00Z"  # ISO timestamp
expiration-action: delete|deprecate|archive
post-expiration-link: "[[Permanent Alternative]]"

# For temporary workarounds
workaround-status: active|pending-fix|superseded
fix-source: "JIRA-1234"
```

## Edge Cases

1. **Conditional knowledge** — "If using v1.x, do X; if v2.x, do Y" — the v1.x path is temporarily valid but will expire
2. **Event-bound knowledge** — Live session notes should be archived or deleted after event
3. **Temporary credentials** — Should never enter the vault; use secrets management instead
4. **Draft iterations** — These ARE temporal but have value as history; distinguish from "delete after use"

## Related

- [[AI-Assisted Knowledge Management Seed.md]] — Note lifecycle and deletion criteria
- [[Note Lifecycle Management]] — Whisper → Draft → Refined → Evergreen
- [[Frontier Exploration - Temporal Knowledge]] — Time-bound knowledge
- [[Seed Gap - Knowledge with Inherent Expiration Windows]] — Related gap
