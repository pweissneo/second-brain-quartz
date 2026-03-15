---
last-reviewed: 2026-03-15
confidence: emerging
author-type: ai-assisted
lifecycle: active
tags:
  - frontier-gap
  - tacit-knowledge
  - embodied-knowledge
  - experiential-knowledge
  - knowledge-representation
---

# Frontier Gap: Embodied and Tacit Knowledge in Knowledge Bases

> Knowledge of "how to do X" differs fundamentally from the ability to actually do X. A knowledge base can contain perfect instructions for a piano piece, yet the owner cannot play it. This gap explores how to capture and track physical, embodied, or practiced skills separately from declarative knowledge.

## The Problems

### Problem 1: Embodied Knowledge

Some knowledge cannot be effectively captured in text, no matter how well-structured the note. This is about knowledge that **IS** the physical execution:

- **Physical skills**: Playing piano, cooking, martial arts, surgery
- **Embodied knowledge**: Riding a bike, swimming, driving
- **Practiced skills**: Foreign language speaking, coding interviews, improv
- **Decaying knowledge**: Things you once knew but have forgotten

The same note about "how to do X" could represent:
1. Theory you read about (can explain but not do)
2. Something you used to do but can't anymore (atrophied)
3. Something you can do competently (current skill)
4. Something you're learning (in progress)
5. Something you want to learn (goal)

### Problem 2: Tacit Knowledge

Some knowledge cannot be easily transferred through written language. This is **tacit knowledge** — the kind of knowledge someone has but can't fully explain:

- A musician "feeling" the groove — knowing when to push and when to lay back
- A master craftsman's intuition about when a joint is right
- A doctor's gut feeling about a patient that stems from experience
- An athlete's muscle memory and timing

This creates a fundamental challenge for AI-managed knowledge bases: **how do you capture knowledge that resists articulation?**

## The Knowledge Articulability Spectrum

Knowledge exists on a spectrum from fully articulable to inherently tacit:

