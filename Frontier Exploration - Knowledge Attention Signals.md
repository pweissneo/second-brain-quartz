---
last-reviewed: 2026-03-14
confidence: emerging
author-type: ai-assisted
lifecycle: active
tags:
  - seed-exploration
  - attention-management
  - prioritization
---

# Frontier Exploration: Knowledge Attention Signals

> How should a knowledge base signal which notes need immediate attention without requiring manual tracking?

## The Problem

The Seed has comprehensive lifecycle tracking (draft → active → evergreen → deprecated → archived) and review date tracking (`last-reviewed`). However, it lacks explicit mechanisms for:

1. **Attention signals** — Which notes need review NOW vs. later
2. **Relevance scoring** — Which notes are most valuable to maintain
3. **Knowledge decay tracking** — When does knowledge become stale even if not contradicted

## Why This Matters

A vault with 167+ notes needs prioritization signals. Without them:
- All notes are treated equally important
- Stale knowledge accumulates silently
- High-value notes aren't distinguished from low-value ones
- Review effort isn't focused on notes that need it most

## Domain Stress Test: Personal Finance

Apply current Seed rules to a personal finance knowledge base:

1. **Review tracking exists** — `last-reviewed` dates are tracked
2. **Lifecycle stages exist** — notes can be marked draft/active/evergreen
3. **But** — There's no mechanism to surface which notes need attention

A note about "2024 tax brackets" might have `last-reviewed: 2024-01` but there's no automatic way to know:
- This note is time-sensitive and needs review
- This note is high-value (referenced by 20 other notes)
- This note is stale (last reviewed 8 months ago in a fast-changing domain)

## Current Seed Gaps

### Gap 1: No Attention Weighting
The Seed tracks `last-reviewed` but doesn't define:
- When a review is "overdue" (time-based)
- When a note is "high-stakes" (impact-based)
- When a note is "neglected" (link-based)

### Gap 2: No Decay Functions
The Seed doesn't distinguish:
- Static knowledge (permanent)
- Time-sensitive knowledge (decays at known rate)
- Event-triggered knowledge (decays when event occurs)

### Gap 3: No Value Signals
The Seed tracks:
- Incoming links (connectivity)
- Backlinks (discoverability)

But doesn't track:
- Usage frequency (how often is this retrieved?)
- Decision impact (does this inform important decisions?)
- Cross-domain importance (how many domains reference this?)

## Proposed Solutions

### Solution 1: Attention Priority Tags

```yaml
attention-priority: critical|high|medium|low
# critical: needs immediate review
# high: review within 1 week
# medium: review within 1 month
# low: review quarterly
```

### Solution 2: Decay Functions

```yaml
decay-rate: static|time-sensitive|event-triggered
# static: never decays (mathematical truths)
# time-sensitive: decays after known period (tax brackets)
# event-triggered: decays when specific event occurs (policy after election)
review-trigger: explicit-condition | time-based | event-based
```

### Solution 3: Value Scoring

```yaml
value-score: 1-10
# Derived from: incoming-links * weight + usage-frequency * weight + decision-impact * weight
```

### Solution 4: Attention Dashboard

A vault should surface:
- Notes with `last-reviewed` > 30 days (configurable by domain)
- Notes with `confidence: high` but old review dates
- Notes tagged `time-sensitive` approaching review deadlines
- Notes with high connectivity that haven't been reviewed

## Test: Can an AI Agent Prioritize Work?

Given a vault of 167 notes:
1. Can you identify the top 5 notes needing attention?
2. Can you distinguish urgent from deferrable?
3. Can you track knowledge decay automatically?

If no, the vault lacks attention management.

## Edge Cases

### Edge Case 1: Conflicting Signals
A note might be high-value (many links) but low-attention (stable knowledge). How to weight?

**Resolution:** Separate value signals from attention signals. A evergreen math theorem can be high-value but never need review. A tax bracket note can be low-value but need constant updates.

### Edge Case 2: Domain Variation
"Overdue" means different things in math (years) vs. finance (months) vs. news (days).

**Resolution:** Allow domain-specific decay rates:
```yaml
decay-rate:
  domain-default: 365 days
  overrides:
    finance: 90 days
    news: 7 days
    mathematics: 1825 days
```

### Edge Case 3: Attention Fatigue
If all notes are marked "critical," nothing is prioritized.

**Resolution:** Limit critical notes to 5% of vault. Use auto-escalation: notes marked critical but unreviewed for 2x period automatically downgrade.

## Implementation in Seed

Add to Quality Maintenance section:

```markdown
**Rule:** Use attention priority tags to surface notes needing review — separate critical/high/medium/low based on decay rate and value.
**Why:** Without attention signals, all notes are treated equally, causing stale knowledge to accumulate and high-value notes to receive insufficient maintenance.
**Test:** Can you identify the top 5 notes needing attention right now? Can you explain why each needs attention?

**Rule:** Define decay functions for time-sensitive knowledge — specify static/time-sensitive/event-triggered with review triggers.
**Why:** Different knowledge decays at different rates. Treating all knowledge as static causes time-sensitive knowledge to silently become misleading.
**Test:** Pick 10 notes with temporal claims. Can you categorize each as static, time-sensitive, or event-triggered? Do time-sensitive notes have explicit review triggers?

**Rule:** Track knowledge value signals separately from structural metrics — combine link density with usage frequency and decision relevance.
**Why:** Connectivity measures structure, not value. A note can be highly connected but low-value (a hub that organizes but doesn't inform) or highly valuable but low-connectivity (foundational insight not yet linked).
**Test:** Can you identify your top 10 most valuable notes? Can you explain what makes them valuable beyond connectivity?
```

## Related

- [[AI-Assisted Knowledge Management Seed]] — Master Seed
- [[Note Lifecycle Management]] — Lifecycle stages
- [[Frontier Exploration - Knowledge Debt]] — Related to neglected knowledge
- [[Stress Test - Confidence Markers Rule Across Domains]] — Domain with fast decay
