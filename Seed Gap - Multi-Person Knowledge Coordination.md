---
last-reviewed: 2026-04-08

last-updated: 2026-04-04
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - multi-person
  - coordination
  - crew
  - team
gap-status: resolved
gap-priority: medium
gap-phase: resolved
gap-source: redundancy-scan
discovered: 2026-03-30
analyzed: 2026-03-30
proposed: 2026-04-01
resolved: 2026-04-04
resolved-by: "[[Seed Rule Addition - Multi-Person Coordination]]"
resolution-deadline: 2026-05-01
---

# Seed Gap: Multi-Person Knowledge Coordination

> **2026-03-31:** This gap note was merged from two overlapping notes discovered via REDUNDANCY_SCAN:
> - `Seed Gap - Multi-Person Knowledge Coordination` (seed-gap format)
> - `Frontier Exploration - Multi-Person Knowledge Execution` (frontier exploration format)
> 
> The merged note combines the formal Seed rule proposal with broader context and implementation approaches.

## Gap Description

The Seed covers multi-item coordination (cooking meals, event planning) and participant-count validity (games, team sports), but lacks explicit guidance for **coordinated execution by multiple people** — where the coordination itself is the knowledge, not the individual actions.

## Why This Matters

Individual knowledge capture captures understanding, but multi-person execution requires additional dimensions:

1. **Role definitions** — Who does what?
2. **Communication protocols** — What is said when?
3. **State synchronization** — How does everyone know current state?
4. **Responsibility transfer** — How is leadership transferred?
5. **Escalation paths** — Who decides when things go wrong?
6. **Verification of coordination** — How do you verify collective execution?

The Seed's atomicity rule assumes knowledge should be self-contained for one person. Multi-person execution often requires breaking self-contained procedures into role-specific slices that must be reassembled for team execution.

## Where This Gap Appears

### Aviation (from Seed Stress Test)
- Crew Resource Management (CRM) — coordination between pilot and copilot
- Single-pilot vs. two-crew aircraft have different knowledge needs
- Pre-flight briefing, sterile cockpit rules, read-back requirements, challenge-and-response for critical actions

### Similar Domains
- **Surgery** — surgical teams (surgeon, scrub nurse, anesthesiologist), WHO surgical safety checklist, time-out protocols
- **Marine** — bridge team coordination, watch rotations, captain/lookout/engineer responsibilities
- **Military** — squad coordination, chain of command, unit operations
- **Emergency services** — firefighting teams (ICS), paramedic crews, incident command
- **Theater/film** — director, stage crew, actors, production coordination
- **Team sports** — coach, players, medical staff coordination

## What the Seed Currently Covers

| Rule | Coverage | Gap |
|------|----------|-----|
| Multi-item coordination | Items being created | People executing together |
| Participant count | Advice validity by number | Coordination roles/responsibilities |
| Trade coordination | Sequential trade execution | Role-based responsibility |
| Ensemble knowledge | Participant requirements | Coordination protocols |

## Proposed Seed Rule

> **Rule:** For knowledge that requires coordinated execution by multiple people (crew operations, team sports, pair programming, surgical teams), organize for both individual understanding AND team coordination.
> 
> **Why:** Individual knowledge of procedures is insufficient when execution requires coordination. Notes should include coordination requirements, role definitions, communication protocols, and synchronization triggers.
> 
> **Test:** Can you identify: (1) Coordination dependencies? (2) Role definitions where relevant? (3) Communication protocols? (4) Synchronization triggers (when to coordinate)?

### Implementation Approaches

#### Role-Sliced Notes
Create notes for each role that link to a master procedure:
- [[Engine Failure Procedure (PM)]] — Pilot monitoring responsibilities
- [[Engine Failure Procedure (PF)]] — Pilot flying responsibilities

#### Coordination Hub
Central note that maps roles to responsibilities:
- [[Engine Failure CRM Hub]]

#### Communication Protocol Notes
Explicit scripts for critical communications:
- [[Standard Callouts - Engine Failure]]
- [[Challenge-Response Protocols]]

#### State Synchronization Rules
How the team maintains shared situational awareness:
- [[CRM State Callouts]]
- [[Briefing Protocols]]

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

## Edge Cases

- **Single-pilot aircraft:** Falls back to self-communication (talking to oneself)
- **Async coordination:** Different time zones, shift work — requires handoff procedures
- **Hierarchical vs. flat:** Navy (strict hierarchy) vs. rugby (flat, adaptive)

## Test Scenario

Apply to aviation knowledge base:
1. Engine failure procedure note exists
2. Can you identify PM and PF roles?
3. Are communication protocols documented (read-back, callouts)?
4. Does the vault have a CRM hub?
5. Can you verify team coordination knowledge exists?

## Related Existing Notes

- [[Seed Stress Test - Aviation Knowledge Base]] — Identified this gap
- [[Frontier Exploration - Multi-Person Knowledge Execution]] — (merged into this note)
- [[Seed Stress Test - Multi-Person Coordination in Team Sports]] — Potential domain test
- [[Multi-Vault Knowledge Coordination]] — Different (vaults, not people)
- [[Frontier Exploration - Safety-Critical Knowledge Thresholds]] — Related domain