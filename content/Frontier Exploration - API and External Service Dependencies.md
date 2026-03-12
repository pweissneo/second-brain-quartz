---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - api-dependency
  - service-dependency
  - external-dependencies
---

# Frontier Exploration - API and External Service Dependencies

## The Gap

The Seed covers:
- **Software version dependencies** — which software version knowledge applies to (`version:`, `eol-estimate`)
- **Physical equipment dependencies** — what tools are required to execute knowledge

But it does NOT cover:
- **External service/API dependencies** — knowledge that depends on third-party services being available and accessible

## Why This Matters

Knowledge that relies on external services is fundamentally different from self-contained knowledge:

1. **Availability is not under your control** — Services can shut down (Google Reader, del.icio.us), change APIs, or implement rate limits
2. **Breaking changes happen silently** — Unlike software versions, API changes often happen without clear version bumps
3. **Cost models affect accessibility** — Free tiers may disappear; usage-based pricing may make knowledge unusable
4. **Knowledge becomes obsolete without warning** — A note about "how to use the X API" becomes useless if X shuts down

## Examples by Domain

### Data Science/ML
- "How to use GPT-4 API for text generation" — depends on OpenAI API availability
- "How to fine-tune a model on Hugging Face" — depends on HF infrastructure

### Finance
- "How to get real-time stock prices" — depends on APIs like Alpha Vantage, Yahoo Finance
- "How to connect to your brokerage" — depends on third-party integration APIs

### Home Automation
- "How to automate lights with Home Assistant" — depends on device manufacturer APIs
- "How to use voice assistants" — depends on Alexa/Google/Siri API availability

### Research
- "How to access academic papers via API" — depends on JSTOR, arXiv, PubMed APIs
- "How to use citation managers" — depends on service availability

### Social Media Management
- "How to schedule posts via API" — depends on Twitter/X, Instagram, LinkedIn APIs
- APIs change frequently; knowledge may become stale within months

## The Challenge

Service dependencies are:
- **Externally controlled** — You can't fix broken service dependencies yourself
- **Time-sensitive** — May work today, broken tomorrow
- **Often undocumented** — API changes may not be announced
- **Tier-dependent** — Free vs paid tiers have different capabilities

## Proposed Solution

Add service dependency tracking to frontmatter:

```yaml
service-dependencies:
  - service: "OpenAI API"
    required: true
    alternatives: "Anthropic API, local models"
    cost-impact: "Pay-per-token; may become expensive"
    reliability: "High (established service)"
    alternatives-documented: true
  - service: "Weather API"
    required: false
    alternatives: "National weather service, local sensors"
    rate-limits: "1000 calls/day on free tier"
```

## Test Cases

For a knowledge base about data science:
1. Pick 10 notes involving external APIs. Do they document service dependencies?
2. Are alternatives documented for when services become unavailable?
3. Can a reader estimate the cost of following the knowledge?

For a home automation knowledge base:
1. Pick 10 integration notes. Do they specify which services/APIs are required?
2. What happens when a manufacturer changes their API?
3. Are local-only alternatives documented?

## Related Notes

- [[Frontier Exploration - Framework-Dependent Knowledge]] — Software/framework version dependencies
- [[Stress Test - Version Scope Rule in Data Science ML]] — Version dependencies in ML workflows
- [[Frontier Exploration - Equipment and Tool Dependencies]] — Physical tool dependencies
- [[Source Validation Over Time]] — URLs rot; service dependencies rot faster
- [[AI-Assisted Knowledge Management Seed]] — The Seed this note extends
