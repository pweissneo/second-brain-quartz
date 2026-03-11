---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Note Splitting Principle

When an atomic note grows too large, it must be **split** into smaller atomic notes and **rewired** to maintain graph health.

## Rule
Split a note when:
- Content exceeds ~200-300 words
- Multiple distinct ideas are covered
- The note could be broken into separate concepts

## Test Criteria (for AI Evaluation)
- [ ] Is the note ≤300 words?
- [ ] Does the note cover only one idea?
- [ ] Are there "also..." or "additionally..." patterns suggesting multiple ideas?
- [ ] Can this note be meaningfully linked to 2+ other notes?

## Process
1. **Identify distinct ideas** in the oversized note
2. **Create new atomic notes** for each idea
3. **Preserve core information** in the original note
4. **Link to new notes** from the original (and vice versa)
5. **Update outgoing links** from other notes if needed
6. **Rebuild graph index** using `graph_build_index`

## Warning Signs
- Note is hard to read at a glance
- You find yourself writing "also..." multiple times
- The note covers multiple topics

## Why It Matters
- Keeps the graph traversable
- Maintains atomicity
- Ensures efficient agent navigation

## Example
Original: "Learning Types.md" (too big)
Split into:
- "[[Supervised Learning]]"
- "[[Unsupervised Learning]]"
- "[[Reinforcement Learning]]"
Each links to the others and to the parent concept.

## AI-Assisted Splitting

AI can identify and split oversized notes into atomic units.

### AI Capabilities
- Detect notes exceeding word count thresholds (200-300 words)
- Identify multiple ideas within a single note
- Create split notes with appropriate content
- Preserve and rewire links bidirectionally

### AI Splitting Triggers
| Trigger | Threshold |
|---------|-----------|
| Word count | > 300 words |
| Multiple ideas | > 1 H2/H3 heading |
| Concept density | > 3 distinct concepts |

### AI Process
1. **Identify** — AI finds oversized/overfull notes
2. **Analyze** — AI identifies natural split points
3. **Create** — AI drafts new atomic notes
4. **Link** — AI creates bidirectional links
5. **Verify** — Human reviews split quality

### AI Test Criteria
- [ ] Can AI split notes while maintaining graph integrity?
- [ ] Are resulting notes truly atomic (one idea each)?
- [ ] Are all original links preserved appropriately?
- [ ] Are bidirectional links created where meaningful?

## Related
- [[Atomic Note Principle]]
- [[Graph Maintenance]]
- [[Graph Traversal Efficiency]]
