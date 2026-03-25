---
last-reviewed: 2026-03-16
last-updated: 2026-03-22
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
domain-familiarity: learning
schema-version: "1.0"
tags:
  - frontier-exploration
  - vault-maintenance
  - version-control
---

# Frontier Exploration - Knowledge Base Version Control and Change Tracking

> How should a knowledge base track changes, handle branching, and manage evolution over time?

## The Problem

The Seed focuses on capturing and structuring knowledge, but says little about:
- How to track changes to notes over time
- How to handle competing edits from multiple sources
- How to roll back or compare historical versions
- How to merge contributions from different authors (human or AI)

Without version control, a knowledge base becomes a "flat" artifact — you can't understand how knowledge evolved, undo mistakes, or collaborate safely.

## Why This Matters Now

- **AI agents continuously improve notes** — without tracking, changes are invisible
- **Multiple contributors** — humans and AI agents may edit the same note
- **Knowledge decay** — understanding what changed helps assess currency
- **Error recovery** — mistakes happen; rollback capability is essential

## Key Questions

### Change Tracking

1. Should every edit create a new version, or only significant changes?
2. How many historical versions should be retained?
3. How do you distinguish "valuable evolution" from "noise" in change history?

### Conflict Resolution

4. When two editors change the same note simultaneously, how is conflict resolved?
5. Should AI agents prefer their own edits, human edits, or latest edits?
6. How do you flag conflicts for human review vs. auto-resolve?

### Branching and Merging

7. Should experimental notes exist in a "branch" before merging to main?
8. How do you compare divergent versions of the same note?
9. What constitutes a "major" vs "minor" change warranting different tracking?

### Attribution and Provenance

10. Should each change carry author attribution (human/AI)?
11. How do you track which AI model made an edit?
12. Can you query "what changed since last review" automatically?

## Domain-Specific Considerations

### Collaborative Vaults
- Multiple humans may edit — need conflict detection
- AI agents as "contributors" with different reliability profiles
- Edit frequency vs. quality trade-offs

### Personal Vaults
- Simpler needs: just rollback capability
- Single-author but multi-session (different AI sessions)
- Change tracking helps recall "why did I add this?"

### Published/Shipped Vaults
- Versioned releases for external users
- Changelog generation for vault evolution
- Deprecation tracking across versions

## Potential Seed Rules

### Rule: Track edit history for notes above a quality threshold

**Why:** Version control overhead isn't worth it for transient notes, but essential for evergreen knowledge.

**Test:** For notes with `lifecycle: evergreen`, is there edit history accessible? Can you determine when it was last modified and by whom?

### Rule: Use explicit conflict markers when multiple sources modify simultaneously

**Why:** Silent overwrites lose information; explicit markers preserve both versions for review.

**Test:** When an AI edit conflicts with previous content, does the note contain conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) or a conflict note linking to both versions?

### Rule: Include change attribution with author-type for AI-generated edits

**Why:** AI editing patterns differ from human patterns; attribution enables reliability assessment.

**Test:** Can you determine for any note: (1) Was it last edited by human or AI? (2) Which AI model/agent? (3) When?

### Rule: Create vault "snapshots" before major refactoring

**Why:** Large-scale changes (Seed rule updates, structural reorganizations) risk introducing regressions; snapshots enable rollback.

**Test:** Before modifying >10% of vault content, was a snapshot/tag created? Can you restore to that point?

## Test Scenarios

### Cooking Knowledge Base

- Recipe edited by human (added local variation) and AI (standardized formatting) — conflict?
- Previous version of recipe had different ingredient ratios — can you compare?
- "Aunt Mary's special sauce" evolved over 5 edits — can you trace the evolution?

### Legal Knowledge Base

- Statute interpretation changed due to new case law — is change tracked?
- Multiple attorneys contributed notes — can you attribute by author?
- Precedent was overruled — can you see the "before" state?

### Personal Knowledge Base

- Note added in 2023 session — why was it added? What was context?
- AI session made conflicting edits in two sessions — which to keep?
- Deleted note — can you recover within 30 days?

## Related Seed Rules

- [[Note Lifecycle Management]] — lifecycle states
- [[Sources Provenance MCP]] — provenance tracking
- [[Knowledge Graph Structure]] — graph evolution

## Open Questions

1. Is git-style branching appropriate for knowledge bases, or is simpler linear history better?
2. Should change tracking be opt-in per-note or vault-wide default?
3. How do you handle "merge conflicts" between AI agents with different reasoning?

---

**Confidence:** emerging — this is an initial exploration, not a mature Seed rule.

**Next Steps:** 
- Test conflict detection in multi-session AI editing
- Develop change attribution schema
- Create snapshot workflow for major changes
