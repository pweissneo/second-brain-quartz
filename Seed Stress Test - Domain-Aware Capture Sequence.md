---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - capture-sequence
  - bootstrap
---
# Seed Stress Test - Domain-Aware Capture Sequence Rule

## The Stress Test

Applied the domain-aware capture sequence rule (added 2026-04-06) to **pottery** domain (completely unfamiliar).

**Rule being tested:**
> Apply domain-aware capture sequence during bootstrap — capture in order: (1) Safety-critical knowledge, (2) Core principles and essential techniques, (3) Materials and tools, (4) Standard procedures, (5) Advanced applications.

**Test questions from the Seed:**
1. Can you identify the first 5 concepts to capture in the correct phase order?
2. Does safety-critical knowledge come before applications?
3. Can you explain WHY that sequence?
4. When do you switch from "building foundations" to "filling gaps"?
5. Is the 50/30/20 bootstrap allocation applied?

## What Happened

**Test questions 1-3 failed — AI cannot execute without domain expertise:**

- Q1: "Can you identify the first 5 concepts to capture" — Assumes AI knows pottery fundamentals. I guessed (silvafety, centering, wheel throwing, clay types, firing) but had zero verification this is correct.
- Q2: "Does safety-critical knowledge come before applications" — I assumed silica dust safety is critical, but is that actually the FIRST safety thing in pottery? Maybe kiln safety? Eye hazards from spinning wheels?
- Q3: "Can you explain WHY that sequence" — I provided justification but it's circular: "safety first because rule says safety first."

**Test questions 4-5 not applicable:**

- "When to switch foundations→applications" — No indicator for WHEN. The frontier note says "when you can answer X" but that's post-hoc, not predictive.
- "Is 50/30/20 applied?" — No metadata tracking this allocation. 

## Root Cause

**Test is not executable by AI in unfamiliar domains:**

The test assumes AI can identify foundational concepts in any domain. But identifying foundations requires either:
- Existing domain knowledge (not available for unfamiliar domains)
- Domain expert consultation (the rule doesn't provide this)
- Prior vault in that domain to analyze (bootstrap = empty vault)

**No implementation tracking in frontmatter:**

Unlike `vault-mode: exploration|exploitation` which can be tracked programmatically:
```yaml
vault-mode: exploration
exploration-ratio: 0.7
```

There's no equivalent for capture sequence:
```yaml
# What would go here?
bootstrap-phase: foundation|application|transitioning
capture-sequence-phase: 1|2|3|4|5|complete
foundation-coverage: 0.5  # What's "50% foundations"?
```

**No transition criteria:**

The frontier note says "switch when you can answer 'what is X?'" — but this is a post-hoc check, not a trigger. There's no explicit moment that says "now."

## Gap Identified

The domain-aware capture sequence rule is conceptually sound but:
1. **Test is not AI-executable** for unfamiliar domains (requires domain knowledge to identify foundations)
2. **No metadata tracking** for capture sequence phase or foundation vs. application ratio
3. **No explicit transition trigger** — relies on post-hoc judgment

## Proposed Refinement

### Option 1: Remove AI unverifiable from Test

Simplify Test to what AI CAN verify:
- Is there a documented capture sequence in frontmatter or note?
- Does sequence include "safety" or "critical" in phase 1?
- Is there explicit phase transition documented?

### Option 2: Add implementation tracking

Add frontmatter fields:
```yaml
bootstrap-capture-phase: foundations|applications|transitioning
foundations-documented: true
safety-captured-first: true  # vs. don't know
foundation-count: 5
application-count: 3
```

### Option 3: Provide domain-agnostic foundation identification heuristics

How to identify foundations in ANY unfamiliar domain:
- Search for "getting started" / "beginner" / "first steps"
- Find safety warnings in domain literature
- Look for prerequisite chains
- Find what experts list as "must know first"

## Recommendation

Option 1 + partial Option 2 — make test executable by checking for explicit documentation rather than requiring AI to know domain fundamentals.

---
**Related:**
- [[AI-Assisted Knowledge Management Seed.md]] — Original rule
- [[Frontier Exploration - Capture Priority Sequence for Unfamiliar Domains]] — Frontier note
- [[Seed Refinement - Bootstrap Phase Tracking]] — Future refinement