---
last-reviewed: 2026-03-18
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - reasoning-strategies
  - domain-agnostic
---

# Seed Stress Test: Reasoning Strategies Rules

Testing Seed rules about query answering, synthesis, and reasoning success tracking.

## Relevant Seed Rules

1. **Define reasoning strategies for query answering** — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection.

2. **Document synthesis logic for complex answers** — when combining multiple notes, track which notes contributed, how synthesis was performed, and any assumptions made.

3. **Track reasoning success rate as a proxy for vault usability — monitor query completion, gap detection frequency, and answer quality.

---

## Domain: Cooking Knowledge Base

Testing these rules against a cooking knowledge base with:
- Recipe notes (procedural)
- Technique notes (procedural/explanatory)
- Ingredient notes (reference)
- Flavor principle notes (explanatory)
- Cuisine notes (hub)

---

## Issue 1: Query Decomposition

**Rule:** Include explicit rules for query decomposition.

**Problem:** The Seed doesn't specify HOW to decompose queries. Different query types need different decomposition strategies:

| Query Type | Example | Decomposition Strategy |
|------------|---------|------------------------|
| How-to | "How to make pasta" | Find recipe → check technique notes → verify ingredients |
| Why | "Why does bread rise" | Find explanation note → trace to science notes |
| Recommendation | "What wine with fish" | Link wine notes to fish notes via pairing rules |
| Troubleshooting | "Why is my sauce broken" | Match symptom to technique error notes |

**Gap:** No guidance on:
- When to decompose vs. answer directly
- How many sub-queries is too many
- What to do when sub-queries conflict

**Proposed Test:** For any query requiring 3+ sub-queries, is there explicit justification for decomposition complexity?

---

## Issue 2: Traversal Planning

**Rule:** Plan traversal paths before executing.

**Problem:** The Seed doesn't define traversal strategies. For the same query, different traversal strategies yield different results:

| Strategy | Best For | Risk |
|----------|----------|------|
| Breadth-first | Overview, quick answers | Shallow, misses nuance |
| Depth-first | Deep analysis | Misses related concepts |
| Hub-first | Structured domains | Assumes good hubs exist |
| Link-hop | Discovery, exploration | Undirected, may wander |

**Cooking Example:**
- Query: "How to cook salmon"
- Breadth-first: Get all salmon recipes → overwhelm
- Hub-first: Start at "Salmon" hub → get curated recipes
- Link-hop: Start at "Fish" → "Fatty Fish" → "Salmon" → too indirect

**Gap:** No guidance on choosing traversal strategy.

**Proposed Test:** For complex queries, can you justify WHY you chose your traversal strategy?

---

## Issue 3: Relevance Scoring

**Rule:** Score note relevance using explicit criteria.

**Problem:** No guidance on what makes a note "relevant." Different scoring approaches:

| Criteria | Weight | Problem |
|----------|--------|---------|
| Keyword match | High | Misses synonyms |
| Link density | High | Favors hub notes |
| Recency | Medium | Penalizes evergreen |
| Confidence | Medium | Assumes confidence is calibrated |
| Personal utility | High | Hard to measure |

**Cooking Example:**
- Query: "quick dinner"
- Recipe A: "Quick Weeknight Pasta" (tags: dinner, quick, pasta) — high keyword match
- Recipe B: "Ramen Upgrade" (tags: dinner, 15-min) — semantic match but no keyword
- Recipe C: "Sunday Roast" (tags: dinner, traditional) — correct tags but not quick

**Gap:** No explicit relevance scoring formula.

**Proposed Test:** Can you articulate your relevance scoring criteria BEFORE running the query?

---

## Issue 4: Confidence Aggregation

**Rule:** Aggregate confidence from component notes.

**Problem:** How do you combine confidence levels?

| Aggregation Method | Formula | Issue |
|--------------------|---------|-------|
| Average | (c1 + c2) / 2 | Dilutes high confidence |
| Minimum | min(c1, c2) | Too pessimistic |
| Maximum | max(c1, c2) | Too optimistic |
| Weighted | (c1*w1 + c2*w2) / (w1+w2) | Requires weights |

**Cooking Example:**
- Recipe note: confidence: high (tested 5 times)
- Ingredient note: confidence: medium (from blog)
- Technique note: confidence: high (standard)
- Final answer: ???

**Gap:** No guidance on aggregation method.

**Proposed Rule Addition:**
> When aggregating confidence from multiple notes:
> 1. Use minimum confidence if notes are dependent (answer requires ALL)
> 2. Use weighted average if notes are independent (answer uses parts)
> 3. Apply floor: if ANY note is confidence: low, final cannot exceed medium

---

## Issue 5: Gap Detection

**Rule:** Detect and flag knowledge gaps encountered during reasoning.