1. **Fully articulable knowledge** — Can be fully captured in text (facts, procedures, rules)
2. **Partially articulable** — Core is documentable, but the "feel" requires experience
3. **Inherently tacit** — Cannot be captured in text at all (Polanyi's "we know more than we can tell")
4. **Embodied** — The movement ITSELF is the knowledge; text describes what to look for, not what to do

The Seed optimizes for text-based knowledge capture. But some knowledge exists on this spectrum:

| Domain | Text Captures | Text Cannot Capture |
|--------|---------------|---------------------|
| Clinical examination | Technique names | Palpation feel, visual cues, tissue resistance |
| Musical performance | Note sequences | Tone quality, timing nuance, audience response |
| Physical therapy | Exercise descriptions | Proper form feedback, pain vs. gain assessment |
| Mechanical repair | Procedures | Sounds, smells, tactile feedback |
| Artistic drawing | Techniques | Line quality, pressure control, visual judgment |

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

## Current Seed Coverage

The Seed includes:
- `experiential-component` frontmatter: marks knowledge that requires direct experience to apply
- `prerequisites`: lists background notes needed
- `difficulty`: labels complexity level
- `status`: lifecycle stage (draft, active, evergreen, deprecated)

What's missing: 
1. **Proficiency tracking**: Current user proficiency level at the skill being documented
2. **Capture limits**: When to stop capturing and recommend hands-on learning
3. **Verification mode**: How to verify if embodied knowledge was learned correctly

## Proposed Solutions

### 1. Add Proficiency-Level Frontmatter

```yaml
proficiency-level: novice|learning|competent|proficient|master
last-practiced: 2026-03-01
practice-interval: weekly  # optimal practice frequency to maintain
decay-rate: physical  # physical skills decay faster than mental
```

#### Proficiency Levels

- **novalearning**: Have read about it, understand theory, cannot perform
- **learning**: Can perform with significant effort, inconsistent results
- **competent**: Can perform reliably, needs concentration
- **proficient**: Can perform fluently, can teach others
- **master**: Can perform effortlessly,创新能力, adapts spontaneously

### Why Proficiency Tracking Matters

1. **Retrieval filtering**: When I want to "cook dinner," I need recipes I can actually execute, not just ones I have notes about
2. **Practice prioritization**: Shows what skills are at risk of decay
3. **Goal tracking**: Shows what you want to learn vs. what you can do
4. **Honest self-assessment**: Distinguishes "knowing about" from "being able to do"

### Edge Cases for Proficiency Tracking

**Theoretical domains**: Mathematics, philosophy, physics - these don't decay physically. Use `decay-rate: mental` or omit.

**Knowledge vs. skill**: Some things are pure knowledge (history facts) with no skill component. Don't add proficiency to these.

**Social skills**: Interpersonal skills decay differently - they require other people. Use `decay-rate: social` and note interaction requirements.

**Atrophied skills**: If you used to be competent but stopped practicing, mark with `proficiency-level: atrophied` and `last-performed: YYYY-MM-DD`.

### Relationship to Existing Metadata

`proficiency-level` is about *your current ability*, orthogonal to:
- `difficulty`: how hard the skill is objectively
- `experiential-component`: whether the skill requires practice (yes/no)
- `status`: whether the note itself is complete

### 2. Add Learning-Mode Frontmatter

**Rule:** For knowledge domains where text is fundamentally insufficient, include explicit `learning-mode:` frontmatter with values: `text-sufficient | text-helps-practice | practice-required | teacher-required`.

**Why:** Readers and AI agents need to know upfront whether reading this note is sufficient or whether real-world practice is mandatory. False promises waste time and may cause harm.

**Test:** Can you categorize each note by learning mode? Do notes requiring practice clearly signal this?

### 3. Practice Guidance for Embodied Knowledge

**Rule:** Notes with `experiential-component: essential` must include explicit practice guidance: what to do, what feedback to seek, and when to stop self-learning and find a teacher.

**Why:** Telling someone "this requires practice" without guidance on HOW to practice is incomplete knowledge. The note should enable effective practice.

### 4. Capture Limits for Embodied Domains

**Rule:** In domains where embodied knowledge dominates, cap text capture at "enough to know you need hands-on learning" rather than attempting comprehensive coverage.

**Why:** Attempting to fully capture embodied knowledge produces false confidence. Better to acknowledge the limit and guide toward practice.

### 5. Verification Through Performance

**Rule:** For knowledge marked `learning-mode: practice-required` or beyond, verification must be through practical demonstration, not verbal or written recall.

**Why:** Someone can describe a clinical examination perfectly yet perform it incorrectly. Text-based verification creates false confidence in embodied domains.

### 6. Multi-Media-First Capture

**Rule:** For embodied knowledge domains (performing arts, physical skills, clinical procedures), use multi-media-first capture with text summary as secondary.
- Video/audio IS the primary note
- Text describes what to look for, not what to do
- Include explicit `execution-criteria` frontmatter for verification

**Why:** Embodied knowledge cannot exist in text — the movement ITSELF is the knowledge. Text-only capture produces false confidence.

### 7. Tag Embodied Knowledge with Verification Mode

**Rule:** Tag embodied knowledge with `knowledge-type: embodied` and `verification-mode: real-time` to distinguish from standard tacit knowledge.

**Why:** Most knowledge can be verified after creation (sources, tests). Embodied knowledge is validated during execution, by audience response, by physical feedback.

### 8. Handle Ensemble Knowledge Separately

**Rule:** For ensemble knowledge (timing between musicians, stage blocking), use `knowledge-type: collective` with explicit participant requirements.

**Why:** Some knowledge only exists in the group context. Individual notes cannot capture what only emerges from interaction.

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

## Test Criteria (for AI Evaluation)

- [ ] Can you distinguish between: A recipe you can cook (competent+) vs. one you just bookmarked (novalearning)
- [ ] Can you identify domains where text capture is fundamentally insufficient?
- [ ] Do notes in these domains include learning-mode guidance?
- [ ] Is there guidance on when to seek hands-on instruction?
- [ ] Can you distinguish "text-helps" from "practice-required" knowledge?
- [ ] For embodied domains: Is media the primary capture?
- [ ] Does the note pass the embodied knowledge test:
  - Can this knowledge be fully captured in text without media?
  - Is there a "correct" physical execution that can be verified?
  - Does knowledge emerge from execution context, not just describe it?

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

---

## Related Notes

- [[Frontier Exploration - Institutional Knowledge]] — unwritten organizational knowledge (similar capture challenges)
- [[Handling Contradictory Sources]] — For objective vs subjective distinctions
- [[Frontier Exploration - Simulation-Based Knowledge]] — Related: both deal with knowledge that's hard to capture in text alone
- [[AI-Assisted Knowledge Management Seed]] — verification-status field for procedural content
- [[Stress Test - Atomicity Rule Across Domains]] (tacit knowledge handling)
- [[Stress Test - Hub Note Rule in Woodworking]] (tacit knowledge in tool feel)
- [[Stress Test - Experiential Knowledge Rule (Cross-Domain Analysis)]] — Tests experiential knowledge handling
- [[Frontier Exploration - Context-Specific Learning Insights]] — Context-dependent knowledge
- [[Frontier Exploration - Tool and Equipment Maintenance Knowledge]]
- [[Frontier Exploration - Multi-Modal Knowledge]] — Media alongside text (infrastructure)
- [[Knowledge Base Workflow]] — Capture and processing workflow

---

**Note:** This is frontier exploration. The rules proposed here may not be fully mature. Test them against your vault before adding to the Seed proper.
