---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
tags:
  - frontier-exploration
  - physics
  - scientific-knowledge
schema-version: "1.0"
---

# Frontier Exploration: Physics Knowledge Base Gaps

> Identified gap: The Seed has been stress-tested on chemistry, mathematics, and engineering domains, but not on pure physics knowledge bases. Applying current rules reveals gaps specific to physics knowledge organization.

## Why Physics Is Different

Physics knowledge has characteristics that stress test the Seed in unique ways:

1. **Theoretical hierarchy** - Physics builds from fundamental theories (classical mechanics → quantum mechanics → quantum field theory). Notes must reflect this dependency structure.

2. **Mathematical formalism** - Physics knowledge is inseparable from its mathematical formulation. Notes about "the wave equation" are notes about both the physical phenomenon AND the partial differential equation.

3. **Experimental vs theoretical** - Physics distinguishes between experimentally verified theories, theoretical models awaiting confirmation, and speculative frameworks. Verification differs from empirical domains.

4. **Unit and constant dependencies** - Physics relies on defined constants (speed of light, Planck's constant, gravitational constant). Knowledge often requires specific unit conventions.

5. **Simulation and computation** - Modern physics increasingly depends on computational simulation. Notes about simulation methods have different verification needs than experimental notes.

## Where the Seed Would Get Stuck

### Gap 1: Mathematical Notation as Primary Content

**Scenario:** Building a note about "Schrödinger equation"
- Current Seed atomicity rule: Split into smallest reusable components
- Problem: Splitting the equation from its physics interpretation destroys meaning
- The equation IS the knowledge, not an attribute of it

**Test for Seed:** Does the Seed address when mathematical notation itself IS the note content rather than a supporting element?

### Gap 2: Theory Hierarchy Organization

**Scenario:** Organizing notes about classical mechanics → Lagrangian mechanics → quantum mechanics
- Current Seed: No explicit theory hierarchy handling
- Problem: Notes have different "foundationality" - some concepts depend on others
- No rule for organizing by theoretical prerequisite depth

**Test for Seed:** Is there guidance for organizing notes by theoretical dependency depth (foundational theory vs derived result)?

### Gap 3: Experimental Verification Differentiation

**Scenario:** Note about "Higgs boson detection" vs "string theory"
- Current Seed: Verification mode (empirical/social/computational)
- Problem: Both are physics but verification is fundamentally different - one is confirmed experimental result, one is unconfirmed theoretical framework
- No rule for theory-status tracking (hypothetical/proposed/confirmed)

**Test for Seed:** Does the Seed handle knowledge where verification status ranges from "confirmed" to "speculative" as intrinsic to the knowledge itself?

### Gap 4: Unit System Dependencies

**Scenario:** Note about "gravitational constant G"
- Current Seed: No unit system handling
- Problem: G has different values in different unit systems (SI vs CGS)
- Knowledge about constants must specify unit system

**Test for Seed:** Is there guidance for knowledge that is unit-system-dependent?

### Gap 5: Computational Physics

**Scenario:** Note about "finite element analysis for fluid dynamics"
- Current Seed: No computational verification handling
- Problem: This knowledge is about using computation to derive results - verification is code correctness + physical plausibility
- Different from both experimental and pure theoretical knowledge

**Test for Seed:** Is there guidance for knowledge that is fundamentally computational in nature (simulation, numerical methods)?

## Proposed Seed Rules

### Rule: Tag mathematical formalism level

**Why:** Physics knowledge spans from conceptual understanding to pure mathematical formalism. Organization should reflect this.

**Test:** Can you categorize notes by their mathematical intensity (conceptual/equations/formal-derivation)?

**Implementation:**
```yaml
formalism-level: conceptual|equations|derivation
math-heavy: true|false
```

### Rule: Track theoretical dependency depth

**Why:** Physics theories build on each other. Notes should reflect how "fundamental" they are.

**Test:** Can you identify which notes are foundational vs derived from other theories?

**Implementation:**
```yaml
theory-depth: foundational|intermediate|applied
prerequisite-theories: [[Classical Mechanics]], [[Linear Algebra]]
```

### Rule: Add theory status markers

**Why:** Physics knowledge ranges from experimentally confirmed to mathematically speculative. This status is intrinsic to the knowledge.

**Test:** Do notes about theoretical physics specify their verification status?

**Implementation:**
```yaml
theory-status: confirmed|experimental|proposed|hypothetical-speculative
experimental-basis: direct-indirect|inferred|none
```

### Rule: Specify unit system for constants and derived quantities

**Why:** Physics constants and derived quantities depend on unit conventions.

**Test:** Do notes about physical constants specify their unit system?

**Implementation:**
```yaml
unit-system: SI|CGS|Planck|natural
```

### Rule: Distinguish computational from analytical knowledge

**Why:** Computational physics knowledge requires different verification (code validation + results plausibility) vs analytical knowledge.

**Test:** Can you identify notes about computational methods vs analytical derivations?

**Implementation:**
```yaml
knowledge-type: analytical|computational|experimental|theoretical
verification-type: mathematical|code-validation|experimental|peer-review
```

## Comparison with Existing Stress Tests

| Domain | Gap Type | Current Coverage |
|--------|----------|------------------|
| Chemistry | Mathematical formalism | Partial (see Chemistry Domain Extensions) |
| Mathematics | Proof vs computation | Partial (see Stub Notes Rule) |
| Engineering | Applied physics | Partial (see Equipment Dependencies) |
| Physics | Pure theoretical | NOT COVERED |

## See Also

- [[Seed Stress Test - Chemistry Knowledge Base]] - Closest existing coverage
- [[Seed Stress Test - Mathematics Knowledge Base]] - Mathematical notation handling
- [[Frontier Exploration - Scientific Knowledge Organization]] - (hypothetical - needs creation)
- [[AI-Assisted Knowledge Management Seed]] - Foundation rules

## Test for Seed Integration

A physics knowledge base using only current Seed rules would struggle with:
1. Mathematical notation atomicity (when IS the notation the knowledge?)
2. Theory hierarchy (foundational vs derived)
3. Theory status tracking (confirmed vs speculative)
4. Unit system conventions
5. Computational vs analytical knowledge distinction

If these issues are not addressed, an AI building a physics vault would make arbitrary organizational choices that misrepresent the theoretical structure of physics knowledge.

- [[_root]]