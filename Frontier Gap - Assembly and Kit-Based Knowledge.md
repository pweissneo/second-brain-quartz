---
last-reviewed: 2026-03-16
last-updated: 2026-03-29
confidence: emerging
level: frontier
lifecycle: seed-gap
author-type: ai-assisted
tags:
  - frontier-gap
  - assembly
  - process-type
  - knowledge-structure
verification-status: unverified
schema-version: "1.0"
---

# Frontier Gap: Assembly and Kit-Based Knowledge

> Knowledge about building, assembling, or constructing things from parts has unique characteristics that current Seed rules don't explicitly address.

## The Problem

Assembly knowledge differs fundamentally from other knowledge types:

- **Interdependent steps**: Step B might require output from Step A, but Step C might be independent
- **Parallelizable work**: Some tasks can happen simultaneously, others must be sequential
- **Blocking relationships**: You can't install motherboard before case is open
- **Recovery paths**: If Step 5 fails, what steps need to be undone?
- **Verification at checkpoints**: How do you know you've done it right so far?

Current Seed rules cover:
- Procedural knowledge (linear sequences)
- Iterative knowledge (loops with evaluation)
- Temporal knowledge (time-dependent)

But assembly/kit knowledge is **networked procedural** - a directed graph of dependencies, not a linear sequence.

## Examples

- **PC building**: Motherboard install depends on case prep; CPU cooler depends on CPU; RAM can be installed anytime after motherboard but before closing case
- **IKEA furniture**: Some holes align only after multiple parts are loosely connected
- **Home renovation**: Electrical depends on framing; drywall depends on electrical; painting depends on drywall - but subfloor might be parallel
- **3D printing**: Leveling bed depends on assembly; first layer depends on leveling; supports depend on model geometry

## Why This Matters for Knowledge Bases

When capturing "how to build X":

1. **Linear procedures fail** - "Step 1, then Step 2" misses dependencies
2. **Troubleshooting becomes complex** - "It doesn't work" could be any previous step
3. **Partial progress is valuable** - Being 50% done is meaningful state
4. **Rollback matters** - Knowing what to undo when something fails

## Proposed Rules

### Rule: For assembly/construction knowledge, model as dependency graphs, not sequences

**Test:** Can you identify which steps block which? Can you reorder steps and still achieve the goal?

**Implementation:**
```yaml
process-type: assembly
dependencies:
  - step: 3
    requires: [1, 2]
  - step: 4
    requires: [3]
  - step: 5
    requires: [3]
    parallel: [4]  # Can run concurrently
checkpoints:
  - after: 3
    verify: "Case motherboard standoff installed"
rollback:
  - from: 5
    undo: [5, 4]
  - from: 4
    undo: [4]
```

### Rule: Tag assembly knowledge with completion indicators

**Why:** Unlike linear procedures where you're either done or not, assembly has meaningful intermediate states.

**Test:** Can you state what "50% complete" means for this build?

### Rule: Capture recovery paths for assembly failures

**Why:** When assembly fails, users need to know what to undo and in what order.

**Test:** For each major step, can you describe: (1) What if this fails? (2) What must be undone? (3) What can be reused?

## Test Case: Building a PC

Linear procedure:
1. Install CPU
2. Install RAM
3. Install CPU cooler
4. Install motherboard in case
5. Install power supply
6. Install GPU
7. Connect cables

Actual dependency graph:
- CPU → (cooler, motherboard)
- RAM → (motherboard) [parallel with cooler]
- Motherboard → (case)
- GPU → (motherboard)
- PSU → (case, motherboard, GPU) [all dependencies]

If GPU fails after install: undo GPU, try again. If motherboard standoffs wrong: undo everything back to case prep.

## Related Notes

- [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]]
- [[Frontier Exploration - Iterative Creative Knowledge]]
- [[Note Types and Templates]]
- [[Atomic Note Principle]]

## Questions for Seed Update

1. Should "process-type: assembly" be a new category alongside "procedural" and "iterative"?
2. How to handle "partially complete" state in knowledge activation?
3. Should rollback paths be mandatory for safety-critical assembly?
