---
last-reviewed: 2026-03-31
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
gap-status: proposed
gap-priority: high
gap-source: frontier-exploration
discovered: 2026-03-31
tags:
  - seed-refinement
  - collaborative
  - governance
  - multi-author
  - access-control
---

# Seed Refinement - Collaborative Knowledge Base Governance

> **Refinement:** Add explicit governance rules for collaborative knowledge bases where multiple contributors create, review, or access content.

## Gap Analysis

The Seed provides extensive rules for **personal** knowledge bases but lacks dedicated guidance for **collaborative or multi-author knowledge bases** — vaults where multiple people contribute, review, or access different subsets of content.

### Current Seed Coverage (Insufficient)

The Seed has scattered references:
- `gap-owner: optional` — only mentions collaborative in gap tracking context
- `contribution-type:` field — tracks individual contribution in synthesis, not governance
- `author-type: collaborative` — mentions mixed provenance, not multi-author coordination
- No explicit permission tiers, review workflows, or conflict resolution

### What the Seed Lacks

For collaborative vaults, the Seed doesn't address:
1. **Permission tier structure** — Who can create, edit, delete, or view what?
2. **Attribution requirements** — How to track who contributed what?
3. **Conflict resolution** — When two authors edit the same note, how is it resolved?
4. **Quality gates** — What review process before content becomes "official"?
5. **Partial visibility** — How to handle notes some users can see and others cannot?
6. **Contributor lifecycle** — What happens when someone joins or leaves?

## Proposed Rule Addition

**Rule:** For collaborative knowledge bases with multiple contributors, explicitly define permission tiers, attribution requirements, review workflows, and conflict resolution protocols before content is added.

**Why:** Without explicit governance, collaborative vaults degrade into either (a) chaos (anyone edits anything) or (b) paralysis (no one knows what's allowed). The Seed's current rules assume a single author — collaborative vaults need coordination rules that personal vaults don't require.

**Test:** For a collaborative knowledge base: (1) Can you identify who can edit each note? (2) What review process applies? (3) How are conflicts resolved? (4) What happens when someone joins or leaves? (5) Can you determine what content is visible to whom?

## Implementation Guidance

### Frontmatter Fields

```yaml
# For collaborative notes
collaborative: true
permission-tier: owner|editor|reviewer|reader
author: [[username]]
last-editor: [[username]]
contributors:
  - [[username1]]
  - [[username2]]
review-status: draft|pending-review|approved|archived
requires-review: true|false
reviewers: [[username]]
approval-date: 2026-03-31

# For access-controlled content
access-level: public|internal|restricted|private
allowed-groups: [group1, group2]
```

### Permission Tier Definitions

| Tier | Create | Edit | Delete | Review | View |
|------|--------|------|--------|--------|------|
| Owner | ✓ | ✓ | ✓ | ✓ | ✓ |
| Editor | ✓ | Own only | Own only | — | ✓ |
| Reviewer | — | — | — | Assigned | ✓ |
| Reader | — | — | — | — | ✓ |

### Review Workflow

```
Draft → Pending Review → Approved → (Optional: Archived)
```

- **Draft**: Initial creation, author-only edit
- **Pending Review**: Submitted for review, reviewers can comment
- **Approved**: Official knowledge, requires reviewer approval
- **Archived**: Deprecated but preserved for reference

### Conflict Resolution Protocol

1. **Last-write-wins with notification** — Simple but can lose work
2. **Merge required** — Both edits preserved, manual merge needed
3. **Designated resolver** — Specific person decides on conflicts
4. **Vote-based** — Community decides on contested changes

Choose based on vault criticality and contributor count.

### Contributor Lifecycle

```yaml
# When contributor joins
contributor-status: active|pending|departed
joined-date: 2026-01-15
departed-date:  # when they leave
# Archive their notes or reassign ownership
```

## Test Case: Team Documentation Wiki

A team creates a collaborative knowledge base for engineering practices:

1. **Without governance rules:**
   - Anyone edits anything → conflicting guidance appears
   - No review process → unverified content treated as official
   - No attribution → can't trace decisions to decisions-makers
   - Departures leave orphan content with no owner

2. **With governance rules:**
   - Tier system: Senior engineers approve, junior editors propose
   - Review workflow: All changes go through PR-like review
   - Attribution: Every note tracks author and last-editor
   - Lifecycle: Departures trigger ownership reassignment

## Rationale

As knowledge bases grow beyond personal use (team wikis, family knowledge bases, organizational documentation), governance becomes critical. The current Seed explicitly optimizes for single-author vaults — collaborative vaults need explicit coordination rules that the Seed currently assumes away.

## Integration Path

1. Add new rule to Seed Foundation section (after "Use construction-phase model")
2. Update Schema.md to include collaborative fields
3. Add compliance audit for collaborative vaults
4. Document in vault documentation for teams adopting

## Related Seed Rules

- [[Frontier Exploration - Access-Controlled Knowledge]] — Related but focuses on content, not governance
- [[Frontier Exploration - Collaborative Knowledge Creation]] — Focuses on creation, not ongoing coordination
- [[Frontier Exploration - Knowledge Version Control]] — Tracks changes but not multi-author coordination
- [[Seed Gap - Collaborative Knowledge Base Governance]] — Original gap note

---

*Discovered during heartbeat: 2026-03-31*
*Method: FRONTIER_EXPLORATION*