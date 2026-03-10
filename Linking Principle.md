---
protected: true
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Linking Principle

Notes must be **interconnected** through [[Wikilinks]] to form a knowledge graph.

## Core Rule
- Every note should link to at least **2-3 related notes**
- Links should be **content-driven** — only link when there's a meaningful connection
- Use descriptive link text: `[[Concept|Display Text]]` when appropriate
- Always consider: "What does this note relate to?"

## Quality Criteria

**Every link must pass the "why follow?" test:**
- Can you explain WHY the link exists in one sentence?
- Does the link add genuine value to the current note?
- Is there substantive connection, not just keyword matching?

| Good Link | Bad Link |
|-----------|----------|
| Explains a concept used in current note | Random keyword match |
| Provides deeper context on a related idea | "Also see..." without context |
| Connects to a concrete related concept | Link to everything mentioned |

## Link Density
- **Minimum**: 2-3 links per note (ensures connectivity)
- **Maximum**: Avoid over-linking (dilutes meaning)
- **Target**: Links that add genuine value
- See [[Graph Density Management]] for detailed strategies on managing link quality and quantity

## Connection Types
Make diverse connections:
- **Direct relevance** - Builds on each other
- **Contrast** - Opposition illuminates
- **Analogy** - Different domains, similar patterns
- **Cause/Effect** - One explains the other
- **Category** - Share common parent

### Examples

| Type | Example |
|------|---------|
| Direct relevance | [[Atomic Note Principle]] → [[Linking Principle]] (linking builds on atomicity) |
| Contrast | [[Progressive Summarization]] → [[Zettelkasten Method]] |
| Analogy | [[Progressive Summarization]] → [[Active Reading]] |
| Cause/Effect | [[The Forgetting Curve]] → (retention via active recall) |
| Category | [[Note Types]] → [[Atomic Note Principle]] |

## How to Find Connections

1. **Review neighbors** - What does this note connect to?
2. **Use graph tools** - Find 2-hop connections
3. **Write and ask** - "What does this remind me of?"
4. **Cross-pollinate** - Different domains connect unexpectedly

## Anti-Patterns

### 1. False Connections
Linking because you "should" not because it makes sense.

### 2. Generic Links
"See also" without context.

### 3. Over-Connecting
Every note → every note.

### 4. Keyword Matching
Links that only match words, not concepts.

## The Connection Test

Can you explain WHY these notes connect in one sentence? If not, the link is decorative.

## AI-Assisted Evaluation

AI can automatically evaluate link quality:
- Check if links are meaningful or decorative
- Identify link inflation (>5 outgoing links)
- Verify bidirectional links where appropriate
- Flag weak links that don't pass the "why follow?" test

**Human-in-the-loop:** AI evaluates, human confirms. Auto-deletion risks losing subtle connections.

## Test Criteria (for AI Evaluation)
- [ ] Does each note have 2-3 outgoing links?
- [ ] Are links meaningful (pass the "why follow?" test)?
- [ ] Can you explain each link's purpose in one sentence?
- [ ] Are links bidirectional where appropriate?
- [ ] Are links substantive, not just keyword matches?

## Bidirectional Awareness
- Most tools automatically show backlinks
- You don't need to manually create backlinks — focus on forward links from atomic notes
- Backlinks emerge naturally from good forward linking

## Related
- [[Atomic Note Principle]]
- [[Note Insertion Strategy]]
- [[Graph Traversal Efficiency]]
- [[Emergence in Knowledge Graphs]]
