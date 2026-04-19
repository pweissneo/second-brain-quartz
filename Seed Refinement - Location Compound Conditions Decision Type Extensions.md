---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-08

last-updated: 2026-04-02
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - location-knowledge
  - compound-conditions
  - decision-type
gap-source: frontier-exploration
resolves:
  - Seed Gap - Location-Dependent Knowledge Handling
  - Seed Gap - Decision-Tree Knowledge Handling
  - Seed Gap - Compound Condition Knowledge Handling
---

# Seed Refinement - Location, Compound Conditions, and Decision Type Extensions

## Purpose

This note proposes three Seed refinements to resolve identified Seed gaps:
1. **Location-dependent knowledge** — explicit location scope tagging
2. **Compound condition knowledge** — condition hierarchy and temporal stacking  
3. **Decision-type knowledge** — expanded decision type values

All three gaps have been identified but incompletely resolved in current Seed rules.

## 1. Location-Dependent Knowledge Extension

### Gap Status

- **Seed Gap - Location-Dependent Knowledge Handling**: identified, unresolved
- **Existing coverage**: infrastructure-type (geographic), spatial-scale, spatial-vault allowance
- **Missing**: explicit location-scope frontmatter with variants support

### Proposed Rule

> **Rule:** For knowledge that varies by physical location (geography, latitude, climate zone, timezone), add `location-scope:` frontmatter and provide variants or caveats for alternative locations.
> **Why:** Without explicit location scoping, knowledge becomes unreliable when transferred to different contexts. Location-dependent knowledge is not interchangeable — applying knowledge to the wrong location can cause real-world failures (failed crops, missed celestial events, failed observations).
> **Test:** (1) Does the vault contain knowledge that varies by location? (2) If yes, is location scope tagged? (3) Are alternative locations addressed? (4) Can a user from a different location determine applicability?

### Implementation

```yaml
location-scope: global|northern-hemisphere|southern-hemisphere|latitude-specific|climate-zone|region|country|local
location-variants:
  northern: "Content for Northern Hemisphere"
  southern: "Content for Southern Hemisphere"
applicable-regions: [northern-hemisphere, temperate]
excluded-regions: [tropical, southern-hemisphere]
```

### Rationale

The current Seed covers geographic infrastructure (line 301) and spatial scale (line 2100) but lacks explicit location-scope tagging. This refinement adds the missing piece.

---

## 2. Compound Condition Knowledge Extension

### Gap Status

- **Seed Gap - Compound Condition Knowledge Handling**: identified, unresolved  
- **Existing coverage**: compound-conditions frontmatter (line 1483)
- **Missing**: condition hierarchy (hard/soft), temporal stacking, interaction formulas

### Proposed Rule

> **Rule:** For knowledge with multiple applicability conditions, distinguish hard constraints from soft guidelines and document temporal dependencies.
> **Why:** Not all conditions are equal — some are mandatory (hydration >50% for bread structure) while others are preferences (65-80% for style). Current rules treat all conditions equally, causing incorrect application of optional guidelines as requirements.
> **Test:** (1) Can you identify hard vs soft conditions? (2) Do conditions have temporal components? (3) Is condition interaction documented?

### Implementation

```yaml
condition-stack:
  - condition: "Primary condition"
    type: hard-constraint|soft-guideline|preference
    weight: 0.8
  - condition: "Secondary condition"
    type: soft-guideline
    weight: 0.5

temporal-conditions:
  - condition: "Temperature > 70F"
    duration-required: 3  # days
    temporal-type: consecutive|accumulated|threshold
    active-window: spring|fall|summer|winter|any
```

### Rationale

The compound-conditions rule (line 1483) captures dependencies but doesn't distinguish their importance or temporal nature. This refinement adds hierarchy and temporal stacking.

---

## 3. Decision Type Expansion

### Gap Status

- **Seed Gap - Decision-Tree Knowledge Handling**: partial resolution noted, incomplete
- **Existing coverage**: decision-type at line 1808 (diagnostic|setup|troubleshooting|selection|prioritization|context-dependent)
- **Status**: Actually already resolved! The Seed already includes all proposed types.

### Verification

The Seed at line 1808 includes:
- diagnostic
- setup  
- troubleshooting
- selection
- prioritization
- context-dependent

The Seed Gap - Decision-Tree Knowledge Handling notes "partial resolution" but the Seed already has the full set. This refinement confirms resolution and can be marked resolved.

---

## Test for All Refinements

### Location-Dependent Test
```bash
# Find notes that should have location scope
grep -l "latitude\|hemisphere\|climate\|zone\|region" *.md | \
  xargs grep -L "location-scope"
```

### Compound Condition Test
```bash
# Find notes with multiple conditions lacking hierarchy
grep -l "compound-conditions.*true" *.md | \
  xargs grep -L "condition-stack\|condition-type"
```

### Decision Type Test
```bash
# Verify all decision notes have decision-type
grep -l "decision\|choice\|branching" *.md | \
  xargs grep -L "decision-type"
```

---

## Related Notes

- [[Seed Gap - Location-Dependent Knowledge Handling]]
- [[Seed Gap - Compound Condition Knowledge Handling]]  
- [[Seed Gap - Decision-Tree Knowledge Handling]]
- [[Frontier Exploration - Geographically-Constrained Knowledge]]
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]]
- [[Frontier Exploration - Compound Context Knowledge]]

---

**Conclusion:** This Seed Refinement proposes adding location-scope and condition-stack frontmatter to resolve two identified gaps. The third gap (decision-type) is already resolved in the current Seed.

**Action:** If approved, integrate location-scope and condition-stack into the Seed foundation rules section.
