---
last-reviewed: 2026-03-31
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - user-context-knowledge
  - personal-knowledge
  - knowledge-decay
gap-status: identified
gap-priority: medium
gap-source: frontier-exploration
---

# Frontier Exploration - User-Context-Dependent Knowledge

> How to manage knowledge that is valid only for specific user configurations, contexts, or life stages — knowledge that becomes unreliable not due to time passing or external conditions changing, but because the user's own context changed.

## The Gap

The Seed handles several forms of knowledge degradation:
- **Temporal staleness** — knowledge gets old with time (review cycles, decay functions)
- **Condition-triggered** — knowledge applies only when specific conditions are met (market regimes, seasonal states)
- **Obsolescence** — knowledge becomes wrong because reality changed (outdated facts)

But there's a distinct category the Seed doesn't address: **user-context-dependent knowledge** — knowledge that was accurate for the user's specific configuration but becomes unreliable because the user's context changed, even though nothing external changed and the knowledge hasn't aged.

## Examples

### Personal Configuration Knowledge
- "How to set up my development environment" — becomes irrelevant when you switch IDEs or OS
- "My meeting schedule patterns" — wrong when your role changes
- "My commute route" — irrelevant after moving
- "Tools I use for X task" — obsolete after tool changes

### Life Stage Knowledge
- "How I manage time with young kids" — changes when kids grow
- "My fitness routine for my current body" — changes as fitness level changes
- "Budget approach for my income bracket" — wrong after promotions/salary changes

### Preference Knowledge
- "My coffee order" — changes with taste evolution
- "How I like to communicate with X person" — relationship dynamics shift
- "What works for my sleep schedule" — chronotype doesn't change, but circumstances do

### Workflow Knowledge
- "The order I do morning tasks" — changes with job/life changes
- "How I handle email" — tools and roles change
- "My note-taking system" — evolves with needs

## Why Current Seed Rules Are Incomplete

1. **Not time-based** — The knowledge isn't old; it may be from yesterday. Time-based decay wouldn't catch it.

2. **Not condition-based** — The external conditions haven't changed. It's the user's internal context that shifted.

3. **Not obsolescence** — The knowledge isn't factually wrong. It's just no longer applicable to this user.

4. **No user-context field** — Notes don't track which user configuration the knowledge depends on.

## Key Distinction: User-Context vs Personal Knowledge

This is different from "personal knowledge" (knowledge captured from personal experience):

| Aspect | Personal Knowledge | User-Context-Dependent |
|--------|------------------|----------------------|
| Source | Personal experience | Can come from anywhere |
| Validity | True for you (subjective) | Was true for your old config |
| Degradation | Doesn't degrade | Degrades when context changes |
| Fix | Update with new experience | Update with new context |

**Personal knowledge example:** "My favorite coffee is medium roast" — still true, just may change.
**User-context example:** "My VS Code shortcuts" — was true, now wrong because you switched to Zed.

## Proposed Seed Rule

**Rule:** For knowledge that depends on specific user configuration, include `user-context` frontmatter specifying the context dependencies.

**Why:** Without explicit user-context tracking, AI agents cannot distinguish between knowledge that should be updated (user context changed) vs. knowledge that is stable (user context still applies). This causes agents to present outdated user-specific guidance.

**Test:** For notes about personal setups, workflows, or preferences: (1) Is there `user-context:` frontmatter? (2) Can you identify which aspect of user config this depends on? (3) Is there a mechanism to detect when user context has changed?

**Implementation:**
```yaml
user-context:
  context-type: tool-configuration|workflow|preference|life-stage|role
  context-dependency: "IDE: VS Code"  # specific config
  valid-from: 2025-01-01
  context-change-trigger: "tool-change|role-change|move|life-stage"
  last-verified: 2026-03-01
```

### Context Types

- `tool-configuration` — Depends on specific software/tools
- `workflow` — Depends on process or routine
- `preference` — Personal taste (can change)
- `life-stage` — Depends on life circumstances
- `role` — Depends on job/position
- `environment` — Depends on physical location

### Change Detection

**Rule:** Include explicit `context-change-trigger` — what event would make this knowledge obsolete?

**Test:** Can you identify what would need to change for this knowledge to become unreliable?

Examples:
- "My VS Code setup" → trigger: switching editors
- "Morning routine" → trigger: job change, move
- "Budget approach" → trigger: income change

## Lifecycle Extension

Extend note lifecycle with user-context states:

| State | Meaning |
|-------|---------|
| `active` | User context unchanged, knowledge applicable |
| `context-changed` | User context changed, needs verification |
| `deprecated` | Confirmed obsolete, context no longer applies |

**Transition rule:** When user reports context change (new job, moved, switched tools), automatically mark relevant notes as `context-changed` for verification.

## Verification Distinction

Verify user-context-dependent knowledge differently:
- **Time-based verification:** "Is this still accurate?" (fact check)
- **Context-based verification:** "Does this still apply to my current context?" (relevance check)

## Retrieval Implications

When presenting user-context knowledge:
1. Check current user context against note's context dependency
2. If mismatched, flag as "may not apply to current configuration"
3. Offer to verify against current context

## Related Seed Rules

- [[Frontier Exploration - Condition-Triggered Knowledge]] — Related but external-condition based
- [[Seed Gap - Knowledge with Inherent Expiration Windows]] — Related but time/event based
- [[Frontier Exploration - Personal Knowledge vs Vault Knowledge]] — Distinction between personal and vault knowledge
- [[Frontier Exploration - Knowledge Calibration by Use Intent]] — Calibration based on how knowledge will be used

## Test Questions

1. Can you identify knowledge that depends on your specific user configuration?
2. Do those notes document their context dependencies?
3. When your context changes (new tools, new role), do you have a way to find affected notes?
4. Does your retrieval system distinguish "true but not applicable" from "false"?

---

**Questions for Seed refinement:**
- Should user-context knowledge have automatic invalidation when context change detected?
- How do you handle knowledge that's partially context-dependent (some parts still valid)?
- Is there a "context migration" process for updating user-context notes?