---
author-type: ai-assisted
lifecycle: archived
confidence: low
last-updated: 2026-03-31
gap-status: merged
gap-priority: medium
merged-into: [[Seed Gap - Multi-Person Knowledge Coordination]]
redirect_to: [[Seed Gap - Multi-Person Knowledge Coordination]]
---

# Frontier Exploration - Multi-Person Knowledge Execution

> ⚠️ **ARCHIVED: This note has been merged into [[Seed Gap - Multi-Person Knowledge Coordination]]**
> 
> The content from this frontier exploration has been incorporated into the Seed Gap note, which provides a formal rule proposal in Seed format.
> 
> **Reason for merge:** REDUNDANCY_SCAN on 2026-03-31 found this frontier exploration note and the Seed Gap note covered identical territory. The content was merged to eliminate redundancy.

## Original Content (Archived)

> When knowledge must be executed by multiple people, individual understanding is insufficient.

### The Gap

The Seed's knowledge organization assumes single-person consumption. But many domains require coordinated execution:

- **Aviation:** CRM (Crew Resource Management) — pilot, copilot, ATC
- **Surgery:** OR team — surgeon, anesthesiologist, nurses
- **Theater/film:** Director, stage crew, actors
- **Team sports:** Coach, players, medical staff
- **Firefighting:** Incident commander, crew
- **Military:** Unit coordination
- **Nuclear operations:** Control room teams

In these domains, knowing a procedure individually is insufficient — you must execute it in coordination with others.

### Why This Matters

Individual knowledge capture captures understanding, but multi-person execution requires additional dimensions:

1. **Role definitions** — Who does what?
2. **Communication protocols** — What is said when?
3. **State synchronization** — How does everyone know current state?
4. **Responsibility transfer** — How is leadership transferred?
5. **Escalation paths** — Who decides when things go wrong?
6. **Verification of coordination** — How do you verify collective execution?

The Seed's atomicity rule assumes knowledge should be self-contained for one person. Multi-person execution often requires breaking self-contained procedures into role-specific slices that must be reassembled for team execution.

### Seed Rule Candidate

> **Rule:** For knowledge that requires coordinated execution (crew operations, surgical procedures, team sports, pair programming), organize for both individual understanding AND team coordination.
> **Why:** Individual knowledge of procedures is insufficient when execution requires coordination. Notes should include coordination requirements, role definitions, communication protocols, and synchronization mechanisms.
> **Test:** (1) Does this knowledge require multiple people to execute? (2) Are role responsibilities explicitly defined? (3) Are communication protocols documented? (4) Can you verify coordination without assuming everyone "just knows"?

### Implementation Approaches

- **Role-Sliced Notes:** [[Engine Failure Procedure (PM)]], [[Engine Failure Procedure (PF)]]
- **Coordination Hub:** [[Engine Failure CRM Hub]]
- **Communication Protocol Notes:** [[Standard Callouts - Engine Failure]]
- **State Synchronization Rules:** [[CRM State Callouts]]

### Edge Cases

- Single-pilot aircraft falls back to self-communication
- Async coordination (different time zones) requires handoff procedures
- Hierarchical vs. flat structures (Navy vs. rugby)

---

*Archived: 2026-03-31 (merged via REDUNDANCY_SCAN)*
*See: [[Seed Gap - Multi-Person Knowledge Coordination]]*
*See also: [[Seed Stress Test - Aviation Knowledge Base]], [[Frontier Exploration - Safety-Critical Knowledge Thresholds]]*