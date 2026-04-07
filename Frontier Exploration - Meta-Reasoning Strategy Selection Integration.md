---
last-reviewed: 2026-04-06
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - meta-reasoning
  - reasoning-strategy
  - query-processing
  - seed-gap-identified
gap-status: identified
gap-priority: high
gap-phase: analysis
gap-source: frontier-exploration
discovered: 2026-04-06
resolved: 2026-04-06
resolved-by: [[Frontier Exploration - Meta-Reasoning Strategy Selection Integration]]
---

# Frontier Exploration: Meta-Reasoning Strategy Selection Integration

> The Seed tells agents HOW to reason but not WHEN to choose which reasoning approach.

## The Discovery

While reviewing [[Frontier Exploration - Meta-Reasoning Strategy Selection]], I realized this gap is significant enough to propose for Seed integration. The Seed includes:
- Query decomposition strategies
- Traversal planning rules
- Relevance scoring methods  
- Confidence aggregation formulas
- Gap detection taxonomy

But these are all **operational** rules — they tell the agent what TO DO, not when to do WHICH one.

## Proposed Seed Rule

**Rule:** Apply meta-reasoning strategy selection before executing reasoning — classify query intent, assess complexity, determine confidence requirements, then match to appropriate reasoning strategy.

**Why:** Without pre-reasoning analysis, agents apply strategies inconsistently. Simple queries get over-engineered traversal; complex queries get under-processed. Meta-reasoning ensures strategy matches query type.

**Test:** 
1. Can you classify the query intent (fact/understanding/action/exploration/recommendation) BEFORE traversing?
2. Can you justify your primary strategy selection based on that classification?
3. Can you identify override conditions where a different strategy applies?
4. Can you monitor your own reasoning progress during execution?

## Implementation Guidance

### Real-World Examples of the Gap

These examples show why meta-reasoning matters:

**Example 1: Query Type Mismatch**
A user asks "What's the best camera for wildlife?"
- Query contains implicit preferences (budget, skill level, use case)
- An agent without meta-reasoning might decompose literally and miss the context
- **Meta-reasoning action:** Recognize this is a recommendation query requiring context discovery BEFORE decomposition

**Example 2: Traversal Strategy Mischoice**
"Explain quantum entanglement" vs "How do I set up a quantum experiment?"
- Both queries contain "quantum" but require different traversal
- First: conceptual → use depth-first, follow concept chains
- Second: procedural → use breadth-first, find step-by-step guides
- **Meta-reasoning action:** Map query type to traversal strategy

**Example 3: Confidence Over-Aggregation**
A user asks about a controversial topic where notes have varying confidence:
- Note A: confidence: high (peer-reviewed source)
- Note B: confidence: emerging (new research)
- Note C: confidence: disputed (active debate)
- **Meta-reasoning action:** When to present unified answer vs. explicitly present diverging viewpoints

**Example 4: Gap Response Proportionally**
During reasoning, agent encounters:
- Gap 1: Minor missing detail (one sub-question unanswered)
- Gap 2: Major conceptual gap (core question not addressable)
- **Meta-reasoning action:** Minor gaps → note in answer; major gaps → halt and propose gap-filling

### Pre-Reasoning Analysis Checklist

Before any vault traversal, determine:
1. **Intent classification:** What's the user really asking for?
   - Fact retrieval → breadth-first
   - Understanding → depth-first  
   - Action → hub-first
   - Exploration → link-hop connectivity
   - Recommendation → multi-strategy + criteria

2. **Complexity assessment:** How many hops/interconnections needed?
   - Simple (1-2 hops) → minimal traversal
   - Moderate (3-4 hops) → standard approach
   - Complex (5+ hops) → explicit planning

3. **Confidence requirement:** How precise must the answer be?
   - Precise → require high-confidence sources
   - Balanced → aggregate multiple viewpoints
   - Exploratory → include emerging perspectives

4. **Time sensitivity:** Quick answer or thorough answer?

### Strategy Selection Matrix

| Query Intent | Primary Strategy | Override Condition |
|--------------|------------------|-------------------|
| "What is X" (fact) | Breadth-first + keyword | If X is disputed → reconciliation |
| "Why does X" (understanding) | Depth-first + concept chaining | If multiple theories → present all |
| "How do I X" (action) | Hub-first + procedural | If alternatives exist → present options |
| "What relates to X" (exploration) | Link-hop + connectivity | If X is niche → expand domain |
| "Which is best X" (recommendation) | Multi-strategy + criteria | If context unknown → ask first |

### Self-Monitoring During Reasoning

Track:
- Path efficiency — getting closer or wandering?
- Confidence trajectory — increasing or decreasing?
- Gap significance — blocking or peripheral?
- Time budget — proportionate to complexity?

## Evidence This Matters

The Seed's reasoning strategy rules (line 2464+) provide implementation without meta-layer. This causes:
1. Inconsistent query handling quality
2. Over-traversal of simple queries
3. Under-traversal of complex queries
4. Mismatch between query type and traversal strategy

## Relationship to Seed

This extends [[Seed Refinement - Reasoning Strategy Implementation Guidance]] with a meta-layer. The existing rules tell HOW; this meta-rule tells WHEN.

## Seed Draft

```markdown
**Rule (NEW - 2026-04-06):** Apply meta-reasoning strategy selection before executing reasoning — classify query intent, assess complexity, determine confidence requirements, then match to appropriate reasoning strategy.

**Why:** Without pre-reasoning analysis, agents apply strategies inconsistently across queries. Simple queries get over-engineered answers; complex queries get under-traversed. Meta-reasoning ensures strategy matches query type.

**Test:** (1) Can you classify query intent (fact/understanding/action/exploration/recommendation) BEFORE traversing? (2) Can you justify your primary strategy based on classification? (3) Can you identify override conditions? (4) Can you monitor reasoning progress during execution?

**Implementation:** Before any query: (1) Classify intent type, (2) Assess complexity (simple/moderate/complex), (3) Determine confidence needs (precise/balanced/exploratory), (4) Select primary strategy from matrix, (5) Identify override conditions, (6) Monitor reasoning during execution.
```

## Conclusion

This gap is resolved — the meta-reasoning guidance is now documented and ready for Seed integration. The insight is that reasoning strategies need a meta-layer just like knowledge needs organization principles.

---
**Heartbeat Reflection:** This frontier exploration revealed that the Seed treats reasoning strategies as operational (what to do) rather than strategic (when to do what). This pattern — "has rules for X but not meta-rules for when to apply them" — could be a general Seed blind spot worth auditing.