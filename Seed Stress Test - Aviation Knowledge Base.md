---
 lifecycle: staging
 confidence: low
 last-updated: 2026-03-29
---
# Seed Stress Test - Aviation Knowledge Base

> Testing Seed rules against an aviation flight knowledge base reveals unique challenges in safety-critical, equipment-dependent, regulatory domains.

## Domain Profile: Aviation

- **Knowledge types:** Procedural (checklists, maneuvers), Regulatory (FAA rules, NOTAMs), Technical (aircraft systems, performance), Meteorological (weather interpretation), Embodied (flying skills, sensory feedback)
- **Stakes:** Extremely high (life-safety critical)
- **Verification mode:** Tool-dependent ( simulators, actual flight), Empirical (muscle memory, decision timing)
- **Equipment dependency:** High (specific aircraft types, avionics)
- **Regulation:** High (FAA, EASA, ICAO)

## Stress Test Results

### Rule: Atomicity Rule

**Challenge:** Aviation procedural knowledge REQUIRES checklists to stay together for safety. Splitting "engine failure" into separate "engine failure diagnosis" and "engine failure response" notes would be Dangerous.

**Edge case identified:** The Seed's atomicity rule assumes splitting improves reusability. In aviation, checklists must remain as complete procedures. The rule needs explicit exception for safety-critical procedures.

**Test result:** FAILS for aviation — rule would create unsafe knowledge organization

**Recommendation:** Add edge case for safety-critical procedural knowledge:
> **Edge case:** For safety-critical procedural knowledge (aviation, emergency medicine, critical infrastructure), keep complete procedures together even if >300 words. Split ONLY if parts are independently executable AND safety-independent.

### Rule: 2+ Outgoing Links Rule

**Challenge:** Aviation knowledge naturally clusters around specific scenarios (runway incursion, engine failure, weather encounter). Forcing 2+ links might create artificial connections.

**Test:** Typical maneuver notes (e.g., "Engine Failure After Takeoff") naturally link to prerequisites (engine monitoring, climb performance) but may have only 1 outgoing link to the checklist itself.

**Test result:** MOSTLY PASSES — but may need relaxed threshold for scenario-based notes

### Rule: Construction Phase Model

**Challenge:** Aviation knowledge has strict prerequisite chains (ground school → oral exam → flight training → check ride). These cannot be reordered.

**Edge case:** Skeleton phase may need 100+ notes for pilot certification knowledge alone before practical flight knowledge is possible.

**Test result:** PASSES with extended skeleton threshold

### Rule: Verification Ratio Rule

**Challenge:** "Verified" in aviation means actually flown or simulator-checked, not source-checked. Source verification is insufficient — you need empirical validation.

**Test result:** The Seed's "empirical verification" edge case applies directly here

### Rule: Equipment Dependencies

**Challenge:** Aviation has extreme equipment dependency. Knowledge about a Cessna 172 does not transfer to a Boeing 737. The Seed's infrastructure rule works but needs stronger enforcement.

**Test:** Is there separation between general principles (aerodynamics, weather theory) and aircraft-specific procedures?

**Test result:** PASSES — Seed infrastructure rule handles this well

### Rule: Confidence Markers

**Challenge:** Aviation confidence is legally defined (instrument rating, commercial rating, ATP). The arbitrary 1-5 confidence scale doesn't map.

**Test result:** NEEDS ADDITION — aviation needs rating-level confidence mapping

### Unique Gap: Crew Resource Management

Aviation knowledge depends on crew coordination (CRM). Single-pilot vs. two-crew aircraft have different knowledge needs. The Seed doesn't address multi-person knowledge workflows.

**New Seed rule candidate:**

> **Rule:** For knowledge that requires coordinated execution (crew operations, team sports, pair programming), organize for both individual understanding AND team coordination.
> **Why:** Individual knowledge of procedures is insufficient when execution requires coordination. Notes should include coordination requirements, role definitions, and communication protocols.
> **Test:** Can you identify coordination dependencies? Are crew roles defined where relevant?

### Unique Gap: Regulatory Expiration

Aviation knowledge has regulatory expiration (medical certificate, currency requirements). The temporal knowledge rule handles dates but not "currency" (recent experience requirements).

**Test result:** The "temporal knowledge" section partially covers but needs aviation-specific extension

## Summary

| Rule | Result | Notes |
|------|--------|-------|
| Atomicity | ⚠️ FAIL | Safety-critical procedures must stay together |
| 2+ Links | ✅ PASS | May need relaxed threshold |
| Construction Phase | ⚠️ PARTIAL | Extended skeleton phase needed |
| Verification Ratio | ✅ PASS | Empirical mode applies |
| Equipment Dependencies | ✅ PASS | Infrastructure rule works |
| Confidence Markers | ⚠️ PARTIAL | Needs rating-level mapping |

## Seed Improvement Candidates

1. **Safety-critical procedure exception to atomicity** — explicit carve-out
2. **Crew coordination knowledge** — multi-person execution organization
3. **Currency/expiration knowledge** — experience-based temporal rules for skill-based domains

---
See also: [[Frontier Exploration - Safety-Critical Knowledge Thresholds]]
See also: [[Seed Stress Test - Decision Threshold Rule in Emergency Medicine]] (similar safety-critical domain)