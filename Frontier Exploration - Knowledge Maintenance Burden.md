---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
tags: [frontier-exploration, maintenance, vault-health]
---

# Frontier Exploration: Knowledge Maintenance Burden

> Some knowledge isn't just "unverified" or "outdated" — it's actively costly to maintain. This explores when to exclude knowledge based on maintenance burden, not just utility.

## The Problem

The Seed tells us when to add knowledge (priority signals, diminishing returns) and when to verify it (verification ratio), but it doesn't address knowledge that has an inherently **high maintenance burden** — knowledge that requires ongoing attention, updates, or verification just to remain useful.

Examples of high-maintenance knowledge:
- **Version-locked technical knowledge** (software, tools, frameworks) that changes monthly
- **Price-sensitive knowledge** (costs, rates, market values) that fluctuates frequently  
- **Contact/directory information** that changes regularly
- **Time-sensitive opportunities** (deadlines, limited offers, seasonal events)
- **Beta/experimental technology** that's actively changing

This is different from "stale" knowledge (needs review) or "obsolete" knowledge (no longer true). High-maintenance knowledge may be **currently accurate** but will **become inaccurate soon** — requiring repeated maintenance cycles.

## Why This Matters

Without maintenance-burden awareness, vaults accumulate knowledge that:
1. Provides low utility (easily looked up elsewhere when needed)
2. Requires high maintenance (frequent updates to stay accurate)
3. Creates false confidence (appears reliable but is actually stale)

The result: The vault spends maintenance effort on knowledge that would be better served by external resources (search, current documentation, live APIs).

## The Insight

**Knowledge has a maintenance-to-utility ratio.** Some knowledge is worth capturing even with high maintenance (core expertise, personal insights). Other knowledge has low utility regardless of freshness (easily found, context-independent, basic facts).

The decision should consider:
- **Utility**: How valuable is this knowledge when accurate?
- **Portability**: Can someone else easily find this elsewhere?
- **Volatility**: How often does this knowledge change?
- **Personalization**: Does this include your specific context that can't be found elsewhere?

## Potential Seed Rule

A rule about maintenance burden would need:
- **Rule**: Evaluate maintenance burden before capturing volatile knowledge — exclude if utility-to-maintenance ratio is low AND the knowledge is easily lookable elsewhere.
- **Why**: High-maintenance + low-utility + portable knowledge bloats the vault without proportional value.
- **Test**: For knowledge about version-locked, price-sensitive, or frequently-changing topics: (1) Does this include personalized context that can't be found elsewhere? (2) Is the volatility so high that the knowledge will be stale within 30 days? (3) Could a web search provide current information faster than maintaining this note?

## Implementation Approach

```yaml
maintenance-burden: high|medium|low
volatility-type: version-sensitive|price-sensitive|time-sensitive|stable
external-availability: high|medium|low  # How easily found elsewhere
maintenance-rationale: "Why this is worth maintaining"
```

## Questions for Refinement

1. Should maintenance burden be a capture-time decision or a periodic re-evaluation?
2. How do we distinguish "worth maintaining" personal context from "not worth capturing" transient facts?
3. Does this apply differently to learning vs. reference vaults?

## Related Notes

- [[Seed Stress Test - Error Knowledge Capture in Programming]] — version-sensitive knowledge
- [[Seed Gap - Recurring and Periodic Knowledge]] — consolidated temporal knowledge (replaces Deadline-Driven)
- [[Anti-Pattern - Note Hoarding]] — related to capture discipline

---

*This is a frontier exploration note. The concept may develop into a Seed rule or may remain as domain-specific guidance.*
