---
protected: true
last-reviewed: 2026-03-22
last-updated: 2026-03-22
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - methodology
  - lifecycle
  - maintenance
---

# Note Lifecycle Management

Notes have a lifecycle. Knowing when to archive or delete is as important as knowing when to create.

> **Seed-Compliant Stages:** draft → active → evergreen → deprecated
> This note uses more granular stages (Seedling/Bud) that map to the Seed's foundation.

## Lifecycle Stages

```
Seedling → Bud → Evergreen → Deprecated
   ↓         ↓         ↓           ↓
  Raw     Developing  Mature    Superseded
 idea     concept    knowledge
```

> **Mapping to Seed:** Seedling → draft | Bud → active | Evergreen → evergreen | Deprecated → deprecated | Archive (inactive but valid)

### 1. Seedling (New)
- Fresh capture from input
- Often incomplete, needs processing
- Status: needs work

### 2. Bud (Developing)
- Processed, linked, but not fully integrated
- Has 2-3+ meaningful connections
- Status: growing

### 3. Evergreen (Mature)
- Fully formed, well-linked, frequently referenced
- Core knowledge of the vault
- Status: stable
- *Concept from Andy Matuschak: write as if for your future self, notes should be self-contained and understandable alone, iterate on notes rather than abandoning them, link forward to developing ideas*

## In Practice

- Start with a seed note (small, focused)
- Expand when new connections emerge
- Merge similar notes to reduce fragmentation
- Update outdated information on review

### 4. Archive (Inactive)
- Still valid but no longer relevant
- May contain historical value
- Status: dormant

**Archive subtypes (Seed refinement):**
- **Temporal data** (annual tax brackets, API versions): Mark with `as-of:` date instead of deprecated — these are historically accurate, just not current
- **Conditional** (context-dependent advice): Add `condition:` or `applies-when:` scope tags — not deprecated when conditions change
- **Historical** (one-time events): Mark `lifecycle: historical` — complete records, not deprecated
- **Cyclical** (strategies that cycle in/out of favor): Mark `status: cyclical` — not wrong, just currently unfashionable

### 5. Delete (End of Life)

> **Seed Rule:** Never delete notes — deprecate them with a marker and a pointer to the replacement.

The Delete stage should rarely be used. Instead of deleting:
- Mark as deprecated with `lifecycle: deprecated`
- Add pointer to replacement note
- Keep in vault for historical reference

**The only exceptions for deletion:**
- Genuinely ephemeral notes (meeting minutes, temporary scratch notes) that have no long-term value
- Notes that are factually incorrect (not just outdated, but wrong)
- Notes that violate privacy (contain information about living individuals without consent)

## Deprecation Criteria

When should a note be marked deprecated? The Seed says notes should have lifecycle stages, but doesn't specify when to deprecate.

### Mark deprecated when:

**1. Contradicted by New Information**
- New evidence fundamentally contradicts the note's core claim
- A better note covers the same topic more accurately
- Source material has been superseded

**2. Redundancy**
- Another note covers the same topic more completely
- Content has been merged into other notes
- Multiple notes on same topic exist (consolidate instead)

**3. Outdated Domain Context**
- Technology/process has changed
- Best practices have evolved
- Examples are no longer relevant

**4. Low Value**
- Very few incoming links (isolated)
- Content is too generic to be useful
- Doesn't serve the vault's purpose

### Deprecation Process

1. **Don't delete** — always mark deprecated, never remove
2. **Add frontmatter:** `lifecycle: deprecated`
3. **Add pointer:** "This topic is now covered by [[Handling Temporal Knowledge]]"
4. **Update links** — redirect readers to replacement

### What NOT to Deprecate

- Notes with high incoming links (hub notes)
- Foundational concepts (atomicity, linking principles)
- Notes that are still factually correct
- Personal perspectives that remain valid

### Deprecation Types (Seed refinement)

Add `deprecation-type:` frontmatter to distinguish between:
- **hard**: feature removed, no replacement works
- **soft**: discouraged but still functional
- **historical**: no longer maintained but historically significant (for abandoned tools/technologies)

Also add version-specific frontmatter (`applies-to:` or `version:`) for notes containing version-specific knowledge.

### Review Frequency by Lifecycle (Seed refinement)

- draft: review weekly
- active: review monthly  
- evergreen: review quarterly
- deprecated: review when replacement receives major updates

## When to Archive

- No references in 3+ months
- Topic no longer active in your life/work
- Superseded by updated notes
- Belongs to a past project (completed)

## When to Delete

- Factually incorrect
- Duplicate of another note (merge instead)
- Purely ephemeral (meeting notes, temporary)
- Violates atomicity with no fix

## Archive Process

1. Move to `/Archive/` folder
2. Keep links intact (they become dead ends - acceptable)
3. Add `archived: true` frontmatter
4. Update any hub notes that reference it

## Don't Over-Archive

Most notes should become evergreen. Be conservative:
- Useful reference → keep
- Potential future value → keep
- Only dead weight → archive/delete

## Related
- [[Handling Temporal Knowledge]]
- [[Frontier Exploration - Note Completion Criteria]] - When a note is "done" (maturity stages)
- [[Frontier Exploration - Living Documents]] - Notes that are intentionally designed to be continuously updated
- [[Frontier Exploration - Knowledge Cascade Effects]] - How to handle cascading updates across notes
- [[Anti-Patterns in Knowledge Management]]
- [[Graph Maintenance]]
- [[The Forgetting Curve]]
- [[Atomic Note Principle]]
