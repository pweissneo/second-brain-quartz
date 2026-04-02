---
last-reviewed: 2026-03-31
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: verified
schema-version: "1.0"
tags:
  - seed-gap
  - methodology
  - gap-analysis
---

# Seed Gap Analysis Methodology

> How to identify, validate, and resolve Seed gaps — a meta-methodology for vault self-improvement.

## The Gap Lifecycle

Seed gaps progress through defined stages:

```
identified → analyzed → proposed → integrated → deprecated
              ↓
         superseded
              ↓
        replaced-by another gap
```

### Stage Definitions

| Stage | Description | Key Questions |
|-------|-------------|---------------|
| **identified** | Gap documented, root cause understood | What is missing? Why does it matter? |
| **analyzed** | Solution approach defined, edge cases mapped | How should the Seed be extended? What test validates closure? |
| **proposed** | Rule written in Rule/Why/Test format | Does the proposal pass stress tests? |
| **integrated** | Rule merged into Seed, gap note archived | Does the new rule work in practice? |
| **deprecated** | Gap no longer relevant | Why was it deprecated? What replaces it? |
| **superseded** | Gap merged into larger gap | What compound problem does the superseder address? |

## Gap Classification

### By Type

- **seed-missing**: The Seed lacks a rule for this situation
- **seed-weak**: A rule exists but is insufficiently specific
- **seed-contradictory**: Two rules conflict in this context
- **seed-incomplete**: Rule exists but lacks edge cases

### By Severity

- **blocking**: Prevents vault from functioning (e.g., no completion criteria)
- **useful**: Improves vault quality but not critical
- **nice-to-have**: Enhancement that adds polish

### By Source

- **frontier-exploration**: Identified during gap hypothesis work
- **stress-test**: Found when testing rules against domains
- **compliance-audit**: Found when checking rule adherence
- **redundancy-scan**: Found during duplicate detection

## Gap-to-Seed Pathway

When a gap matures to resolution:

### Step 1: Validate the Gap
- Confirm the gap actually exists (not already addressed)
- Check for redundancy with existing Seed Gaps
- Identify intersecting gaps (compound patterns)

### Step 2: Develop Solution
- Write proposed rule in Rule/Why/Test format
- Identify edge cases where rule might fail
- Draft implementation guidance

### Step 3: Stress Test
- Apply to 3+ different domains
- Check for unintended side effects on existing rules
- Verify test is executable by AI

### Step 4: Integrate
- Merge rule into appropriate Seed section
- Update gap note with resolution
- Update related Seed Gaps if affected

## Compound Gap Detection

When two or more gaps intersect, they may form a **compound gap** that neither addresses alone.

### Identifying Compound Gaps

Look for:
- Gaps with intersecting `intersects-with:` fields
- Gaps that reference each other in `analysis-notes`
- Domains where multiple Seed rules fail simultaneously

### Example: Technology-Heavy Dual-Nature

- **Gap A**: Domain-Velocity Confidence Decay
- **Gap B**: Dual-Nature Domain Handling

In tech-heavy creative domains (photography, audio), both gaps apply simultaneously. Neither alone addresses:
- Technical elements decay faster than aesthetic elements
- Hybrid notes need compound confidence tracking

The compound solution requires both underlying gaps to mature first.

## Redundancy Detection

Before creating new gaps, check for:

1. **Direct redundancy**: Identical problem already has a gap
2. **Superset redundancy**: New gap is covered by existing gap
3. **Subset redundancy**: New gap is a special case of existing gap
4. **Resolution redundancy**: Already resolved in Seed

### Redundancy Check Process

```bash
# Find gaps with similar keywords
grep -l "keyword" Seed\ Gap\ -*.md

# Check lifecycle status
grep "gap-status:" Seed\ Gap\ -*.md | sort | uniq -c

# Find superseded gaps
grep -l "superseded" Seed\ Gap\ -*.md
```

## Gap Quality Criteria

A good Seed Gap note includes:

- [ ] Clear problem statement (what's missing)
- [ ] Why it matters (consequence of gap)
- [ ] Current Seed coverage (what exists)
- [ ] Proposed solution (Rule/Why/Test)
- [ ] Test for closure (how we know gap is closed)
- [ ] Edge cases and limitations
- [ ] Related gaps and dependencies

### Anti-Quality Indicators

- Vague problem statement ("The Seed could be better")
- No actionable test ("Improve quality somehow")
- Missing edge cases
- No consideration of unintended effects
- Duplicate content from existing Seed

## Gap Resolution Patterns

### Pattern 1: Direct Integration
Gap directly becomes Seed rule with minimal adaptation.

### Pattern 2: Merge with Existing
Gap overlaps with existing rule — merge into existing, deprecate gap.

### Pattern 3: Supersede
Gap is subsumed by larger compound gap — mark superseded, point to superseder.

### Pattern 4: Deprecate
Gap was wrong premise or no longer relevant — mark deprecated with reason.

### Pattern 5: Promoted to Frontier
Gap is valid but not Seed-appropriate — move to Frontier Exploration.

## Example: Gap Lifecycle in Practice

### Identified (2026-03-26)
```
gap-status: identified
gap-priority: medium
gap-type: seed-missing
```

### Analyzed (2026-03-27)
```
gap-status: analyzed
analysis-notes: "Root cause identified as missing rule. Proposed approach defined."
```

### Proposed (2026-03-28)
```
gap-status: proposed
proposed-rule: |
  Rule: [rule text]
  Why: [why it matters]
  Test: [executable test]
```

### Integrated (2026-03-30)
```
gap-status: integrated
resolved: 2026-03-30
resolved-by: [[Seed Refinement - New Rule Name]]
```

### Deprecated Example (2026-03-29)
```
lifecycle: deprecated
gap-status: deprecated
deprecated-date: 2026-03-29
deprecated-reason: "Redundant with [[Seed Gap - Existing Gap]]"
```

## Related Notes

- [[Seed Development Hub]] — Central hub for Seed improvements
- [[Seed Gap - Seed Gap Note Lifecycle Management]] — Gap-specific lifecycle
- [[Seed Gap - Seed Rule Lifecycle Management]] — Seed rule evolution
- [[AI-Assisted Knowledge Management Seed]] — The Seed itself
- [[Frontier Exploration Hub]] — Where unripe gaps go

---

*Methodology note created during REDUNDANCY_SCAN heartbeat (2026-03-31)*