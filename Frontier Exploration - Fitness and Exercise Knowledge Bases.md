---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
confidence: high
lifecycle: resolved
author-type: ai-assisted
schema-version: "1.0"
knowledge-source-type: analysis
analysis-type: comparative
evidence-tier: expert-consensus
tags:
  - domain-specific
  - fitness
  - exercise
  - health
  - frontier-exploration
resolved: 2026-04-02
resolution: "All 3 gaps now covered by Seed rules (lines 1474-1487, 1079-1107, 2429-2431)"
---

# Frontier Exploration: Fitness and Exercise Knowledge Bases

Fitness and exercise knowledge presents unique challenges for AI-assisted knowledge management that differ from other health domains.

## Domain Characteristics

### Individual Variation is Extreme

Unlike medical knowledge where variation is understood (drug responses vary), fitness knowledge has even more pronounced individual differences:
- **Genetic factors:** Muscle fiber composition, fast-twitch/slow-twitch dominance, recovery capacity
- **Movement patterns:** Some people have natural squat mechanics, others cannot squat without pain
- **Recovery capacity:** Training frequency that works for one person causes burnout in another
- **Equipment availability:** Knowledge about barbell exercises assumes gym access

### Knowledge Validity is Personal

A fitness claim like "squats are the best leg exercise" is:
- True for some body types
- False for others (mobility limitations, injury history)
- Neutral for others (not better, just different)

This is different from medical knowledge where there's usually a clearer "correct" answer per condition.

### Progressive Overload Principle

The core principle of fitness (progressively increase demand) is simple, but application varies:
- Linear progression (add weight each session)
- Wave loading (undulating intensity)
- Block periodization (phased focus)
- DUP (daily undulating periodization)

Each works, but which works *for you* requires experimentation.

## Seed Rule Gaps Identified

### Gap 1: User-Specific Applicability tagging ✅ RESOLVED

The Seed now includes `individual-variation` tagging:

**Seed Rule (lines 1474-1487):**
- Rule: For domains with extreme individual variation (fitness, nutrition, learning styles, sensory preferences), add `individual-variation` tagging to distinguish person-specific knowledge from universal principles.
- Why: In domains like fitness, nutrition, and personal productivity, the same advice can be correct for one person and incorrect for another. Without explicit individual-variation tagging, AI agents cannot distinguish "this works for everyone" from "this works for specific body types/conditions/preferences."
- Test: For fitness/nutrition/productivity notes: (1) Does the note include `individual-variation: high` for person-dependent knowledge? (2) Are person-specific experiments documented separately from universal principles? (3) Can you identify which claims apply broadly vs. only to specific individuals?

### Gap 2: Experimentation Tracking for Knowledge Validation ✅ RESOLVED

**Seed Rule (lines 1079-1107):**
- Rule: Track original knowledge provenance separately from sourced knowledge — for knowledge without external sources (original synthesis, personal experiments, untested hypotheses, intuition-based insights), use `source-origin` frontmatter to distinguish from external-sourced knowledge.
- Why: Enables systematic tracking of personal experiments with structured format (hypothesis, variables, duration, outcome, conclusion) via `source-origin-type: empirical` and `test-protocol` fields.
- Test: For notes without `source:` or `source-url:` frontmatter: (1) Is `source-origin: original` present? (2) Is `source-origin-type:` specified (synthesis|hypothesis|invention|intuition|experiential|empirical)? (3) Does confidence reflect the knowledge type?

### Gap 3: Conflicting Expert Consensus ✅ RESOLVED

**Seed Rule (lines 2429-2431):**
- Rule: For domains with active expert disagreement and conflicting studies, tag notes with `consensus-level: debated` AND include both major positions with evidence summary.
- Why: Fitness domains often have legitimate debate. Presenting one side as consensus misleads users.
- Test: For contested fitness claims, can you identify both major positions and the nature of disagreement?

## Resolution Summary

All three gaps identified in this frontier exploration are now resolved in the Seed:
1. **Individual variation** → Seed lines 1474-1487 (`individual-variation` tagging)
2. **Personal experimentation** → Seed lines 1079-1107 (`source-origin` frontmatter)
3. **Consensus levels** → Seed lines 2429-2431 (`consensus-level` frontmatter)

This frontier note served its purpose in identifying gaps that the Seed now addresses. The vault maintains zero gaps in the fitness domain area.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Core rules covering all three gaps
- [[Frontier Exploration - Personal Experimentation Results]]
- [[Frontier Exploration - Knowledge Consensus Level Tracking]]
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]]
- [[Seed Stress Test - Cooking Knowledge Base]] (similar individual variation issues)
