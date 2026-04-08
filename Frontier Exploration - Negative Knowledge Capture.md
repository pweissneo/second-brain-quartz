---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: seedling
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
---

# Frontier Exploration - Negative Knowledge Capture

## The Gap

The Seed covers:
- Knowledge types (procedural, conceptual, factual, experiential, relational, meta)
- Verification (source, empirical, tool-dependent, embodied, drill-verified)
- Correction workflow (marking wrong knowledge rather than deleting)

What's **missing**: Explicit guidance on systematically capturing **negative knowledge** — knowledge about what doesn't work, what's been disproven, failed experiments, and paths not taken. The Seed's correction workflow handles "I learned this was wrong" but doesn't address "I know this path fails."

## Why This Matters

Negative knowledge is high-value but under-captured:

1. **Prevents repeated failures** — Time saved by not retrying failed approaches
2. **Reveals causal mechanisms** — Knowing something fails often explains why the alternative works
3. **Compound value** — Negative knowledge becomes more valuable as the domain grows (fewer people need to rediscover the same failures)
4. **Informs boundaries** — Knowing what doesn't work defines the space where success is possible

But negative knowledge is harder to capture:
- It's less intrinsically interesting ("what NOT to do" is less engaging than "what to do")
- It can feel pessimistic or discourage exploration
- Confidence is harder to establish (how do you verify something doesn't work?)
- The space of failures is infinite; capturing all negatives is impossible

## How It Differs From Existing Rules

**vs. Correction workflow**: The correction rule handles "I believed X, now I know Y is correct." Negative knowledge captures "I know X doesn't work" — even if I never believed X was true.

**vs. Abandoned directions**: The creative project rule mentions storing abandoned directions with rationale. This is related but narrower — focused on project iterations, not general knowledge.

**vs. Anti-patterns**: Anti-patterns describe what commonly fails in a domain. Negative knowledge captures what specifically failed in YOUR experience.

## Categories of Negative Knowledge

1. **Empirically disproven** — Tested, failed consistently
2. **Theoretically impossible** — Logic proves it can't work
3. **Conditionally failed** — Works in some contexts, not others (boundary knowledge)
4. **Outcompeted** — Other approaches are strictly better (trade-off knowledge)
5. **Path not taken** — Deliberately chose alternative, recorded why others rejected

## Capture Test

Does this negative knowledge meet these criteria?
- **Specificity**: Can you describe exactly what failed, not just that it "didn't work"?
- **Context**: Do you know the conditions under which failure occurred?
- **Transferability**: Would someone else in the same context face the same failure?
- **Non-obvious**: Is this failure not obvious to someone entering the domain?

If yes to all, capture with explicit negative framing.

## Implementation

```yaml
negative-knowledge: true
negative-type: empirically-disproven|theoretically-impossible|conditionally-failed|outcompeted|path-not-taken
failure-context:
  what-tried: "Specific approach attempted"
  expected-outcome: "What you expected"
  actual-outcome: "What happened"
  conditions: "Context where failure occurred"
failure-mechanism: "Why it failed (if known)"
transferability: "Would this fail in different contexts?"
confidence: high|medium|low
negative-rigor: proven|observed|inferred  # How confident in the negative claim
```

## Verification for Negative Knowledge

Negative knowledge verification differs from positive:
- **Empirically disproven**: Requires multiple failed trials, not single failure
- **Theoretically impossible**: Requires logical argument, not just lack of success
- **Conditionally failed**: Requires understanding of which conditions matter
- **Outcompeted**: Requires demonstrating the alternative is strictly better
- **Path not taken**: Requires documenting why alternatives were rejected

## Seed Integration Candidate

**Rule (proposed):** Systematically capture negative knowledge — documented failures, disproven approaches, and deliberately rejected paths — using explicit negative-knowledge tagging and context-rich failure documentation.

**Why:** Without explicit negative knowledge capture, vaults optimize for positive knowledge at the expense of valuable failure information. Negative knowledge compounds in value as domains grow but is under-captured relative to its utility.

**Test:** For knowledge about failed approaches: (1) Is negative-knowledge: true present? (2) Does failure-context document what was tried, expected, and actual? (3) Is negative-type categorized? (4) Is transferability assessed? (5) Can someone avoid repeating this failure based on this note?

## Related Notes

- [[Anti-Patterns in Knowledge Management]] — General failure patterns
- [[Seed Refinement - Verification Mode Conflict Resolution]] — Conflict handling
- [[Frontier Exploration - Exploration Exploitation Transition Triggers]] — When to explore vs. exploit