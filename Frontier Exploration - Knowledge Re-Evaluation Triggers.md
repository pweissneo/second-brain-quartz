---
last-reviewed: 2026-04-02
lifecycle: deprecated
confidence: n/a
author-type: ai-assisted
tags:
  - frontier-exploration
  - deprecated
  - redirect
redirect_to: [[Frontier Exploration - Knowledge Decision Framework]]
correction-type: merged
correction-date: 2026-04-02
corrected-by: [[Frontier Exploration - Knowledge Decision Framework]]
---

# Frontier Exploration - Knowledge Re-Evaluation Triggers

> **DEPRECATED (2026-04-02):** This note has been merged into [[Frontier Exploration - Knowledge Decision Framework]], which provides a unified framework covering option value, context validity, and verification priority.

## The Problem

The Seed covers:
- Gap identification (what's missing)
- Knowledge deprecation (when knowledge becomes outdated)
- Verification cycles (when to re-verify)

But it doesn't address: **When your LIFE context changes, how do you systematically re-evaluate knowledge that was correct in your old context but may not apply in your new one?**

Examples:
- You moved to a new city — all location-specific knowledge needs review
- You changed careers — domain knowledge may be irrelevant or new domains needed
- You acquired new equipment — technique knowledge may change
- Your financial situation changed — budget knowledge needs re-assessment
- You started a relationship — social/interpersonal knowledge expands

## Why This Matters

Without context-change triggers:
1. **Stale applicability** — Knowledge marked as "verified" stays verified forever, even when context makes it inapplicable
2. **Silent irrelevance** — Notes that worked in old context silently fail in new context
3. **Opportunity cost** — New context needs aren't identified; old knowledge isn't cleaned up
4. **False confidence** — Vault appears comprehensive but content is contextually obsolete

## Types of Context Changes

### Geographic Changes
- Move to new city/region/country
- Climate zone change
- Infrastructure availability change (public transit, internet speed)

### Professional Changes
- Career transition
- New role/industry
- Freelance to employed shift
- Retirement

### Equipment Changes
- New tool acquisition
- Tool loss/breakage
- Upgraded infrastructure (home office, workshop)

### Personal Changes
- Relationship status (single → partnered)
- Family changes (new child, children leaving)
- Health changes
- Financial situation change

### Temporal Milestones
- Turning 30/40/50 (different financial needs)
- Annual review periods
- Decade milestones

## Proposed Solution

### Context Change Audit Protocol

When any major context change occurs:

1. **Trigger identification** — Document what changed
2. **Knowledge audit** — Identify vault sections affected
3. **Applicability re-assessment** — For each affected note: still applicable?
4. **Gap identification** — What's needed in new context?
5. **Cleanup** — Archive context-specific notes from old context

### Frontmatter Fields

```yaml
context-dependent: true
context-type: geographic|professional|equipment|personal|temporal
context-validity:
  previous-context: "description of old context"
  current-context: "description of new context"
  applicability-changed: true|false
context-change-trigger: "What change prompted review"
last-context-audit: 2026-03-28
```

### Rule Proposal for the Seed

**Rule:** Tag context-dependent knowledge with explicit context scope — knowledge that applies only in specific life contexts must be tagged with `context-dependent: true` and `context-type:` indicating what context dimension matters.
**Why:** Without explicit context tagging, knowledge that was correct in one context silently persists when context changes. A note about "best neighborhoods for families in Chicago" is meaningless if you live in Denver. Context-dependent knowledge needs explicit tagging so context changes trigger appropriate audits.
**Test:** For notes with context-specific applicability: (1) Is there `context-dependent: true`? (2) Is `context-type:` specified? (3) Can you identify what context must be true for this to apply?

**Rule:** Conduct context-change audits when major life changes occur — for any significant context shift (location, career, equipment, relationships), audit the vault for affected knowledge within 30 days.
**Why:** Context changes invalidate applicability assumptions. Knowledge that was verified in old context may be completely wrong in new context. Without systematic audits, stale knowledge accumulates and surfaces at worst times.
**Test:** Can you identify: (1) Last major context change you experienced? (2) Notes that would be affected? (3) Have you audited them? If you can't answer, you need a context-change audit protocol.

## Example Workflow

**Scenario:** You moved from New York to Austin.

### Before Move (in vault)
- [[Best NYC Subways for Commuting]]
- [[NYC Winter Clothing Essentials]]
- [[Texas BBQ Restaurants to Try]] (pre-visit, now obsolete)

### After Move (audit triggers)
1. Geographic context-dependent notes flagged for review
2. New notes needed: [[Austin Commuter Options]], [[Austin Summer Heat Tips]]
3. Archive: [[NYC Winter Clothing]] (no longer applicable)
4. Update: [[Texas BBQ]] — now relevant, remove "to try" framing

### Post-Audit State
```yaml
# NYC note
context-dependent: true
context-type: geographic
applicability-changed: true
archived: true
archive-reason: "No longer in NYC"

# Austin note
context-dependent: true
context-type: geographic
current-context: "Austin, TX"
```

## Distinction from Related Concepts

| Concept | Description | Trigger |
|---------|-------------|---------|
| Outdated knowledge | Knowledge that was wrong | New information |
| Context-dependent | Was correct, context changed | Life change |
| Stale verification | Needs re-verification | Time passage |
| Deprecated | No longer relevant | Purpose change |

## Test Questions

1. Does this note depend on a specific life context that could change?
2. If I moved/changed careers/got new tools, would this note still apply?
3. Is the context dependency documented in frontmatter?
4. When context changes, do I have a protocol to find affected notes?

---

See also:
- [[Frontier Exploration - Context-Gated Knowledge]] — context gates on knowledge applicability
- [[Frontier Exploration - Geographically-Constrained Knowledge]] — geographic knowledge types
- [[Seed Gap - Knowledge Reorganization vs In-Place Updates]] — when to reorganize
- [[Note Lifecycle Management]] — lifecycle phases including archival
- [[Frontier Exploration - Knowledge Option Value]] — related concept: knowledge that may become valuable under uncertain future conditions
