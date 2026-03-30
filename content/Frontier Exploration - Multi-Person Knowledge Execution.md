---
lifecycle: staging
confidence: low
last-updated: 2026-03-29
gap-status: identified
gap-priority: medium
---
# Frontier Exploration - Multi-Person Knowledge Execution

> When knowledge must be executed by multiple people, individual understanding is insufficient.

## The Gap

The Seed's knowledge organization assumes single-person consumption. But many domains require coordinated execution:

- **Aviation:** CRM (Crew Resource Management) — pilot, copilot, ATC
- **Surgery:** OR team — surgeon, anesthesiologist, nurses
- **Theater/film:** Director, stage crew, actors
- **Team sports:** Coach, players, medical staff
- **Firefighting:** Incident commander, crew
- **Military:** Unit coordination
- **Nuclear operations:** Control room teams

In these domains, knowing a procedure individually is insufficient — you must execute it in coordination with others.

## Why This Matters

Individual knowledge capture captures understanding, but multi-person execution requires additional dimensions:

1. **Role definitions** — Who does what?
2. **Communication protocols** — What is said when?
3. **State synchronization** — How does everyone know current state?
4. **Responsibility transfer** — How is leadership transferred?
5. **Escalation paths** — Who decides when things go wrong?
6. **Verification of coordination** — How do you verify collective execution?

The Seed's atomicity rule assumes knowledge should be self-contained for one person. Multi-person execution often requires breaking self-contained procedures into role-specific slices that must be reassembled for team execution.

## Seed Rule Candidate

> **Rule:** For knowledge that requires coordinated execution (crew operations, surgical procedures, team sports, pair programming), organize for both individual understanding AND team coordination.
> **Why:** Individual knowledge of procedures is insufficient when execution requires coordination. Notes should include coordination requirements, role definitions, communication protocols, and synchronization mechanisms.
> **Test:** (1) Does this knowledge require multiple people to execute? (2) Are role responsibilities explicitly defined? (3) Are communication protocols documented? (4) Can you verify coordination without assuming everyone "just knows"?

## Implementation Approaches

### Role-Sliced Notes
Create notes for each role that link to a master procedure:
- [[Engine Failure Procedure (PM)]] — Pilot monitoring responsibilities
- [[Engine Failure Procedure (PF)]] — Pilot flying responsibilities

### Coordination Hub
Central note that maps roles to responsibilities:
- [[Engine Failure CRM Hub]]

### Communication Protocol Notes
Explicit scripts for critical communications:
- [[Standard Callouts - Engine Failure]]
- [[Challenge-Response Protocols]]

### State Synchronization Rules
How the team maintains shared situational awareness:
- [[CRM State Callouts]]
- [[Briefing Protocols]]

## Domain-Specific Examples

### Aviation CRM
- Pre-flight briefing
- sterile cockpit rules
- read-back requirements
- challenge-and-response for critical actions

### Surgical Time-Out
- WHO surgical safety checklist
- role introduction
- verification of patient/site
- expected blood loss confirmation

### Firefighting ICS
- Incident command system
- role assignments by incident type
- communication hierarchy
- transfer of command protocol

## Edge Cases

- **Single-pilot aircraft:** Falls back to self-communication (talking to oneself)
- **Async coordination:** Different time zones, shift work — requires handoff procedures
- **Hierarchical vs. flat:** Navy (strict hierarchy) vs. rugby (flat, adaptive)

## Test Scenario

Apply to aviation stress test:
1. Engine failure procedure note exists
2. Can you identify PM and PF roles?
3. Are communication protocols documented (read-back, callouts)?
4. Does the vault have a CRM hub?
5. Can you verify team coordination knowledge exists?

---
See also: [[Seed Stress Test - Aviation Knowledge Base]]
See also: [[Frontier Exploration - Safety-Critical Knowledge Thresholds]]