---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - vault-architecture
  - multi-vault
---

# Frontier Exploration - When to Create a New Vault

> "One vault to rule them all?" — When separate vaults make more sense than one mega-vault.

## The Problem

The Seed provides extensive guidance on:
- How to structure notes within a vault
- How to organize content with hubs and links
- How to handle cross-domain knowledge within one vault
- Vault boundaries (what belongs vs. what doesn't)

But the Seed is silent on a fundamental architectural question: **When should you create a separate vault instead of continuing to grow the current one?**

This gap matters because:
- One mega-vault becomes unwieldy
- Different vaults can have different conventions
- Separation can clarify purpose
- But too many vaults fragment knowledge

## The Core Tension

Two valid impulses conflict:

1. **Unified Vault**: One place for everything → easier search, cross-pollination, single set of conventions
2. **Separate Vaults**: Domain-specific vaults → clearer purpose, tailored conventions, focused scope

The Seed optimizes for the unified approach but doesn't define the breaking point.

## Signals That Suggest a New Vault

### 1. Fundamentally Different Conventions Needed

If a domain requires conventions that conflict with the main vault:
- Medical vault needs strict source hierarchy (per Seed rule)
- Creative writing vault needs subjective consensus tagging
- Code vault needs version-scoping for every note
- **Signal**: You're fighting the Seed to accommodate this domain

### 2. Different Audience, Different Needs

If knowledge serves fundamentally different audiences:
- Personal knowledge base vs. team/shared knowledge base
- Learning vault (pedagogical structure) vs. reference vault (alphabetical/categorical)
- **Signal**: The same note would need different structure for different users

### 3. Access Control Requirements

If some knowledge must be isolated:
- Client-specific information that can't mix with personal
- Sensitive data (financial, medical, legal) requiring different security
- **Signal**: You need different permissions for different parts

### 4. Scale Becomes Unmanageable

When one vault grows so large that:
- Graph traversal becomes slow
- Search results are overwhelmed
- Review cycles take too long
- **Signal**: The vault has 500+ notes and no natural hub can hold it all

### 5. Purpose Divergence

When the vault's purpose statement no longer fits:
- Started as "cooking notes" → now includes restaurant reviews, nutrition science, food history
- Started as "work projects" → now includes career planning, industry research, skill development
- **Signal**: The `_root.md` purpose statement feels forced

### 6. Different Update Cadence

When knowledge in one area changes at a fundamentally different rate:
- News/current events (daily updates) mixed with philosophy (decades-stable)
- **Signal**: Some notes need weekly review, others yearly

## Signals to KEEP One Vault

### 1. Natural Cross-Pollination

If domains naturally inform each other:
- Cooking + nutrition science + food history = richer together
- Programming + mathematics + philosophy = unexpected insights
- **Signal**: Removing a domain would impoverish another

### 2. Shared Conventions Work

If one set of conventions serves all domains well:
- The Seed's domain-agnostic rules actually apply
- No domain requires rule exceptions
- **Signal**: You can apply the Seed uniformly

### 3. Single Audience

If you're the only user (or same audience for all):
- No access control needed
- No competing structural needs
- **Signal**: One purpose serves everyone

### 4. Manageable Scale

If the vault is growing but staying healthy:
- Graph metrics look good
- Review cycles are sustainable
- Search remains precise
- **Signal**: Growth isn't causing pain

## The Decision Framework

### Create a New Vault When:

| Condition | New Vault? |
|-----------|-----------|
| Different conventions needed | ✅ Yes |
| Different audience | ✅ Yes |
| Access control needed | ✅ Yes |
| 500+ notes, no natural hub | ✅ Yes |
| Purpose no longer unified | ✅ Yes |
| Wildly different update cadence | ✅ Consider |
| Cross-pollination essential | ❌ No |
| Single audience | ❌ No |
| Shared conventions work | ❌ No |
| Scale manageable | ❌ No |

### The Hybrid Approach

Sometimes you don't need a new vault, just better structure:
- Use domain tags extensively
- Create domain-specific entry points
- Use audience metadata
- Separate with clear section hubs

**Rule of thumb**: Create a new vault only when you can articulate a different purpose that justifies the fragmentation cost.

## Proposed Seed Rules

### Rule: Evaluate vault architecture at 200 notes

**Why:** Beyond 200 notes, the cost of reorganization increases dramatically. It's cheaper to split early than migrate later.

**Test:** Does your vault exceed 200 notes? Have you explicitly evaluated whether to split?

### Rule: Create separate vaults when purposes diverge

**Why:** A vault with multiple purposes lacks coherence. Each purpose deserves its own structure.

**Test:** Can you state your vault's purpose in one sentence? Does every note serve that purpose?

### Rule: Use cross-vault links sparingly

**Why:** Cross-vault links are harder to maintain, don't benefit from shared conventions, and signal potential vault boundary issues.

**Test:** Are cross-vault links <1% of total links? If more, consider merging vaults.

### Rule: Document vault relationships

**Why:** Multiple vaults need documentation explaining their boundaries and relationships.

**Test:** Does a meta-document explain what each vault holds and why they're separate?

## Cross-Vault Patterns

If you do have multiple vaults:

### Hub-and-Spoke Across Vaults

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

### Cross-Vault Links

When knowledge genuinely spans vaults:

```markdown
# Nutrition Science

Related: Cooking/Recipe Quality, Programming/Health Tracker App

> Cross-vault link format: Vault Name/Note Name (not a real link in this vault)
```

### Unified Search

Use a meta-layer for cross-vault search:
- Tag each vault with `vault: [name]`
- Search across vaults with prefix: `vault:cooking`
- Or use a master index that links to all vaults

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Note Types and Templates]]
- [[Graph Navigation MCP]]
- [[Hub Node Creation]]
- [[Note Prioritization Strategy]]
- [[Domain-Specific Knowledge Bases]]
