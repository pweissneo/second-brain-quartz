---
lifecycle: seed-gap
confidence: high
author-type: ai-assisted
verification-status: verified
gap-type: seed-missing
gap-resolution: resolved
gap-resolution-note: Resolved by Seed Refinement - Collaborative Knowledge Base Governance
resolved-by: [[Seed Refinement - Collaborative Knowledge Base Governance]]
discovered: 2026-03-28
resolved: 2026-04-01
tags:
  - seed-gap
  - collaboration
  - multi-author
  - access-control
  - archived
---

> ✅ **This Seed Gap has been RESOLVED and integrated into the Seed Refinement.**
> The proposed rule has been refined in [[Seed Refinement - Collaborative Knowledge Base Governance]].
> This note is preserved for historical reference and documentation purposes.

# Seed Gap: Collaborative Knowledge Base Governance

## The Gap

The Seed provides extensive rules for individual/personal knowledge bases but lacks explicit guidance for **collaborative or multi-author knowledge bases** — vaults where multiple people contribute, review, or access different subsets of content.

## Why This Matters

As knowledge bases grow beyond personal use (team wikis, family knowledge bases, organizational documentation), governance becomes critical:

1. **Permission boundaries**: Who can create, edit, delete, or view what?
2. **Attribution**: How to track who contributed what?
3. **Conflict resolution**: When two authors edit the same note, how is it resolved?
4. **Quality gates**: What review process before content becomes "official"?
5. **Partial visibility**: How to handle notes that some users can see and others cannot?

## Current Vault Coverage

The vault has scattered coverage:
- [[Frontier Exploration - Access-Controlled Knowledge]] — mentions access levels but not governance
- [[Frontier Exploration - Collaborative Knowledge Creation]] — focuses on the act of creating together, not ongoing governance
- [[Frontier Exploration - Knowledge Version Control]] — tracks changes but not multi-author coordination

## What's Missing

A Seed rule should address:
1. **Permission tier structure**: Define explicit tiers (owner, editor, reviewer, reader)
2. **Attribution requirements**: Track author, last-editor, review-status
3. **Conflict protocol**: Define what happens when edits conflict
4. **Quality gates**: Define when notes move from draft to verified
5. **Visibility handling**: How to tag and query partial-access content

## Proposed Rule Structure

```yaml
# For collaborative notes
collaborative: true
permission-tier: owner|editor|reviewer|reader
author: [[username]]
last-editor: [[username]]
review-status: draft|pending-review|approved
requires-review: true|false
```

**Rule:** For collaborative knowledge bases with multiple contributors, explicitly define permission tiers, attribution requirements, review workflows, and conflict resolution protocols before content is added.

**Why:** Without explicit governance, collaborative vaults degrade into either (a) chaos (anyone edits anything) or (b) paralysis (no one knows what's allowed). Personal vault rules assume a single author — collaborative vaults need coordination rules.

**Test:** Can you identify: (1) Who can edit each note? (2) What review process applies? (3) How are conflicts resolved? (4) What happens when someone leaves?

## Gap Resolution

This should become a Seed rule in the Foundation or Governance section, addressing multi-author coordination that the current Seed doesn't cover.

---

*Discovered during heartbeat: 2026-03-28*
*Method: FRONTIER_EXPLORATION*