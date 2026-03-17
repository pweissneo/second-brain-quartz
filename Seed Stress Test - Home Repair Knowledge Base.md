---
last-reviewed: 2026-03-16
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - assembly-knowledge
  - home-repair
  - safety-critical
domain: home-repair-diy
test-type: stress-test
seed-rule: Distinguish assembly/construction knowledge from linear-sequential, iterative, and cyclic-branching knowledge
test-domain: Home Repair / DIY
---

# Seed Stress Test: Assembly Knowledge Rule in Home Repair

> Testing the rule: "Distinguish assembly/construction knowledge from linear-sequential, iterative, and cyclic-branching knowledge — tag with `process-type: assembly` when knowledge involves interdependent steps that must be performed in a dependency order."

## The Domain

Home repair/DIY encompasses:
- **Electrical work**: Wiring, circuit breakers, fixture installation
- **Plumbing**: Pipe fitting, fixture installation, leak repair
- **Structural**: Framing, drywall, flooring
- **Finish work**: Painting, trim, caulking
- **HVAC**: Ventilation, thermostat installation
- **Exterior**: Roofing, siding, deck building

## The Seed Rule Under Test

The current rule says assembly knowledge should be tagged with `process-type: assembly` and includes fields for:
- `dependencies:` - which steps block which
- `parallel-possible:` - what can run concurrently
- `rollback:` - recovery paths
- `checkpoints:` - verification points

## Edge Cases Discovered

### Edge Case 1: Safety-Critical Steps (Priority Override)

**Scenario**: In electrical work, some steps are safety-critical in ways that override normal dependency logic.

**Test**: Installing a circuit breaker
- Step 1: Turn off main power (blocks ALL work)
- Step 2: Verify power is off (MUST happen after Step 1, but also MUST happen even if Step 1 says "done")
- Step 3: Make connections
- Step 4: Turn power back on

**Issue**: The rule's `dependencies:` field captures "what blocks what" but doesn't capture **mandatory verification steps** that must happen regardless of upstream completion.

**Verdict**: Assembly rule needs `mandatory-verification:` field for safety-critical confirmation points that cannot be skipped even if dependencies are satisfied.

---

### Edge Case 2: Permit and Inspection Triggers

**Scenario**: Many home repairs require permits and inspections at specific points.

**Test**: Replacing a water heater
- Step 1: Remove old heater
- Step 2: Install new heater
- Step 3: **INSPECTION REQUIRED** (cannot proceed without)
- Step 4: Turn on water
- Step 5: **INSPECTION REQUIRED** (cannot proceed without)

**Issue**: The assembly rule doesn't capture **external gate dependencies** — points where work must pause for official approval before continuing.

**Verdict**: Assembly rule needs `inspection-trigger:` field documenting when permits/inspections are required.

---

### Edge Case 3: Tool-Specific Knowledge as Prerequisite

**Scenario**: Some steps require specific tools that affect whether the step is even possible.

**Test**: Installing recessed lighting
- Requires: Drywall saw OR rotary tool
- Requires: Wire strippers
- Requires: Voltage tester
- Requires: Ladder (height-dependent)

**Issue**: The rule captures `prerequisites:` as notes but doesn't capture **tool prerequisites** that are domain-specific and may not have corresponding notes.

**Verdict**: Add `tool-requirements:` field to assembly process type. Some tools are mandatory, others have equivalents.

---

### Edge Case 4: Skill Level as Prerequisite

**Scenario**: Some steps require skills beyond just having the right tools.

**Test**: Soldering copper pipes
- Requires: Soldering skill (not just having a torch)
- Requires: Knowledge of proper fitting alignment
- Requires: Understanding of flow direction

**Issue**: The rule captures "what step requires what" but doesn't capture **skill prerequisites** that may be learnable but not documented as notes.

**Verdict**: Add `skill-prerequisites:` field with explicit skill requirements that may not map to vault notes.

---

### Edge Case 5: Seasonal/Weather Dependencies

**Scenario**: Some home repairs can only be done in specific weather conditions.

**Test**: Exterior painting
- Temperature must be above 50°F (10°C)
- Humidity must be below 85%
- No rain forecast for 24 hours
- Direct sunlight may cause issues (for some paints)

**Test**: Roofing
- Cannot be done in rain
- Cannot be done in extreme heat (shingles become pliable)
- Wind limits apply

**Issue**: The assembly rule captures linear dependencies but not **environmental dependencies** that determine whether work can proceed at all.

**Verdict**: Add `environmental-conditions:` field specifying required weather/temperature/humidity ranges.

---

### Edge Case 6: Material Lead Times

**Scenario**: Some steps require materials that must be ordered in advance.

**Test**: Bathroom remodel
- Step 1: Measure space (can do anytime)
- Step 2: Order fixtures (4-6 week lead time for custom orders)
- Step 3: Fixtures arrive (waiting period)
- Step 4: Installation begins

**Issue**: Assembly knowledge typically assumes materials are available. Home repair often has long lead times that affect project timeline but aren't captured in the process.

**Verdict**: Add `material-acquisition:` field for steps that require ordered materials with lead times.

---

