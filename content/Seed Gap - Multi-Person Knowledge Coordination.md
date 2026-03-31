---
last-updated: 2026-03-30
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - multi-person
  - coordination
  - crew
  - team
gap-status: identified
gap-priority: medium
gap-phase: discovery
gap-source: seed-stress-test
---

# Seed Gap: Multi-Person Knowledge Coordination

## Gap Description

The Seed covers multi-item coordination (cooking meals, event planning) and participant-count validity (games, team sports), but lacks explicit guidance for **coordinated execution by multiple people** — where the coordination itself is the knowledge, not the individual actions.

## Where This Gap Appears

### Aviation (from Seed Stress Test)
- Crew Resource Management (CRM) — coordination between pilot and copilot
- Single-pilot vs. two-crew aircraft have different knowledge needs
- The Seed doesn't address multi-person knowledge workflows

### Similar Domains
- **Surgery** — surgical teams with defined roles (surgeon, scrub nurse, anesthesiologist)
- **Marine** — bridge team coordination, watch rotations
- **Military** — squad coordination, chain of command
- **Emergency services** — firefighting teams, paramedic crews
- **Theater/film** — production crew coordination

## What the Seed Currently Covers

| Rule | Coverage | Gap |
|------|----------|-----|
| Multi-item coordination | Items being created | People executing together |
| Participant count | Advice validity by number | Coordination roles/responsibilities |
| Trade coordination | Sequential trade execution | Role-based responsibility |
| Ensemble knowledge | Participant requirements | Coordination protocols |

## Proposed Seed Addition

> **Rule:** For knowledge that requires coordinated execution by multiple people (crew operations, team sports, pair programming, surgical teams), organize for both individual understanding AND team coordination.
> **Why:** Individual knowledge of procedures is insufficient when execution requires coordination. Notes should include coordination requirements, role definitions, communication protocols, and synchronization triggers.
> **Test:** Can you identify: (1) Coordination dependencies? (2) Role definitions where relevant? (3) Communication protocols? (4) Synchronization triggers (when to coordinate)?

### Frontmatter Extension

```yaml
coordination-type: crew|team|paired|role-based
coordination-roles: [pilot, copilot, surgeon, etc.]
coordination-protocol: [briefing|handoff|check-in|sync]
synchronization-trigger: time-based|event-based|condition-based
```

## Example Structure

- [[Crew Resource Management]] (universal hub)
  - [[Aviation CRM]] (implementation: pilot/copilot)
  - [[Surgical Team Coordination]] (implementation: surgeon/nurse/anesthesiologist)
  - [[Marine Bridge Team]] (implementation: captain/lookout/engineer)

## Related Existing Notes

- [[Seed Stress Test - Aviation Knowledge Base]] — Identified this gap
- [[Frontier Exploration - Multi-Person Knowledge Execution]] — Related exploration
- [[Seed Stress Test - Multi-Person Coordination in Team Sports]] — Potential domain test
- [[Multi-Vault Knowledge Coordination]] — Different (vaults, not people)

## Gap Status: Identified

This gap has been identified through seed stress testing. Next step: analyze existing multi-person notes in the vault and propose specific rule language.