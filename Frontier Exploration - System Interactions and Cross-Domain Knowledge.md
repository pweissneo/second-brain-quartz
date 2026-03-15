---
last-reviewed: 2026-03-13
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - cross-domain
  - systems-thinking
  - methodology
---

# Frontier Exploration - System Interactions and Cross-Domain Knowledge

> How do we capture knowledge about how domains influence each other?

## The Problem

Knowledge doesn't exist in isolation. Understanding nutrition helps with fitness programming. Psychological principles inform product design. Economic theory shapes political analysis. But the Seed treats domains as separate — each with its own rules, but no guidance on:

1. When knowledge from one domain directly informs another
2. How to structure notes that span multiple domains
3. Whether to create unified notes or separate cross-linked notes
4. How to handle conflicting principles from different domains

An AI building a knowledge base using only domain-specific rules will create siloed knowledge that misses the connections that make expertise valuable.

## Seed Gap Analysis

### Existing Coverage
- Cross-domain knowledge (tags and hubs)
- Multi-domain vaults (tagging atomic notes)
- Prerequisites (linking across domains)
- Trade-off knowledge (context-dependent decisions)

### Missing / Incomplete

1. **No rule for knowledge that is explained by another domain**
   - Example: Understanding habit formation (psychology) makes fitness programming more effective
   - When should a note reference cross-domain explanations vs. explain them inline?

2. **No guidance on domain interaction hierarchy**
   - Some domains are "foundational" to others (biology → medicine, psychology → marketing)
   - How to capture these dependencies without over-linking?

3. **No guidance on conflicting principles from different domains**
   - Example: Economic "rational actor" model vs. psychological behavioral biases
   - When to present as conflict vs. when to synthesize?

4. **No guidance on cross-domain synthesis notes**
   - When is "X from the perspective of Y" worth a separate note vs. a link?

## Examples of System Interaction Knowledge

### Example 1: Fitness and Nutrition
```
Knowledge: "Progressive overload requires sufficient protein intake"
Cross-domain connection: Protein needs explained by muscle physiology (biology)
Decision: Link to [[Muscle Protein Synthesis]] or inline explanation?

Current Seed guidance: None specific to this scenario
```

### Example 2: Product Design and Psychology
```
Knowledge: "Dark patterns increase short-term conversion but damage brand trust"
Cross-domain: Behavioral psychology (persuasion) + consumer psychology (trust)
Decision: Synthesize in one note or link to two separate domain notes?

Current Seed guidance: None
```

### Example 3: Climate and Agriculture
```
Knowledge: "Planting dates vary by hardiness zone"
Cross-domain: Botany + climate science + local weather patterns
Decision: Hub note linking all three domains vs. integrated agricultural note?

Current Seed guidance: Climate-zone rules exist but don't address multi-domain synthesis
```

## Proposed Seed Rules

### Rule: Identify domain interaction type when knowledge spans multiple domains

**Why:** Not all cross-domain connections are equal. Some are explanatory (domain B explains why A works), some are applicational (domain A applies to domain B), some are conflicting (principles from different domains contradict).

**Test:** For a note connecting multiple domains: (1) Is one domain explaining the other? (2) Is one domain being applied to another? (3) Do the domains have conflicting principles?

**Implementation:**
```yaml
domain-interaction-type: explanatory|applicational|conflicting|synthesized
domains: [primary-domain, secondary-domain]
synthesis-status: separate-notes|merged-note|pending-synthesis
```

### Rule: For explanatory cross-domain knowledge, decide on inline vs. link based on reusability

**Why:** If the explanatory domain knowledge (e.g., psychology principle) is referenced in many places, keep it separate and link. If it's only relevant here, inline the explanation.

**Test:** (1) How many notes reference this explanatory knowledge? (2) Does the explanation need to evolve independently? (3) Is the explanation domain-specific or generic?

**Decision tree:**
- Referenced in 3+ notes → separate note with links
- Referenced in 1-2 notes → inline summary with link to detail
- Explanation evolves independently → separate note
- Explanation is generic → could be universal principle note

### Rule: Present conflicting domain principles as explicit tensions, not false syntheses

**Why:** When psychology says one thing and economics says another, presenting a "unified" view misleads readers. Better to present the tension and let readers navigate.

**Test:** (1) Is there genuine conflict between domains? (2) Is there a context where each principle is valid? (3) Can you articulate both positions without strawmanning?

**Implementation:**
```yaml
domain-conflict:
  domain-a: psychology
  domain-a-principle: "People are heavily influenced by framing"
  domain-b: economics  
  domain-b-principle: "People act rationally despite framing"
  synthesis-guidance: "Present as context-dependent: framing works for simple decisions, rational analysis dominates for high-stakes"
```

### Rule: Create integration hub notes for frequently-crossing domains

**Why:** When two domains consistently interact (e.g., nutrition + fitness, psychology + product design), a hub note helps navigate the intersection.

**Test:** (1) Do you have 5+ notes that reference both domain A and domain B? (2) Do users frequently ask questions at the intersection? (3) Is there a recognized sub-field at the intersection?

**Example:** [[Fitness Nutrition]] hub integrating exercise science + nutrition science

### Rule: Tag notes with domain transfer potential

**Why:** Knowledge from one domain often applies to another. Tagging helps discover transfer opportunities.

**Test:** For a note: (1) Could this principle apply in a different domain? (2) Has it been applied elsewhere? (3) Are transfer examples documented?

**Implementation:**
```yaml
domain-transfer-potential:
  - from: psychology
    to: product-design
    transfer-principle: "Loss aversion → feature removal resistance"
  - from: ecology
    to: business
    transfer-principle: "Systems thinking → organizational interdependencies"
```

## Gap Summary

| Gap | Current Rule | Gap |
|-----|--------------|-----|
| Domain interaction types | Cross-domain tags | No guidance on explanatory vs applicational vs conflicting |
| Cross-domain explanation strategy | Link vs inline | No decision framework for domain explanations |
| Conflicting principles | Trade-off knowledge | No guidance on domain-level conflicts |
| Integration hubs | Hub creation (5+ notes) | No guidance on cross-domain hubs |
| Domain transfer | Tags | No systematic way to capture transfer potential |

## Questions for Further Exploration

1. Should domain interaction knowledge be captured proactively (designed upfront) or reactively (emerges from note-linking)?
2. How do we prevent cross-domain notes from becoming too complex (violating atomicity)?
3. When does cross-domain synthesis create new domain knowledge vs. just connecting existing domains?

## Related Notes
- [[Frontier Exploration - Knowledge Abstraction Levels]]
- [[Frontier Exploration - Trade-off Knowledge Capture]]
- [[Prerequisite Knowledge Tracking]]
- [[Knowledge Graph Structure]]
