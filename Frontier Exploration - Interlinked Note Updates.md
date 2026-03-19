---
last-reviewed: 2026-03-19
last-updated: 2026-03-19
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
thinking-tool-type: organizational-decision
---

# Frontier Exploration - Interlinked Note Updates

## The Problem

When one piece of knowledge changes, it often creates a cascade of necessary updates across the vault:

- A hub note's categorization changes → all spoke notes may need updating
- A foundational definition evolves → all notes referencing it may need adjustment  
- A tool or method is replaced → related tutorials, workflows, and anti-patterns all need updates
- A domain terminology standard changes → all usage must be synchronized

The Seed covers **active replacement** (tracking what changed and why) but doesn't address the **coordination problem**: how do you ensure all affected notes get updated together?

## Why This Matters

Without explicit interlinked update tracking:
1. **Partial updates** create inconsistency - some notes reflect the new reality, others still reference the old
2. **Update cascades** are invisible - you fix one note but miss three others
3. **Update debt** accumulates silently - each individual note looks fine, but together they're inconsistent
4. **Reasoning fails** - AI agents traverse the graph and encounter contradictory information

## The Gap in Current Seed Rules

Current rules address:
- [[Active Knowledge Replacement]] - tracking that Note A replaces Note B
- [[Handling Incorrect or Outdated Knowledge]] - marking notes as obsolete
- [[Contradiction Detection]] - finding conflicting claims

What's MISSING:
- **Coordination tracking** - knowing that updating Note A requires checking Notes B, C, D
- **Update dependency graphs** - explicit relationships between notes that must be updated together
- **Batch update workflows** - processes for handling multi-note changes

## Proposed Solution: Update Dependency Frontmatter

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

## When to Use This

Apply update dependency tracking when:
1. You're making a change to a hub note that affects its spokes
2. A foundational concept changes meaning
3. A tool/technology you're documenting gets updated
4. A terminology standard shifts
5. Any change could create inconsistency if not propagated

## Example: Tool Version Update

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

## Integration with Seed Rules

This extends rather than replaces existing rules:
- Still use [[Active Knowledge Replacement]] for the replacement relationship
- Still use correction metadata when knowledge is wrong
- Add update-dependencies as a PRE-EMPTIVE tracking mechanism

## Test Questions

For your vault, can you answer:
1. When was the last time you updated multiple notes for a single change?
2. Do you track which notes depend on each other for consistency?
3. Can you identify notes that might be partially outdated because their dependencies changed?

## See Also

- [[Active Knowledge Replacement]]
- [[Handling Incorrect or Outdated Knowledge]]  
- [[Knowledge Debt]]
- [[Multi-Vault Architecture]] (for cross-vault dependencies)
