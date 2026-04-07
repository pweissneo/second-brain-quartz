---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
confidence: emerging
author-type: ai-assisted
lifecycle: seed-extension
verification-status: unverified
tags:
  - frontier-exploration
  - context
  - compound-knowledge
---

# Frontier Exploration: Compound Context Knowledge

> Knowledge that depends on multiple interdependent conditions being true simultaneously — distinct from single-condition or context-gated knowledge.

## The Gap

The Seed covers:
- **Context-gated knowledge** — knowledge that applies in specific contexts (e.g., only for beginners, only for US users)
- **Conditional knowledge** — knowledge with explicit if-then structure
- **Infrastructure-dependent knowledge** — knowledge that depends on specific hardware/software setups

But it lacks guidance on **compound context knowledge** — knowledge where multiple conditions must ALL be true simultaneously for the knowledge to be applicable. The failure mode is different: if ANY condition fails, the knowledge is inapplicable, not just "less applicable."

## Examples of Compound Context Knowledge

### Software Configuration
> "Use `npm install --legacy-peer-deps` to resolve dependency conflicts"
- **Compound because**: Depends on: (1) using npm, (2) having peer dependency issues, (3) the project using React 17-, (4) specific package versions
- **Failure mode**: If you use yarn, or have different dependency issues, or use React 18+, this advice is wrong

### Financial Advice
> "Roth conversions are beneficial in retirement"
- **Compound because**: Depends on: (1) current tax bracket, (2) expected future tax bracket, (3) having traditional IRA balances, (4) retirement timeline, (5) state tax considerations
- **Failure mode**: Any single condition being different can reverse the recommendation

### Physical Skills
> "Use a neutral wrist position when typing"
- **Compound because**: Depends on: (1) keyboard layout, (2) desk height, (3) chair height, (4) individual anatomy, (5) typing style
- **Failure mode**: What helps some people causes problems for others

### Medical/Health
> "Take medication with food to reduce stomach upset"
- **Compound because**: Depends on: (1) specific medication, (2) food type, (3) timing, (4) individual sensitivity, (5) other medications
- **Failure mode**: Some medications MUST be taken on empty stomach; food interactions vary

### Home Maintenance
> "Change HVAC filters every 3 months"
- **Compound because**: Depends on: (1) filter type, (2) home square footage, (3) number of occupants, (4) pets, (5) air quality, (6) HVAC usage patterns
- **Failure mode**: Heavily-used homes with pets may need monthly changes; rarely-used homes may need only twice yearly

## Why It Matters

Compound context knowledge has unique failure modes:

1. **Silent failure**: The advice is technically "correct" but inapplicable because one condition is missed
2. **False confidence**: Users assume the advice applies when most conditions are met, missing the one that isn't
3. **Verification complexity**: Unlike single-condition knowledge, verifying compound knowledge requires checking ALL conditions, not just the primary one
4. **Interaction effects**: Conditions may interact in non-obvious ways (A is fine, B is fine, but A+B is problematic)

## Current Seed Coverage Analysis

The Seed covers:
- `context-gated:` for single-context applicability
- `prerequisites:` for learning prerequisites
- `infrastructure-scope:` for infrastructure dependencies
- `applicability-scope:` for universal vs. specific knowledge

What's missing:
- Explicit documentation of MULTIPLE interdependent conditions
- Verification guidance for compound contexts (all conditions must be verified)
- Compound failure mode handling (what happens when ANY condition fails)
- Compound context retrieval (searching for "when does X apply" needs all conditions checked)

## Seed Rule Proposal

**Rule:** For knowledge that depends on multiple conditions being true simultaneously, explicitly document each condition with `compound-conditions:` frontmatter listing all dependencies and verify applicability by checking ALL conditions, not just the primary one.

**Why:** Compound context knowledge fails silently when any single condition is missed. Unlike single-condition knowledge (where the main factor determines applicability), compound knowledge requires ALL conditions to be verified. Without explicit compound documentation, AI agents and users cannot assess whether the knowledge actually applies to their situation.

**Test:** Pick 10 notes with contextual claims (advice, recommendations, procedures). For each: (1) Can you identify all conditions that must be true for this to apply? (2) Does the note explicitly list these conditions? (3) Would missing any single condition make the advice inapplicable or incorrect? (4) Does the note warn about compound failure modes?

**Implementation:**
```yaml
compound-conditions: true
conditions:
  - condition: "Using npm as package manager"
    category: tool
    required: true
  - condition: "React version 17 or below"
    category: framework
    required: true
  - condition: "Peer dependency conflicts present"
    category: problem-type
    required: true
    verification: "Check package-lock.json for conflicts"
compound-failure-mode: any  # any|all|interaction
compound-warning: "If using yarn orpnpm, this advice does not apply"
```

**Compound failure modes:**
- `any`: Knowledge fails if ANY condition is false (most common)
- `all`: Knowledge only applies when ALL conditions are met AND they interact synergistically
- `interaction`: Specific combination matters, not just individual conditions

## Verification Guidance for Compound Knowledge

Single-condition verification: Check the main condition → knowledge applies or doesn't

Compound verification requires:
1. **Condition inventory**: List ALL conditions the knowledge depends on
2. **Condition verification**: Verify EACH condition is true in your context
3. **Failure mapping**: Document what happens when each condition fails
4. **Applicability confidence**: Calculate as product of confidence in each condition (if 3 conditions at 80% confidence each → 0.8 × 0.8 × 0.8 = 51% compound confidence)

## Edge Cases

- **Unknown conditions**: If you're unsure what conditions matter, flag with `conditions: partially-known` and prioritize testing to discover missing conditions
- **Condition interactions**: Some compound knowledge has interaction effects where A+B ≠ A + B. Document known interactions explicitly
- **Condition evolution**: Conditions change over time (software updates, personal circumstances). Include `condition-valid-until:` for time-sensitive conditions

## Relationship to Existing Seed Rules

- Complements [[Frontier Exploration - Context-Gated Knowledge]] — compound context is multi-condition context-gated
- Complements [[Frontier Exploration - Infrastructure-Dependent Knowledge]] — infrastructure is one category of compound conditions
- Complements [[Frontier Exploration - Threshold Knowledge]] — thresholds can be compound conditions
- Complements the Seed's applicability rules — compound applicability requires stricter scope documentation
- See [[Types of Applicability Boundaries]] for related applicability scope topics

## Test Questions

1. For advice that "usually works," what conditions make it not work?
2. Can you name 5 pieces of advice you've given that depend on multiple conditions?
3. When has compound context failure caused you to follow advice that didn't work?
4. How would an AI agent verify compound context knowledge without explicit condition listing?

## Notes to Link

- [[Frontier Exploration - Context-Gated Knowledge]]
- [[Frontier Exploration - Infrastructure-Dependent Knowledge]] 
- [[Frontier Exploration - Threshold Knowledge]]
- [[Types of Applicability Boundaries]]
