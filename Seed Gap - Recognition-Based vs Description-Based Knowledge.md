---
last-reviewed: 2026-03-27
last-updated: 2026-03-28
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-type: seed-missing
gap-phase: resolved
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-03-27
resolved: 2026-03-28
resolved-by: "[[AI-Assisted Knowledge Management Seed]] — rules added 2026-03-16 and 2026-03-22"
deprecated-date: 2026-03-28
deprecated-reason: superseded
---

# Seed Gap - Recognition-Based vs. Description-Based Knowledge

> ⚠️ **DEPRECATED**: This gap has been resolved. The Seed now includes explicit rules for recognition-based knowledge. This note is preserved for historical context.

## Gap Identification

**Domain**: Multiple domains (astronomy observation, medical diagnosis, art evaluation, equipment troubleshooting, sensory assessment)

**Gap Type**: Seed-missing

## What the Gap Is

The Seed's atomicity rule assumes all knowledge can be summarized in one sentence and that splitting creates reusable components. However, some knowledge exists not as information to describe, but as the **ability to perceive patterns** — recognition-based knowledge.

This gap manifests differently across domains:

1. **Astronomy**: "That faint smudge is M31" — the knowledge IS the recognition, not a description
2. **Medical**: Recognizing a heart murmur, identifying rash patterns, reading CT scans
3. **Art evaluation**: Judging whether a painting "works," identifying forgery indicators
4. **Equipment troubleshooting**: "That sound means bearing failure" — pattern recognition from audio
5. **Sensory assessment**: Evaluating wine, coffee, food — knowledge exists as taste/smell recognition

**Key distinction**: Description-based knowledge can be captured as "X is Y" statements. Recognition-based knowledge can only be developed through exposure and practice — you cannot read your way to being able to identify M31.

## Why This Matters for the Seed

The atomicity rule fails for recognition-based knowledge:
- Cannot be summarized in one sentence (the recognition IS the knowledge)
- Splitting into components loses the essential pattern-recognition capability
- The "test" for whether you have the knowledge is: Can you perceive it yourself?

The Seed lacks:
- Guidance on when to treat knowledge as recognition-based vs. description-based
- Distinction between knowledge you can transfer via notes vs. knowledge that requires practice/exposure
- Organization approach for recognition-based knowledge (pattern libraries, exemplar collections)

## Proposed Rule (Rule/Why/Test Format)

**Rule**: Identify when knowledge is recognition-based (ability to perceive patterns) vs. description-based (information that can be articulated). Apply different organizational approaches for each type.

**Why**: Recognition-based knowledge cannot be captured through text alone — it requires exposure, practice, and experiential development. Treating it as description-based leads to notes that cannot actually transfer the knowledge. Different knowledge types need different capture strategies.

**Test**:
1. Can this knowledge be fully articulated in text without losing essential meaning? If no → recognition-based
2. Would splitting this into atomic components destroy the pattern-recognition capability? If yes → recognition-based
3. Can someone who has never encountered this pattern learn it from reading your notes alone? If no → recognition-based
4. If all three point to recognition-based, organize as: pattern library + reference examples + deliberate practice recommendations, not as "atomic" information notes

## Implementation Guidance

For recognition-based knowledge:
- Create **pattern libraries** — collections of examples with labels (e.g., "M31 appearance at different apertures," "common equipment sounds and what they indicate")
- Include **reference exemplars** — images, recordings, samples that train the pattern recognition
- Add **deliberate practice guidance** — how to develop the recognition ability (not just what the pattern is)
- Use `knowledge-type: recognition-based` frontmatter
- Set expectations: notes cannot fully transfer this knowledge, only guide development

## See Also

- [[Frontier Exploration - Amateur Astronomy Knowledge Bases]] — original discovery
- [[Frontier Exploration - Sensory Anchor Standardization]] — related sensory knowledge capture
- [[Seed Gap - Embodied Knowledge]] — broader category of knowledge that resists text capture
- [[Seed Stress Test - Embodied Knowledge Rule]] — stress testing the current rule