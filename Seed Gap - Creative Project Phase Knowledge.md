---
last-reviewed: 2026-03-28
last-updated: 2026-03-28
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-phase: discovery
gap-type: seed-missing
gap-source: manual
discovered: 2026-03-28
tags:
  - seed-gap
  - creative-projects
  - phase-model
  - iteration-tracking
---

# Seed Gap - Creative Project Phase Knowledge

> Gap: Seed lacks rules for creative project phase knowledge where phases are non-linear, iterations are normal, and outputs are subjective.

**Related:** [[Frontier Exploration - Creative Project Phase Knowledge]], [[AI-Assisted Knowledge Management Seed]]

---

## What Gap This Fills

The Seed covers:
- Construction-phase model for vault maturity (skeleton → flesh → muscle → maturity)
- Sequential-skill domain modifications (language learning, music prerequisites)
- Creative composition as principles + examples

The Seed MISSING:
- **Creative project phase tracking** (non-linear phases, iteration-based)
- **Abandoned direction storage** (normal, not failure)
- **Timeline/deadline knowledge** (external constraints)
- **Project retrospective knowledge** (cross-project learning)
- **Subjective output handling** (judgment calls, not metrics)

---

## Proposed Rule

**Rule:** For creative project knowledge bases (albums, films, novels, games, podcasts), structure notes around project phases and iteration tracking.

**Why:** Creative output differs from procedural or factual knowledge. Phases are non-linear (mixing triggers re-recording), decisions are subjective ("done" is judgment), and abandonment is normal process, not failure. Current Seed rules treat iteration as inefficiency rather than learning. Missing project-phase structure means vaults lose critical creative judgment knowledge.

**Test:** For creative project knowledge base (album/film/book production):
1. Can you identify which iteration a note belongs to?
2. Are phase transition rationales documented?
3. Is abandoned direction stored with learning (not deleted)?
4. Are deadline trade-offs explicit?
5. Is cross-project retrospective captured?

**Implementation:**
```yaml
# On project notes
project-type: album|film|novel|game|podcast|creative-other
project-phase: concept|pre-production|production|post|release|retrospective
belongs-to-iteration: 2
iteration-tracking: explicit

# On abandoned direction notes
abandoned-direction: true
abandonment-rationale: "Why this direction was dropped"
replaced-by: [[Note that replaced this]]

# On phase transitions
phase-transition-rationale: "Why moved to this phase"
deadline-trade-off: "What was deprioritized"
```

---

## Relationship to Existing Seed Rules

- Extends **construction-phase model** for creative output context (not vault maturity)
- Supplements **creative composition** rules with iteration tracking
- Related to **temporal knowledge** but project-specific
- Connects to **note lifecycle** (abandoned ≠ deleted)

---

## Edge Cases to Test

- Solo projects vs. collaborative (who owns tracking?)
- Long-running projects (years between phases)
- Series vs. standalone (iteration vs. sequel)
- Client work with external deadlines
- hobby vs. professional (different tracking needs)