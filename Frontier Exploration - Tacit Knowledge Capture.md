---
last-reviewed: 2026-03-22
confidence: emerging
lifecycle: evergreen
author-type: ai-assisted
knowledge-type: meta
access-pattern: learning
verification-status: unverified
verification-mode: source
tags:
  - frontier-exploration
  - methodology
  - tacit-knowledge
---

# Frontier Exploration - Tacit Knowledge Capture

> How do you capture knowledge that experts possess but cannot explicitly articulate?

## The Problem

The Seed assumes knowledge can be captured as explicit statements: rules, principles, procedures, definitions. But some of the most valuable knowledge exists as **tacit knowledge** — intuition, feel, pattern recognition, judgment calls that experts make but cannot explain how they make.

A master chef knows when a sauce is "done" by the way it coats a spoon. An experienced programmer senses a bug before debugging. A therapist reads body language instantly. This knowledge is real, valuable, and effectively captured in traditional explicit form.

## When This Applies

- Expert intuition and pattern recognition
- Judgment-based decisions without explicit criteria
- Skills learned through practice rather than study
- "I know it when I see it" type knowledge
- Knowledge that feels obvious once pointed out but isn't spontaneously articulable

## Seed Gap Analysis

### What the Seed Covers

- [[Frontier Gap - Embodied Knowledge]] — sensory and physical knowledge
- [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]] — experiential knowledge requiring execution
- [[AI-Assisted Knowledge Management Seed]] (contains verification workflow for practice-required knowledge)
- [[Frontier Exploration - Expert Heuristics and Rules of Thumb]] — captured expert shortcuts
- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — subjective quality assessment

### What's Missing

1. **Tacit vs. explicit boundary**: When is knowledge genuinely tacit vs. just not yet articulated?
2. **Extraction techniques**: Methods to surface tacit knowledge from experts
3. **Documentation proxies**: How to capture the "shape" of tacit knowledge when you can't capture the knowledge itself
4. **Calibration indicators**: How to verifyTacit knowledge is being captured accurately
5. **Transfer mechanisms**: How to help others develop the same tacit knowledge

## Proposed Approach

### Recognizing Tacit Knowledge

Tacit knowledge often manifests as:
- Expert hesitation when asked to explain
- "It depends" responses with implicit context
- Instant recognition without conscious analysis
- Disagreement among experts on criteria
- Successful execution without articulable process

**Test**: Can you find an expert who performs this task well but struggles to explain how? That's a strong indicator of tacit knowledge.

### Capture Strategies

1. **Decision documentation**: Ask experts to narrate their thinking during real decisions, even if they say "I just know"

2. **Contrast cases**: Present examples and ask "why these vs. those?" — experts often recognize patterns faster than they can describe them

3. **Proxy indicators**: Capture what experts look for, even if they can't articulate the full judgment:
   - "She checks X, Y, Z before deciding" (behavioral indicators)
   - "He pauses when A, B, C appear" (recognition cues)
   - "When X happens, she always considers Y" (conditional awareness)

4. **Analogical transfer**: Ask experts to compare to known explicit knowledge — "this is like X but different in Y ways"

5. **Outcome tracing**: After expert decisions, trace backward — what did they implicitly consider?

### Verification Approaches

Tacit knowledge verification differs from explicit knowledge:

1. **Multiple expert consistency**: Do other experts reach similar conclusions?
2. **Prediction accuracy**: Does the expert's tacit knowledge produce good outcomes?
3. **Transfer test**: Can the knowledge be developed in others, even if not explicitly taught?
4. **Contrast accuracy**: Can the expert consistently distinguish cases (even if not explain why)?

## Test

For your vault:
1. Can you identify knowledge that meets the "expert struggles to explain" test?
2. Have you used any extraction strategies (decision documentation, contrast cases, proxy indicators)?
3. Do you have verification approaches for tacit knowledge distinct from explicit verification?

## Implementation

### Frontmatter fields for tacit knowledge:

```yaml
tacit-knowledge: true
tacit-extraction-method: decision-documentation|contrast-cases|proxy-indicators|analogical-transfer|outcome-tracing
tacit-verification: multiple-expert|prediction-accuracy|transfer-test|contrast-accuracy
expert-consensus: high|medium|low|unknown
```

### Note structure for tacit knowledge:

```markdown
# [Domain] Tacit Knowledge

## What Experts Do
[Observable behaviors, decisions, recognition patterns]

## How It Manifests
[Specific contexts where this knowledge applies]

## Known Indicators
[Cues experts respond to, even if they can't explain criteria]

## Verification Status
[How this has been tested or confirmed]

## How to Develop
[Can this be taught? What practice develops it?]
```

## Edge Cases

- **Partially articulable**: Some tacit knowledge has explicit components. Capture what's articulable explicitly, mark remaining tacit parts.
- **Individual vs. universal**: Expert tacit knowledge may be personal (individual pattern recognition) or universal (expert consensus on recognition). Distinguish with `tacit-scope: personal|domain-expert`.
- **Evolving to explicit**: Tacit knowledge can become explicit over time as the domain matures. Track with `articulation-status: tacit|becoming-explicit|explicit`.

## See Also

- [[Frontier Gap - Embodied Knowledge]] — overlaps but focuses on sensory/tactile
- [[Frontier Exploration - Expert Heuristics and Rules of Thumb]] — related but assumes heuristics can be captured
- [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]] — verification differs
- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — subjective assessment
