---
last-reviewed: 2026-03-27
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - stress-test
  - drill-verified
  - safety
  - home-repair
---

# Seed Stress Test: Drill-Verified Rule in Home Repair

> Testing the drill-verified knowledge rule (added 2026-03-27) against home repair and DIY safety procedures.

## The Rule Under Test

**Rule (NEW - 2026-03-27):** For knowledge that can only be validated through practice drills (not through source-checking, actual use, or tool execution), tag with `verification-mode: drill-verified` and track drill frequency.

**Test:** For emergency, safety, or survival knowledge: (1) Does the note have `verification-mode: drill-verified`? (2) Is there `last-practiced:` frontmatter? (3) Is there `next-drill-due:`? (4) Is certification-equivalent documented?

## Domain: Home Repair / DIY

### What's Different About This Domain

Home repair involves:
- Power tools (circular saws, table saws, routers, nail guns)
- Structural work (framing, decking, roofing)
- Electrical work (wiring, panel work, outlet replacement)
- Plumbing (pipe fitting, water heater installation)
- Height work (ladders, scaffolding)

Unlike cooking where "verification" means you eat the food and judge the result, home repair safety procedures must be verified through DRILLS because:
1. You hope to never use them in real emergencies
2. Using them incorrectly can cause serious injury or death
3. Source verification doesn't verify muscle memory

### Test Scenario 1: Circular Saw Kickback Response

**Knowledge:** "If kickback occurs, release trigger immediately and let blade spin down. Do NOT try to grab the saw."

**Is this drill-verified?** Yes - muscle memory must be automatic

**Current Seed Test:** 
- `verification-mode: drill-verified` ✓
- `last-practiced:` - needs tracking
- `next-drill-due:` - needs tracking
- `certification-equivalent:` - not applicable for DIY

**Problem identified:** The Seed doesn't address what happens when someone CANNOT practice (no equipment, no safe space to practice). This creates a gap - knowledge tagged as drill-verified but never practiced.

**Edge case found:** In home repair, some safety procedures (electrical panel work, working at heights) require equipment/safe conditions that most DIYers don't have. The rule assumes drills are feasible.

### Test Scenario 2: Ladder Fall Response

**Knowledge:** "When falling from ladder: tuck chin, spread arms to absorb impact, roll if possible."

**Is this drill-verified?** Yes - must be automatic response

**Problem:** How do you drill falling from a ladder? You can't. The rule doesn't address:
- Mental rehearsal as drill type
- Video analysis as alternative verification
- Explicit acknowledgment that full drill is impossible

### Test Scenario 3: First Aid for Woodworking Injuries

**Knowledge:** "For deep saw cuts: apply direct pressure for 10+ minutes, elevate above heart, seek medical attention."

**Verification:** This is both drill-verified (practice pressure application) AND source-verified (medical accuracy).

**Edge case found:** The rule treats drill-verified as distinct from source-verified, but home repair safety knowledge is often BOTH. A first aid procedure should be both properly sourced AND practiced.

### Test Scenario 4: Fire Extinguisher Use

**Knowledge:** "PASS method: Pull pin, Aim at base of fire, Squeeze handle, Sweep side to side."

**Verification:** Can be practiced with expired/dummy extinguishers

**Current Seed Test:** The rule works well for this - practice is feasible

## Issues Found

### Issue 1: Drill Feasibility Not Addressed

The rule assumes drill verification is possible. For home repair:
- Ladder fall drills require safety equipment most people don't have
- Electrical emergency drills require special setup
- Some procedures are too dangerous to practice realistically

**Proposed refinement:**
```markdown
**Edge case:** For safety procedures where full drill is not feasible, use:
- `drill-type: mental-rehearsal` for cognitive-only drills
- `drill-type: partial` for practicing components (e.g., grip without the fall)
- `drill-type: simulation` for video/virtual practice
- `drill-type: observed` for watching someone else perform
```

### Issue 2: Mixed Verification Modes

Home repair safety knowledge often requires BOTH source verification (correct medical/legal info) AND drill verification (muscle memory). The current rule treats them as separate.

**Proposed refinement:**
```markdown
**Edge case:** Safety-critical home repair knowledge may require dual verification:
- `verification-mode: drill-verified, source-verified` 
- Track drill status AND source quality separately
- Confidence is LOW if only one mode is verified
```

### Issue 3: Certification Tracking

Some home repair skills have certifications (electrician, plumber). The rule has `certification-equivalent` but doesn't address:
- How to handle partial certifications
- Trade-specific certification bodies
- Expiration tracking for certifications

**Proposed refinement:**
```markdown
**Edge case:** For home repair certifications:
- `certification-equivalent: none` means self-taught
- Document which procedures require professional (vs. DIY) knowledge
- Tag with `professional-required: true` for code/liability reasons
```

### Issue 4: Drill Frequency for Low-Risk/High-Consequence

Some procedures (electrical safety) are low-frequency but high-consequence. The rule says "quarterly" as default but doesn't address:
- When quarterly is overkill vs. insufficient
- How to assess if practice is "enough"

**Proposed refinement:**
```markdown
**Edge case:** For home repair safety:
- Frequency should match risk × exposure (use power tools daily = monthly, rarely = quarterly)
- Add `exposure-frequency: daily|weekly|monthly|rarely` to calculate appropriate drill schedule
```

## Test Executability

**Does this test work?** Yes - an AI agent can:
1. Identify safety-related home repair notes
2. Check for `verification-mode: drill-verified` tag
3. Verify drill tracking fields exist
4. Flag notes missing drill tracking
5. Assess feasibility of actual drill

**What fails:** The AI cannot verify that the person actually practiced. The rule relies on honest self-reporting. In home repair, unlike CPR certification, there's no external accountability.

## Domain-Specific Test for Home Repair

```markdown
For home repair safety notes:
1. Is this knowledge about a procedure that could cause injury if performed wrong?
2. Does the note require muscle memory (automatic response) vs. just knowing?
3. Is there equipment required to practice? Is it available?
4. Could this kill you if wrong? (electrical, structural, height)
5. Is there a DIY vs. professional boundary?

If yes to 1-2: tag drill-verified
If yes to 3 AND equipment unavailable: use mental-rehearsal drill type
If yes to 4: require source-verification AND drill-verification for full confidence
If yes to 5: tag `professional-required: true`
```

## Recommendations for Seed Update

### Add to Drill-Verified Rule:

```markdown
**Edge case (stress test 2026-03-27 - home repair):** Safety procedures in home repair face unique drill verification challenges:
- Some procedures cannot be fully drilled (ladder falls, electrical emergencies) - use mental-rehearsal drill type
- High-consequence knowledge (electrical, structural, height) requires both source AND drill verification
- Add `exposure-frequency:` to calculate appropriate drill frequency
- For procedures requiring professional certification, tag `professional-required: true`
- Mix of drill-verified AND source-verified is common for safety-critical knowledge
```

## Related

- [[Seed Stress Test - Home Repair Knowledge Base]]
- [[Seed Stress Test - Verification Status Rule in Home Repair]]
- [[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed]] — Drill-verified rule (section 1, Foundation)

---