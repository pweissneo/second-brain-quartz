---
last-reviewed: 2026-03-18
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
domain-familiarity: learning
tags:
  - seed-stress-test
  - automotive
  - equipment-dependencies
  - safety-critical
  - context-gated
---

# Seed Stress Test: Automotive Repair Knowledge Base

> Testing Seed rules against the unique demands of automotive repair and maintenance knowledge.

## Domain Characteristics

Automotive repair presents unique knowledge management challenges:
- **Safety-critical procedures** — incorrect repairs can cause injury or death
- **Equipment-specific knowledge** — procedures vary by specific tools
- **Context-gated knowledge** — knowledge applies to specific year/make/model
- **Experiential diagnostics** — "sound," "feel," and "smell" are diagnostic clues
- **Temporal knowledge** — procedures change with model years and technology
- **Regulatory requirements** — emissions, safety inspections vary by jurisdiction

---

## 1. Safety-Critical Knowledge

**Seed Rule:** For safety-critical procedural knowledge, include explicit contra-indication sections and `safety-warning` frontmatter.

**Automotive Application:**

### Edge Case: Brake Repair

**Problem:** Brake work is inherently safety-critical. A note on "replacing brake pads" must include:
- Safety warnings that are impossible to ignore
- Contra-indications (when NOT to do this yourself)
- Explicit warning about requiring proper tools

**Test:** For automotive safety-critical notes:
1. Is there a `safety-warning: critical` tag?
2. Are contra-indications prominent (not buried)?
3. Is there a clear "stop and consult a professional" option?

### Edge Case: Airbag Knowledge

**Problem:** Airbag systems can deploy unexpectedly, causing serious injury or death. Some procedures (disconnecting battery) are safe; others (removing steering wheel) are not.

**Seed Rule:** For knowledge that should never be execution-verified, use `verification-avoid` frontmatter.

**Analysis:** Automotive repair has procedures that:
- Should be verified by execution (changing oil, replacing filters)
- Should NEVER be verified by amateurs (airbag component replacement)

**Test:** Can you identify which automotive procedures have `verification-avoid` tags?

### Edge Case: Lifting the Vehicle

**Problem:** "Jack up the car" assumes the reader knows:
- Where to place jack stands (frame rails, not bumper)
- What type of jack (hydraulic floor jack vs scissor jack)
- How to engage parking brake
- What to do if jacks slip

**Test:** For equipment-dependent procedures, are assumptions documented with `gear-required` and `gear-category`?

---

## 2. Equipment Dependencies

**Seed Rule:** For procedures that depend on equipment availability, use explicit equipment tagging with `gear-required` and alternatives.

**Automotive Application:**

### Edge Case: Specialty Tools

**Problem:** Some repairs require specialty tools that most home mechanics don't own:
- Torque wrench (critical for wheel lug nuts)
- Floor jack and jack stands (NOT the scissor jack that comes with the car)
- OBD-II scanner (for diagnostic codes)
- Brake bleeder kit

**Test:** For automotive notes, can you identify:
1. Required tools (`gear-required: required`)
2. Optional but helpful tools (`gear-optional: recommended`)
3. When to rent vs buy vs professional

### Edge Case: Tool Quality Variation

**Problem:** "Use a wrench" — but:
- Metric vs SAE (import vs domestic)
- 6-point vs 12-point (12-point rounds fasteners)
- Quality matters (cheap tools can fail at worst times)

**Test:** Does the note specify tool requirements beyond just "a wrench"?

### Edge Case: Consumables vs Tools

**Problem:** Oil change requires tools (wrench, funnel, jack) AND consumables (oil, filter, gasket).

**Seed Edge Case (2026-03-17):** Distinguish `tools` (owned, reusable) from `consumables` (purchased per job).

**Test:** For automotive procedures, are both tools AND consumables listed?

---

## 3. Context-Gated Knowledge

**Seed Rule:** Tag context-gated knowledge with explicit `context-gate` conditions.

**Automotive Application:**