### Edge Case 7: Code Compliance Variations

**Scenario**: Electrical and plumbing work must comply with local building codes that vary by jurisdiction.

**Test**: Installing a 240V circuit
- NEC (National Electrical Code) specifies minimum requirements
- Local amendments may add requirements
- Some areas require licensed electrician; others allow DIY

**Issue**: The rule's jurisdiction tagging (from other Seed rules) doesn't integrate with assembly flow — code requirements may add extra steps not present in generic tutorials.

**Verdict**: Assembly processes in regulated trades need `code-requirements:` field pointing to jurisdiction-specific notes.

---

### Edge Case 8: Destructive vs. Non-Destructive Sequencing

**Scenario**: Some steps are irreversible (destructive) and must be scheduled carefully.

**Test**: Removing drywall
- Once cut, cannot be "un-cut"
- Must verify what's behind wall FIRST

**Test**: Cutting pipes
- Cannot un-cut
- Must verify length TWICE before cutting

**Issue**: The `rollback:` field captures undo capability but doesn't distinguish **inherently irreversible steps** that require extra verification.

**Verdict**: Add `irreversible:` flag to steps that cannot be undone, requiring heightened verification.

---

### Edge Case 9: Multi-Trade Coordination

**Scenario**: Many home projects involve multiple trades that must be sequenced correctly.

**Test**: Kitchen remodel
- Plumbing must be done before flooring (can't drill through finished floor)
- Electrical must be done before drywall
- HVAC must be coordinated with insulation
- Plumbing must be pressure-tested before walls close

**Issue**: The assembly rule assumes a single process, but home repair often involves **interdependent processes from different trades** that must be coordinated.

**Verdict**: Add `trade-coordination:` field for multi-trade projects, specifying which trade must complete before another can start.

---

### Edge Case 10: Permit Exemptions

**Scenario**: Some work doesn't require permits but still requires following codes.

**Test**: Replacing a light fixture (no permit in most jurisdictions)
- Still must follow electrical code
- Still must be done safely
- Still may affect home insurance

**Issue**: The inspection-trigger field assumes permits are required, but many DIY tasks have **permit exemptions with code compliance still required**.

**Verdict**: Add `code-compliance:` field even when `inspection-trigger:` is not required — distinguish "no inspection needed" from "no code applies."

---

## Summary of Required Extensions

The current assembly process type is a good start but needs these extensions for home repair:

```yaml
process-type: assembly
extensions:
  mandatory-verification:
    - step: 2
      check: "Verify power is off"
      safety-critical: true
  inspection-trigger:
    - after-step: 3
      type: electrical
      jurisdiction: [US, CA]
  tool-requirements:
    mandatory:
      - voltage-tester
    optional:
      - fish-tape
      - wire-stripper
  skill-prerequisites:
    - basic-electrical-safety
    - wire-stripping
  environmental-conditions:
    temperature: "50-90°F"
    humidity: "<85%"
    precipitation: "none expected 24h"
  material-acquisition:
    - step: 2
      lead-time: "2-4 weeks"
      item: "custom-cabinet"
  code-requirements:
    - NEC 2023
    - local-amendments
  irreversible-steps:
    - step: 4
      warning: "Cannot be undone - verify twice"
  trade-coordination:
    - after: plumbing
      before: flooring
```

## Test Evaluation

**Rule**: Distinguish assembly/construction knowledge from linear-sequential, iterative, and cyclic-branching knowledge

**Domain**: Home Repair / DIY

**Result**: ⚠️ Rule VALID but INCOMPLETE

The rule correctly identifies assembly as a distinct process type. However, home repair reveals additional dimensions:

1. **Safety-critical verification** - Some steps require mandatory checks regardless of dependency completion
2. **External gate dependencies** - Permits and inspections create external pause points
3. **Tool prerequisites** - Domain-specific tools may not map to vault notes
4. **Skill prerequisites** - Skills may not be documented but are still required
5. **Environmental conditions** - Weather/temperature affects whether work can proceed
6. **Material lead times** - Ordered materials create wait dependencies
7. **Code compliance** - Jurisdiction-specific requirements add steps
8. **Irreversible steps** - Some actions cannot be undone
9. **Multi-trade coordination** - Different trades must be sequenced

## Recommendations for Seed Update

Add these fields to the assembly process type:

1. `mandatory-verification:` - Safety-critical confirmation points
2. `inspection-trigger:` - When permits/inspections are required
3. `tool-requirements:` - Domain-specific tools needed
4. `skill-prerequisites:` - Skills needed beyond tools
5. `environmental-conditions:` - Weather/temperature requirements
6. `material-acquisition:` - Steps requiring ordered materials
7. `code-requirements:` - Applicable codes/regulations
8. `irreversible-steps:` - Flag for irreversible actions
9. `trade-coordination:` - Multi-trade sequencing

## Related Notes

- [[Frontier Gap - Assembly and Kit-Based Knowledge]] - Existing assembly exploration
- [[Seed Stress Test - Craft Knowledge Bases]] - Similar domain stress test
- [[Frontier Exploration - Regulatory and Compliance Knowledge]] - Code compliance
