---
last-reviewed: 2026-04-07
lifecycle: seed-stress-test
confidence: medium
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - reasoning-strategies
  - photography
  - domain-specific-test
status: in-progress
---

# Seed Stress Test: Reasoning Strategies in Photography Knowledge Base

Testing [[AI-Assisted Knowledge Management Seed]] rules about query answering, synthesis, and reasoning success tracking against a photography knowledge base.

## Relevant Seed Rules

1. **Define reasoning strategies for query answering** — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection. (See [[Seed Refinement - Reasoning Strategy Implementation Gaps]])

2. **Document synthesis logic for complex answers** — when combining multiple notes, track which notes contributed, how synthesis was performed, and any assumptions made. (See [[Seed Refinement - Reasoning Success Rate Implementation]])

3. **Track reasoning success rate as a proxy for vault usability** — monitor query completion, gap detection frequency, and answer quality. (See [[Seed Refinement - Reasoning Success Rate Implementation]])

## Domain: Photography Knowledge Base

Testing these rules against a photography knowledge base with:
- Camera settings notes (procedural)
- Technique notes (procedural/explanatory)
- Equipment notes (reference)
- Composition principle notes (explanatory)
- Genre/style hub notes

---

## Issue 1: Query Decomposition in Photography Context

**Rule:** Include explicit rules for query decomposition.

**Problem:** Photography queries have unique types not covered by general guidance:

| Query Type | Example | Photography Decomposition Strategy |
|------------|---------|-------------------------------------|
| How-to | "How to shoot in low light" | Find technique → check equipment requirements → verify camera settings |
| Why | "Why does my lens flare" | Find optics explanation → trace to equipment limitations → link to solutions |
| Recommendation | "What lens for portraits" | Link lens notes to use-case via technical requirements |
| Troubleshooting | "Why are my photos blurry" | Match symptom to technique/equipment/error notes |
| Equipment-specific | "Which camera for sports" | Link specs to use-case via capability matching |

**Gap:** No guidance on equipment-specific query decomposition (matching technical specs to use requirements).

**Test:** For photography queries requiring equipment matching, can you articulate the spec-to-requirement mapping?

---

## Issue 2: Traversal Strategy Selection

**Rule:** Plan traversal paths before executing.

**Photography-Specific Considerations:**

| Strategy | Best For | Photography Risk |
|----------|----------|------------------|
| Breadth-first | "What genres exist" | May return too many style options |
| Depth-first | "Explain shallow DOF" | Misses practical equipment requirements |
| Hub-first | "Portrait photography" | Works well if genre hubs are strong |
| Link-hop | "Discovering new techniques" | May lead to equipment rabbit holes |

**Photography Example:**
- Query: "How to photograph waterfalls"
- Breadth-first: All waterfall techniques → overwhelm with long exposure + ND filter + composition → too much
- Hub-first: Start at "Waterfall Photography" hub → get curated techniques → works well if hub exists
- Link-hop: Start at "Nature" → "Landscapes" → "Water" → "Waterfalls" → too indirect
- Depth-first: Start at "Long Exposure" → get deep detail but miss composition aspects

**Gap:** No guidance on when equipment requirements should constrain technique exploration.

**Test:** Can you justify your traversal strategy for equipment-dependent queries?

---

## Issue 3: Relevance Scoring in Photography

**Rule:** Score note relevance using explicit criteria.

**Photography-Specific Scoring Criteria:**

| Criteria | Weight | Photography Consideration |
|----------|--------|---------------------------|
| Keyword match | High | Brand names (Canon, Sony, Nikon), model numbers (A7IV, R5) |
| Link density | High | Hub notes for genres have many links |
| Recency | Medium | Camera technology changes; older notes may be outdated |
| Confidence | Medium | Confidence in equipment recommendations depends on recency |
| Personal utility | High | Gear preferences highly personal |

**Equipment Recency Problem:**
- A note from 2022 about "best mirrorless cameras" may now be wrong
- Camera firmware updates can change performance characteristics
- New lens releases may make older recommendations obsolete

**Gap:** No guidance on recency weighting for equipment-dependent notes.

**Proposed Test:** For equipment recommendations, can you justify the recency weighting used?

---

## Issue 4: Confidence Aggregation for Equipment vs Technique

**Rule:** Aggregate confidence from multiple notes.

**Photography Example:**
- Note A (2024 lens recommendation): confidence: high
- Note B (2022 camera review): confidence: medium
- Note C (user forum post): confidence: low

**Aggregation Challenge:**
- Equipment recommendations: recency matters significantly
- Technique notes: more evergreen, recency matters less
- Style preferences: highly subjective, low confidence ceiling

