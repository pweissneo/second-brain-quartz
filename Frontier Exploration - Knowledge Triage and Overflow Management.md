---
last-reviewed: 2026-03-16
confidence: emerging
author-type: ai-assisted
lifecycle: active
tags:
  - frontier-exploration
  - knowledge-management
  - prioritization
  - overflow
  - maintenance
---

# Frontier Exploration - Knowledge Triage and Overflow Management

> When capture exceeds maintenance capacity, how do you decide what to keep, what to defer, and what to abandon?

## The Problem

The Seed optimizes for growth: capture first, process second, verify later. But what happens when:
- You capture faster than you can process
- Verification accumulates beyond feasible review
- The vault grows past your attention capacity
- New domains compete for limited learning time

This isn't a maintenance problem (which deals with stale notes) — it's an **overflow problem** (too much valid knowledge, not enough time).

## When Overflow Happens

Signs your vault is in overflow:
1. Processing backlog exceeds 2 weeks of captures
2. Unverified notes exceed 40% of total (beyond the Seed's warning threshold)
3. You have more "to learn" notes than "mastered" notes
4. Multiple domains are partially developed with no completion in sight
5. You spend more time organizing than actually using the knowledge

## Current Seed Coverage

The Seed includes:
- Verification ratio tracking (50% within 30 days)
- Unverified ceiling (pause at 40%)
- Diminishing returns testing
- Construction phase (relaxed rules for new vaults)
- Priority signals for capture

What's missing:
- What to do when already in overflow
- How to triage existing backlog
- When to abandon partial domains
- How to recover to healthy state

## Triage Strategies

### Strategy 1: Domain Triage

Rank domains by:
- **Current utility**: How much are you using this knowledge now?
- **Growth potential**: How much more valuable could this become?
- **Maintenance cost**: How often does it need updating?
- **Time to competence**: How long to reach useful proficiency?

**Action**: Focus on high-utility + low-time-to-competence domains. Defer or abandon high-maintenance + low-utility domains.

### Strategy 2: Note Triage

For each unverified/unprocessed note:
1. **Still relevant?** If the context changed, deprecate
2. **Still actionable?** If conditions expired, archive
3. **Worth revisiting?** If may be useful later, batch for future review
4. **Critical?** If high-stakes, prioritize immediately
5. **Replaceable?** If web search can replace it in 30s, delete

### Strategy 3: Time-Boxed Recovery

Allocate fixed time to recovery:
- Week 1: Deprecate clearly stale notes (50% time)
- Week 2-3: Verify critical notes (30% time)
- Week 4: Process new captures only (20% time)

**Goal**: Return to verification ratio ≤30% before resuming normal capture.

### Strategy 4: The 3-Month Rule

If a note hasn't been accessed in 3 months:
- Review: Is this still relevant?
- If yes but unverified: Verify or deprecate
- If no: Delete or archive

This prevents accumulation of "someday" knowledge that never gets used.

## When to Abandon Domains

Signs a domain should be paused/abandoned:
1. No practical application in 6+ months
2. Maintenance burden exceeds utility
3. Domain has more notes than you've ever accessed
4. You've moved to a different life phase (career change, etc.)

**Action**: 
- Mark domain hub as `status: dormant`
- Keep notes but stop adding new ones
- Don't delete — you may return later

## Recovery Metrics

Track these to detect overflow early:
- **Processing backlog age**: Days since oldest unprocessed note
- **Verification velocity**: Notes verified per week
- **Access frequency**: Notes accessed per month
- **Domain activity**: Which domains are actually used?

Healthy vault metrics:
- Backlog age < 14 days
- Verification velocity ≥ capture velocity
- Top 20% notes accessed monthly
- 3+ domains actively used

## Seed Rule Candidates

### Rule: Enforce Overflow Detection

> Monitor overflow indicators: processing backlog age, verification velocity, access patterns. When overflow begins, pause capture and prioritize recovery.

**Why**: Overflow doesn't fix itself — it compounds. Early detection prevents collapse.

**Test**: Can you calculate your processing backlog age? Is it under 14 days?

### Rule: Use Domain Completion Criteria to Prevent Overflow

> Before entering a new domain, define completion criteria. Stop adding to domains that meet criteria before starting new ones.

**Why**: Partial domains accumulate forever. Explicit completion criteria create natural stopping points.

**Test**: Can you state what "80% coverage" looks like for each domain? Are you working toward completion or just accumulating?

### Rule: Time-Box Exploration Phases

> Limit exploration bursts to 2 weeks. After exploration, shift to exploitation (deepening existing knowledge) before next exploration.

**Why**: Pure exploration creates overflow. Bounded exploration prevents unbounded capture.

**Test**: Can you identify your last exploration phase? How long did it last? Did you return to existing domains?

### Rule: Practice Triage Before Capture

> When in overflow, evaluate potential captures against current backlog. Reject captures that exceed processing capacity.

**Why**: The Seed says "capture first" — but when overwhelmed, this amplifies the problem.

**Test**: When you capture something now, do you consciously evaluate whether you can process it?

### Rule: Accept Imperfect Knowledge in Overflow

> When truly overwhelmed, prefer "good enough" verification over "perfect" verification. Mark notes as "reviewed" with notes rather than waiting for full verification.

**Why**: Perfect is the enemy of done. Some knowledge is better unverified than unprocessed.

**Test**: Do you have notes marked "reviewed (cursory)" or similar? Are they distinguished from fully verified?

---

## Related Notes

- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — Domain-level prioritization
- [[Note Lifecycle Management]] — Note stages and transitions
- [[The Knowledge Portfolio]] — Balancing knowledge investments
- [[Anti-Pattern - Note Hoarding]] — Accumulating without purpose
- [[AI-Assisted Knowledge Management Seed]] — Verification workflow
- [[Frontier Exploration - Vault Growth Velocity and Sustainable Expansion]] — Growth management

---

**Note:** This is frontier exploration. The rules proposed here may not be fully mature. Test them against your vault before adding to the Seed proper.
