---
last-reviewed: 2026-03-29
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
gap-status: integrated
gap-priority: medium
gap-phase: implementation
gap-severity: useful
updated: 2026-03-29
---

# Multi-Vault Knowledge Management

> How should knowledge bases handle multiple vaults and the knowledge that spans them?

*This note consolidates: Multi-Vault Architecture, Cross-Vault Knowledge Relationships, Vault Merging and Migration, and Interlinked Note Updates.*

## The Core Problem

The Seed assumes a single vault, but practical knowledge management often involves multiple vaults:
- Personal knowledge base
- Professional/work vault
- Project-specific vaults
- Shared team vaults

Knowledge doesn't respect vault boundaries:
- A note about "time management" might belong in both personal productivity and work contexts
- Technical documentation might live in both a project vault and a professional reference vault
- Learning notes might connect to both a learning vault and a career vault

## When to Create a New Vault

### Signals That Suggest a New Vault

| Signal | Description |
|--------|-------------|
| **Different conventions needed** | A domain requires conventions that conflict with the main vault (e.g., strict source hierarchy for medical, version-scoping for code) |
| **Different audience** | Knowledge serves fundamentally different users with different structural needs |
| **Access control** | Some knowledge must be isolated (client-specific, financial, medical requiring different security) |
| **Scale becomes unmanageable** | Vault exceeds 500+ notes with no natural hub that can hold it all |
| **Purpose divergence** | The `_root.md` purpose statement no longer fits new content |
| **Wildly different update cadence** | Some notes need daily review, others yearly (e.g., news vs. philosophy) |

### Signals to Keep One Vault

| Signal | Description |
|--------|-------------|
| **Natural cross-pollination** | Domains naturally inform each other (cooking + nutrition + food history) |
| **Shared conventions work** | The Seed's domain-agnostic rules apply uniformly |
| **Single audience** | No access control needed, one purpose serves everyone |
| **Manageable scale** | Graph metrics look good, search remains precise, growth isn't causing pain |

### Decision Framework

```
CREATE new vault when:
  - Different conventions needed → YES
  - Different audience → YES
  - Access control needed → YES
  - 500+ notes, no natural hub → YES
  - Purpose no longer unified → YES

KEEP one vault when:
  - Cross-pollination essential → YES
  - Single audience → YES
  - Shared conventions work → YES
  - Scale manageable → YES
```

**Rule of thumb:** Create a new vault only when you can articulate a different purpose that justifies the fragmentation cost.

## Cross-Vault Patterns

### Pattern 1: Hub-and-Spoke Across Vaults

```
[Master Index]
    |
    +-- [Cooking Vault]
    |       + Recipes, Techniques, Ingredients
    |
    +-- [Programming Vault]
    |       + Algorithms, Languages, Tools
    |
    +-- [Personal Vault]
            + Goals, Health, Finances
```

### Pattern 2: Vault Alias System

Create lightweight "pointer" notes that summarize and link to the canonical source:

```markdown
# Communication Principles (Work Vault)

> Summary: Key principles from [[../personal/Effective Communication]]

See main note for full details. This version focuses on workplace applications.
```

**Test:** Can someone find the canonical source from any vault's pointer? Do pointers include a "last sync" date?

### Pattern 3: Shared Kernel

For vaults that heavily overlap, identify a "shared kernel" of knowledge that lives in its own vault, referenced by others:

```
my-knowledge-base/
  shared-kernel/        # Evergreen, universal knowledge
  work-vault/          # References shared-kernel
  personal-vault/      # References shared-kernel  
  project-alpha/      # Temporary, will be archived
```

**Test:** Can you identify 10+ notes that could live in shared-kernel? Is the kernel stable (rarely needs updates)?

### When to Use Each Pattern

| Situation | Recommended Pattern |
|-----------|---------------------|
| Highly domain-specific vaults (work vs hobby) | Hub-and-spoke |
| Overlapping domains with different perspectives | Vault alias system |
| Foundational knowledge used everywhere | Shared kernel |
| Temporary project knowledge | Duplicate with expiry date |

## Cross-Vault Linking

**Principle:** Cross-vault links are legitimate and useful. The Seed's "every link must be explainable" applies — cross-vault links should pass the same test.

Use consistent naming convention for cross-vault references:
```
[[vault-name/note-name]] or [[../other-vault/note-name]]
```

```yaml
# Frontmatter for cross-vault knowledge
canonical-vault: personal
local-variant: true  # This is a summary/link, not canonical
last-sync: 2026-03-29
cross-vault-links:
  - ../work-vault/related-note
  - ../research-vault/deep-dive
```

**Test:** Can I explain why someone would follow this link to another vault? If the other vault might not exist for all users, note the dependency.

## Reference Over Duplicate

When content naturally belongs in multiple vaults, prefer referencing over duplicating:
- Create a "stub" note in the secondary vault that references the primary vault
- Use canonical location for the "real" note
- Only duplicate when the use case is genuinely different

**Test:** "Would someone expect different content in this vault vs. the primary location?" If yes, duplicate with adaptation. If no, reference.

