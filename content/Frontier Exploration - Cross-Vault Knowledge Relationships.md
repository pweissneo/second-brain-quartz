---
last-reviewed: 2026-03-17
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - multi-vault
  - cross-references
---

# Frontier Exploration - Cross-Vault Knowledge Relationships

> How should knowledge bases handle content that spans multiple vaults?

## The Problem

When you maintain multiple vaults (personal, work, research, project-specific), knowledge often overlaps. A note about "effective communication" might belong in both a professional development vault and a personal relationships vault. How do you handle this without duplication or fragmentation?

## Current Approaches and Their Issues

### 1. Duplication (Copy-Paste)
**What:** Copy the same knowledge into each vault
**Problems:** 
- Updates must be applied everywhere
- Inconsistent versions emerge
- Vaults grow bloated with duplicates

### 2. Single Source (One Vault)
**What:** Keep all knowledge in one vault
**Problems:**
- Vault becomes unwieldy
- Topic mixing reduces focus
- Different access permissions become impossible

### 3. Pure References (Links Only)
**What:** Link from one vault to another using absolute paths or URLs
**Problems:**
- Links break if vaults move
- No local context when browsing
- External links feel disconnected

## Proposed Solutions

### Cross-Vault Wikilinks
Use a consistent naming convention for cross-vault references:

```
[[vault-name/note-name]] or [[../other-vault/note-name]]
```

**Advantages:**
- Portable within local filesystem
- Clear origin tracking
- Can be made clickable with vault-specific plugins

**Test:** Can you navigate from any note to any related note in another vault with 2 clicks or fewer?

### Vault Alias System
Create lightweight "pointer" notes in each vault that summarize and link to the canonical source:

```
# Communication Principles (Work Vault)

> Summary: Key principles from [[../personal/Effective Communication]]

See main note for full details. This version focuses on workplace applications.

## Workplace-Specific Applications
- [link to workplace-specific content]
```

**Advantages:**
- Each vault has context-appropriate version
- Canonical source remains single point of truth
- Lightweight pointers are easy to maintain

**Test:** Can someone find the canonical source from any vault's pointer? Do pointers include a "last sync" date?

### Shared Kernel Pattern
For vaults that heavily overlap, identify a "shared kernel" of knowledge that lives in its own vault, referenced by others:

```
my-knowledge-base/
  shared-kernel/        # Evergreen, universal knowledge
  work-vault/          # References shared-kernel
  personal-vault/      # References shared-kernel  
  project-alpha/      # Temporary, will be archived
```

**Advantages:**
- Single source of truth for universal knowledge
- Clear separation of vault types
- Easy to extract and share the kernel

**Test:** Can you identify 10+ notes that could live in shared-kernel? Is the kernel stable (rarely needs updates)?

## Frontmatter for Cross-Vault Knowledge

```yaml
canonical-vault: personal
local-variant: true  # This is a summary/link, not canonical
last-sync: 2026-03-17
cross-vault-links:
  - ../work-vault/related-note
  - ../research-vault/deep-dive
```

## When to Use Each Approach

| Situation | Recommended Approach |
|-----------|---------------------|
| Highly domain-specific vaults (work vs hobby) | Pure references |
| Overlapping domains with different perspectives | Vault alias system |
| Foundational knowledge used everywhere | Shared kernel |
| Temporary project knowledge | Duplicate with expiry date |

## Proposed Seed Rule

**Rule:** For cross-vault knowledge, prefer the approach that minimizes sync burden while maintaining accessibility.
**Why:** Cross-vault knowledge requires maintenance. Choosing the wrong approach creates technical debt.
**Test:** For any note that references another vault: (1) Is the approach documented? (2) Is there a sync mechanism? (3) Can you find the canonical source in 2 clicks?

## Related Notes

- [[Multi-Vault Architecture]] - Vault structure fundamentals
- [[Knowledge Originality Assessment]] - Determining canonical ownership
- [[Vault Health Automation]] - Cross-vault link checking
