---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-gap
confidence: medium
author-type: ai-assisted
tags:
  - frontier-exploration
  - verification
  - automation
  - temporal
---

# Frontier Exploration - Knowledge Freshness Automation

> [!note]
> This note explores a potential gap in the Seed: the absence of automated temporal triggers for knowledge freshness verification.

## The Gap

The current Seed provides comprehensive guidance on:
- How to verify knowledge (verification methods, confidence markers)
- How to date knowledge (freshness dating in frontmatter)
- How to detect staleness (staleness computation vs detection)

But it lacks guidance on:
- **When** should the vault actively surface knowledge needing verification?
- How to trigger automated verification prompts?
- What happens between "last-verified" dates and human review?

## The Problem Space

### Current State

The Seed includes:
- `last-updated` and `last-reviewed` frontmatter fields
- Verification ratio tracking
- Staleness detection rules (see [[Seed Gap - Staleness Detection vs. Staleness Computation]])
- Knowledge validity windows (see [[Seed Gap - Knowledge with Inherent Expiration Windows]])

### What's Missing

There's no explicit rule for:
1. **Temporal verification triggers** — E.g., "Verify factual knowledge over 90 days old"
2. **Automation hooks** — How to integrate with cron/heartbeat for automated verification prompts
3. **Proactive freshness management** — Vault actively requesting verification vs. passive waiting for human review
4. **Grace periods** — How long after staleness detection before knowledge is flagged vs. deprecated

### Edge Cases

- **Active vs. Passive vaults**: Should a knowledge vault actively surface verification needs or wait for humans to query?
- **Resource constraints**: In large vaults, verifying all outdated knowledge is impossible — which takes priority?
- **Domain-specific triggers**: Medical knowledge should verify more frequently than historical facts
- **Multi-person vaults**: Who gets verification requests? Round-robin? Expertise-based?

## Exploration Questions

1. **Verification Trigger Design**: Should the Seed include a rule for automated verification frequency based on knowledge type?
   - Factual: quarterly review
   - Procedural: annual review
   - Experiential: as-needed basis
   - Conceptual: minimal review (stable over time)

2. **Automation Compatibility**: Can verification triggers be expressed as an AI-executable rule?

3. **Priority vs. Resource Allocation**: When verification backlog exceeds capacity, what prioritization framework applies?

## Potential Seed Rule

> **Rule (proposed):** Implement automated freshness verification triggers based on knowledge type and domain velocity.
>
> **Why:** Passive verification，等待 human initiative causes knowledge drift; the Seed tells what to verify but not when to trigger verification automatically.
>
> **Test:** (1) Can the vault automatically surface knowledge exceeding freshness thresholds? (2) Is verification frequency differentiated by knowledge type? (3) Does the automation respect resource constraints?

## Related Notes

- [[Seed Gap - Knowledge with Inherent Expiration Windows]] — temporal validity bounds
- [[Seed Gap - Staleness Detection vs. Staleness Computation]] — detection vs. computation distinction
- [[Frontier Exploration - Knowledge Freshness Dating]] — current state of dating practices
- [[Seed Refinement - Verification Priority Adaptations]] — priority-based verification
- [[Frontier Exploration - Automated Vault Health Monitoring]] — related automation concept

## Domain Test Cases

Use these to stress-test any proposed rule:

### Cooking Knowledge Base
- Factual nutrition data: expires faster than procedural recipes
- Ingredient substitutions: need seasonal freshness
- Equipment specs: product lifecycle dependent

### Medical Knowledge Base  
- Drug interactions: high-priority verification
- Diagnostic procedures: medium verification
- Historical case studies: minimal verification

### Personal Finance Knowledge Base
- Tax rules: annual verification trigger
- Account details: as-needed verification
- Investment principles: minimal verification

---

*This exploration note should either become a Seed rule or be merged with existing freshness/dating notes.*