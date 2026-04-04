---
author-type: ai-assisted
confidence: emerging
gap-status: proposed
gap-priority: high
gap-phase: implementation
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-04-02
domain: knowledge-management
lifecycle: seed-gap
last-analyzed: 2026-04-02
analysis-conclusion: "Seed covers staleness/obsolescence/context-shift but lacks goal-transition handling. This is distinct and worth adding as a Seed extension."
proposed-rule: |
  **Rule:** Track goal/context dependencies in purpose-specific knowledge — when the user's goals change, apply goal-transition handling.
  
  **Why:** Without goal tracking, AI agents cannot distinguish between stale (time), obsolete (reality), or goal-transitioned (priorities changed) knowledge. Goal-transitioned knowledge wastes maintenance effort and creates retrieval noise.
  
  **Test:** For purpose-specific notes: (1) Can you identify the goal that made this relevant? (2) Is there mechanism to detect goal changes? (3) Does vault reflect current vs abandoned goals? (4) Is there a goal-transition workflow?
---

# Frontier Exploration - Knowledge Context Transition and Goal Drift

## Updated Analysis (2026-04-02)

The Seed now explicitly addresses:
- **Staleness detection** (time-based) — `staleness: confirmed`, last-reviewed tracking
- **Obsolescence handling** (reality-based) — deprecated, superseded-by, external extinction
- **Context-shift** (applicability to others) — target-user-expertise tracking

However, a specific case remains unaddressed: **goal/context transition** — when knowledge becomes irrelevant because the user's goals changed, not because the knowledge became stale, wrong, or inapplicable to others.

This gap is worth addressing because:
1. Maintenance continues on knowledge no longer relevant (wasted effort)
2. Retrieval surfaces accurate but goal-irrelevant content
3. The vault doesn't reflect current priorities vs abandoned goals

## The Problem

When users change their goals, projects, or life priorities, knowledge that was previously useful and accurate becomes irrelevant — not because it was wrong, but because the context that made it applicable no longer exists.

**Goal/context transition** is different from:
- **Staleness**: Knowledge that was correct but time has passed (needs review)
- **Obsolescence**: Knowledge that was correct but reality changed (needs replacement)
- **Context-shift**: Knowledge that applies to others but not you personally

The knowledge was correct for old goals, but those goals are no longer held. Examples:
- Notes about preparing for a job interview for a role you decided not to pursue
- Research on a city you were considering moving to, but you've chosen elsewhere
- Learning resources for a skill you decided not to acquire
- Project planning for an initiative you abandoned
- Recipe collections for dietary restrictions you've lifted

## Why This Matters for AI Knowledge Management

The Seed has rules for staleness detection and obsolescence handling, but no explicit mechanism for knowledge that becomes irrelevant due to goal evolution. Without this:

1. **Maintenance waste**: Agents continue verifying and updating knowledge that no longer provides value
2. **Retrieval confusion**: Users get presented with knowledge that is technically accurate but no longer relevant to their current situation
3. **Goal drift invisibility**: The vault doesn't reflect the user's evolving priorities, making it harder to see what they currently care about
4. **Noise accumulation**: Over time, the vault accumulates "zombie knowledge" — accurate but useless by association

## Current Seed Gaps

The Seed addresses:
- Staleness detection (time-based)
- Obsolescence handling (reality-based)
- Context-shift (applicability to others)

Missing:
- **Goal evolution handling**: How to detect when knowledge became irrelevant due to user goal changes
- **Goal metadata**: Tracking what goals/contexts made knowledge applicable
- **Transition workflow**: How to handle knowledge when goals change
- **Archival vs deletion**: When to keep goal-transitioned knowledge vs remove it

## Proposed Seed Rule

**Rule:** Track goal/context dependencies in knowledge that is purpose-specific — when the goal that made knowledge applicable changes, apply goal-transition handling protocol.

**Why:** Without goal tracking, AI agents cannot distinguish between knowledge that is stale (time), obsolete (reality), or goal-transitioned (user priorities changed). Treating all three the same wastes maintenance effort and creates retrieval noise.

**Test:** For purpose-specific knowledge (job prep, project plans, location research): (1) Can you identify what goal/context made this knowledge relevant? (2) Is there a mechanism to detect when that goal has changed? (3) Does the vault reflect current goals vs abandoned goals? (4) Is there a workflow for goal-transitioned knowledge (archive, tag, review)?

## Implementation Considerations

- **Goal metadata**: Add `applicable-goal:` frontmatter to purpose-specific notes
- **Goal tracking**: Maintain a simple "current goals" list that can be compared against note metadata
- **Transition detection**: Flag notes whose applicable-goal is no longer in current goals
- **Handling options**: Archive (keep with goal context), tag (mark as goal-transitioned), or delete

## Related Notes

- [[Seed Gap - Knowledge Deprecation and Obsolescence Management]] (covers obsolescence, not goal transition)
- [[Frontier Exploration - Note Completion Criteria]] (doesn't address goal changes)
- [[Frontier Exploration - When a Note Has Become Obsolete]] (focuses on factual obsolescence)