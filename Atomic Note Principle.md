---
protected: true
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
---

# Atomic Note Principle

A note must be **atomic** — it contains exactly **one single idea**.

## Rule
- Each note should focus on one concept, idea, or piece of knowledge
- If a note grows beyond its original scope, it should be **split** into separate atomic notes
- The maximum size for a note is approximately **200-300 words** or one screen's worth of content

## When to Split
Split a note when:
- Content exceeds ~300 words
- Multiple distinct ideas are covered
- The note could be broken into separate concepts
- You find yourself writing "also..." or "additionally..." multiple times

## Process for Splitting
1. **Identify distinct ideas** in the oversized note
2. **Create new atomic notes** for each idea
3. **Preserve core information** in the original note
4. **Link bidirectionally** — to new notes from original, and vice versa
5. **Update outgoing links** from other notes if needed
6. **Rebuild graph index** using `graph_build_index`

## Test Criteria (for AI Evaluation)
- [ ] Can you summarize the note in one sentence?
- [ ] Does the note cover only one idea?
- [ ] Is the note ≤300 words?
- [ ] Could this note be reused in a different context?
- [ ] Are there "also..." or "additionally..." patterns suggesting multiple ideas?

## AI-Assisted Splitting
AI can identify and split oversized notes:

| Trigger | Threshold |
|---------|-----------|
| Word count | > 300 words |
| Multiple ideas | > 1 H2/H3 heading |
| Concept density | > 3 distinct concepts |

### AI Splitting Process
1. **Identify** — Find oversized/overfull notes
2. **Analyze** — Identify natural split points
3. **Create** — Draft new atomic notes
4. **Link** — Create bidirectional links
5. **Verify** — Human reviews split quality

## Why It Matters
- Atomic notes are reusable across different contexts
- Smaller notes are easier to link and connect
- Graph traversal becomes more efficient with atomic units
- Keeps the graph traversable and navigable

## Examples
- ✅ Good: "[[Zettelkasten Method]] explains the core principle of atomic notes"
- ❌ Bad: "Zettelkasten Method and how to implement it and tools and examples"

## Edge Case: Procedural Content

Not all content should be split purely based on word count. The Seed notes that procedural content (recipes, tutorials, code samples) may legitimately exceed 300 words.

**Executable procedures** (recipes, code, technical specs) should stay together because:
- The user needs all steps in one place to execute the task
- Splitting breaks the workflow
- The "one idea" here is "how to do X" — it's inherently unified

**Educational tutorials** can be split because:
- They're explaining concepts, not enabling execution
- Each step may be reusable in other contexts

**Test: When to split procedural content**
Given a note >300 words:
1. Does the user need to execute this linearly from start to finish?
2. Would splitting this make it harder for a user to complete the task?
3. Are each "part" independently useful in other contexts?

If yes to 1-2 → keep together. If yes to 3 → consider splitting.

| Content | Decision | Reason |
|---------|----------|--------|
| Recipe (Beef Wellington) | Keep as one | User needs all steps to cook |
| CSS Centering Tutorial | Split | Each method (flex, grid) is reusable |
| Legal contract template | Keep as one | Full document needed for validity |
| "How to learn Python" | Split | Each resource/tip is independently useful |

## Related
- [[Linking Principle]]
- [[Graph Traversal Efficiency]]
- [[Note Types]]


## Stress Tests
This rule has been validated across multiple domains:

- [[Stress Test - Atomicity Rule in Music Theory]] — Tests edge cases for domain unit concepts (dynamics, tempo markings)
- [[Stress Test - Minimum Link Rule in Cooking]] — Tests minimum link requirements in recipe-based vaults
- [[Stress Test - 3-Hops Rule in Medicine]] — Tests navigation depth in medical taxonomies
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]] — Tests temporal data handling
