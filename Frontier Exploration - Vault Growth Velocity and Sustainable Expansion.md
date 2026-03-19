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

# Frontier Exploration: Vault Growth Velocity - Open Questions

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

## Seed Rules Already Cover This

The Seed already contains comprehensive guidance on vault growth velocity:

### Existing Seed Rules (Reference)

1. **Verification Ratio Rule**: "Track vault growth velocity and maintain verification ratio — a healthy vault verifies at least 50% of new captures within 30 days."

2. **Verification Ceiling Rule**: "When unverified notes exceed 40% of total vault, pause exploration and prioritize verification until ratio drops below 30%."

3. **Knowledge Debt Tracking** (from [[Frontier Exploration - Knowledge Debt]]): Composite score formula tracking verification debt, staleness debt, decay debt, redundancy debt, and noise debt.

4. **Overflow Recovery**: "When in overflow: (1) Do you allocate fixed time to recovery? (2) Is capture paused during recovery? (3) Do you have a target ratio before resuming?"

5. **Construction Phase Model**: Guidance for vault maturity stages (<50 notes, 50-200, >200) with different velocity expectations.

## Genuine Open Questions

While the Seed covers most velocity concerns, these questions remain:

1. **Exploration-Exploitation Cycling**: How to identify distinct phases in capture history? When to explicitly shift modes?

2. **Domain-Specific Velocity**: Should verification velocity differ by domain (fast verification in cooking vs. slow in philosophy)?

3. **Deepening Metrics**: How to measure "deepening existing topics" vs. "adding new ones" in a way an AI can verify?

4. **Optimal Growth Rate**: What is the ideal notes-per-week rate for vaults at different maturity levels?

## Related Concepts

- [[AI-Assisted Knowledge Management Seed]] — contains verification ratio and velocity rules
- [[Frontier Exploration - Knowledge Debt]] — addresses accumulated unverified knowledge (Frontier Exploration note, not a Seed rule)
- [[Note Lifecycle Management]] — covers note aging and staleness (principle note, not a Seed rule)

## Next Steps (Genuine Gaps)

1. Develop metrics for measuring exploration vs. exploitation phases
2. Test domain-specific velocity recommendations
3. Create AI-verifiable deepening metrics
