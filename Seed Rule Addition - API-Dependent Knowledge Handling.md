---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: staging
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: procedural
tags:
  - seed-rule-addition
  - api-dependent
  - real-time
  - external-services
access-pattern: lookup
retrieval-mode: search
storage-pattern: compact
verification-approach: source
schema-version: "1.0"
---

# Seed Rule Addition: API-Dependent Knowledge Handling

> Rule proposal for handling knowledge that depends on live external APIs — real-time data, exchange rates, stock prices, weather, sports scores, cryptocurrency, etc.

## Rule Proposal

**Rule:** For API-dependent real-time knowledge, track access constraints separately from verification status and set verification frequency based on data volatility.
**Why:** Financial, weather, sports, and similar live data require credentials, cost money per query, face rate limits, and depend on network availability. Treating them like standard verified knowledge overcounts verification capability and ignores cost constraints.
**Test:** (1) Can you identify API-dependent knowledge in your vault? (2) Do you track API access constraints (cost, rate limits)? (3) Is verification frequency appropriate for data volatility? (4) Is cost tracking integrated into verification decisions?

## Implementation

```yaml
api-dependent: true
api-provider: provider-name
api-cost-per-query: 0.01  # USD
rate-limit: 100/day
last-api-query: 2026-04-06
api-uptime-sla: 99.9%
fallback-source: source-name
verification-frequency: daily|weekly|monthly|quarterly|on-query
```

## Verification Frequency Guidelines

| Volatility | Examples | Frequency |
|------------|----------|----------|
| High | Crypto, live stock prices | Daily or on-query |
| Medium | Exchange rates, commodity prices | Weekly |
| Low | GDP figures, annual statistics | Quarterly |

## Cost Threshold

If cost per query exceeds $0.10 per data point, prefer source-based verification with explicit freshness indicators over live API calls.

## Test Scenarios

1. **Stock price verification:** Should verify on-query for stocks with high volatility, weekly for stable
2. **Weather data:** Verify forecast on-query, historical within 24 hours
3. **Rate limit management:** When approaching limit, switch to fallback source
4. **Cost tracking:** At $10/month threshold, evaluate third-party aggregation service

## Related Notes

- [[Frontier Exploration - API-Dependent Real-Time Knowledge Handling]]
- [[Seed Refinement - Verification Method Availability Tracking]]
- [[Frontier Exploration - Real-Time API-Dependent Knowledge]]