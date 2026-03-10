---
last-reviewed: 2026-03-10
lifecycle: emerging
confidence: emerging
tags:
  - frontier-exploration
  - alternatives
  - knowledge-presentation
---

# Frontier Exploration: Parallel Valid Alternatives

## The Gap

The Seed has rules for:
- **Contradictory sources** (experts disagree) → create synthesis note
- **Subjective preferences** → present as options
- **Deprecation** (old version replaced by new) → mark deprecated, point to replacement

But there's no guidance for **parallel valid alternatives** — cases where multiple approaches are ALL valid, NONE is deprecated, and the choice between them is context-dependent, not about correctness.

### Examples of the Gap

**Programming:** "Use REST or GraphQL for APIs" — both are valid, choice depends on use case

**Cooking:** "Cast iron or stainless steel for searing" — both produce excellent results, different contexts

**Writing:** "Active voice vs. passive voice" — both grammatically correct, different effects

**Project Management:** "Agile vs. Waterfall" — both valid methodologies

**Problem Solving:** "Top-down vs. bottom-up analysis" — both valid approaches

## Why This Is Different From Contradictory Sources

| Contradictory Sources | Parallel Alternatives |
|----------------------|----------------------|
| Experts disagree on what's correct | Experts agree multiple approaches work |
| Must synthesize or pick winner | Should present as equal options |
| Getting it "wrong" matters | No wrong choice — context-dependent |
| e.g., "Is this diet best?" | e.g., "Which diet fits your lifestyle?" |

## The Problem for AI Agents

Without guidance on parallel alternatives:
1. AI creates duplicate notes for equivalent approaches
2. AI picks a "winner" when none exists, misleading readers
3. AI presents context-dependent choices as absolute rules
4. Knowledge base becomes opinionated when it should be neutral

## Proposed Seed Rule

**Rule:** When multiple approaches are ALL valid, present them as equal alternatives with context indicators — never declare one "best" without specifying the context.
**Why:** A knowledge base should represent reality accurately. Declaring a false winner when alternatives exist misleads readers and loses valuable context-dependent guidance.
**Test:** For notes containing absolute statements (always/never/best):
1. Are there alternative approaches that also work?
2. If yes, does the note present them as alternatives?
3. Are the contexts where each approach is preferred specified?

**Alternative Rule:** Use `alternatives` frontmatter to explicitly mark notes with parallel valid options:

```yaml
---
alternatives:
  - [[Alternative Approach A]]
  - [[Alternative Approach B]]
context-factors:
  - Use A when: [specific context]
  - Use B when: [different context]
---
```

## Related

- [[Handling Contradictory Sources]]
- [[Subjective vs Objective Knowledge]]
- [[Context-Scope Tagging]]
- [[Domain-Specific Knowledge Bases]]
