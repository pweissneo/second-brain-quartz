---
last-updated: 2026-04-04
lifecycle: seed-rule
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-status: resolved
gap-priority: medium
discovered: 2026-03-30
resolved: 2026-04-04
resolved-by: "[[Seed Rule Addition - Multi-Person Coordination]]"
gap-source: frontier-exploration
tags:
  - seed-rule
  - coordination
  - multi-person
  - crew
  - team
---

# Seed Rule Addition: Multi-Person Knowledge Coordination

**Rule:** For knowledge requiring coordinated execution by multiple people (crew operations, team sports, pair programming, surgical teams), organize notes for both individual understanding AND team coordination — include role definitions, communication protocols, and synchronization triggers.

**Why:** Individual knowledge of procedures is insufficient when execution requires coordination between people. Notes should include coordination requirements that enable team execution, not just individual comprehension. Without coordination-aware organization, vaults capture what each person needs to know but miss how they work together.

**Test:** For any procedure requiring 2+ people: (1) Can you identify coordination dependencies? (2) Are role definitions documented where relevant? (3) Are communication protocols explicit (what is said when)? (4) Are synchronization triggers defined (when to coordinate)?

## Implementation

### Frontmatter Extension

```yaml
coordination-type: crew|team|paired|role-based
coordination-roles: [pilot, copilot, surgeon, scrub-nurse, anesthesiologist]
coordination-protocol: [briefing|handoff|check-in|sync|challenge-response]
synchronization-trigger: time-based|event-based|condition-based
```

### Organization Patterns

**Role-Sliced Notes:** For critical procedures, create role-specific notes that link to a master procedure:
- [[Engine Failure Procedure (PF)]] — Pilot flying responsibilities
- [[Engine Failure Procedure (PM)]] — Pilot monitoring responsibilities

**Coordination Hub:** Central note mapping roles to responsibilities:
- [[Surgical Safety Hub]] → links to surgeon, nurse, anesthesiologist notes

**Communication Protocol Notes:** Explicit scripts for critical moments:
- [[Standard Callouts - Engine Failure]]
- [[Challenge-Response Protocols for Critical Actions]]
- [[Briefing Scripts for Crew Operations]]

**State Synchronization Rules:** How teams maintain shared awareness:
- [[CRM State Callouts]]
- [[Sterile Cockpit Protocols]]
- [[Handoff Procedures]]

### Coordination Type Definitions

| Type | Description | Example |
|------|-------------|---------|
| crew | Fixed team with defined roles, hierarchical | Aviation, surgery, marine bridge |
| team | Adaptive roles, shared purpose | Sports, theater, military squads |
| paired | Two people with complementary roles | Pair programming, driving |
| role-based | Rotating roles based on context | Incident command, on-call rotation |

### Synchronization Triggers

- **Time-based:** Periodic check-ins, watch rotations, scheduled briefs
- **Event-based:** Phase transitions, critical events, anomalies detected
- **Condition-based:** Threshold triggers, state changes, decision points

## Edge Cases

- **Single-person fallback:** Document self-communication protocols (thinking aloud, checklist verbalization)
- **Async coordination:** Shift handoffs, time zone transitions — require explicit handoff procedures
- **Hierarchical vs. flat:** Some contexts require strict hierarchy; others need adaptive leadership
- **Ad-hoc teams:** Temporary groups without established protocols need coordination templates

## Domain Examples

**Aviation:** CRM (Crew Resource Management), sterile cockpit, read-back requirements, challenge-and-response for critical actions

**Surgery:** WHO surgical safety checklist, time-out protocols, role-specific responsibilities (surgeon, scrub nurse, anesthesiologist)

**Marine:** Bridge team coordination, watch rotations, captain/lookout/engineer responsibilities

**Emergency Services:** ICS (Incident Command System), team roles in fire/EMS

**Team Sports:** Coach-player coordination, medical staff communication, in-game adjustments

**Software Development:** Pair programming protocols, code review workflows, agile ceremonies

## Relationship to Existing Seed Rules

- **Atomicity Rule:** Apply with modification — procedures may be split by role but must have coordination hub
- **Multi-Item Coordination:** Extends from items to people — same principle of completeness
- **Verification:** Coordination knowledge should be verified through team演练 (drills) or simulation, not just individual review

## Gap Resolution

This rule resolves [[Seed Gap - Multi-Person Knowledge Coordination]] which identified that the Seed lacked guidance for coordinated multi-person execution knowledge.

**See also:**
- [[Seed Stress Test - Aviation Knowledge Base]] — Original stress test identifying this gap
- [[Frontier Exploration - Multi-Person Knowledge Execution]] — Frontier exploration that framed the issue
- [[Seed Gap - Collaborative Knowledge Base Governance]] — Different (governance, not execution coordination)