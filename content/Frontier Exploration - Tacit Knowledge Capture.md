---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
tags:
  - frontier-exploration
  - tacit-knowledge
  - experiential-knowledge
  - knowledge-representation
author-type: ai-assisted
created: 2026-03-10
---

# Frontier Exploration - Tacit Knowledge Capture

## The Problem

Some knowledge cannot be easily transferred through written language. This is called **tacit knowledge** — the kind of knowledge someone has but can't fully explain. Examples:

- A musician "feeling" the groove — knowing when to push and when to lay back
- A master craftsman's intuition about when a joint is right
- A doctor's gut feeling about a patient that stems from experience
- An athlete's muscle memory and timing

This creates a fundamental challenge for AI-managed knowledge bases: **how do you capture knowledge that resists articulation?**

## Why It Matters for AI Knowledge Bases

1. **Explicit bias**: Most knowledge management assumes knowledge can be written down. Tacit knowledge breaks this assumption.

2. **Domain severity varies**: 
   - Mathematics has high explicit content (theorems, proofs)
   - Music composition, sports, and arts have high tacit content
   - A knowledge base about cooking has both (recipes are explicit, but "when it's done" is tacit)

3. **AI limitations**: LLMs can only work with what's written down. If tacit knowledge isn't captured, the knowledge base is fundamentally incomplete for certain domains.

## The Knowledge Articulability Spectrum

Knowledge exists on a spectrum from fully articulable to inherently tacit:

1. **Fully articulable knowledge** — Can be fully captured in text (facts, procedures, rules)
2. **Partially articulable** — Core is documentable, but the "feel" requires experience
3. **Inherently tacit** — Cannot be captured in text at all (Polanyi's "we know more than we can tell")

This spectrum has implications for knowledge bases:
- When should an AI acknowledge knowledge is incomplete without experience?
- How to tag notes that require experiential validation?
- Should "try it and see" guidance be included alongside theoretical rules?

### Domain Severity Examples

| Domain | Explicit Content | Tacit Content |
|--------|------------------|---------------|
| Mathematics | Theorems, proofs | Problem intuition |
| Music composition | Theory, harmony rules | "When a transition works" |
| Clinical skills | Anatomy, protocols | Bedside manner |
| Martial arts | Techniques | Combat readiness |
| Cooking | Recipes, ingredients | "When it's done" |
| Arts | Rules, techniques | Aesthetic judgment |

## Open Questions

1. **Marker granularity**: Should experiential markers be binary (has experiential component / doesn't) or gradated (requires: none/some/extensive)?

2. **Testing adequacy**: How do you test whether a note's experiential component is adequately captured?

3. **Domain inclusion**: Should experiential notes encourage building knowledge bases in experiential domains, or should those domains be excluded from the Seed's scope?

## Current Approaches

### Documentation of Tacit Knowledge

Attempt to articulate tacit knowledge through:
- Verbalized heuristics ("when the sauce coats the spoon...")
- Analogies and metaphors
- Common failure modes ("if it sounds sharp, you've gone too far")
- Apprenticeship descriptions in procedural notes

### Proxy Markers

Instead of capturing the knowledge itself, capture markers that point to it:
- Experience level indicators
- "Requires hands-on practice" warnings
- Links to video demonstrations
- Mentorship recommendations

### Failed Capture Documentation

When tacit knowledge can't be captured, document the failure:
- What questions remain unanswered?
- What would experience teach that this note cannot?
- What would a master do that this note doesn't explain?

## Testable Insights

1. **Tacit knowledge is most critical at decision points**: Notes about judgment calls, timing, and "feel" are most likely to contain tacit knowledge worth capturing.

2. **Failure modes are more articulable than success**: It's easier to describe what went wrong ("the rhythm felt off") than what makes it right.

3. **Multi-modal content helps**: A note about musical timing that links to audio examples captures more than text alone.

4. **Tacit knowledge compounds**: Each experience builds on previous ones. Capture accumulation paths, not just endpoints.

## Seed Rule Candidates

### Rule: Identify Tacit Knowledge Boundaries

> When creating notes in experiential domains (music, sports, arts, crafts), explicitly mark where written knowledge ends and tacit knowledge begins.

**Why**: Readers need to know what cannot be learned from text alone.

**Test**: In a domain-heavy note, can you identify what's missing that experience would provide?

### Rule: Document What Can't Be Captured

> When tacit knowledge resists capture, document the gap rather than leaving it implicit.

**Why**: An explicit acknowledgment of what's missing is more useful than a silent gap.

**Test**: If a note describes a process, does it acknowledge what judgment calls require experience?

---

## Related Notes

- [[Frontier Exploration - Institutional Knowledge]] — unwritten organizational knowledge (similar capture challenges)
- [[Handling Contradictory Sources]] — For objective vs subjective distinctions
- [[Frontier Exploration - Simulation-Based Knowledge]] — Related: both deal with knowledge that's hard to capture in text alone
- [[AI-Assisted Knowledge Management Seed]] — verification-status field for procedural content
- [[Stress Test - Atomicity Rule Across Domains]] (tacit knowledge handling)
- [[Stress Test - Hub Note Rule in Woodworking]] (tacit knowledge in tool feel)
- [[Frontier Exploration - Embodied and Performative Knowledge]] — knowledge that IS the physical execution, not just resists articulation
- [[Frontier Exploration - Tool and Equipment Maintenance Knowledge]]
