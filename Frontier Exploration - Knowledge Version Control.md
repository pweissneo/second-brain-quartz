---
author-type: ai-assisted
last-updated: 2026-04-01
confidence: emerging
verification-status: unverified
lifecycle: emerging
source-origin: original
source-origin-type: hypothesis
---

# Frontier Exploration - Knowledge Version Control

## The Problem

The Seed covers update strategies (discrete versioning, slow evolution, cyclical, deepening) but doesn't address how to handle version control for knowledge itself — when knowledge changes, how do you track what changed, why, and what implications the change has for dependent knowledge?

## Gap Analysis

Knowledge versioning differs from software versioning in key ways:
- Software: backward compatibility matters; old versions are artifacts
- Knowledge: old versions may be more accurate for historical context; backward compatibility is usually irrelevant

The Seed addresses:
- `evolution-pattern` frontmatter for tracking change type
- `was-valid-until` for outdated knowledge
- `validity-period` for inherent expiration

What's missing:
1. **Version lineage**: How to track knowledge evolution over time (not just "changed" but "how it changed from what")
2. **Dependency impact**: When knowledge changes, how to identify and update dependent notes
3. **Change rationale**: Capturing not just WHAT changed but WHY it changed
4. **Rollback consideration**: When to keep old versions vs. archive them
5. **Merge conflict resolution**: When two change paths converge

## Proposed Rule

**Rule:** Apply explicit version control to knowledge that has significant dependent notes — track change lineage, update affected notes, and preserve change rationale.

**Why:** Knowledge doesn't exist in isolation. When a core principle changes, notes that depended on the old principle may now contain contradictions or outdated reasoning. Without explicit version control, the vault accumulates inconsistent knowledge that appears verified but is actually superseded.

**Test:** For notes with 3+ dependent notes (backlinks): (1) Can you identify what would break if this note changed? (2) Is there a change history documenting previous states? (3) When this note changes, do you check dependent notes for consistency? (4) Is change rationale documented alongside change?

**Implementation:** Use frontmatter for version control:
```yaml
version-control: enabled
version: 3
version-history:
  - version: 1
    date: 2025-06-15
    change: "Initial capture"
    rationale: "First principles from source X"
  - version: 2
    date: 2025-11-20
    change: "Expanded with new evidence from study Y"
    rationale: "Source provided more complete picture"
  - version: 3
    date: 2026-04-01
    change: "Corrected error in section Z"
    rationale: "Original interpretation was wrong - see [[Correction Note]]"
dependencies-affected:
  - [[Dependent Note A]]
  - [[Dependent Note B]]
version-strategy: preserve-all|latest-only|archive-old
# preserve-all: keep full history (for high-dependency knowledge)
# latest-only: only current state matters (for stable, well-understood)
# archive-old: keep current + archive (default for most knowledge)
```

**Change categories:**
- **Correction**: Knowledge was wrong, now correct (requires dependency check)
- **Expansion**: Knowledge was incomplete, now fuller
- **Refinement**: Knowledge was correct, now more precise
- **Deprecation**: Knowledge still correct but superseded by newer
- **Split**: One note became multiple (requires link migration)

**Dependency check protocol:**
When a note changes:
1. List all notes linking TO this note (backlinks)
2. For each dependent note, check if content depends on the specific aspect that changed
3. Update or flag dependent notes as needed
4. Document dependency updates in change log

## Edge Cases

- **Hidden dependencies**: Some dependencies aren't visible through links — a note might reference the "concept" not the specific wording. Use explicit dependency tracking.
- **Circular dependencies**: A changes B, B changes A. Break cycles by identifying root change.
- **Historical accuracy**: Sometimes old knowledge is more accurate for historical context (e.g., medical knowledge from 1950 was correct FOR 1950, not for now). Use `was-valid-until` for temporal validity, not version control.
- **Distributed knowledge**: When multiple notes contribute to one concept, version control becomes complex. Consider concept-level version tracking.

## Domain-Specific Adaptations

- **Historical research**: Version control tracks interpretation evolution, not just factual changes
- **Legal knowledge**: Version control tracks jurisdiction changes, statute updates
- **Technical domains**: Version control tracks API changes, deprecated features

## Vault-Level Change Tracking (Broader Concerns)

While individual note version control focuses on tracking changes per note, vault-level change tracking addresses broader concerns:

### Change Tracking Questions
1. Should every edit create a new version, or only significant changes?
2. How many historical versions should be retained?
3. How do you distinguish "valuable evolution" from "noise" in change history?

### Conflict Resolution
4. When two editors change the same note simultaneously, how is conflict resolved?
5. Should AI agents prefer their own edits, human edits, or latest edits?
6. How do you flag conflicts for human review vs. auto-resolve?

### Attribution and Provenance
7. Should each change carry author attribution (human/AI)?
8. How do you track which AI model made an edit?
9. Can you query "what changed since last review" automatically?

### Vault-Level Rules

**Rule:** Track edit history for notes above a quality threshold.
**Why:** Version control overhead isn't worth it for transient notes, but essential for evergreen knowledge.
**Test:** For notes with `lifecycle: evergreen`, is there edit history accessible?

**Rule:** Use explicit conflict markers when multiple sources modify simultaneously.
**Why:** Silent overwrites lose information; explicit markers preserve both versions for review.
**Test:** When an AI edit conflicts with previous content, does the note contain conflict markers or a conflict note?

**Rule:** Include change attribution with author-type for AI-generated edits.
**Why:** AI editing patterns differ from human patterns; attribution enables reliability assessment.
**Test:** Can you determine for any note: (1) Was it last edited by human or AI? (2) Which AI model/agent?

**Rule:** Create vault "snapshots" before major refactoring.
**Why:** Large-scale changes risk introducing regressions; snapshots enable rollback.
**Test:** Before modifying >10% of vault content, was a snapshot/tag created?

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

## Relationship to Existing Seed Rules

- Complements `evolution-pattern` (describes how knowledge changes)
- Complements `correction-type` (describes why knowledge changed)
- Complements `diminishing returns` (version control effort should be weighted by dependency count)
- Complements [[Seed Rule - Vault Change Tracking]] — broader change tracking rules

## Test Questions

1. If this foundational note changed tomorrow, how many other notes would need updating?
2. Can you trace the evolution of any key concept in this vault?
3. When was the last time a note change required updating dependent notes?
4. Do you have a change log for any note with 3+ dependencies?

---

**Confidence assessment**: This gap feels real but the implementation may be over-engineered. Version control for knowledge adds significant maintenance burden. The key question: Does the benefit of explicit version tracking exceed the cost for most notes?

**Alternative**: Simpler approach — only apply version control to notes tagged as `foundational: true` or `hub: true` where dependencies are highest.