### Edge Case: Year/Make/Model Scope

**Problem:** "How to change spark plugs" varies dramatically by:
- Engine type (4-cylinder vs V6 vs V8)
- Access (some engines require removing intake manifold)
- Technology (coil-on-plug vs older distributor systems)

**Test:** For automotive notes, is there:
1. `context-type: technical` with vehicle specifications
2. Clear scope of which vehicles this applies to
3. Version/year information when relevant

### Edge Case: Regional Variations

**Problem:** Automotive knowledge varies by region:
- Emissions equipment (California vs other states vs Europe)
- Fuel types (octane ratings, diesel availability)
- Inspection requirements

**Test:** Does the note specify geographic applicability with `jurisdiction` or `region` scope?

### Edge Case: Pre-1996 vs OBD-II

**Problem:** Diagnostic procedures changed dramatically with OBD-II (1996+). Pre-OBD codes are read differently.

**Test:** Is there clear distinction between pre-OBD and OBD-II procedures?

---

## 4. Experiential Knowledge: Diagnostics

**Seed Rule:** For domains with experiential knowledge, include `experiential-component` frontmatter.

**Automotive Application:**

### Edge Case: "It sounds like..."

**Problem:** Experienced mechanics diagnose by sound:
- Rod knock (connecting rod bearing failure) — rhythmic knocking under load
- Wheel bearing noise — humming that changes with speed
- Exhaust leaks — pronounced at acceleration

**Test:** For diagnostic notes, is there `experiential-component: intuition` with pattern cues?

### Edge Case: Smell as Diagnostic

**Problem:** Odors indicate problems:
- Burning oil — valve cover gasket or PCV issues
- Sweet smell — coolant leak (head gasket)
- Rotten eggs — catalytic converter issues

**Test:** Are smell-based diagnostics documented with sensory cues?

### Edge Case: Feel and Vibration

**Problem:** Physical sensations diagnose issues:
- Steering wheel vibration at speed — wheel balance or alignment
- Pulsing brake pedal — warped rotors
- Engine roughness — misfire, vacuum leak

**Test:** Are there `experiential-component: kinesthetic` notes documenting physical diagnostics?

---

## 5. Verification Workflow

**Seed Rule:** For procedural content, include verification-status field.

**Automotive Application:**

### Edge Case: Safety-Critical Verification

**Problem:** Some procedures (brake work, suspension) should be professionally inspected after DIY repair.

**Test:** For safety-critical DIY repairs, is there:
1. A "get professional inspection" recommendation
2. Verification by execution noted (if personally performed)
3. Community validation status

### Edge Case: Year-Specific Verification

**Problem:** A repair procedure that worked on a 2015 model might not apply to 2024.

**Seed Rule:** For rapidly evolving technology, use `version` and `utility-expiry` frontmatter.

**Test:** For automotive notes, is there a year/model applicability stated?

---

## 6. Knowledge Debt: Recalls and Technical Service Bulletins

**Seed Rule:** Track knowledge obsolescence and update cycles.

**Automotive Application:**

### Edge Case: Recalls

**Problem:** Automakers issue recalls that supersede existing knowledge:
- "How to fix X" might be obsolete if a recall covers X
- Recalls are time-sensitive

**Test:** For common repairs, is there:
1. Recall status check recommended?
2. Links to NHTSA recall database?

### Edge Case: Technical Service Bulletins (TSBs)

**Problem:** TSBs are manufacturer-issued guidance for known issues not covered by recalls. They're important but not as formal as recalls.

**Test:** Is there guidance on finding TSBs for specific vehicles?

---

## 7. Assembly Knowledge: Major Repairs

**Seed Rule:** For assembly knowledge with interdependent steps, include dependencies, checkpoints, and rollback paths.

**Automotive Application:**

### Edge Case: Engine Replacement

