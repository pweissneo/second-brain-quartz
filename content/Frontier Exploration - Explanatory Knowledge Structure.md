---
last-reviewed: 2026-03-17
confidence: emerging
author-type: ai-assisted
lifecycle: evergreen
tags:
  - frontier-exploration
  - knowledge-presentation
  - explanatory-structure
  - pedagogy
  - teaching
---

# Frontier Exploration: Explanatory Knowledge Structure

> How should knowledge be organized WITHIN a note to maximize understanding? This gap explores the pedagogical structure of individual notes - how to present knowledge so readers (and AIs) can actually learn from it.

## The Problem

The Seed optimizes for atomicity, linking, and graph structure. But even a perfectly atomic note can be poorly structured for understanding. A note that stores knowledge well may not teach it well.

**Key insight:** Knowledge that serves as *reference* (look up when needed) has different structural needs than knowledge that serves as *explanation* (read to understand).

## Reference vs. Explanatory Knowledge

| Aspect | Reference Knowledge | Explanatory Knowledge |
|--------|-------------------|---------------------|
| Purpose | Find and retrieve | Understand and learn |
| Structure | Hierarchical, search-friendly | Narrative, logical flow |
| Links | Navigation shortcuts | Concept dependencies |
| Examples | Dictionary, encyclopedia | Tutorial, concept explanation |
| Reader behavior | Scan for specific item | Read start-to-finish |

### The Hybrid Challenge

Many notes serve BOTH purposes:
- A note on "Photosynthesis" needs to be findable (reference) AND explain the process (explanatory)
- A recipe needs to be retrievable (reference) AND teach technique (explanatory)

**Current Seed gap:** No guidance on balancing reference structure (for retrieval) with explanatory structure (for understanding).

## Explanatory Structure Patterns

### 1. The Inverted Pyramid

Start with the conclusion/answer, then provide context and details.
- **What:** Core insight first
- **Why:** Significance/context
- **How:** Supporting details
- **When:** Applicability conditions

Best for: Quick comprehension, decision-support, troubleshooting

### 2. The Conceptual Progression

Build understanding step-by-step, each step enabling the next.
- Prerequisite concepts first
- Core principle next
- Implications and applications last

Best for: Teaching new concepts, learning domains

### 3. The Problem-Solution Structure

Frame knowledge as answer to a question.
- State the problem/question clearly
- Present the solution/answer
- Explain why it works
- Note edge cases and limitations

Best for: Decision knowledge, how-to knowledge

### 4. The Analogical Bridge

Use familiar concepts to explain unfamiliar ones.
- Start with what reader already knows
- Bridge to new concept via analogy
- Detail what's similar and different
- Test understanding with examples

Best for: Abstract concepts, technical topics

### 5. The Contrast Structure

Define by what something is NOT.
- Establish boundaries
- Show what differs from similar concepts
- Clarify common misconceptions

Best for: Distinguishing similar concepts, nuance

## Structural Elements Within Notes

### Opening: The Gateway

The first 50-100 words determine whether readers continue.
Should establish:
- What this note is about (one sentence)
- Why it matters (relevance)
- What reader will understand after (expectation)

### Body: The Core

Structured for the primary purpose:
- **For reference:** Categorized sections, scannable
- **For explanation:** Logical flow, builds understanding
- **For procedure:** Sequential steps, clear prerequisites

### Closing: The Transfer

Final section should enable:
- Summary of key points
- Connection to related knowledge
- Next steps for further learning
- Confidence check (can reader now do X?)

## Dual-Purpose Note Structure

Notes serving both reference AND explanatory purposes need hybrid structure:

```
1. Quick-answer header (reference purpose)
   - One-line definition
   - Key facts in bullet list
   
2. Explanation section (explanatory purpose)
   - Conceptual progression
   
3. Details section (reference purpose)
   - Organized for scanning
   
4. Connection section (both)
   - Links to related concepts
```

## Frontmatter for Explanatory Intent

```yaml
presentation-style: reference|explanatory|hybrid
reading-time: 5min
prerequisites-needed: [list]
learning-outcomes:
  - "Understand X"
  - "Apply Y"
explanatory-structure: inverted-pyramid|progression|problem-solution|analogy|contrast
```

## Testing Explanatory Quality

### The TL;DR Test

Can you write a one-sentence summary that captures the essence?
If yes, the note has a clear purpose.

### The Teaching Test

If you had to teach this in 5 minutes, would the note structure support you?
If no, structure needs work.

### The Edge Case Test

Does the note handle exceptions, or does it present as universal?
Over-generalization signals poor explanatory structure.

### The Gap Test

After reading, do readers know what they DON'T know?
Good explanatory notes map the territory, not just the highlights.

## Link Strategy for Explanatory Notes

Explanatory notes should link:
- **Prerequisites:** Concepts reader needs first (backward links)
- **Extensions:** What this enables (forward links)
- **Alternatives:** Related but different approaches
- **Examples:** Concrete instances of abstract principle

## The Explanation-to-Reference Ratio

Not all notes need equal explanatory depth:
- Foundational concepts: High explanatory (teach thoroughly)
- Edge cases: Medium explanatory (context for exceptions)
- Reference data: Low explanatory (focus on findability)

**Rule:** Notes with high `learning-outcomes` should prioritize explanatory structure.

## Seed Rule Candidates

### Rule: Match Structure to Purpose

> When creating notes, determine the primary purpose (reference, explanatory, or hybrid) and structure accordingly. Include `presentation-style` frontmatter.

**Why:** Reference and explanatory structures conflict. Forced hybrid notes often serve neither purpose well.

**Test:** Can you identify the primary purpose of the last 5 notes created? Does structure match purpose?

### Rule: Include Learning Outcomes

> Notes intended for explanatory purposes should include explicit `learning-outcomes` frontmatter listing what readers will understand after reading.

**Why:** Without explicit outcomes, explanatory notes drift without clear teaching goal.

**Test:** For explanatory notes, can you list 1-3 things a reader will understand after reading?

### Rule: Structure Explanations with Recognized Patterns

> Explanatory notes should follow established pedagogical structures: inverted pyramid, conceptual progression, problem-solution, analogical bridge, or contrast.

**Why:** These patterns are proven to support understanding. Random structure wastes reader cognitive effort.

**Test:** Can you identify which pattern each explanatory note follows?

### Rule: Test Explanations for Teaching Effectiveness

> After creating explanatory notes, verify they actually explain: can a reader who knows nothing about the topic understand it?

**Why:** Writing to explain requires different skills than writing to document. Self-testing catches failures.

**Test:** Have someone unfamiliar with the topic read the note and report what they learned.

---

## Related Notes

- [[Zettelkasten Method]] — capture methods (covers note-taking approaches)
- [[Frontier Exploration - Learning Progression and Curriculum Design]] — multi-note sequences
- [[Frontier Exploration - Knowledge Abstraction Levels]] — concept tiers
- [[The Inverse Test]] — testing knowledge quality
- [[AI-Assisted Knowledge Management Seed]] — atomicity rules
- [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]] — learning how to learn

---

**Note:** This is frontier exploration. The rules proposed here may not be fully mature. Test them against your vault before adding to the Seed proper.
