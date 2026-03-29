---
last-reviewed: 2026-03-27
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
gap-status: resolved
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-27
resolved: 2026-03-29
gap-resolution-note: Rule added to Seed on 2026-03-28 - "For domains with inherently different knowledge velocities, use domain-velocity classification"
replaced-by: [[AI-Assisted Knowledge Management Seed]]
---

# Seed Gap: Domain-Velocity Confidence Decay Rules

## Gap Identification

**What happened:** Testing Seed rules against the photography domain revealed that the Seed's confidence markers and review intervals don't account for domain velocity — how quickly knowledge becomes outdated varies dramatically by domain, but the Seed treats confidence uniformly across domains.

**Source:** Seed Stress Test - Photography Knowledge Base.md

## Current Seed State

The Seed has:
- Confidence markers: `high`, `emerging`, `disputed`, `obsolete`
- Review intervals: Default 30 days, with some domain-specific guidance (line ~1606, 2047, 3205-3207)
- Edge cases for: error knowledge (90 days), fast-changing software (3 months), historical knowledge (never)

What's missing: Explicit domain-velocity rules that tie confidence levels to review intervals, and guidance for technology-heavy domains where knowledge can become outdated in weeks, not months.

## Proposed Gap Resolution

### Rule Proposal: Domain-Velocity Confidence Decay

**Rule:** Assign domain-appropriate confidence decay rates — fast-changing technology domains require shorter review cycles and automatic confidence downgrades, while static domains (mathematics, history) have extended review intervals.

**Why:** A "high confidence" note about camera autofocus algorithms from 2022 may now be wrong (new firmware, replaced models), while a "high confidence" note about the Pythagorean theorem from 2022 remains valid. Without domain-specific decay rules, the Seed produces false positives (flagging valid knowledge as stale) and false negatives (missing truly outdated technology knowledge).

**Test:** 
1. For notes with `confidence: high`: Does the note's domain have an explicit `review-interval` that matches how fast knowledge changes in that domain?
2. Can you identify which domains require monthly review vs. annual review vs. multi-year review?
3. Does the Seed specify confidence downgrade triggers when review intervals are exceeded?

**Implementation:**
```yaml
# Domain velocity taxonomy
domain-velocity:
  # Fast-changing: 30-day default review
  - technology (hardware): 30 days
  - software (applications): 30-60 days
  - social-media: 30 days
  - cryptocurrency: 30 days
  
  # Moderate: 90-day default review  
  - medicine (practitioner-level): 90 days
  - law (statutes): 90 days
  - finance (market-dependent): 90 days
  - photography (technique): 90 days
  
  # Slow: 180-365 day default review
  - craft (fundamental): 180 days
  - cooking (core techniques): 180 days
  - philosophy: 180-365 days
  - history (ancient): never
  - mathematics: never
  
  # Edge case: specific knowledge types within domains
  review-intervals:
    error-knowledge: 90 days
    opinion-preference: 90 days
    factual-reference: 180 days
    foundational-principle: 365 days
```

**Confidence downgrade trigger:**
```yaml
# When review interval exceeded, auto-downgrade confidence
confidence-downgrade:
  trigger: "days-since-review > review-interval"
  action: confidence → emerging (maintain note, flag for review)
  exception: "If note has explicit decay-rate override, use that instead"
```

**Edge case:** Within-domain variation — a photography note about composition (slow-changing) differs from a note about camera menu settings (fast-changing). Allow per-note `decay-rate` override for domain-appropriate adjustments.

**Edge case:** Knowledge that's cumulative vs. disruptive — some technology knowledge builds on previous versions (compositional), while some replaces previous versions entirely (disruptive). Cumulative knowledge has slower decay; disruptive knowledge decays faster.

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — Primary Seed rules
- [[Confidence Markers]] — Current confidence system
- [[Seed Stress Test - Photography Knowledge Base.md]] — Source of gap discovery
- [[Seed Stress Test - Cryptocurrency Knowledge Base.md]] — Related domain with fast change
- [[Seed Stress Test - Chess Knowledge Base.md]] — Related domain with slow change (rules stable)
- [[Handling Temporal Knowledge]] — Temporal knowledge handling
- [[Frontier Exploration - Knowledge Aging and Review Cycle Management]] — Related exploration