**Problem:** Engine replacement involves:
- Dependencies (remove intake before lifting engine)
- Parallel tasks (replace hoses while engine is out)
- Rollback (if engine doesn't fit, what can be reused)
- Checkpoints (when does "50% complete" mean?)

**Seed Edge Case (2026-03-18):** For complex assembly, include:
- `dependencies:` mapping what blocks what
- `parallel-possible:` tasks that can run concurrently
- `rollback:` recovery paths
- `checkpoints:` meaningful completion states

**Test:** For major automotive repairs, can you identify these elements?

### Edge Case: Mandatory Verification Points

**Problem:** Some steps MUST be verified regardless of completion:
- Torque specifications (wheel lugs must be torqued, not just tight)
- Fluid levels (correct filling is critical)
- Electrical connections (proper seating of connectors)

**Test:** For automotive assembly notes, are there `mandatory-verification` points with safety-critical checks?

---

## 8. Regulatory Knowledge: Emissions and Safety

**Seed Rule:** For regulated domains, include jurisdiction-specific requirements.

**Automotive Application:**

### Edge Case: Emissions Testing

**Problem:** Emissions requirements vary by jurisdiction:
- California has CARB standards (stricter)
- Some states have no emissions testing
- diesel vs gasoline have different requirements

**Test:** For emissions-related notes, is there:
1. `jurisdiction:` frontmatter
2. `regulatory-date:` and `regulatory-valid-until:`?

### Edge Case: Modified Vehicles

**Problem:** Modifications can affect emissions compliance and insurance validity.

**Test:** Is there guidance on when modifications require:
- Emissions re-testing
- Insurance notification
- Registration updates

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Safety Warnings | Brake, airbag, lifting procedures | Use `safety-warning: critical`, include `verification-avoid` for amateur-skip |
| Equipment Dependencies | Specialty tools, tool quality | List tools separately from consumables, specify metric/SAE |
| Context-Gating | Year/make/model, region | Use `context-gate: true` with vehicle scope |
| Experiential | Sound, smell, feel diagnostics | Use `experiential-component: intuition/kinesthetic` with sensory cues |
| Verification | Safety-critical vs routine | Include "professional inspection" recommendation |
| Temporal Knowledge | Recalls, TSBs, model years | Include version/year scope, recommend recall check |
| Assembly | Engine replacement, major repairs | Include dependencies, checkpoints, rollback, mandatory verification |
| Regulatory | Emissions, modifications | Use jurisdiction scope, regulatory dating |

---

## Recommendations for Seed

### 1. Safety-Critical Equipment Category

Add explicit `safety-equipment` subcategory in equipment tagging:
```yaml
safety-equipment:
  mandatory:
    - jack-stands  # Cannot work without
  conditional:
    - gloves  # Recommended but not required
```

### 2. Vehicle Context Format

Standardize automotive context-gating format:
```yaml
context-gate: true
context-type: technical
vehicle-scope:
  year: "2015-2022"
  make: ["Ford", "Chevrolet", "GMC"]
  model: ["Silverado", "Sierra", "Tahoe"]
  engine: ["5.3L", "6.2L"]
```

### 3. Sensory Diagnostics Template

For experiential automotive knowledge:
```yaml
experiential-component: intuition
sensory-cues:
  sound:
    - "Rod knock: rhythmic knock at idle, worse under acceleration"
    - "Wheel bearing: humming noise that changes with speed"
  smell:
    - "Burning oil: indicates valve cover gasket or PCV"
    - "Sweet: coolant leak, likely head gasket"
  feel:
    - "Steering vibration: wheel balance or alignment"
```

### 4. Recall Check Recommendation

For common repair procedures, add frontmatter:
```yaml
recall-check: recommended
recall-source: NHTSA
```

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Source rules being tested
- [[Seed Stress Test - Home Repair Knowledge Base]] — Related construction/assembly domain
- [[Frontier Exploration - Equipment and Tool Dependencies]] — General equipment handling
- [[Frontier Exploration - Context-Gated Knowledge]] — Context-gating rules
- [[Frontier Exploration - Safety-Critical Procedural Knowledge]] — Safety handling
- [[Self-Improvement Cycle]] — How this contributes to Seed improvement
