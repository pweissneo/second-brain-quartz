---
last-reviewed: 2026-03-10
lifecycle: evergreen
confidence: high
tags:
  - seed-rule
  - synthesis
  - contradiction
  - sources
---

# Handling Contradictory Sources

> When multiple credible sources disagree, how should an AI agent capture and organize the disagreement?

## The Problem

The Seed requires citing sources, but assumes sources agree. In reality:
- Scientific consensus shifts over time
- Different schools of thought exist in every field
- Studies sometimes produce conflicting results
- Expert opinions vary

An AI agent building a knowledge base needs rules for these situations.

## The Gap

The Seed has no guidance for:
1. **When sources contradict** — do you pick one? Capture both? Note the disagreement?
2. **How to organize contradiction** — separate notes? A single note with competing views?
3. **Confidence tracking** — how to signal "this is settled" vs "this is debated"
4. **Temporal shifts** — when consensus changes, how to update without orphaning the old view

## Objective vs Subjective Contradictions

When sources disagree, the response should depend on whether the contradiction is **objective** (fact-based) or **subjective** (preference-based).

### Objective Contradictions
- Food safety claims (one source says safe, another says dangerous)
- Scientific facts (chemistry, physics of cooking)
- Technical specifications (temperatures, times, ratios)
- Historical facts

**Action:** Must create synthesis. Present both viewpoints with source attribution. Do not choose one over the other.

### Subjective Contradictions
- Taste preferences ("best" ingredient, "most flavorful" technique)
- Style preferences (authentic vs. modernized)
- Personal opinions on quality

**Action:** Can present as options/preferences. "Some cooks prefer X, others prefer Y" is sufficient. Synthesis note not required.

### Why This Distinction Matters

- Objective contradictions: Getting it wrong has real consequences (health, safety)
- Subjective contradictions: Presenting as fact limits reader's own judgment
- Over-synthesizing subjective opinions makes the vault feel like it's avoiding taking stances

## The Test (Combined)

**For handling contradictory sources:**
Can you identify at least one note in the vault where sources disagreed? Does that note present multiple viewpoints rather than picking one?

**For objective vs subjective:**
For a note about a source contradiction:
1. **Is there an objective truth at stake?** (safety, correctness, accuracy)
2. **Could following the wrong side cause harm or significant error?**
3. **Do experts disagree because of incomplete data, or because of different preferences?**

If yes to 1-2 → Create synthesis note with balanced presentation
If yes to 3 → Present as multiple perspectives without synthesis

## Proposed Seed Rule

**Rule:** When sources contradict, create a synthesis note that presents both perspectives with source attribution, rather than choosing one side. Distinguish between objective contradictions (which require synthesis) and subjective ones (which can be presented as options).

**Why:** Choosing one side loses information. A knowledge base should represent reality accurately, including uncertainty and debate. Objective contradictions have real consequences if wrong; subjective ones should preserve reader autonomy.

**Test:** Can you identify at least one note in the vault where sources disagreed? Does it present multiple viewpoints appropriately based on whether the contradiction is objective or subjective?

## Alternative: Confidence Levels

Consider adding frontmatter to notes:
- `confidence: high` — established consensus
- `confidence: emerging` — newer findings, may change
- `confidence: disputed` — significant disagreement among experts
- `confidence: obsolete` — superseded by newer understanding

This helps readers understand the reliability of each piece of knowledge without reading the full source chain.

## Parallel Valid Alternatives

The Seed also addresses a related but distinct case: **parallel valid alternatives** — when multiple approaches are ALL valid, NONE is deprecated, and the choice between them is context-dependent, not about correctness.

### Examples

| Domain | Parallel Alternatives |
|--------|---------------------|
| Programming | REST or GraphQL for APIs — both valid, choice depends on use case |
| Cooking | Cast iron or stainless steel for searing — both produce excellent results |
| Writing | Active voice vs. passive voice — both grammatically correct, different effects |
| Project Management | Agile vs. Waterfall — both valid methodologies |

### How This Differs From Contradictory Sources

| Contradictory Sources | Parallel Valid Alternatives |
|----------------------|------------------------------|
| Experts disagree on what's correct | Experts agree multiple approaches work |
| Must synthesize or pick winner | Present as equal options |
| Getting it "wrong" matters | No wrong choice — context-dependent |

