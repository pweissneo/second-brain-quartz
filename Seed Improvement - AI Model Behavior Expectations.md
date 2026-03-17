---
last-reviewed: 2026-03-16
lifecycle: merged
confidence: high
author-type: ai-assisted
status: incorporated
review-by: 
tags:
  - seed-improvement
  - ai-prompt
  - model-behavior
---

# Seed Improvement - AI Model Behavior Expectations

> **STATUS:** This note's content has been incorporated into the Seed (see "AI Model Scope" and "Model Behavior" sections).
> 
> This note remains for historical context and detailed rationale.

> Adding guidance for tracking model-specific behavior and success criteria in prompt knowledge

## Problem

The Seed covers prompt effectiveness but doesn't address:
- Model behavior expectations differ between prompts
- Success criteria for prompts vary by model family
- What "good enough" output looks like is model-specific
- Failure modes vary significantly across models

## Current Gap

The Seed has:
- Rules for capturing prompts as knowledge
- Version tracking for prompts
- Failure mode documentation

But it's missing:
- How to define success criteria that work across models
- When to create model-specific prompt variants
- How to track which models a prompt was tested on
- What to do when a prompt works on one model but not another

## Why This Matters

A prompt that produces excellent results on GPT-4 may fail on Claude. Without explicit model behavior tracking:
1. Users can't determine if a prompt will work for their model
2. Failed prompts aren't debugged properly
3. Model-specific optimizations are lost
4. Knowledge base becomes unreliable for AI interaction guidance

## Proposed Seed Addition

### Model Behavior Metadata

Add fields for prompt notes:

```yaml
model-scope: [gpt-4, claude-3, gemini-pro]
model-tested: 
  - model: gpt-4
    result: excellent
    date: 2026-03-01
  - model: claude-3
    result: poor
    date: 2026-03-01
success-criteria: What "good enough" output looks like
failure-modes:
  - condition: Claude produces verbose output
    workaround: Add "be concise" to prompt
```

### Rules

**Rule:** For critical prompts, test across at least 2 different models before marking as verified.
- Why: Prompt effectiveness varies dramatically across models
- Test: For verified prompts, can you show results from 2+ models?

**Rule:** Mark model-specific knowledge with explicit model-status field — review and archive when models deprecate.
- Why: AI models deprecate or change behavior without notice
- Test: Do model-specific notes have review triggers for deprecation?

**Rule:** Document what "good enough" output looks like for each prompt, not just what ideal output looks like.
- Why: Model behavior varies; success criteria must be realistic
- Test: Can you determine if output is "good enough" without human judgment?

### Differentiation

This is different from:
- Prompt version history (captures iterations of the prompt itself)
- Prompt failure modes (captures what goes wrong, not which models fail)
- Model scope metadata (captures applicability, not tested behavior)

Model behavior expectations track: which models produce what quality of output, enabling informed model selection.

## Implementation

1. Add `model-scope`, `model-tested`, `success-criteria` fields to prompt notes
2. Create rule for multi-model testing requirement
3. Add deprecation triggers for model-specific prompts
4. Update prompt knowledge type to include behavior tracking

## Test Criteria

- [ ] Can you identify which models a prompt was tested on?
- [ ] Do critical prompts have multi-model test results?
- [ ] Can you determine if output meets "good enough" criteria?
- [ ] Are model-specific prompts flagged for deprecation review?

## Related

- [[Frontier Exploration - Capturing AI Prompt Knowledge]]
- [[Frontier Exploration - AI Model Version Dependencies in Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed]]