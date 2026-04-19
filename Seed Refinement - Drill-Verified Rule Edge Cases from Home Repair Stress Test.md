---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-08
lifecycle: seed-extension
confidence: emerging
tags:
  - seed-stress-test
  - seed-refinement
  - drill-verified
  - safety
  - home-repair
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Seed Stress Test - Drill-Verified Rule in Home Repair]]"
  - "[[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]]"
---

# Seed Refinement: Drill-Verified Rule Edge Cases

> Stress testing the drill-verified rule against home repair domain reveals refinements needed for safety-critical knowledge handling.

## Issues Found

### Issue 1: Drill Feasibility Not Addressed

The current rule assumes drill verification is always possible. In home repair, some safety procedures cannot be fully drilled:
- Ladder fall response — requires safety equipment most people don't have
- Electrical emergency response — requires special setup
- Some procedures are too dangerous to practice realistically

**The rule needs to address drill feasibility.**

### Issue 2: Mixed Verification Modes

Home repair safety knowledge often requires BOTH source verification (correct medical/legal info) AND drill verification (muscle memory). The current rule treats them as separate modes, not acknowledging dual-verification cases.

**The rule needs to handle mixed verification modes.**

### Issue 3: Drill Frequency Calculation

The rule says "quarterly" as default but doesn't address:
- When quarterly is overkill vs. insufficient
- How to factor in exposure frequency
- Low-frequency/high-consequence procedures need different schedules

**The rule needs exposure-frequency integration.**

## Proposed Seed Refinements

### Refinement 1: Drill Type Classification

**Rule (PROPOSED):** When tagging knowledge as `verification-mode: drill-verified`, specify drill type based on feasibility:

```yaml
drill-type: physical|partial|mental-rehearsal|simulation|observed
# physical: full drill possible (e.g., fire extinguisher PASS method)
# partial: components can be practiced, not full scenario (e.g., grip without fall)
# mental-rehearsal: full drill not feasible, cognitive practice only
# simulation: video/virtual practice available
# observed: watch someone else perform (no direct practice)
```

**Why:** An AI agent cannot determine if a drill is feasible without explicit classification. Without drill-type, the agent assumes physical drill is possible and may incorrectly flag notes as unverified.

**Test:** (1) Does the note have `drill-type:` field? (2) If `drill-type: mental-rehearsal`, is there explanation of why full drill is not feasible? (3) Can AI agent determine drill feasibility from the note?

**Implementation:**
```markdown
For safety notes in home repair, construction, or other skill-based domains:
- If full physical drill is feasible: drill-type: physical
- If only components can be practiced: drill-type: partial  
- If drill is not feasible but knowledge is critical: drill-type: mental-rehearsal
- If video/simulation available: drill-type: simulation
- If cannot practice but can observe: drill-type: observed
```

### Refinement 2: Dual Verification Mode Support

**Rule (PROPOSED):** Safety-critical knowledge in skill-based domains may require multiple verification modes. Track each mode separately:

```yaml
verification-modes:
  - mode: drill-verified
    status: unverified
    last-practiced: null
    next-drill-due: null
  - mode: source-verified
    status: verified
    last-verified: 2026-03-15
    source-quality: high
```

**Why:** Home repair safety knowledge (e.g., first aid for injuries) needs both correct medical info AND practiced response. The current single `verification-mode` field cannot capture this. Without dual-mode support, an AI agent cannot distinguish between "verified via drill only" and "verified via both drill and source."

**Test:** (1) For safety-critical notes, can you identify which verification modes apply? (2) Is confidence appropriately LOW when only one mode of dual-verification is complete? (3) Does the note document which modes are still needed?

### Refinement 3: Exposure Frequency Integration

**Rule (PROPOSED):** Calculate drill frequency based on risk × exposure:

```yaml
exposure-frequency: daily|weekly|monthly|rarely
risk-level: low|medium|high|critical
drill-frequency:
  daily-use: monthly
  weekly-use: quarterly
  monthly-use: biannual
  rare-use: annual
# High-risk procedures get +1 frequency tier
```

**Why:** A person who uses power tools daily needs monthly drill reminders; someone who does rare DIY needs quarterly. The default "quarterly" doesn't account for this. Without exposure-frequency, the AI cannot calculate appropriate drill schedules.

**Test:** (1) Does the note include exposure-frequency? (2) Is drill frequency adjusted based on risk × exposure? (3) Can AI calculate appropriate next-drill-due date?

### Refinement 4: Professional Boundary Tagging

**Rule (PROPOSED):** For procedures requiring professional certification (vs. DIY knowledge), tag explicitly:

```yaml
professional-required: true
certification-body: "NABCI|IPEI|other"
certification-scope: "full|partial"
certification-valid: true
certification-expires: null
```

**Why:** In home repair, some procedures (electrical panel work, HVAC) legally require licensed professionals. A DIY-focused knowledge base should distinguish what a user should NOT attempt vs. what they can safely practice. Without this tagging, AI cannot distinguish DIY from professional-tier knowledge.

**Test:** (1) Can you identify which notes require professional vs. DIY knowledge? (2) Are legal/liability boundaries documented? (3) Does the note warn when DIY is inappropriate?

## Integration with Existing Seed

These refinements **complement**, not replace:
- **Drill-verified rule** (section 1, Foundation) — remains core rule
- **Verification-mode** — now allows multiple modes per note
- **Conflict resolution hierarchy** — drill-verified wins for safety (mode-priority)

**Changes needed to Seed:**
1. Update `drill-type` field description (currently minimal)
2. Allow `verification-modes` array (currently single value)
3. Add `exposure-frequency` field recommendation
4. Add `professional-required` for boundary documentation

## Test Executability

**Can an AI agent execute these tests?**

1. Drill type test: Yes — AI can identify notes missing drill-type and flag as incomplete
2. Dual verification test: Yes — AI can check if both required modes are verified
3. Exposure frequency test: Yes — AI can calculate appropriate drill frequency from fields
4. Professional boundary test: Yes — AI can identify DIY vs. professional boundary notes

**What AI cannot verify:** Whether the person actually practiced. The rule relies on honest self-reporting. For home repair, unlike CPR certification, there's no external accountability.

## Domain Applicability

| Domain | All Refinements Needed? |
|--------|-------------------------|
| Home Repair/Construction | Yes — all 4 refinements |
| Cooking | Partial — drill-type, exposure-frequency |
| Emergency/First Aid | Yes — dual verification critical |
| Aviation/Safety-Critical | Yes — professional boundaries critical |
| Creative Skills | Partial — drill-type only |

## Related

- [[Seed Stress Test - Drill-Verified Rule in Home Repair]]
- [[Seed Stress Test - Verification Status Rule in Home Repair]]  
- [[AI-Assisted Knowledge Management Seed]] — Drill-verified rule (lines 617+)
- [[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]]