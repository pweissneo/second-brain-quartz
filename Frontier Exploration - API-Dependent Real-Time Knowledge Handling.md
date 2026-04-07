---
last-reviewed: 2026-04-06
lifecycle: staging
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: factual
tags:
  - frontier-exploration
  - api-dependent
  - real-time
  - external-services
access-pattern: lookup
retrieval-mode: search
storage-pattern: compact
verification-approach: source
schema-version: "1.0"
---

# Frontier Exploration: API-Dependent Real-Time Knowledge Handling

> Testing where the Seed fails for knowledge that requires live external API calls — exchange rates, stock prices, weather data, sports scores, cryptocurrency values, and similar real-time data-dependent knowledge.

## The Domain

Some knowledge requires live external services to verify:
- **Financial:** Stock prices, exchange rates, cryptocurrency values, commodity prices
- **Weather:** Current conditions, forecasts, historical weather data
- **Sports:** Live scores, statistics, player transfers
- **Transportation:** Flight status, public transit real-time data
- **Economic:** GDP figures, unemployment rates, inflation data

## Where the Seed Falls Short

### Gap: No Guidance for API-Dependent Verification

**Current Seed:** Handles "tool unavailable" and "verification method unavailable" separately, but doesn't address API-dependent knowledge specifically.

**Problem:** These knowledge types require:
1. API credentials/authentication
2. Rate limit management
3. Cost per query (financial APIs often charge)
4. Network availability
5. Service uptime guarantees

**Test Failure:** The Seed can't answer:
- "Should I verify this stock price daily, weekly, or on query?"
- "What's the verification cost per data point?"
- "How do I handle rate limits vs. verification freshness?"
- "When does it become cheaper to trust a source than query the API?"

## Proposed Seed Extension

**Rule:** For API-dependent real-time knowledge, track access constraints separately from verification status.

```yaml
api-dependent: true
api-provider: provider-name
api-cost-per-query: 0.01  # USD
rate-limit: 100/day
last-api-query: 2026-04-06
api-uptime-sla: 99.9%
fallback-source: source-name
```

**Rule:** Set verification frequency based on data volatility:
- High volatility (crypto, stock prices): verify on query or daily
- Medium volatility (exchange rates): weekly
- Low volatility (GDP figures): quarterly

**Rule:** Track verification cost — if cost per query exceeds threshold, use source-based verification with explicit freshness indicators instead of live API calls.

## Test

1. Can you identify API-dependent knowledge in your vault?
2. Do you track API access constraints (cost, rate limits)?
3. Is verification frequency appropriate for data volatility?
4. Is cost tracking integrated into verification decisions?

## Related Notes

- [[Frontier Exploration - Real-Time API-Dependent Knowledge]]
- [[Frontier Exploration - Tool-Executable Knowledge]]
- [[Seed Gap - Verification Mode Conflict Resolution]]