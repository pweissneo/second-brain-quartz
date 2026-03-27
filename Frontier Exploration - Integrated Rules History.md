---
last-reviewed: 2026-03-26
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - seed-evolution
  - rules-history
---

# Frontier Exploration - Seed Rule Evolution Tracking

> An exploration of how a knowledge base should document and track the evolution of its own rules (the Seed).

## Purpose

This note explores how a knowledge base should document the history of its rules — how rules change over time, how to track rule evolution, and how to maintain a coherent framework as rules are added, modified, or deprecated.

## Why This Matters

The Seed is not static — it evolves through:
- New frontier explorations that become Seed rules
- Stress tests that reveal edge cases
- Gap identification that adds new rules
- Conflict resolutions that refine existing rules

Without tracking this evolution, the Seed becomes a static document rather than a living system.

## Proposed Implementation

### Rule Version Tracking
Each Seed rule should have:
- `rule-version:` — semantic version (1.0, 1.1, 2.0)
- `rule-added:` — date the rule was introduced
- `rule-modified:` — date of last significant change
- `rule-deprecated:` — date (if deprecated)

### Changelog Note
Maintain a `Seed-Changelog.md` note that tracks:
- Date
- Rule affected
- Type of change (added/modified/deprecated)
- Rationale
- Related frontier exploration or stress test

### Backward Compatibility
When modifying a rule:
- Keep previous version as "historical" note
- Mark with `lifecycle: historical` and `superseded-by: [[new-rule-version]]`
- This allows testing rules against previous versions

## Test for AI Agents

- [ ] Can you identify when each Seed rule was added?
- [ ] Can you trace the evolution of any rule through versions?
- [ ] Is there a changelog or version history?
- [ ] Can you revert mental model to any previous Seed version?

## Related Concepts

- [[Seed Rule - Vault Change Tracking]] — general change tracking (different focus)
- [[Exportable Rules]] — how to export rules from a knowledge base
- [[Note Lifecycle Management]] — how individual notes evolve
- [[AI-Assisted Knowledge Management Seed]] — the rules being evolved