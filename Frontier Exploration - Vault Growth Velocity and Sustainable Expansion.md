---
last-reviewed: 2026-03-16
last-updated: 2026-03-16
confidence: emerging
author-type: ai-assisted
lifecycle: active
applicability: universal
tags:
  - frontier-exploration
  - vault-growth
  - expansion
---

# Frontier Exploration: Vault Growth Velocity and Sustainable Expansion

## The Problem

The Seed provides extensive guidance on:
- How to add knowledge (diminishing returns testing, priority signals)
- How to process knowledge (48-hour rule, staging states)
- How to verify knowledge (verification-status, activation states)

But it lacks guidance on:
- **How fast** should a vault grow
- When is growth "too fast" (accumulating faster than verifying)
- When to shift from exploration to exploitation mode
- What percentage of notes should be "verified" at any time

Without velocity guidance, two failure modes emerge:
1. **Velocity failure**: Vault grows forever but never matures (high capture, low verification)
2. **Stagnation failure**: Vault stops growing entirely (no new knowledge captured)

## Questions the Seed Doesn't Answer

- Is there an optimal capture-to-verification ratio?
- How many notes should be added per week/month for a healthy vault?
- When should an agent shift from "add more topics" to "deepen existing ones"?
- What % of unverified notes is "too many"?

## Initial Hypotheses

### Hypothesis 1: Verification Ratio Target
A healthy vault maintains a verification ratio (verified/total) above a threshold:
- **Learning vaults**: ≥50% verified (need verified knowledge to learn from)
- **Reference vaults**: ≥70% verified (need reliable answers)
- **Hybrid vaults**: ≥60% verified

Test: Calculate verified %, if below threshold, pause capture until verification catches up.

### Hypothesis 2: Velocity Thresholds
Growth should follow a maturation curve:
- **New vault (<50 notes)**: Focus on exploration, velocity can be high
- **Maturing vault (50-200 notes)**: Balance exploration/exploitation, moderate velocity
- **Mature vault (>200 notes)**: Focus on exploitation, low velocity, high verification

Test: Track notes added vs. verified per month. Mature vaults should verify >70% of new additions.

### Hypothesis 3: Exploration-Exploitation Cycling
Rather than fixed ratios, cycle between modes:
- **Exploration burst**: Add 10+ new topic notes
- **Verification phase**: Verify all unverified notes from exploration
- **Deepening phase**: Add detail to verified notes
- Repeat

Test: Can you identify distinct phases in your capture history?

### Hypothesis 4: Staleness Threshold
Notes older than X months without review become "stale risk":
- If >20% of notes are stale, prioritize review over capture
- Stale risk increases knowledge debt exponentially

Test: Calculate % of notes with last-reviewed > 6 months ago.

## Domains Where This Matters Most

- **Experiential domains**: High unverified ratio is dangerous (bad recipes waste time, bad medical advice causes harm)
- **Fast-changing domains**: High staleness is dangerous (outdated code, deprecated tools)
- **High-stakes domains**: Verification is mandatory before use

## Testable Rules (Proposed)

**Rule:** Track verification velocity separately from capture velocity — a healthy vault verifies at least 50% of new captures within 30 days.

**Rule:** When unverified notes exceed 40% of total vault, pause exploration and prioritize verification until ratio drops below 30%.

**Rule:** Mature vaults (>200 notes) should spend at least 50% of capture effort on deepening existing topics, not adding new ones.

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — provides capture criteria (diminishing returns) but not velocity
- [[AI-Assisted Knowledge Management Seed]] — tracks individual note status (verification-status) but not vault-level metrics
- [[Frontier Exploration - Knowledge Debt]] — addresses accumulated unverified knowledge

## Open Questions

1. What is the actual "safe" unverified ratio for different vault purposes?
2. Should velocity differ by domain (fast verification in cooking vs. slow in philosophy)?
3. How do you measure "deepening" vs. "adding" in a way an AI can verify?

## Next Steps

1. Track capture vs. verification metrics for 30 days
2. Test velocity thresholds on personal vault
3. Refine thresholds based on empirical data
