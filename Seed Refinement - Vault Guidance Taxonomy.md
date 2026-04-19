---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: evergreen
confidence: high
tags:
  - seed-refinement
  - taxonomy
  - structure
level: principle
---

# Seed Refinement - Vault Guidance Taxonomy

> The Seed's guidance exists across three distinct categories: main rules, frontier explorations, and stress tests. Understanding their relationship improves vault navigation and maintenance.

## The Three Categories

### 1. Main Rules (Seed.md)
- Foundational principles in Rule/Why/Test format
- Domain-agnostic by default
- Evergreen, high-confidence
- Protected notes in the Seed

**Purpose:** Core principles that apply broadly across vaults

### 2. Frontier Explorations
- Emerging concepts not yet mature enough for Seed
- Gap identification and proposed rules
- Lower confidence, marked as "emerging"

**Purpose:** Document what's being discovered but not yet resolved

### 3. Seed Stress Tests
- Domain-specific validation of main rules
- Edge cases discovered through application
- Includes edge case modifications

**Purpose:** Validate rules work in specific contexts, refine when they don't

## The Gap

The three categories overlap but lack explicit taxonomy:
- Frontier explorations may contain testable rules needing formalization
- Stress tests may reveal gaps requiring frontier exploration
- Main rules evolve from both

## Proposed Workflow

1. **Stress test finds issue** → Document in stress test note
2. **Issue is a gap** → Create frontier exploration
3. **Exploration matures** → Add to Seed as rule
4. **Rule applies broadly** → Protect in Seed.md

## The Test

Can you navigate from any stress test finding → frontier exploration → Seed rule?

If not, the taxonomy lacks integration.

## Related

- [[AI-Assisted Knowledge Management Seed]] — Main rules
- [[Seed Stress Test - 5-1 Ratio Across Domains]] — Example stress test category
- [[Frontier Exploration - Tacit Knowledge Capture]] — Example frontier category