**Problem:** The Seed doesn't define what counts as a "gap" or how to handle them:

| Gap Type | Example | Detection Method |
|----------|---------|------------------|
| Missing note | "No note on X" | Check if query terms return results |
| Incomplete note | "Note exists but thin" | Check word count, links |
| Outdated note | "Note from 2020" | Check last-reviewed |
| Contradictory | "Note A says X, Note B says not-X" | Compare confidence, sources |

**Gap:** No explicit gap classification system.

**Proposed Gap Taxonomy:**
```yaml
gap-type: missing | incomplete | outdated | contradictory | unverified
gap-severity: blocking | minor | cosmetic
gap-action: create | expand | update | verify | reconcile
```

---

## Issue 6: Synthesis Documentation

**Rule:** Document which notes contributed, how synthesis was performed, and any assumptions.

**Problem:** The Seed doesn't specify synthesis format. Current approaches:

| Format | Example | Pros | Cons |
|--------|---------|------|------|
| List | "Based on [[Source Note A]], [[Source Note B]]" | Simple | No structure |
| Chain | "A → B → C" | Shows logic | Linear only |
| Tree | "Root from A+B, child from C" | Hierarchical | Complex |
| Network | "A connected to B via X" | Flexible | Hard to parse |

**Cooking Example:**
- Query: "Why is my bread dense"
- Notes used: 
  - [[Bread Troubleshooting]] (general)
  - [[Gluten Development]] (technique)
  - [[Yeast Activity]] (science)
- Synthesis: "Combined troubleshooting guide with specific technique and science notes"
- Assumptions: "User is at sea level, using standard yeast"

**Gap:** No required synthesis documentation format.

**Proposed Test:** Can another agent reproduce your answer by following your synthesis documentation?

---

## Issue 7: Reasoning Success Rate

**Rule:** Track query completion, gap detection frequency, and answer quality.

**Problem:** What exactly should be tracked?

| Metric | Definition | Collection Method |
|--------|------------|-------------------|
| Completion rate | % queries with answers | Log every query |
| Gap detection | % queries with gaps found | Tag gaps during reasoning |
| Answer quality | ??? | Hardest to measure |

**Quality Measurement Approaches:**
- Self-assessment (unreliable)
- Human feedback (expensive)
- Task success (indirect)
- Cross-validation (complex)

**Gap:** No quality measurement standard.

**Proposed Simple Metrics:**
```yaml
reasoning-metrics:
  queries-total: 100
  queries-completed: 85
  queries-gaps-found: 23
  gaps-resolved: 15
  completion-rate: 0.85
  gap-resolution-rate: 0.65
```

---

## Issue 8: Interaction Between Reasoning Rules

The three reasoning rules interact in complex ways:

```
Query → Decomposition → Traversal → Scoring → Synthesis → Answer
                ↓              ↓           ↓
            Gap Detection ← Gap Detection ← Gap Detection
```

**Problem:** No guidance on:
- When to iterate vs. proceed
- How gap detection affects traversal
- Whether to abort if gaps found

**Proposed Decision Tree:**
1. Decompose query
2. Plan traversal
3. Execute traversal
4. For each note: score relevance
5. Detect gaps
6. If blocking gap: note and continue OR abort
7. Synthesize from available notes
8. Document synthesis
9. Track metrics

---

## Summary of Gaps Found

| Gap | Severity | Proposed Fix |
|-----|----------|--------------|
| No query decomposition guidance | Medium | Add decision tree for query types |
| No traversal strategy selection | Medium | Add strategy selection criteria |
| No relevance scoring formula | High | Add explicit scoring formula |
| No confidence aggregation method | High | Add aggregation rules |
| No gap classification system | Medium | Add gap taxonomy |
| No synthesis format standard | Medium | Add required fields |
| No quality metrics standard | Medium | Add simple tracking schema |
| No rule interaction guidance | Low | Add decision tree |

---

## Proposed New Seed Rules

**Rule:** Define explicit query decomposition strategies — for different query types (how-to, why, recommendation, troubleshooting), specify decomposition approach before traversing.

**Rule:** Document synthesis with required fields:
```yaml
synthesis:
  sources: [note1, note2]
  method: [chain|tree|network]
  assumptions: ["assumption 1"]
  confidence-aggregation: min|average|weighted
```

**Rule:** Track reasoning metrics:
- Query completion rate (target: >80%)
- Gap detection rate
- Gap resolution rate (target: >50%)

---

## Universal Domain Considerations

The reasoning strategies apply across all knowledge base types, with specific adaptations:

### Reference KBs
- Prioritize precision over breadth
- Favor direct answers over exploratory paths
- Minimize synthesis to reduce error accumulation
- Use minimum confidence aggregation (if ANY note is low-confidence, final answer cannot exceed medium)

