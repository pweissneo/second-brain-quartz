---
last-reviewed: 2026-03-16
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - creative-writing
  - reasoning-strategies
  - domain-agnostic
---

# Seed Stress Test: Reasoning Strategies Rule in Creative Writing

## Seed Rule Being Tested

**Rule:** Define reasoning strategies for query answering — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection.

**Test:** For a complex query, can you: (1) decompose it into atomic sub-questions? (2) plan traversal paths before executing? (3) score note relevance using explicit criteria? (4) aggregate confidence from component notes? (5) detect and flag knowledge gaps encountered during reasoning?

## Application to Creative Writing Knowledge Base

### Where the Rule Works Well

**Query Decomposition** works naturally in creative writing:
- "How do I write a compelling villain?" → decompose into: character motivation, reader psychology, antagonist archetypes, moral complexity
- Each sub-question maps to different notes in the vault

**Traversal Planning** works for structured knowledge:
- Character development notes link to psychology notes
- Plot structure notes link to pacing notes
- Clear hub-spoke structure enables planning

### Edge Case 1: Subjective Evaluation Criteria

**Problem:** In creative writing, "what makes a compelling villain" is highly subjective. The reasoning strategy must handle subjective knowledge differently than objective knowledge.

**The Test Problem:** The Seed's reasoning strategy rule assumes objective relevance scoring. But in creative writing:
- Note A: "Villains should have relatable motivations" — confidence: high
- Note B: "Villains work best when they believe they're right" — confidence: medium  
- Note C: "Make your villain competent" — confidence: low (subjective)

How do you aggregate confidence from notes that are all subjective opinions?

**Proposed Refinement:**
> For subjective-knowledge domains, add a "subjectivity-weight" factor to confidence aggregation. Subjective notes should be weighted lower in aggregate confidence than objective notes.

### Edge Case 2: Contradictory Writing Advice

**Problem:** Writing advice often contradicts:
- "Show, don't tell" vs "Sometimes telling is effective"
- "Write what you know" vs "Write what you want to learn"
- "Start with action" vs "Start with character"

**The Test Problem:** When reasoning traverses notes with contradictory advice, how does the AI synthesize?

**Current Seed:** "When sources contradict, create a synthesis note presenting both perspectives."

**Creative Writing Problem:** Contradictory writing advice is often NOT a contradiction — both may be valid in different contexts. "Show, don't tell" works for emotional scenes; "telling" works for pacing.

**Proposed Refinement:**
> For creative domains where advice is context-dependent rather than contradictory, add a "context-dependency" flag. Instead of synthesizing into one answer, present as alternatives with applicability guidance.

### Edge Case 3: Iterative Creative Processes

**Problem:** Creative writing is iterative, not sequential. A query like "how do I revise my first draft" requires iterative reasoning, not linear traversal.

**The Test Problem:** The reasoning strategy assumes traversal paths can be planned in advance. But revision is evaluative:
- Write something → evaluate → decide next step → repeat

**Proposed Refinement:**
> For iterative creative processes, reasoning strategies should include evaluation criteria. The traversal is not "read note A then B" but "apply advice from A, evaluate result, decide next."

### Edge Case 4: Genre-Specific Knowledge

**Problem:** Writing advice varies wildly by genre:
- Thriller: pacing is critical
- Literary fiction: prose style is critical  
- Romance: character emotional arc is critical

**The Test Problem:** A query about "pacing" might return notes from multiple genres. How does the AI know which genre-specific notes are relevant?

**Proposed Refinement:**
> For genre-dependent knowledge, add "genre-scope" to note metadata. Reasoning should filter by genre when query intent is genre-specific.

### Edge Case 5: Tacit Knowledge in Writing

**Problem:** Much of writing knowledge is tacit — "the feel of a good sentence," "when a paragraph works." This is hard to capture in notes and harder to reason about.

**The Test Problem:** Gap detection in creative writing is different — it's not "missing note" but "missing tacit knowledge that can't be captured."

**Proposed Refinement:**
> For tacit-knowledge domains, gap detection should distinguish: (1) missing declarative knowledge (can be captured), (2) missing tacit knowledge (can't be captured but can be flagged for practice/experience).

### Edge Case 6: Multi-Modal Creative Output

**Problem:** Creative writing often involves other modalities — scene descriptions that could be illustrated, dialogue that could be performed, descriptions that evoke sensory details.

**The Test Problem:** The reasoning strategy assumes text-based notes. But creative output involves multiple modalities.

**Proposed Refinement:**
> For multi-modal creative domains, reasoning should consider: Can this advice be applied across modalities? Are there notes that reference visual/audio/kinesthetic elements?

## Modified Test for Creative Writing

### Original Test:
> For a complex query, can you: (1) decompose it into atomic sub-questions? (2) plan traversal paths before executing? (3) score note relevance using explicit criteria? (4) aggregate confidence from component notes? (5) detect and flag knowledge gaps encountered during reasoning?

### Modified Test for Creative Writing:

1. **Query Decomposition (modified):**
   - Decompose into sub-questions
   - Identify which sub-questions are objective vs subjective
   - Tag subjective sub-questions with "subjectivity-weight"

2. **Traversal Planning (modified):**
   - Plan paths
   - Identify genre-specific paths vs universal paths
   - For iterative queries (revision, editing), plan evaluation loops, not linear paths

3. **Relevance Scoring (modified):**
   - Score by: direct match + genre applicability + recency
   - Add genre-scope filter
   - Weight subjective notes lower than objective notes

4. **Confidence Aggregation (modified):**
   - Calculate weighted average
   - Downweight subjective advice
   - Flag when advice is contradictory (synthesize) vs context-dependent (present as alternatives)

5. **Gap Detection (modified):**
   - Detect missing declarative knowledge
   - Detect missing tacit knowledge (flag for practice)
   - For genre-specific gaps, specify genre

## Summary

| Issue | Original Rule | Creative Writing Adaptation |
|-------|--------------|---------------------------|
| Subjective evaluation | Not addressed | Add subjectivity-weight factor |
| Contradictory advice | Synthesize | Distinguish contradiction vs context-dependency |
| Iterative processes | Linear traversal | Add evaluation loop planning |
| Genre specificity | Not addressed | Add genre-scope metadata |
| Tacit knowledge | Not addressed | Distinguish declarative vs tacit gaps |
| Multi-modal output | Not addressed | Consider cross-modal applicability |

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Original rule
- [[Frontier Exploration - Knowledge Base Reasoning Strategies]] — Related exploration
- [[Seed Gap - Music Composition Knowledge Bases]] — Similar domain-specific issues
- [[Seed Stress Test - Chess Knowledge Base]] — Another creative domain test