### Why This Matters for AI Agents

Without guidance on parallel alternatives:
1. AI creates duplicate notes for equivalent approaches
2. AI picks a "winner" when none exists, misleading readers
3. AI presents context-dependent choices as absolute rules
4. Knowledge base becomes opinionated when it should be neutral

### Testing the Gap

A knowledge base has a gap in handling equivalents if:
1. You find notes that claim one approach is "best" when alternatives exist
2. Notes about techniques don't acknowledge that other techniques achieve similar results
3. A learner cannot find guidance on which equivalent approach to use when

### Handling Parallel Valid Alternatives

When multiple approaches are ALL valid (none is "wrong"), structure the knowledge based on the nature of the decision:

| Scenario | Recommended Structure |
|----------|---------------------|
| 2 alternatives, comparison IS the insight | Single comparative note |
| 2 alternatives, each needs substantial development | Separate notes + bidirectional links |
| 3+ alternatives | Hub + spoke pattern |
| Alternatives are context-dependent (different styles, use cases) | Hub + tagged variants |

**Rule:** When multiple equivalently valid approaches exist for achieving the same goal, present them as alternatives with explicit applicability context — not as synthesized "best" approach.

**Test:** For notes containing absolute statements (always/never/best):
1. Are there alternative approaches that also work?
2. If yes, does the note present them as alternatives?
3. Are the contexts where each approach is preferred specified?

**Implementation:** Use `alternatives` frontmatter to explicitly mark notes with parallel valid options:

```yaml
---
alternatives:
  - Alternative Approach A
  - Alternative Approach B
context-factors:
  - Use A when: [specific context]
  - Use B when: [different context]
---
```

## Cultural and Temporal Subjectivity

What's considered "good" varies by culture and time:
- Western vs Eastern harmony preferences in music
- Traditional vs modern aesthetics
- What's "classic" changes over time

**Action:** Tag cultural scope with `culture:` and temporal scope with `temporal:` for evaluative claims.

## When Subjective Becomes Objective (Craft vs Taste)

Some domains have "objective quality" frameworks:
- Code: does it compile? does it pass tests?
- Recipes: does the dish turn out as described?
- Structural engineering: will the bridge hold?

These are objective tests for what might seem subjective. Distinguish:
- **Craft claims**: verifiable (technique, functionality)
- **Taste claims**: pure preference, no right answer

## Personal Experience vs. External Sources

When your personal experience contradicts published sources, the vault should capture both:

### The Problem in Practice

You read that a technique, approach, or method is "best" according to sources. But your own experience shows something different works better for you. Examples:
- A cooking source says "always rest meat 15 minutes" but you find it gets cold
- A productivity source says "morning hours are best for deep work" but you're night productive
- A learning source says "spaced repetition is optimal" but you learn better by cramming

### Why This Matters

Personal experience is a valid form of knowledge, but it conflicts with the "cite sources" principle. If you only capture what sources say, you lose your own learned wisdom. If you ignore sources, you lose external validation.

### Approaches

#### 1. Create a Synthesis Note
Present both perspectives with explicit attribution:
- What sources say
- What your experience shows  
- Your current conclusion

This preserves both external knowledge and personal learning.

#### 2. Use Personal vs. General Tags
Tag notes with scope:
- `scope: general` - what works for most people
- `scope: personal` - what works for you specifically

#### 3. Document the Context
Your experience might be context-dependent. Document:
- Your specific conditions (equipment, environment, constraints)
- Why you think the difference exists
- What would change your conclusion

### When Personal Experience Wins

Consider prioritizing personal experience over sources when:
1. You have extensive direct experience (not one-time trial)
2. Your context differs significantly from source conditions
3. Multiple attempts consistently show the same result
4. You understand WHY your experience differs

### When Sources Should Win

Defer to sources when:
1. You're a beginner with limited experience
2. Your context matches source conditions
3. Sources represent expert consensus in your field
4. Safety-critical knowledge (verify before ignoring)

---

## Related
- [[AI-Assisted Knowledge Management Seed]] — The rules this note extends
- [[Knowledge Base Workflow]] — How new knowledge enters the vault
- [[Self-Improvement Cycle]] — Continuous improvement process
- [[Source Validation Over Time]] — Source verification and reliability
- [[Confidence Markers]] — Signaling reliability
