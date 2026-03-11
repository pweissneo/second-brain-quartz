---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - ai-interaction
  - prompt-engineering
  - knowledge-types
level: pattern
---

# Frontier Exploration: Capturing AI Prompt Knowledge

> How should a knowledge base structure knowledge about interacting with AI systems through prompts?

## The Problem

Prompt engineering is a form of procedural knowledge, but it has unique characteristics that existing Seed rules don't fully address:

1. **Exact wording matters** — Small changes in prompts can produce dramatically different outputs
2. **Context windows limit inclusion** — Prompts compete with other content for limited context
3. **Versioning is essential** — Prompts evolve like code; a "v1" vs "v2" matters
4. **Effectiveness is context-dependent** — A prompt that works for one model may fail for another
5. **It's meta-knowledge** — Prompts are knowledge *about* using knowledge, not knowledge itself

## Why Existing Rules Are Insufficient

### Atomicity

The atomicity rule (one idea per note) doesn't map cleanly to prompts:

- A prompt can be atomic (single clear instruction) but contain multiple "ideas" in the Seed sense
- The "one idea" test fails: Does "Write a summary of this article" contain one idea or three (write, summary, article)?

**Test:** Does the prompt achieve one clear output goal? That's the atomic unit for prompts, not semantic ideas.

### Verification

The verification rule expects testable procedures:

- Prompts can't be verified by execution alone — you need to evaluate the *quality* of output
- There's no ground truth for "good" AI output in many cases
- Effectiveness depends on the model, temperature, and other parameters

**Test:** For prompt notes, verification means: Can you describe what "good enough" output looks like? Is there an evaluation criteria?

### Confidence Markers

Existing confidence markers (high/emerging/disputed/obsolete) don't capture what's needed:

- A prompt might work for GPT-4 but not Claude
- A prompt might work today but fail after model updates
- Confidence needs model-specific and version-specific tags

**Test:** Does the prompt include model-specific scope? Is the model's version noted?

## Proposed Rules for Prompt Knowledge

### Rule: Include Model Scope for Every Prompt

**Rule:** Every prompt note must specify which AI models or model families it works with, using `model-scope:` in frontmatter.

**Why:** Prompts are not universal — effectiveness varies dramatically across models. A prompt that works for GPT-4 may produce poor results from Claude. Without explicit model scope, readers and AIs cannot assess applicability.

**Test:** Can you identify which model(s) this prompt was designed for? Is there a `model-scope:` field?

### Rule: Track Prompt Version

**Rule:** Treat prompt notes like code — include version tracking via `prompt-version:` and document significant changes in the note history.

**Why:** Prompts evolve through iteration. A v1 prompt that failed might inform a v2 that works. Keeping version history captures the learning process and allows rollback if newer versions fail.

**Test:** If this prompt has been improved, is there a version history? Can you access earlier versions?

### Rule: Define Success Criteria

**Rule:** Every prompt note must include explicit criteria for what "good enough" output looks like — not just what the prompt asks for, but how to evaluate whether it succeeded.

**Why:** Without success criteria, verification is subjective. "Write a good summary" is unverifiable; "Summary under 100 words capturing main thesis and 3 key points" is verifiable.

**Test:** Can an AI determine whether a given output satisfies this prompt without human judgment? Is success measurable?

### Rule: Separate Prompt Template from Prompt Instance

**Rule:** Distinguish between reusable prompt templates (with placeholders) and instantiated prompts (with specific values filled in).

**Why:** Templates are portable across contexts; instances are specific. Mixing them loses reusability and creates version bloat.

**Test:** Can this prompt be adapted to new contexts by replacing placeholders? Is the structure reusable?

### Rule: Include Failure Modes

**Rule:** Document known failure modes — what does this prompt produce when it doesn't work? What inputs cause problems?

**Why:** Understanding what doesn't work is as valuable as knowing what does. Failure modes help debug and improve prompts.

**Test:** Are common failure modes documented? Can a user anticipate what will go wrong?

## Knowledge Structure for Prompt Notes

```yaml
---
title: "Prompt: Extract Key Arguments"
model-scope: [gpt-4, gpt-4-turbo]
prompt-version: "1.2"
created: 2026-03-01
last-tested: 2026-03-10
verification-status: tested
success-criteria: |
  - Output contains 3-5 distinct arguments
  - Each argument is under 30 words
  - Arguments are quoted verbatim from source
failure-modes: |
  - Produces summaries instead of arguments when source is narrative
  - Misses implicit arguments in opinion pieces
  - Overlaps arguments when source has repeated points
tags:
  - prompt
  - extraction
  - argument-analysis
---
```

## Relationship to Existing Seed Rules

This extends rather than replaces existing rules:

| Seed Rule | Application to Prompts |
|-----------|----------------------|
| Atomicity | One clear output goal per prompt note |
| Links | Link to: related prompts, the knowledge domain it extracts, evaluation criteria |
| Verification | Tested vs untested vs failed — track outputs |
| Confidence | Model-specific confidence (works for X, unknown for Y) |
| Evolution | Version history tracks prompt improvement |

## Edge Cases

### Prompts for Different Tasks on Same Model

Different task types require different approaches:
- Extraction prompts (pull specific data)
- Generation prompts (create new content)
- Transformation prompts (convert format)
- Analysis prompts (evaluate or compare)

Structure these as separate notes or use task-type tags.

### Prompts That Depend on Context

Some prompts assume context (previous messages, system prompts). Document required context:
- What must precede this prompt?
- What system instructions are assumed?
- How does context affect output?

### Multi-Step Prompt Chains

When multiple prompts must run in sequence:
- Create a hub note for the chain
- Document the order and dependencies
- Track outputs between steps

## Test Scenario

> An AI agent needs to extract structured data from a research paper.
> 
> It should find: A prompt note with model-scope (gpt-4), version history, success criteria (JSON with specific fields), failure modes (what happens with tables vs prose), and links to related extraction prompts.
> 
> Without prompt-specific structure: Agent finds generic "how to extract data" notes that don't capture the prompt itself.

## Related

- [[AI-Assisted Knowledge Management Seed]] — The Seed being extended
- [[Frontier Exploration - AI-Optimized Knowledge Bases]] — Related AI-native structure
- [[Frontier Exploration - Procedural Knowledge Verification]] — Verification principles
- [[Confidence Markers]] — Reliability signaling

---

**This is frontier exploration territory.** Prompt engineering is a rapidly evolving field. These rules are hypotheses to test. Refine them as the domain matures.
