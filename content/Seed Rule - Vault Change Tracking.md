---
last-reviewed: 2026-03-24
last-updated: 2026-03-24
lifecycle: evergreen
confidence: emerging
verification-status: emerging
author-type: ai-assisted
schema-version: "1.0"
tags:
  - seed-rule
  - vault-maintenance
  - version-control
  - change-tracking
---

# Seed Rule: Vault Change Tracking and Version Control

**Rule:** Track note changes with attribution and distinguish significant edits from minor updates.

**Why:** Without change tracking, AI agents cannot assess knowledge currency, recover from errors, or understand how knowledge evolved over time. A vault without change history is a flat artifact — you can't determine what's recent vs. stale, undo mistakes, or understand the provenance of individual notes.

**Test:** For notes with `lifecycle: evergreen` or `verification-status: verified`: (1) Can you determine when it was last modified? (2) Can you identify whether the last edit was by human or AI? (3) Is there a mechanism to access previous versions?

---

## Implementation

### Track edit attribution

For notes above a quality threshold (evergreen, verified), include change metadata:

```yaml
last-modified: 2026-03-24
last-editor-type: human|ai
last-editor: "model name or human identifier"
edit-count: 5
```

**Why:** AI editing patterns differ from human patterns. Attribution enables appropriate skepticism — AI-generated edits may need more review than human-sourced content.

**Test:** Can you identify for any evergreen note: (1) Was it last edited by human or AI? (2) Which AI model/agent? (3) When?

### Distinguish major from minor edits

Not all edits are equal. Use edit significance to determine tracking level:

```yaml
edit-significance: major|minor
# Major: content changes (new knowledge, restructured explanation)
# Minor: formatting, typo fixes, link updates
```

**Why:** Minor edits (typos, formatting) don't need full version history; major edits (content changes) do. Over-tracking minor edits creates noise.

**Test:** For notes with 5+ edits: (1) Can you distinguish major content changes from minor polish? (2) Do major changes have more detailed attribution? (3) Is the edit history actionable for understanding knowledge evolution?

### Use explicit conflict markers for simultaneous edits

When multiple sources (human + AI, or multiple AI sessions) modify the same note:

```yaml
conflict-status: resolved|pending|manual-review
conflicts:
  - editor: "source 1"
    version: "timestamp or hash"
    summary: "what changed"
```

**Why:** Silent overwrites lose information. Explicit conflict markers preserve both versions for review.

**Test:** When an AI edit conflicts with previous content: (1) Does the note contain conflict markers? (2) Is there a way to see both versions? (3) Can you determine which version was retained?

### Create vault snapshots before major refactoring

Before modifying >10% of vault content (Seed rule updates, structural reorganizations, bulk changes):

```yaml
snapshot-before: "2026-03-24-vault-before-seed-update"
snapshot-type: pre-refactor|pre-migration|pre-major-change
```

**Why:** Large-scale changes risk introducing regressions. Snapshots enable rollback to a known-good state.

**Test:** Before modifying >10% of vault content: (1) Was a snapshot/tag created? (2) Can you restore to that point? (3) Is there documentation of what changed in this refactor?

### Track knowledge decay signals

```yaml
decay-signals:
  - type: outdated-dependency
    detected: 2026-03-20
    note: "Links to deprecated tool"
  - type: contradicted-by
    detected: 2026-03-22
    note: "New note contradicts this"
```

**Why:** Knowledge that was correct may become incorrect. Tracking decay signals helps prioritize review.

**Test:** For notes older than 90 days: (1) Are there any decay signals? (2) Is outdated content flagged? (3) Can you prioritize review based on decay indicators?

---

## Test Scenarios

### Cooking Knowledge Base
- Recipe edited by human (added local variation) and AI (standardized formatting) — can you identify both contributions?
- Previous version had different ingredient ratios — can you compare versions?
- "Aunt Mary's special sauce" evolved over 5 edits — can you trace evolution?

### Legal Knowledge Base
- Statute interpretation changed due to new case law — is change tracked with reason?
- Multiple attorneys contributed notes — can you attribute by author?
- Precedent was overruled — can you see the "before" state?

### Personal Knowledge Base
- Note added in 2023 session — why was it added? What was context?
- AI session made conflicting edits in two sessions — which to keep?
- Deleted note — can you recover within 30 days?

---

## Related Seed Rules

- [[Note Lifecycle Management]] — lifecycle states include edit tracking
- [[Seed Rule - Version Upgrade Path Knowledge]] — version changes for external tools
- [[Seed Rule - Handling Incorrect or Outdated Knowledge]] — correction metadata

---

**Evidence basis:** Synthesized from Frontier Exploration note "Knowledge Base Version Control and Change Tracking" which identified this as a gap in the Seed.

**See also:** [[Frontier Exploration - Knowledge Base Version Control and Change Tracking]]