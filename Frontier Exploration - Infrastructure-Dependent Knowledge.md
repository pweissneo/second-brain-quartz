---
last-reviewed: 2026-03-18
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - domain-specific
  - infrastructure-dependent
  - home-automation
---

# Frontier Exploration: Infrastructure-Dependent Knowledge

> How to organize knowledge that depends on specific physical infrastructure, network configurations, or geographic constraints — where general rules don't transfer.

## The Problem

Some knowledge domains have **infrastructure dependencies** that fundamentally change what knowledge applies:

- **Home automation**: WiFi vs Zigbee vs Z-Wave vs Matter protocols behave differently
- **Networking**: Knowledge depends on ISP, router, mesh system
- **Solar/energy**: Knowledge depends on grid tie, battery setup, climate
- **Gardening**: Knowledge depends on hardiness zone, soil type, microclimate

The Seed provides domain-agnostic rules, but infrastructure-dependent domains expose a gap: **how to organize knowledge that is true in one infrastructure context but false or irrelevant in another.**

## What's Different About Infrastructure-Dependent Knowledge

1. **Configuration is the context**: The knowledge isn't about a topic (cooking, programming) — it's about a specific configuration of tools, devices, and infrastructure
2. **Transfer is rare**: Unlike "learning React helps with Vue", learning one home automation setup barely helps with another
3. **Failure modes differ**: The same device fails differently on different networks, protocols, or power configurations
4. **Version + infrastructure interaction**: Software version AND hardware config together determine what works

## The Gap in Current Seed Rules

The Seed covers:
- Version tracking (software-stack dependencies)
- Context-gated knowledge (geographic, temporal, identity gates)
- Condition-triggered knowledge (when to apply knowledge)

But it lacks explicit guidance for **infrastructure configuration as a first-class dependency** — treating infrastructure setup like a domain with its own structural rules.

## Proposed Approach: Infrastructure-Aware Knowledge Organization

### Tagging Strategy

For infrastructure-dependent notes, require:

```yaml
infrastructure-type: network|hardware|geographic|power|configuration
infrastructure-scope:
  - protocol: Zigbee
  - router: eero
  - grid: on-grid
  - climate: temperate
applicability-transferability: low  # rarely transfers to other configs
```

### Test for Infrastructure-Dependent Domains

Ask: If I change my [router / device / protocol / location], how much of this knowledge becomes irrelevant?

- **High transfer**: Programming concepts (transfers across languages)
- **Medium transfer**: Gardening principles (transfer across zones with adaptation)
- **Low transfer**: Home automation configs (mostly tied to specific setup)

### Recommended Structure

1. **Infrastructure reference note**: Document the specific setup as a reference point
2. **Principle notes**: Separate general principles from config-specific tweaks
3. **Config variants**: When knowledge has variants by config, use hub + variants pattern with config tagging

## Test for This Frontier

An AI building a home automation knowledge base should be able to answer:
1. What infrastructure does this knowledge depend on?
2. Would this knowledge apply to a different configuration?
3. Is there a general principle beneath the config-specific knowledge?
4. Can I separate the portable insight from the local adaptation?

## Related Seed Rules

- [[Frontier Exploration - Context-Gated Knowledge]]
- [[Frontier Exploration - API and External Service Dependencies]]
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]]