## Vault Merging

When combining two vaults (e.g., merging personal with work, or vaults from different phases):

### Key Principles

1. **Purpose hierarchy wins.** Establish a clear primary purpose for the merged vault. Notes that don't serve the primary purpose become candidates for archival.

2. **Canonical over duplicate.** Establish a canonical vault (usually the one with better structure) and migrate content into it.

3. **Link bridging.** Create "bridge notes" that summarize content from the other vault rather than importing everything.

### Merge Workflow

1. **Identify cross-vault links** (notes in Vault A that link to Vault B)
2. **Categorize each as:** merge, bridge, or archive
3. **Detect duplicates** (similar titles or >70% content overlap)
4. **Resolve duplicates** using purpose-alignment
5. **Report unresolved conflicts**

### Schema Conflicts

Schema conflicts during merge should default to the more comprehensive schema and migrate notes to that standard.

## Platform Migration

When moving a vault from one tool to another (Obsidian → Quartz, Roam → Logseq, etc.):

### Migration Workflow

1. **Test migration first.** Migrate a subset (20-30 notes) to identify breaking changes.

2. **List all non-standard syntax** (plugins, special features)

3. **Categorize each as:** convert, replace, or document-as-deprecated

4. **Verify all attachments** are accessible post-migration

5. **Confirm search** returns equivalent results

### Key Risks

| Risk | Mitigation |
|------|------------|
| Link format conversion | Wikilinks vs Markdown links vs HTML links |
| Metadata loss | Some tools don't support all frontmatter fields |
| Plugin dependency | Notes relying on community plugins may break |
| Attachment handling | Images, PDFs need relinking |

### Preservation Principle

The structural knowledge (how notes connect) is more valuable than the specific link syntax. Rebuild links in new format rather than just converting syntax.

## Interlinked Note Updates

When one piece of knowledge changes, it often creates a cascade of necessary updates across the vault:

- A hub note's categorization changes → all spoke notes may need updating
- A foundational definition evolves → all notes referencing it may need adjustment  
- A tool or method is replaced → related tutorials, workflows, and anti-patterns all need updates
- A domain terminology standard changes → all usage must be synchronized

### Update Dependency Tracking

```yaml
update-dependencies:
  - note: "[[Related Note]]"
    change-type: terminology|reference|procedure|context
    urgency: required|recommended|review
    reason: "Why this note needs updating"
```

### Change Types

- **terminology**: Word/phrase usage changed (e.g., "AI assistant" → "AI agent")
- **reference**: Link or citation needs updating (e.g., old URL, deprecated API)
- **procedure**: Step-by-step knowledge changed (e.g., new tool version)
- **context**: Assumptions or context shifted (e.g., new policy, changed circumstances)

### Urgency Levels

- **required**: Must update before note is usable
- **recommended**: Should update for consistency  
- **review**: Check if update needed (may not apply)

### Example: Tool Version Update

```yaml
# In Note: Old Tool Tutorial.md
update-dependencies:
  - note: "[[New Tool Tutorial]]"
    change-type: procedure
    urgency: required
    reason: "Old tutorial now points to deprecated version"
  - note: "[[Tool Comparison]]"
    change-type: reference
    urgency: required
    reason: "Version numbers need updating"
  - note: "[[Troubleshooting Guide]]"
    change-type: procedure
    urgency: recommended
    reason: "Some errors may be version-specific"
```

## Migration Triggers

Content should migrate between vaults when:
- Purpose changes (personal project becomes professional)
- Scope changes (hobby becomes career)
- Vault context changes (individual becomes team)

**Test:** "Has the context for this knowledge fundamentally changed?" If yes, consider migration.

## Edge Cases

**Orphan cross-references:** What happens when the referenced vault doesn't exist or is private? Consider: conditional links, fallback explanations, or avoiding cross-vault links when the vault is personal/private.

**Stale references:** Cross-vault links can break when vaults are reorganized. Include: last-verified dates, regular link audits across vaults.

**Inconsistent definitions:** The same term might have different meanings in different vaults. Use: explicit context in cross-vault links, disambiguation notes.

## Seed Rule Proposal

**Rule:** Evaluate vault architecture at 200+ notes using explicit purpose and scale criteria. Use cross-vault links sparingly (<1% of total links). Document vault relationships when maintaining multiple vaults.

**Why:** Beyond 200 notes, the cost of reorganization increases dramatically. It's cheaper to split early or coordinate multiple vaults intentionally rather than let fragmented knowledge accumulate. Cross-vault links require maintenance; keeping them minimal reduces coordination burden.

**Test:** (1) Can you state your vault's purpose in one sentence? (2) Do all notes serve that purpose? (3) Are cross-vault links <1% of total links? (4) Does documentation explain what each vault holds and why they're separate?

## See Also

- [[Frontier Exploration - Multi-Vault Architecture]] — Technical architecture considerations
- [[Frontier Exploration - Cross-Vault Knowledge Relationships]] — Different angle
- [[Vault Merging and Migration]] — When vaults combine
- [[AI-Assisted Knowledge Management Seed]] — Single-vault focus