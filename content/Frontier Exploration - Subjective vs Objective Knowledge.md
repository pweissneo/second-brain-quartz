---
last-reviewed: 2026-03-10
confidence: emerging
lifecycle: deprecated
status: deprecated
replaced-by: Handling Contradictory Sources
tags: [frontier, knowledge-types, subjectivity, quality-control, deprecated]
---

> **DEPRECATED:** This note's content has been incorporated into the Seed (Section 6: Knowledge Processing - Subjective Knowledge rules). The practical guidance is now in [[Handling Contradictory Sources]].

# Frontier Exploration - Subjective vs Objective Knowledge

> **Status:** This exploration has been incorporated into the Seed (Section 6: Knowledge Processing - Subjective Knowledge rules). This note now serves as a validated example and deeper exploration.
>
> How should a knowledge base handle domains where there's no objective truth?

## The Problem

Some knowledge domains have objective answers:
- Medicine: "Does this treatment work?" (can be tested)
- Science: "What is the composition of water?" (factual)
- Law: "What does this statute say?" (definitive)

Other domains are inherently subjective:
- Art: "Is this a good painting?" (opinion)
- Music: "Is this a beautiful melody?" (taste)
- Writing: "Is this prose style effective?" (judgment)
- Design: "Is this user interface intuitive?" (perspective-dependent)

The current Seed handles **objective contradictions** via synthesis notes, but has limited guidance for **inherently subjective knowledge**.

## Why This Matters for AI Knowledge Bases

AI agents default to treating claims as verifiable facts. When encountering:
- "This is the best jazz album of 1959"
- "Minimalist design is superior to baroque"
- "This writing style is more engaging"

An AI needs rules to:
1. Recognize subjective claims vs objective ones
2. Present perspectives rather than "the truth"
3. Avoid fabricating consensus that doesn't exist
4. Distribute expert opinions fairly without picking winners

## Key Distinctions

### Descriptive vs Prescriptive
- **Descriptive**: What *is* (facts, data, observations)
- **Prescriptive**: What *should be* (opinions, preferences, recommendations)

Music theory has both:
- Descriptive: "This chord progression uses V7 to I" (verifiable)
- Prescriptive: "You should avoid parallel fifths" (style opinion)

### Consensus vs Controversy
- **Established consensus**: Widely agreed within a community
- **Active controversy**: Debated among experts
- **Personal preference**: Individual taste with no community debate

### Quality vs Taste
- **Quality claims**: Can be argued with evidence (technique, craft)
- **Taste claims**: Pure preference, no right answer

## Proposed Seed Rules

### Rule: Tag subjective claims with `claim-type: subjective` or `claim-type: objective`

**Why:** Without explicit tagging, AI agents cannot distinguish factual claims from opinions, leading to misrepresentation of knowledge types.

**Test:** Pick 10 notes containing evaluative language (best, worst, good, bad, should, shouldn't). Can you categorize each as objective quality (verifiable) or subjective taste (preference)?

### Rule: Present subjective perspectives as "Perspectives" sections rather than single conclusions

**Why:** A knowledge base should represent reality accurately. If experts disagree or no consensus exists, saying "the best approach is X" misleads readers.

**Test:** For notes containing subjective claims: (1) Is there a single conclusion presented as fact? (2) Are alternative perspectives listed? (3) Does the note acknowledge subjectivity?

### Rule: Distinguish craft criticism from aesthetic judgment

**Why:** "This sculpture has anatomical errors" is verifiable (craft). "This sculpture is beautiful" is subjective (aesthetic). Conflating them confuses readers.

**Test:** For notes evaluating creative work: (1) Are technical/measurable claims separated from aesthetic judgments? (2) Can readers distinguish what is opinion vs what can be verified?

### Rule: Use `consensus: high/medium/low/none` for subjective claims

**Why:** "Most critics praise this" differs from "this is objectively the best" — both are subjective but represent different levels of community agreement.

**Test:** Can you assign a consensus level to evaluative claims in your vault? Are high-consensus claims distinguished from controversial or minority opinions?

### Rule: Cite sources for subjective claims as rigorously as objective ones

**Why:** "This is a great novel" becomes useful when we know *who* thinks so — a noted critic, a genre expert, a community majority.

**Test:** For subjective claims: (1) Are the sources of opinion identified? (2) Can readers evaluate the credibility of those sources?

## Application to Music Theory

Music knowledge illustrates these distinctions:

| Claim Type | Example | Handling |
|------------|---------|----------|
| Descriptive factual | "Beethoven's 9th uses D minor" | Standard fact format |
| Technical prescription | "Avoid parallel fifths" | Tag as `claim-type: subjective` with `context: Western classical tradition` |
| Aesthetic judgment | "Schubert's lieder are more emotional than Mozart's" | Tag as `claim-type: subjective`, present multiple perspectives |
| Quality claim | "This is the greatest symphony" | Tag with `consensus: low/medium/high`, cite critics |

## Edge Cases

### When Subjective Becomes Objective
Some domains have "objective quality" frameworks:
- Code: does it compile? does it pass tests?
- Recipes: does the dish turn out as described?
- Structural engineering: will the bridge hold?

These are objective tests for what might seem subjective. Distinguish craft (testable) from taste (not testable).

### Cultural Subjectivity
What's considered "good" varies by culture:
- Western vs Eastern harmony
- Pop vs classical aesthetics
- Traditional vs experimental art

Tag cultural scope: `culture: [Western, Eastern]` etc.

### Temporal Subjectivity
Tastes change over time:
- What's considered "modern" in 1950 vs 2020
- Revival of previously-derided styles

Include temporal context for evaluative claims.

## Related Notes

- [[Handling Contradictory Sources]] — For objective contradictions
- [[Handling Contradictory Sources]] — When multiple approaches are valid (merged from Parallel Valid Alternatives)
- [[Confidence Markers]] — For knowledge reliability
- [[Frontier Exploration - Framework-Dependent Knowledge]] — For knowledge that varies by framework
