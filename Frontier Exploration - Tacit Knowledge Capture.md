---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
tags:
  - frontier-exploration
  - tacit-knowledge
  - experiential-knowledge
  - knowledge-representation
author-type: ai-assisted
created: 2026-03-10
updated-by-merge: Stress Test - Tacit Knowledge Rules in Clinical Psychology (2026-03-14)
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

### Clinical Psychology Example

Clinical psychology and therapy have extraordinarily high tacit knowledge content:

- Therapeutic rapport is felt, not taught — the "right" amount of eye contact varies by culture and client personality
- "Reading the room" requires intuition developed through hundreds of sessions
- Knowing when to intervene vs. stay silent
- Detecting subtle client cues (body language, voice changes, affect shifts)
- Managing countertransference (therapist's emotional responses to clients)

**Key insight from stress testing:** Explicit frameworks (risk assessment tools, diagnostic criteria) work well, but therapeutic techniques need:
- `experiential-component: essential|partial|none` tagging
- `supervision-required: true` for skills needing direct oversight
- `proxy-guidance` for tacit knowledge (how to develop the skill)
- Explicit failure mode documentation

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

5. **Explicit frameworks work for structure, not judgment**: In clinical domains, assessment tools and protocols can be documented, but the clinical intuition for when to apply them remains tacit.

## Refined Test for Tacit Knowledge Domains

```
For each note in an experiential domain:
1. Is this fully documentable or does it require practice?
2. Can you identify what's tacit vs. explicit?
3. Is there guidance for developing the skill?
4. Are failure modes documented?
5. Does it require supervision to learn safely?
```

## Seed Rule Candidates

### Rule: Identify Tacit Knowledge Boundaries

> When creating notes in experiential domains (music, sports, arts, crafts), explicitly mark where written knowledge ends and tacit knowledge begins.

**Why**: Readers need to know what cannot be learned from text alone.

**Test**: In a domain-heavy note, can you identify what's missing that experience would provide?

### Rule: Document What Can't Be Captured

> When tacit knowledge resists capture, document the gap rather than leaving it implicit.

**Why**: An explicit acknowledgment of what's missing is more useful than a silent gap.

**Test**: If a note describes a process, does it acknowledge what judgment calls require experience?

### Rule: Tag Experiential Component in Domain Notes

> For domains where experiential knowledge is essential, include `experiential-component` frontmatter indicating what aspects require direct experience to fully understand.

**Why**: Without explicit tagging, readers and AI agents cannot assess whether a note represents complete knowledge or requires practice to apply.

**Test**: Pick 5 notes in an experiential domain. Can you identify which require experience to fully apply? Do they have explicit `experiential-component` markers?

**Implementation**: Use gradated tags:
```yaml
experiential-component: none  # fully documentable
experiential-component: partial  # core is documentable, "feel" requires experience
experiential-component: essential  # cannot be fully captured in text
```

For high-tacit domains (clinical psychology, therapy, music performance), also include:
```yaml
tacit-knowledge-severity: high|medium|low
supervision-required: true|false
proxy-guidance:
  - "Practice with recorded sessions"
  - "Receive live supervision"
failure-modes:
  - "Acting without consultation"
  - "Missing subtle cues"
```

---

## Related Notes

- [[Frontier Exploration - Institutional Knowledge]] — unwritten organizational knowledge (similar capture challenges)
- [[Handling Contradictory Sources]] — For objective vs subjective distinctions
- [[Frontier Exploration - Simulation-Based Knowledge]] — Related: both deal with knowledge that's hard to capture in text alone
- [[AI-Assisted Knowledge Management Seed]] — verification-status field for procedural content
- [[Stress Test - Atomicity Rule Across Domains]] (tacit knowledge handling)
- [[Stress Test - Hub Note Rule in Woodworking]] (tacit knowledge in tool feel)
- [[Frontier Gap - Embodied Knowledge]] — knowledge that IS the physical execution, not just resists articulation
- [[Frontier Exploration - Tool and Equipment Maintenance Knowledge]]