**Gap:** No guidance on domain-specific confidence aggregation rules.

**Test:** Can you justify your confidence aggregation method for equipment-heavy queries?

---

## Issue 5: Gap Detection in Photography

**Rule:** Detect knowledge gaps during reasoning.

**Photography-Specific Gap Types:**

| Gap Type | Example | Severity |
|----------|---------|----------|
| Missing-equipment | "How to shoot star trails" without star tracker recommendations | High |
| Missing-technique | "Portrait lighting" without flash technique | Medium |
| Missing-software | "RAW processing" without software-specific notes | Medium |
| Outdated-equipment | Camera recommendations older than 2 years | High |
| Contradictory | Two notes recommending different lenses for same use case | High |

**Gap:** No guidance on equipment obsolescence gap detection (when to flag notes as outdated).

**Test:** Can you identify when equipment knowledge has become obsolete?

---

## Summary of Gaps Found

| Gap | Severity | Proposed Fix |
|-----|----------|--------------|
| No equipment-specific query decomposition | Medium | Add equipment matching to decomposition |
| No recency weighting for equipment notes | High | Add domain-aware recency rules |
| No confidence aggregation for equipment vs technique | Medium | Add domain-specific aggregation |
| No equipment obsolescence gap detection | High | Add equipment age thresholds |

---

## Testable Criteria for Photography Reasoning

| Test | Criteria | Verification |
|------|----------|--------------|
| Query decomposition | Can decompose equipment queries with spec matching | Manual inspection |
| Recency weighting | Can justify recency weight for equipment vs technique | Log inspection |
| Confidence aggregation | Can differentiate equipment vs technique confidence | Score explanation |
| Gap detection | Can identify equipment obsolescence gaps | Classification test |

---

## Test Executability Assessment

**Base Seed Rule Test:** "For a complex query, can you: (1) decompose it into atomic sub-questions? (2) plan traversal paths before executing? (3) score note relevance using explicit criteria? (4) aggregate confidence from component notes? (5) detect and flag knowledge gaps encountered during reasoning?"

**Photography Domain Assessment:**

| Sub-test | Executable? | Notes |
|----------|-------------|-------|
| (1) Decompose | Yes with modification | Need equipment spec matching |
| (2) Plan traversal | Yes | Hub-first works well for genres |
| (3) Score relevance | Yes with modification | Recency must be explicit |
| (4) Aggregate confidence | Yes with modification | Domain-aware aggregation |
| (5) Detect gaps | Yes with modification | Equipment obsolescence |

**Conclusion:** The Seed rule is executable but requires domain-specific refinements for photography equipment handling.

---

## Edge Cases Found

### Edge Case 1: Equipment Brand Loyalty

Photography communities have strong brand loyalty (Canon vs Nikon vs Sony). Reasoning strategies may inadvertently favor one brand based on link density, creating perception bias.

**Mitigation needed:** Track brand neutrality in equipment recommendations.

### Edge Case 2: Technique vs Equipment Solutions

Some problems can be solved with technique (settings) or equipment (new lens). No guidance on which to prioritize.

**Test:** For queries solvable by either technique or equipment change, can you justify your solution approach?

### Edge Case 3: Genre-Specific Confidence

Some genres (wildlife, sports) are equipment-dependent; others (street, documentary) are technique-dependent. No domain-aware guidance.

**Test:** Can you differentiate equipment-dependence by genre?

---

## Proposed Seed Refinements

### Refinement 1: Equipment-Aware Query Decomposition

**Rule (REFINEMENT):** For equipment-dependent domains (photography, audio, computing), add equipment matching to query decomposition — map use requirements to technical specifications before traversing.

**Why:** Equipment queries require spec matching that general query decomposition doesn't capture.

**Test:** For equipment queries: (1) Can you identify use requirements? (2) Can you map to technical specifications? (3) Can you match equipment to specs?

### Refinement 2: Domain-Aware Recency Weighting

**Rule (REFINEMENT):** For rapidly evolving domains (technology, equipment), apply higher recency weighting to equipment notes than to technique notes.

**Why:** Equipment recommendations decay faster than technique knowledge. Without domain-aware weighting, outdated equipment notes score equally with current ones.

**Test:** For equipment notes: (1) Is note age tracked? (2) Is recency weighting domain-aware? (3) Can you identify obsolete equipment notes?

### Refinement 3: Equipment Obsolescence Gap Detection

**Rule (REFINEMENT):** For equipment-dependent knowledge bases, flag notes with equipment recommendations older than the domain's obsolescence threshold as gap indicators.

**Why:** Outdated equipment recommendations can be worse than no recommendation (wrong purchasing decisions).

**Test:** Can you identify equipment notes past their useful lifespan?
