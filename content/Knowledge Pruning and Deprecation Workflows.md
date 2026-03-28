---
last-reviewed: 2026-03-28
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-extension
  - knowledge-lifecycle
  - deprecation
  - maintenance
  - pruning
level: principle
---

# Knowledge Pruning and Deprecation Workflows

> How should an AI agent systematically prune deprecated knowledge and manage knowledge lifecycle transitions?

## The Gap

The Seed covers:
- Note lifecycle (evergreen, staging, draft)
- Verification status (verified, unverified)
- Obsolescence detection triggers
- Deprecation frontmatter fields

But it lacks explicit guidance on **when and how to prune** — when does deprecated knowledge become noise? What's the workflow from deprecation to potential deletion? How do you prevent the vault from accumulating stale content?

## The Problem in Practice

A knowledge base following current Seed rules might:
1. Mark notes as `deprecated: true`
2. Add `replaced-by:` links
3. Set `review-after:` dates

But after 2 years, the vault has:
- 47 deprecated notes
- 12 "review-after" dates that passed
- No clear process for what happens next
- Concerns about "deleting knowledge"

The vault grows perpetually, even with deprecation markers.

## Where AI Gets Stuck

Following current rules, an AI cannot answer:
1. "Should this deprecated note be archived or deleted?"
2. "What's the workflow from deprecated to removed?"
3. "When does a 'review-after' date become action, not just reminder?"
4. "How much deprecated content is too much?"

## The Pruning Principle

**Rule:** Deprecated knowledge has a lifecycle: deprecated → archived → (potentially) deleted. Establish explicit time-based or trigger-based pruning rules.

**Why:** Without pruning rules, deprecated notes accumulate indefinitely. The Seed says "never delete" but that creates an unbounded archive. Some deprecated knowledge becomes actively misleading (outdated security advice) or consumes maintenance effort without value.

**Test:**
1. Can you categorize all deprecated notes as archived vs. pending review?
2. Is there a defined period after which archived notes are reconsidered?
3. Are there notes explicitly marked for deletion (not just deprecation)?
4. Does the vault have a ratio of current:deprecated notes?

## Pruning Decision Framework

### Criteria for Archiving (keep, mark as historical)

| Criterion | Archive If... |
|-----------|---------------|
| Historical value | Understanding past decisions requires this |
| Pattern evidence | Shows how thinking evolved |
| Rare edge cases | Someone might need this rare scenario |
| Legal/compliance | Required retention period |
| Template value | Good example of what deprecated looks like |

### Criteria for Deletion (remove entirely)

| Criterion | Delete If... |
|-----------|--------------|
| Actively harmful | Following it causes damage |
| Redundant | Exact info exists elsewhere |
| Misleading | Appears current but isn't |
| Maintenance burden | Requires updates but has low value |
| Privacy risk | Contains sensitive info no longer needed |
| Age | Deprecated >X years with no recent access |

### The Time Factor

| Deprecated Age | Default Action | Exception |
|---------------|---------------|-----------|
| <6 months | Keep as-is | Critical security |
| 6-18 months | Archive | Template value |
| 18-36 months | Archive review | Historical value |
| >36 months | Delete unless flagged | Explicit retention |

## Implementation

### Archive Process

```yaml
---
deprecated: true
deprecated-date: 2026-01-15
deprecated-reason: "Superseded by improved version"
replaced-by: [[New Note]]
pruning-status: archived
archived-date: 2026-03-28
pruning-decision: "Historical value - contains pattern evidence"
next-review: 2027-03-01
---
```

### Deletion Process

```yaml
---
deprecated: true
deprecated-date: 2025-01-01
deletion-candidate: true
deletion-reason: "Actively misleading - security vulnerability"
deletion-approved: true
deletion-date: 2026-03-28
---
```

### Pruning Workflow

```
Monthly: Scan deprecated notes
  → Check if review-date passed
  → Apply archiving criteria
  → Flag candidates for deletion

Quarterly: Review archived notes
  → Check if still accessed
  → Apply deletion criteria
  → Document decisions
```

## The Vault Health Metric

Track the deprecated ratio:

```
deprecation-ratio = deprecated_notes / total_notes
```

| Ratio | Assessment |
|-------|------------|
| <5% | Healthy - active pruning |
| 5-15% | Acceptable - monitor |
| >15% | Warning - too much stale content |

This is a different metric from verification ratio — it measures lifecycle management, not quality.

## Relationship to Seed Rules

This extends existing Seed rules:

- **"Never delete" rule**: This rule applies to verified current knowledge. Deprecated knowledge is a different category — the "never delete" guidance is about not removing knowledge arbitrarily, not about preserving outdated content forever.

- **Deprecation fields**: The existing `deprecated:`, `replaced-by:`, `deprecated-review-date:` fields are step 1. This note adds step 2-4 (archiving workflow, deletion criteria, ratio tracking).

- **Diminishing returns**: Deprecated notes are a form of diminishing returns — maintenance effort for low value. Pruning is the operationalization of that principle.

## Edge Cases

### Safety-Critical Deprecation
When deprecated knowledge is safety-critical (old medical advice, outdated security practices), deletion should be accelerated. Add `safety-critical: true` to deprecated notes and prioritize review.

### Legal Retention
Some domains have mandated retention periods. Add `retention-requirement:` field with date or period. Skip deletion until retention satisfied.

### Collaborative Vaults
In shared vaults, pruning decisions may need approval. Add `pruning-approval-required: true` and track approver.

### Personal Knowledge
Personal vaults may want to keep more historical content (past projects, old interests). Adjust ratios and criteria to personal tolerance.

## Test for Pruning Awareness

Can you answer:
1. What percentage of your vault is deprecated?
2. What's your archiving vs. deletion ratio?
3. When did you last review deprecated notes?
4. What's your deprecation ratio trend (increasing/decreasing)?

If you can't answer these, you lack pruning awareness even if you have deprecation markers.

## Related Notes

- [[Frontier Exploration - Knowledge Deprecation and Obsolescence Management]] — Obsolescence detection and triggers
- [[AI-Assisted Knowledge Management Seed]] — Core rules this extends
- [[Note Lifecycle Management]] — Lifecycle stages (evergreen, staging, draft)
- [[Graph Maintenance]] — Graph health checks
- [[Self-Improvement Cycle]] — Continuous improvement