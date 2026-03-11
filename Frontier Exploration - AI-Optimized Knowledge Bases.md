---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - ai-optimization
  - retrieval-augmented-generation
  - knowledge-engineering
level: pattern
---

# Frontier Exploration: AI-Optimized Knowledge Bases

> How should knowledge bases be structured when the primary consumer is an AI agent rather than a human?

## The Problem Space

The current Seed assumes human readers who can:
- Follow natural language explanations
- Ask clarifying questions when confused
- Infer context from headings and structure
- Skip around non-linearly with understanding

AI agents have different needs:
- **Retrieval precision**: AI needs exact matches, not "close enough"
- **Unambiguous semantics**: Same term must mean same thing
- **Explicit prerequisites**: AI cannot "just know" background context
- **Machine-readable structure**: Frontmatter and tags must be parseable
- **Verification pathways**: AI needs to validate claims, not just cite them

## Key Distinctions

### Human-Native vs AI-Native Knowledge

| Aspect | Human-Native | AI-Native |
|--------|--------------|-----------|
| Explanation style | Narrative, layered, exploratory | Declarative, structured, complete |
| Context | Inferred from experience | Must be explicitly provided |
| Ambiguity | Tolerated, resolved by asking | Must be eliminated upfront |
| Links | Navigation aids | Semantic contracts |
| Examples | Illustrative, engaging | Verifiable, testable |

### Retrieval vs Comprehension

Human knowledge bases optimize for **comprehension** - humans can piece together meaning from partial information.

AI knowledge bases optimize for **retrieval** - the AI needs to find exactly what it needs and trust it's accurate.

This changes:
- How atomicity is defined (AI needs complete units, not "one idea" - what is an "idea" to a machine?)
- How links work (semantic contracts, not suggestions)
- How confidence is communicated (probabilities AI can compute with, not vague markers)

## Emerging Rules

### Rule: Define semantic contracts for every link

For AI-native vaults, links should be explicit semantic contracts:
- "This note defines term X used in the source note"
- "This note provides evidence for claim Y"
- "This note is a prerequisite for understanding Z"

**Test**: Can an AI determine why it should follow each link without reading both notes?

### Rule: Separate assertion from evidence

Human notes mix claims and support. AI notes should structure:
- Claims: standalone factual statements
- Evidence: separate notes with verification data
- Synthesis: notes that combine claims with source attribution

**Test**: Can an AI verify a claim by following evidence links without the source text?

### Rule: Use formal ontology for key relationships

Beyond wikilinks, AI-native vaults need typed relationships:
- `is-a`: taxonomy membership
- `part-of`: composition
- `contradicts`: opposing claims
- `supports`: evidence relationship
- `prerequisites`: dependency

**Test**: Can an AI answer "what does this note contradict?" by querying relationships?

### Rule: Optimize for semantic search, not keyword matching

AI retrieval (RAG) uses embeddings, not exact text match. Structure affects retrieval:
- Distinctive terminology (not generic "important" words)
- Key concepts in first 100 words
- Clear topic sentences
- Minimal homonyms

**Test**: Does a semantic search for this note's core concept return it as top result?

## Domain-Specific Considerations

### Prompt Engineering Knowledge

Prompts are procedural knowledge but with unique characteristics:
- Exact wording matters (small changes = big output differences)
- Context windows limit what can be included
- Prompt versions should be tracked like code

### Model Fine-Tuning Data

Knowledge for training differs from knowledge for retrieval:
- Needs consistent formatting
- Quality annotations matter more
- Diversity must be explicit

### Multi-Agent Knowledge

When multiple AI agents access the vault:
- Version conflicts matter more
- Locking/concurrency considerations
- Audit trails for changes

## Test Scenario

> An AI agent must answer: "What's the best way to cook salmon?"
> 
> From a human-native KB: Agent finds notes about salmon, cooking methods, reads several, synthesizes answer
> 
> From an AI-native KB: Agent finds verified procedural note with exact temps, times, confidence level, contradiction links to less-effective methods

**Which produces more reliable results?** The AI-native approach trades flexibility for precision.

## Open Questions

1. Can one vault serve both human and AI readers well, or are these fundamentally incompatible?
2. How do we verify AI-native knowledge is actually retrievable by AI systems?
3. Should AI-native notes include the prompt that would retrieve them?

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Stress Test - Atomicity Rule Across Domains]]
- [[Frontier Exploration - Procedural Knowledge Verification]]
- [[RAG (Retrieval-Augmented Generation)]]

---

**This is frontier exploration territory.** The rules here are hypotheses, not proven guidance. Test them. Refine them. If they fail, update or remove them.