### Learning KBs  
- Include learning path construction in traversal
- Surface prerequisite gaps proactively
- Provide context alongside answers
- Track learning progress through the knowledge graph

### Hybrid KBs
- Balance efficiency (reference) with depth (learning)
- Let query intent determine traversal strategy
- Support both quick lookups and comprehensive learning

### Test Scenario

Given a query: "What are the trade-offs between using a knowledge base for decision-making vs. learning a new domain?"

A well-designed reasoning strategy should:
1. Decompose into sub-questions (decision-making trade-offs, learning trade-offs, KB role in each)
2. Identify relevant hubs (Knowledge Base Utility Assessment, Learning Progression)
3. Score and rank notes by relevance
4. Aggregate confidence from component notes
5. Detect gaps (e.g., no note on KB limitations for decision-making)
6. Synthesize while noting any assumptions

---

## Domain-Specific Adaptations

### Creative Writing Domain

The reasoning strategy rules require significant modification for creative domains where knowledge is subjective, iterative, and context-dependent.

#### Edge Case 1: Subjective Evaluation Criteria

In creative writing, "what makes a compelling villain" is highly subjective. The reasoning strategy must handle subjective knowledge differently than objective knowledge.

**Problem:** The Seed's reasoning strategy rule assumes objective relevance scoring. But in creative writing, notes are subjective opinions with varying confidence levels. How do you aggregate confidence from notes that are all subjective opinions?

**Proposed Refinement:**
> For subjective-knowledge domains, add a "subjectivity-weight" factor to confidence aggregation. Subjective notes should be weighted lower in aggregate confidence than objective notes.

#### Edge Case 2: Contradictory Writing Advice

Writing advice often contradicts: "Show, don't tell" vs "Sometimes telling is effective," "Write what you know" vs "Write what you want to learn."

**Problem:** When reasoning traverses notes with contradictory advice, how does the AI synthesize? The Seed says "when sources contradict, create a synthesis note presenting both perspectives." But contradictory writing advice is often NOT a contradiction — both may be valid in different contexts.

**Proposed Refinement:**
> For creative domains where advice is context-dependent rather than contradictory, add a "context-dependency" flag. Instead of synthesizing into one answer, present as alternatives with applicability guidance.

#### Edge Case 3: Iterative Creative Processes

Creative writing is iterative, not sequential. A query like "how do I revise my first draft" requires iterative reasoning, not linear traversal.

**Problem:** The reasoning strategy assumes traversal paths can be planned in advance. But revision is evaluative: write something → evaluate → decide next step → repeat.

**Proposed Refinement:**
> For iterative creative processes, reasoning strategies should include evaluation criteria. The traversal is not "read note A then B" but "apply advice from A, evaluate result, decide next."

#### Edge Case 4: Genre-Specific Knowledge

Writing advice varies by genre: Thriller needs pacing, literary fiction needs prose style, romance needs emotional arcs.

**Problem:** A query about "pacing" might return notes from multiple genres. How does the AI know which genre-specific notes are relevant?

**Proposed Refinement:**
> For genre-dependent knowledge, add "genre-scope" to note metadata. Reasoning should filter by genre when query intent is genre-specific.

#### Edge Case 5: Tacit Knowledge in Writing

Much of writing knowledge is tacit — "the feel of a good sentence," "when a paragraph works." This is hard to capture in notes and harder to reason about.

**Problem:** Gap detection in creative writing is different — it's not "missing note" but "missing tacit knowledge that can't be captured."

**Proposed Refinement:**
> For tacit-knowledge domains, gap detection should distinguish: (1) missing declarative knowledge (can be captured), (2) missing tacit knowledge (can't be captured but can be flagged for practice/experience).

#### Edge Case 6: Multi-Modal Creative Output

Creative writing often involves other modalities — scene descriptions that could be illustrated, dialogue that could be performed.

**Problem:** The reasoning strategy assumes text-based notes. But creative output involves multiple modalities.

**Proposed Refinement:**
> For multi-modal creative domains, reasoning should consider: Can this advice be applied across modalities? Are there notes that reference visual/audio/kinesthetic elements?

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Knowledge Base Utility Assessment]] — Understanding KB value propositions
- [[Frontier Exploration - Learning Progression and Curriculum Design]] — Learning-specific traversal
- [[Frontier Exploration - Knowledge Retrieval Patterns and Usage Tracking]] — Understanding actual query patterns
- [[Seed Stress Test - Reasoning Strategies in Therapeutic Psychology]] — Domain-specific reasoning test for high-stakes therapeutic domains
- [[Seed Stress Test - Diminishing Returns Rule in Machine Learning Data Science]]
