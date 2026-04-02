---
last-reviewed: 2026-03-24
last-updated: 2026-03-25
confidence: emerging
lifecycle: evergreen
author-type: ai-assisted
knowledge-type: analysis
verification-status: unverified
tags:
  - frontier-exploration
  - ai-interactions
  - model-dependencies
  - prompt-engineering
---

# Frontier Exploration - AI Model Version Dependencies in Knowledge Bases

> How to handle knowledge that depends on specific AI models or versions — and what happens when models change.

## The Problem

Prompt effectiveness varies dramatically across AI models. A prompt that works brilliantly for GPT-4o may produce mediocre results from Claude 3.5 Sonnet. Knowledge bases that capture AI interaction knowledge face a unique challenge: **the underlying "tool" (the AI model) changes behavior without notice**, making previously-valuable knowledge suddenly obsolete.

This is different from:
- Software version dependencies (documented, intentional changes)
- Tool interface knowledge (UI changes slowly, documented)
- Domain knowledge (stable over time)

AI model behavior can shift subtly or dramatically between versions, and these changes are often undocumented.

## Examples

### Prompt Effectiveness Varies by Model
- A prompt designed for Claude might use "think silently" which doesn't work on GPT
- Chain-of-thought prompts work differently on models with different context windows
- JSON output requirements vary across models

### Model-Specific Capabilities
- Some models support function calling, others don't
- Vision capabilities exist on some models but not others
- Long context vs. short context affects how prompts should be structured

### Behavioral Shifts
- Models can become more or less compliant with certain types of requests
- Safety filters change, affecting what outputs are possible
- Reasoning style varies (some models explain more, others give direct answers)

## What's Already Covered

The Seed covers:
- Version scope for software/tools (rule about version metadata)
- Domain-specific knowledge dependencies
- Prompt knowledge with version tracking (proposed)
- Model scope in frontmatter (proposed)

## What's Missing

### Gap 1: Model Behavior Drift Detection

The Seed has no rule for **detecting when model behavior has changed**. Unlike software versions (which are announced), AI model changes can be subtle:
- Same prompt, different quality of output
- Same prompt, different format of response
- Same prompt, different reasoning approach

**Proposed Rule**: Track model behavior expectations separately from model version. Document what "good" output looks like for each prompt.

### Gap 2: Cross-Model Portability Testing

When capturing prompt knowledge, there's no systematic way to test whether the same prompt works across models:
- No rule for "portability testing" prompts across multiple models
- No guidance on when to create model-specific variants vs. generic prompts

**Proposed Rule**: For critical prompts, test across at least 2 different models before marking as "verified." Create model-specific variants when generic prompts fail.

### Gap 3: Deprecation of Model-Specific Knowledge

When a model is deprecated or significantly changed:
- No rule for how to handle knowledge that depended on that model
- No guidance on whether to preserve or archive model-specific notes

**Proposed Rule**: Mark model-specific knowledge with explicit `model-status: active|deprecated|unknown`. When models deprecate, review and either:
- Archive as historical record
- Translate to new model equivalent
- Mark as needing retesting

### Gap 4: Multi-Model Knowledge

What about knowledge that involves multiple AI models working together?
- No rule for capturing "workflows" that span models
- No guidance on dependencies between models in a pipeline

**Proposed Rule**: For multi-model workflows, document each model's role and the interfaces between them. Track which model handles which step.

## Proposed Rules

### Rule: For prompt knowledge, track model-specific success criteria

**Why**: What "good enough" output looks like varies by model. A prompt might produce acceptable results on one model but require refinement on another.

**Test**: For each prompt note: (1) Is there a model-specific success criteria? (2) Has it been tested on multiple models? (3) Are failures documented?

**Implementation**:
```yaml
model-scope: gpt-4o
tested-models:
  - model: gpt-4o
    status: working
    success-criteria: "Produces actionable output in <3 turns"
  - model: claude-3-5-sonnet
    status: partial
    notes: "Requires refinement for complex queries"
model-status: active
```

### Rule: Create model-agnostic core with model-specific outer layers

**Why**: Generic prompt principles (be clear, provide context, specify format) apply across models. Model-specific techniques (use XML tags for Claude, json_mode for OpenAI) are outer layers.

**Test**: For prompt notes: (1) Can you identify what's model-agnostic? (2) Is model-specific guidance separated? (3) Could someone adapt the core to a new model?

### Rule: Version prompt knowledge separately from vault version

**Why**: Prompt knowledge evolves at a different rate than domain knowledge. A domain note might be valid for years; a prompt note might need updates monthly.

**Test**: Can you identify which notes are "model-dependent" vs. "model-agnostic"? Do model-dependent notes have explicit review triggers?

### Rule: Track AI model dependencies in vault metadata

**Why**: The vault itself may depend on AI models for maintenance, generation, or processing. This dependency should be documented.

**Test**: Can you answer: (1) Which AI models does this vault depend on? (2) What would happen if those models became unavailable? (3) Is there a fallback strategy?

## Gap Analysis: Where would an AI get stuck?

An AI building a knowledge base with AI assistance would struggle with:
1. **No baseline for "normal" model behavior** — How do you know if a model has changed?
2. **No portability testing protocol** — How do you verify prompts work across models?
3. **No deprecation strategy** — What happens when the model you optimized for is replaced?
4. **No multi-model workflow guidance** — How do you capture knowledge about using multiple AIs together?

## Related Notes

- [[Frontier Exploration - AI-Optimized Knowledge Bases]] — Covers optimization but not version drift
- [[Frontier Exploration - Capturing AI Prompt Knowledge]] — Related but focuses on capture, not maintenance
- [[Frontier Exploration - API and External Service Dependencies]] — Similar pattern but for services, not models
- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules for knowledge management

## Test Case: Building a Prompt Library

Using only current Seed rules, an AI would create:
- Notes on individual prompts with success criteria
- Notes on model-specific techniques
- Notes on prompt versioning

But it would NOT capture:
- When model behavior has drifted from expectations
- Which prompts have been tested cross-model
- What to do when the optimized model deprecates
- How to maintain a prompt library as models evolve

This is a gap for any knowledge base that relies on AI assistance for creation or maintenance.
