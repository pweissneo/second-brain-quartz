---
last-reviewed: 2026-03-28
last-updated: 2026-03-28
lifecycle: staging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - process-type
  - assembly
  - home-repair
  - extensions
schema-version: "1.0"
---

# Seed Refinement: Assembly Process Type Extensions for Safety-Critical Domains

> Refining the assembly/construction process type based on stress testing in the home repair domain.

## Context

The Seed currently includes a rule for distinguishing assembly/construction knowledge with the `process-type: assembly` tag and fields for:
- `dependencies:` - which steps block which
- `parallel-possible:` - what can run concurrently
- `rollback:` - recovery paths
- `checkpoints:` - verification points

## Domain Stress Test

Testing this rule against **home repair/DIY** revealed 10 edge cases that the current rule doesn't capture.

## Required Extensions

### 1. Safety-Critical Verification (mandatory-verification)

Some steps require verification that MUST happen regardless of upstream completion.

```yaml
process-type: assembly
mandatory-verification:
  - step: 2
    check: "Verify power is off"
    safety-critical: true
```

**Why:** In electrical work, even if you "completed" turning off power, you must independently verify it before proceeding.

### 2. Inspection Triggers (inspection-trigger)

Many domains require permits/inspections at specific points.

```yaml
process-type: assembly
inspection-trigger:
  - after-step: 3
    type: electrical
    jurisdiction: [US, CA]
```

**Why:** Work cannot proceed without external approval at specific points.

### 3. Tool Requirements (tool-requirements)

Some steps require specific tools that affect whether the step is possible.

```yaml
process-type: assembly
tool-requirements:
  mandatory:
    - voltage-tester
  optional:
    - fish-tape
```

**Why:** Domain-specific tools may not map to vault notes and are prerequisites for the task.

### 4. Skill Prerequisites (skill-prerequisites)

Some steps require skills beyond having the right tools.

```yaml
process-type: assembly
skill-prerequisites:
  - basic-electrical-safety
  - wire-stripping
```

**Why:** Skills may not be documented as notes but are still required.

### 5. Environmental Conditions (environmental-conditions)

Some work can only be done in specific weather conditions.

```yaml
process-type: assembly
environmental-conditions:
  temperature: "50-90°F"
  humidity: "<85%"
  precipitation: "none expected 24h"
```

**Why:** Weather/temperature affects whether work can proceed at all.

### 6. Material Acquisition (material-acquisition)

Some steps require materials with lead times.

```yaml
process-type: assembly
material-acquisition:
  - step: 2
    lead-time: "2-4 weeks"
    item: "custom-cabinet"
```

**Why:** Ordered materials create wait dependencies that affect project timeline.

### 7. Code Compliance (code-requirements)

Regulated work must comply with jurisdiction-specific codes.

```yaml
process-type: assembly
code-requirements:
  - NEC 2023
  - local-amendments
```

**Why:** Code requirements may add steps not present in generic tutorials.

### 8. Irreversible Steps (irreversible-steps)

Some actions cannot be undone and require extra verification.

```yaml
process-type: assembly
irreversible-steps:
  - step: 4
    warning: "Cannot be undone - verify twice"
```

**Why:** Destructive actions require heightened verification.

### 9. Multi-Trade Coordination (trade-coordination)

Many projects involve interdependent processes from different trades.

```yaml
process-type: assembly
trade-coordination:
  - after: plumbing
    before: flooring
```

**Why:** Different trades must be sequenced correctly.

### 10. Code Compliance Without Inspection (code-compliance)

Some work has permit exemptions but still requires code compliance.

```yaml
process-type: assembly
code-compliance:
  - electrical-code
# vs inspection-trigger which is empty
```

**Why:** Distinguish "no inspection needed" from "no code applies."

## Updated Assembly Process Type Schema

```yaml
process-type: assembly
# Existing fields
dependencies: ...
parallel-possible: ...
rollback: ...
checkpoints: ...

# New fields
mandatory-verification:
  - step: <number>
    check: <description>
    safety-critical: <boolean>
inspection-trigger:
  - after-step: <number>
    type: <string>
    jurisdiction: <array>
tool-requirements:
  mandatory: <array>
  optional: <array>
skill-prerequisites: <array>
environmental-conditions:
  temperature: <string>
  humidity: <string>
  precipitation: <string>
material-acquisition:
  - step: <number>
    lead-time: <string>
    item: <string>
code-requirements: <array>
irreversible-steps:
  - step: <number>
    warning: <string>
trade-coordination:
  - after: <trade>
    before: <trade>
code-compliance: <array>
```

## Test

**Rule:** Can you apply the assembly process type to safety-critical domains (home repair, manufacturing, construction) and capture all necessary metadata?

**Test:** For an assembly process in a regulated domain:
1. Can you identify safety-critical verification points?
2. Can you document tool requirements?
3. Can you specify skill prerequisites?
4. Can you note environmental constraints?
5. Can you handle irreversible steps?

## Related

- [[Seed Stress Test - Home Repair Knowledge Base.md]] - Source of edge cases
- [[Seed Stress Test - Craft Knowledge Bases]] - Related domain
- [[Frontier Gap - Assembly and Kit-Based Knowledge]] - Assembly exploration
- [[AI-Assisted Knowledge Management Seed]] - Source of original rule