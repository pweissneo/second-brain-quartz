---
last-updated: 2026-04-02
last-reviewed: 2026-04-02
author-type: ai-assisted
lifecycle: seed-extension
verification-status: unverified
confidence: emerging
evidence-tier: reasoning-from-first-principles
knowledge-source-type: analysis
analysis-type: deductive
applicability: universal
recurring: true
utility-type: potential
tags:
  - knowledge-management
  - capture-decision
  - frontier
seealso:
  - AI-Assisted Knowledge Management Seed
  - Note Creation Decision Framework
  - Frontier Exploration - Systematic Knowledge Exclusion Criteria
---

# Frontier Exploration - Knowledge Capture Prioritization During Active Learning

> How should an AI agent decide which knowledge to capture IMMEDIATELY vs. defer vs. ignore when working through a new domain?

## The Gap

The Seed covers:
- **What to capture** (priority signals, diminishing returns, exploration/exploitation)
- **When to create new notes** (Note Creation Decision Framework)
- **What to exclude** (Systematic Knowledge Exclusion Criteria)
- **Gap identification** (systematic identification of missing knowledge)

But there's a **temporal gap**: When an AI agent is actively working through a domain (reading, learning, practicing), it encounters a continuous stream of knowledge items. The Seed doesn't tell it **how to prioritize capture in real-time**.

### Real-World Scenario

An AI agent starts learning about **coffee roasting**:
- Reads about heat transfer physics
- Learns about bean density variations
- Discovers the Maillard reaction timing
- Finds that roasters debate convection vs conduction
- Notes that altitude affects boiling point
- Sees that bag freshness degrades in 2 weeks

**The problem:** All of this is relevant. But capture capacity is finite (~3-5 notes/session). How does the agent decide:
1. Capture NOW (immediately write note)
2. Capture LATER (queue for future processing)
3. Capture ON-DEMAND (only when needed, don't pre-capture)
4. IGNORE (not worth capturing at all)

## Why This Matters

1. **Attention is finite** — Can't capture everything, need real-time triage
2. **Context window** — In active learning, knowledge context is fresh; deferred captures lose context
3. **Velocity mismatch** — Learning speed ≠ capture speed; need prioritization
4. **Different urgency** — Some knowledge expires (seasonal), some compounds (prerequisites)

## Proposed Capture Priority Framework

### Priority 1: IMMEDIATE (capture now)
- Prerequisites for upcoming work (blocking knowledge)
- Insights that connect to existing knowledge (high utility)
- Non-obvious patterns (not easily rediscoverable)
- Time-sensitive knowledge (seasonal, current events)
- Safety-critical information

**Test:** Is this blocking progress OR connecting strongly OR non-obvious AND won't be rediscovered easily?

### Priority 2: DEFER (queue for later)
- General background knowledge (can look up later)
- Things you'll encounter again naturally
- Nice-to-have extensions of captured knowledge
- Knowledge in your "comfort zone" that's already covered

**Test:** Will this still be available when you need it? Will you encounter it again naturally?

### Priority 3: ON-DEMAND (capture only when检索)
- Well-documented standard knowledge (easy to find)
- Highly volatile (changes frequently)
- Your specific preferences (not generalizable)
- Equipment/model-specific that may become obsolete

**Test:** Is this easily searchable? Does it change often? Is it highly specific to your setup?

### Priority 4: IGNORE
- Already in your vault
- Purely decorative (satisfies no real need)
- Out of scope for your vault's purpose
- Below diminishing returns threshold

**Test:** Already captured? No real utility? Out of scope?

## Real-Time Decision Heuristics

When encountering knowledge during active learning:

1. **The "blocker" test** — Is this preventing progress on something I want to do?
2. **The "connection" test** — Does this link to 2+ existing notes meaningfully?
3. **The "rediscover" test** — If I leave this, will I spend >5 minutes finding it again?
4. **The "unique" test** — Does this contain your personal context/analysis, or just facts?
5. **The "shelf-life" test** — Will this still be accurate in 30 days?

**Scoring approach:**
```
Priority Score = (blocker × 3) + (connection × 2) + (not-rediscoverable × 2) + (unique × 1) + (shelf-life × 1)

Where each factor is 0 or 1.

Score >= 5: IMMEDIATE
Score 3-4: DEFER
Score 1-2: ON-DEMAND
Score 0: IGNORE
```

## Edge Cases

- **Prerequisite chains** — If A → B → C, capture A immediately even if lower priority alone, because it's needed for B and C
- **Compounding knowledge** — Some knowledge becomes MORE valuable as you learn more (capture early)
- **Sunk cost** — If you already captured something, don't re-capture just because you see it again
- **Batch vs. stream** — Some learning sessions should be "batch" (capture everything, sort later) vs. "stream" (triage in real-time)

## Integration Points

This framework complements:
- [[Note Creation Decision Framework]] — When to create new notes (but doesn't cover when)
- [[Frontier Exploration - Systematic Knowledge Exclusion Criteria]] — What NOT to capture (but doesn't cover when)
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — Broader prioritization, but focuses on gap-filling, not real-time learning triage

## Test for the Seed

A knowledge base using ONLY the current Seed rules would know:
- What to capture (diminishing returns, priority signals)
- When to create (note creation framework)
- What to exclude (systematic exclusions)
- How to find gaps (gap identification)

BUT: Would NOT have guidance for **real-time capture prioritization during active learning** — leading to either over-capture (capturing everything) or under-capture (missing time-sensitive insights)

---

**Status:** Exploratory note. This gap addresses a specific scenario (active learning) that the Seed's broader capture guidance doesn't cover with sufficient granularity.