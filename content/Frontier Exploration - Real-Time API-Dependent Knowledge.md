---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - frontier-exploration
  - knowledge-verification
  - api
  - real-time
schema-version: "1.0"
---

# Frontier Exploration: Real-Time API-Dependent Knowledge

> Knowledge that requires live external API queries to verify accuracy or currency.

## The Problem

Some knowledge exists in a state of continuous flux and can only be verified by querying external services in real-time:

- **Website/API availability** — Is this service still operational?
- **Product availability** — Is this item still in stock?
- **Version currency** — Is this software version still supported?
- **Price/current data** — What's the current price/stock/value?
- **Status checks** — Is this domain SSL valid? Is this endpoint responding?

The Seed covers:
- Source verification (checking documentation)
- Experiential verification (human testing)
- Tool-executable verification (running local commands)

What's missing: **Live API verification** — querying external services to determine current truth.

## Gap Analysis

### Current Seed Coverage

The Seed includes:
- `execution-type: command|script|api|config|query|build` — but these assume local execution
- `execution-status: verified|failed|pending|not-attempted` — focused on command output
- `verification-modality: passive|practice-required|hybrid` — doesn't account for external API queries

### What's Missing

1. **API Verification Modality**: A distinct verification pathway for knowledge that requires external service queries
   
2. **Staleness Thresholds**: Different from standard review cycles — API-dependent knowledge may become stale within seconds, not days

3. **Caching and Freshness Metadata**: When was the API last queried? What's the acceptable age of this knowledge?

4. **Failure Handling**: What happens when the API is unreachable? The knowledge can't be verified but shouldn't be marked as "unverified" in the standard sense

5. **Graceful Degradation**: Knowledge that depends on unavailable APIs should still be usable with explicit uncertainty markers

## Proposed Rule Structure

### Verification Modality Addition

```yaml
verification-modality: passive|practice-required|hybrid|api-dependent
```

### New Frontmatter Fields

```yaml
# For API-dependent knowledge
api-endpoint: "https://api.example.com/status"
api-verification-type: availability|current-value|schema-valid|connectivity
last-api-check: 2026-03-21T20:00:00Z
api-freshness-threshold: 1h  # How old can this data be?
api-fallback: use-cached|stale-mark|mark-unverified

# For failed API queries
api-status: reachable|unreachable|error|rate-limited
api-error: "Error message if failed"
```

### Test

For notes tagged with `verification-modality: api-dependent`:
1. Does frontmatter include `api-endpoint:` and `api-verification-type:`?
2. Is `last-api-check:` tracked and compared against freshness threshold?
3. Is there explicit handling for API failures (`api-fallback:`)?
4. Can an AI determine whether the knowledge is current without manual checking?

## Domain Examples

- **Software documentation**: Is this library version still supported? (query package manager API)
- **Web resources**: Is this URL still active? (query HTTP HEAD)
- **Financial data**: Is this stock/coin still trading? (query market API)
- **Service status**: Is this SaaS still operational? (query status page API)
- **Domain validation**: Is this SSL certificate still valid? (query certificate transparency logs)

## Edge Cases

- **Rate limiting**: External APIs may limit queries; need intelligent caching
- **Authentication**: Some APIs require keys/secrets that shouldn't be stored in the vault
- **Geographical variation**: Some APIs return different results based on location
- **Cost**: Querying paid APIs has financial cost; track usage
- **Privacy**: Querying some endpoints may leak what knowledge you're checking

## Relationship to Existing Rules

This extends `execution-type: api` in the tool-executable knowledge rule by adding:
- Freshness thresholds specific to external services
- Failure handling for unreachable services
- Caching strategy for rate-limited APIs

This is distinct from:
- **Source verification** — checking documentation, not live services
- **Experiential verification** — human testing, not automated queries
- **Tool-executable** — running local commands, not external services

## Open Questions

1. Should API credentials be stored in the vault? If not, how does the AI access them?
2. How to handle knowledge that's correct at check time but becomes wrong seconds later?
3. What's the right balance between freshness and query cost/rate-limits?

---

See also:
- [[Seed Rule - Tool-Executable Knowledge]]
- [[Frontier Exploration - API and External Service Dependencies]]
- [[Handling Temporal Knowledge]]
