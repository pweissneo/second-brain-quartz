---
last-reviewed: 2026-04-02
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - seed-development
  - architecture
---

# Frontier Exploration: Seed Architecture Decision Framework

> When to create new Seed rules vs. modify existing ones vs. deprecate rules — the meta-level decisions for Seed evolution.

## The Problem

The Seed has grown to 400+ lines of rules covering:
- Foundation and bootstrap
- Knowledge capture and prioritization
- Verification and confidence
- Domain-specific adaptations
- Maintenance and evolution

But the Seed LACKS guidance on:
- **When to create a NEW rule** vs. extend an EXISTING rule
- **When to modify a rule** vs. add edge cases
- **When to deprecate a rule** vs. refine it
- **How to organize the Seed** as it grows (current structure emerged organically)

## Why This Matters

Without explicit architecture guidance:
1. Rules accumulate without organization principle
2. Contradictions emerge between rules that should be unified
3. Similar rules exist in different sections (verification rules scattered throughout)
4. Seed becomes harder to navigate and maintain
5. No criteria for when "enough is enough" on a rule section

## Gap Analysis: Current Seed Structure

Current Seed organization:
- Section 1: Foundation (bootstrap, conventions)
- Section 2: Knowledge Capture (priorities, diminishing returns)
- Section 3: Verification (multiple modes, conflict resolution)
- Section 4: Domain Adaptations (stress tests, edge cases)
- Section 5: Maintenance (version control, correction)
- Section 6: Multi-domain (portfolios, problem hubs)

This emerged organically. Is it the right structure?

## Proposed Seed Architecture Principles

### When to CREATE a New Rule

**Create new rule if:**
- It addresses a NEW category of knowledge management (not covered by existing categories)
- It applies to a DIFFERENT phase of knowledge lifecycle (capture ≠ verification ≠ maintenance)
- The existing rules can't be reasonably extended to cover this case
- It's general enough to apply across 3+ domains

**Extend existing rule if:**
- Same knowledge management category
- Similar lifecycle phase
- Edge case of an existing principle
- Can be expressed as "Rule X, plus..."

### When to MODIFY a Rule

**Modify (not just add edge case) if:**
- The core principle was wrong or incomplete
- New evidence shows the rule fails in important cases
- The rule creates unintended consequences
- The test is not executable

**Add edge cases if:**
- The core principle is sound
- The failure is due to missing boundary conditions
- Existing rule structure is preserved

### When to DEPRECATE a Rule

**Deprecate if:**
- Rule is redundant with another rule (merge into the stronger rule)
- Rule was replaced by a more general principle
- Domain context changed making the rule obsolete
- Rule fails its own test in multiple domains

**Keep and refine if:**
- Core principle is sound but implementation needs work
- Edge cases can be added without breaking existing ones
- The rule serves a distinct purpose

### Seed Organization Criteria

**Current sections by lifecycle phase:**
1. Foundation = pre-capture
2. Capture = during capture
3. Verification = post-capture validation
4. Domain = specific applications
5. Maintenance = ongoing management

**Proposed test:** Can every rule be assigned to one lifecycle phase? If not, the organization may need revision.

## Proposed Rule Metadata

```yaml
seed-rule-type: foundation|capture|verification|maintenance|meta
seed-rule-status: active|deprecated|merged
seed-rule-origin: original|stress-test|gap-analysis
seed-rule-dependencies: [[Related Rule]]
```

## Test Cases

### Case 1: New Verification Mode
Adding "drill-verified" verification mode (2026-03-27).

**Current approach:** Created new rule line 350+
**Alternative approach:** Extended existing verification-mode rule
**Which is correct?**

Analysis:
- Drill-verified is a NEW verification mode → new rule justified
- But should it be in verification section or separate?
- Test: Does it share的核心 verification logic (status tracking, confidence)? Yes → Same section appropriate.

### Case 2: Domain-Specific Stress Tests
70+ stress test notes testing Seed rules in different domains.

**Current approach:** Each domain gets its own note
**Alternative approach:** One consolidated note with table
**Which is correct?**

Analysis:
- Domain differences ARE important (cooking ≠ programming)
- But consolidation would reduce discoverability
- Test: Can someone find relevant stress test for their domain? Yes → Current structure works.

### Case 3: Verification Conflict Resolution
Complex rule (2026-03-31) covering conflicting verification results.

**Current approach:** Single long rule with embedded resolution protocol
**Alternative approach:** Multiple smaller rules
**Which is correct?**

Analysis:
- The rule is complex but coherent (one protocol)
- Splitting would lose context
- Test: Can you apply the rule without cross-referencing? Yes → Single rule appropriate.

## Proposed Organization Refinements

### Section Reorganization

1. Collapse scattered verification rules into unified "Verification" section
2. Group domain stress tests under "Domain Adaptations" section
3. Add "Seed Meta" section for architecture rules (this gap!)
4. Use consistent metadata across all rules

### Metadata Requirements

```yaml
# For every Seed rule:
rule-type: foundation|capture|verification|maintenance|meta
rule-status: active
rule-added: YYYY-MM-DD  # when rule was added
rule-test: executable-test  # yes/no check
```

### Seed Navigation Aid

```
Seed/
├── Foundation/        # Rules for starting new vaults
├── Capture/          # Rules for adding knowledge  
├── Verification/     # Rules for validation
├── Maintenance/     # Rules for ongoing management
├── Domain/          # Domain-specific applications
└── Meta/           # Rules about the Seed itself
```

## Interaction with Existing Rules

The following existing Seed rules would be affected:
- Rule lifecycle management (NEW - this gap)
- Gap-to-Seed pathway (gap notes → rules)
- Seed stress tests (rule validation)

## Questions This Raises

1. Should Seed have explicit size/complexity limits?
2. How do you prevent Seed from becoming its own knowledge base?
3. At what point does organizing Seed become more important than adding to it?
4. Should Seed rules have their own verification status?

## Test: Seed Architecture Decision

For any proposed Seed change:
1. **Category test:** Does this fit existing categories? → Extend
2. **Lifecycle test:** Is this a different phase? → New section
3. **Scope test:** Does it apply to 3+ domains? → Core rule
4. **Dependency test:** Does it depend on other rules? → Consider integration

If 3+ answers suggest different approaches → Escalate to architecture decision.

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core Seed file
- [[Seed Development Hub]] — Current gap tracking
- [[Seed Gap - Seed Rule Lifecycle Management]] — Related gap
- [[Seed Gap - Seed Gap Note Lifecycle Management]] — Gap lifecycle