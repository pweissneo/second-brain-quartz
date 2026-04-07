---
last-reviewed: 2026-04-02
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - maintenance-burden
  - volatility
  - domain-extension
gap-status: analyzed
gap-priority: medium
gap-phase: implementation
gap-source: seed-stress-test
discovered: 2026-04-02
analyzed: 2026-04-02
analysis-conclusion: "Well-documented gap with specific proposed rules for seasonal volatility, ingredient availability, and technique variation. Ready for Seed integration."
---

# Seed Gap: Maintenance Burden Rule - Cooking Domain Edge Cases

**Source:** [[Seed Stress Test - Maintenance Burden Rule in Cooking]]

## Identified Gap

The Maintenance Burden Rule (Seed line ~839) needs domain-specific extensions for cooking knowledge. The basic test is executable but misses critical edge cases.

## Proposed Rules

### Rule 1: Seasonal Knowledge Volatility

**Rule:** Add `volatility-type: seasonal` with `active-window:` field for seasonal cooking knowledge.

**Why:** Seasonal knowledge (pumpkin recipes in March) appears "stale" but has option value for future use. The 30-day staleness test gives false positives.

**Test:** Check for `volatility-type: seasonal` and `active-window:` field. If present, allow capture outside active window without flagging as maintenance burden.

```yaml
maintenance-burden: medium
volatility-type: seasonal
active-window: September-November
verification-cycle: annual
```

---

### Rule 2: Volatility Trajectory Distinction

**Rule:** Distinguish between `volatility-trajectory: improving` (technique evolution) vs. `declining` (trend cycles).

**Why:** AI cannot distinguish "this cooking technique evolved" from "this ingredient was a 2024 trend" using current rule. Different value trajectories require different handling.

**Test:** Check for `volatility-trajectory:` field. Declining trajectories should be excluded or marked with short expiration; improving trajectories have long-term value.

---

### Rule 3: Source Quality Override

**Rule:** For high-external-availability knowledge (recipes), check `source-quality-tier` before excluding.

**Why:** Recipe knowledge online varies enormously in quality. A professional chef's blog vs. an untested Reddit post both have "high external availability" but different reliability.

**Test:** If `source-quality-tier: tested-methodology`, capture even with high external availability. Only exclude unverified personal discoveries.

---

### Rule 4: Taste Calibration Exception

**Rule:** Exception for `knowledge-type: taste-calibration` — always capture regardless of maintenance burden.

**Why:** Personal taste preferences require ongoing calibration but are deeply personal and highest-value knowledge in cooking domain.

**Test:** Check for `knowledge-type: taste-calibration`. If present, always capture regardless of maintenance burden assessment.

---

### Rule 5: Personalization Depth Weighting

**Rule:** Add `personalization-depth:` to reweight equipment-specific knowledge.

**Why:** "How to use my Instant Pot" has high external availability but low actual utility because generic advice doesn't account for user's specific model, altitude, batch sizes.

**Test:** If `personalization-depth: high`, capture even with high external availability.

```yaml
maintenance-burden: medium
external-availability: high
personalization-depth: high  # Multiple context factors from YOUR setup
```

---

### Rule 6: Troubleshooting Knowledge Separation

**Rule:** Separate problem-variability from solution-stability in troubleshooting knowledge.

**Why:** Troubleshooting knowledge has stable solutions (how to fix) but variable problems (what went wrong). Current rule treats all as volatile.

**Test:** Check for `solution-stability: high` vs. `problem-variability: high`. Capture solutions even if problems are variable.

```yaml
maintenance-burden: low
volatility-type: solution-stable
problem-variability: high
```

---

### Rule 7: Cultural Evolution Volatility Type

**Rule:** Add `volatility-type: cultural-evolution` for regional/traditional cooking knowledge.

**Why:** Cultural knowledge (authentic pho, traditional kimchi) involves regional variations, contested authenticity, and ingredient availability — not covered by current volatility types.

**Test:** Check for `volatility-type: cultural-evolution` with appropriate handling for contested/unstable knowledge.

```yaml
volatility-type: cultural-evolution
volatility-source: regional-variation|contested-authenticity|ingredient-availability
```

---

## Summary

These 7 edge cases represent gaps in the current Maintenance Burden Rule. The rule is partially executable by AI but requires domain-specific extensions for cooking.

**Gap status:** Identified — requires Seed integration with domain extensions

**Related notes:**
- [[Seed Stress Test - Maintenance Burden Rule in Cooking]]
- [[AI-Assisted Knowledge Management Seed]] (line ~839)
- [[Frontier Exploration - Knowledge Maintenance]]

---

**Discovered by:** heartbeat-2026-04-02
**Method:** SEED_STRESS_TEST on Maintenance Burden Rule using Cooking domain