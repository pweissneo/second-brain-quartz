---
last-reviewed: 2026-03-17
confidence: emerging
knowledge-type: frontier-exploration
lifecycle: draft
author-type: ai-assisted
tags:
  - frontier-exploration
  - ai
  - prompt-engineering
---

# Frontier Exploration - Prompt Engineering Knowledge

## The Gap

The Seed covers:
- Knowledge about AI-generated content
- AI model version dependencies
- Source quality and verification for AI content

But it does NOT fully cover:
- **Prompt engineering knowledge** — knowledge about how to construct effective prompts for AI systems
- How to capture and organize prompts as reusable knowledge
- The difference between prompt "recipes" and the underlying principles

## Why This Matters

Prompt engineering is becoming a core skill:

1. **Prompts as procedures** — Effective prompts are like recipes: specific steps that produce consistent results
2. **Domain-specific prompts** — Medical prompts differ from legal prompts differ from creative prompts
3. **Prompt version evolution** — What works for GPT-4 may not work for Claude 3
4. **Prompt testing** — How do you verify a prompt works? What's the test criteria?

## The Challenge

Prompt engineering knowledge resists simple capture because:

1. **Context-dependent** — A prompt's effectiveness depends on the AI model, version, and context window
2. **Iterative refinement** — Prompts evolve through testing and refinement
3. **Principle vs. template** — Understanding WHY a prompt works (principle) differs from the prompt itself (template)
4. **Output format variations** — Same prompt can produce different output formats

## Knowledge Types in Prompt Engineering

### 1. Prompt Templates
Reusable prompt structures that can be filled in:
- System prompts
- User prompts  
- Few-shot examples

### 2. Prompt Principles
Underlying techniques that make prompts effective:
- Role assignment
- Constraint specification
- Output formatting
- Chain-of-thought

### 3. Prompt Testing Results
What worked and what didn't:
- Test cases
- Success criteria
- Failure modes

### 4. Model-Specific Knowledge
How prompts perform differently across models:
- Claude vs GPT vs Gemini quirks
- Version-specific behaviors
- Context window limitations

## Proposed Seed Rules

### Rule: Distinguish Prompt Templates from Principles

**Rule:** Tag prompt knowledge as either template (specific prompt text) or principle (technique that works across prompts).
**Why:** Templates are version-specific and may stop working when models update. Principles transfer across versions. Mixing them causes knowledge to become obsolete quickly.
**Test:** Can you separate your prompt notes into templates and principles? Are templates tagged with model/version specificity?

### Rule: Include Test Criteria for Prompts

**Rule:** For prompt knowledge, document what "success" looks like — include specific test cases and evaluation criteria.
**Why:** A prompt is a procedure that should be verifiable. Without test criteria, you can't distinguish effective prompts from ineffective ones.
**Test:** Does each prompt note include: (1) specific test input, (2) expected output characteristics, (3) evaluation criteria?

### Rule: Track Prompt Version Dependencies

**Rule:** Tag prompt templates with the AI model and version they were tested with.
**Why:** Prompts that work with one model/version may not work with others. Version-specific prompts should be explicitly marked.
**Test:** Can you identify which prompts are model-specific vs. model-agnostic?

## Questions for the Seed

1. Should prompt engineering be treated as a procedural domain (like cooking) or a declarative domain (like facts)?
2. How do we handle prompts that work differently on the same model at different times (model updates)?
3. Should prompts be captured as "knowledge" or as "tools"?

---

*This is a frontier exploration note. The insights here may become Seed rules if they prove universally applicable through stress testing.*

## Related Notes

- [[Frontier Exploration - AI Model Version Dependencies in Knowledge Bases]]
- [[Frontier Exploration - AI-Generated Content Verification]]
- [[Frontier Exploration - AI-Optimized Knowledge Bases]]
