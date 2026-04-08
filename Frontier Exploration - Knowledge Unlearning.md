---
last-reviewed: 2026-04-07
lifecycle: emerging
confidence: medium
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-severity: useful
---

# Frontier Exploration - Knowledge Unlearning in AI-Managed Knowledge Bases

> How should an AI agent handle situations where previously correct knowledge becomes incorrect, where core beliefs need revision, or where entire conceptual frameworks require replacement?

## The Gap

The Seed addresses **correction** (fixing errors), **deprecation** (marking superseded knowledge), and **contradiction detection** (finding conflicts between notes). However, it lacks guidance for the deeper cognitive process of **unlearning** — the active process of revising beliefs when new information contradicts not just individual facts but underlying assumptions.

### What's Different About Unlearning

| Correction | Deprecation | Unlearning |
|------------|-------------|------------|
| Fixing a specific error | Marking something as superseded | Revising an entire belief framework |
| Single note update | Add validity metadata | May cascade through multiple notes |
| "X was wrong" | "X was right, now replaced" | "The framework around X was wrong" |
| Local scope | Temporal scope | Conceptual scope |

### Examples Where Unlearning Applies

1. **Paradigm shifts**: A knowledge base built on outdated assumptions (e.g., pre-relativity physics) needs not just updates but framework revision
2. **Belief revision**: Personal knowledge that contradicted published wisdom turns out to be correct — requiring update of both personal note AND source credibility assumptions
3. **Context collapse**: Knowledge that was correct in one context (culture, era, individual circumstances) is fundamentally inapplicable in new context
4. **Supercedure replacement**: Not just deprecating one technique for another, but recognizing the old technique was based on wrong assumptions
5. **Meta-cognitive correction**: The AI recognizes it made reasoning errors, requiring revision of the logic pattern itself, not just the conclusion

## Why This Matters for AI Agents

### Current Seed Gaps

1. **No guidance on framework revision**: When should an AI flag that a cluster of notes needs revision vs. individual corrections?
2. **No belief revision tracking**: There's `correction-type:` but no guidance on when corrections are part of larger belief revision
3. **No detection of assumption conflicts**: Notes may contain implicit assumptions that become problematic when explicit
4. **No unlearning workflow**: No defined process for the AI to recognize "this isn't just an error, it's a category of error"

### The Cognitive Load Problem

Human knowledge management handles unlearning through:
- Feeling surprised/conflicted when contradicting information arrives
- Social feedback (someone corrects you)
- Emotional response to being wrong (resistance is natural)

AI agents lack these signals. They need explicit rules to detect when unlearning is needed.

## Proposed Framework

### Detection Triggers

An AI should flag potential unlearning when:

1. **Cluster contradictions**: 3+ notes contain related errors stemming from same flawed assumption
2. **Source reversal**: A previously trusted source is found to be systematically unreliable
3. **Framework mismatch**: External information contradicts not a specific claim but the model/framework underlying multiple notes
4. **Self-referential correction**: The AI's own reasoning process was flawed, requiring revision of a reasoning pattern
5. **Context revelation**: Assumptions about context (user expertise, environmental conditions, temporal context) were wrong

### Handling Workflow

```
1. DETECT cluster of related corrections
2. IDENTIFY underlying assumption that was wrong
3. AUDIT all notes depending on that assumption
4. REVISION: create new notes with corrected framework
5. DEPRECATE old framework notes (preserve for history)
6. DOCUMENT the unlearning event (what changed, why)
```

### Metadata Extension

```yaml
unlearning-event: true
unlearning-type: framework-revision|belief-reversal|assumption-failure|cognitive-correction
revised-assumption: "What was wrongly assumed"
cascade-impact: [list of affected notes]
unlearning-rationale: "Why the old framework was wrong"
```

### Documentation Requirements

When unlearning occurs, document:
- What belief/framework was abandoned
- What triggered the recognition
- What replaces it
- What other knowledge might depend on the old assumption
- Confidence level in the new framework

## Test Scenario

**Scenario**: An AI builds a knowledge base about nutrition using sources from 2010-2015. In 2020, major studies overturn several foundational assumptions about dietary fat, cholesterol guidelines, and fasting protocols.

**Current Seed behavior**: Individual notes get marked `outdated` or `correction-type: outdated`

**Desired behavior**: 
1. AI recognizes this is not individual errors but a framework revision
2. AI flags the entire nutritional foundation as needing re-evaluation
3. AI creates a meta-note documenting the paradigm shift
4. AI systematically updates dependent knowledge
5. AI preserves the old framework with clear documentation of why it was abandoned

## Edge Cases

### False Unlearning

Don't trigger unlearning when:
- Individual errors are truly independent (not same assumption)
- Correction is about emphasis or nuance, not framework
- Source disagreement is methodological, not about facts
- Apparent contradiction resolves with additional context

### Premature Unlearning

Resist unlearning when:
- New information is from low-reliability sources
- Contradiction is in early-stage research
- The "old" knowledge is actually disputed, not established
- Social or emotional reaction (desire to be right) drives the change

## Relationship to Existing Seed Rules

- **Complements**: Correction workflow, deprecation rules, contradiction detection
- **Extends**: Validates against "belief revision" aspect not covered
- **Distinguishes from**: Outdated knowledge (temporal), factual error (local scope)

## Implementation Priority

Medium — useful for mature vaults with significant knowledge accumulation where framework revision becomes more likely.

## See Also

- [[Frontier Exploration - Paradigm-Shift Knowledge]]
- [[Frontier Exploration - Unverifiable Knowledge Handling]]
- [[Seed Refinement - Self-Contradiction and Evolved Perspective Handling]]
- [[Handling Contradictory Sources]]
- [[AI-Assisted Knowledge Management Seed]] (correction and deprecation rules)
