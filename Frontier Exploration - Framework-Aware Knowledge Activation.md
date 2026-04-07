---
last-reviewed: 2026-04-06
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - framework-switching
  - cognitive-context
  - knowledge-interpretation
---

# Frontier Exploration: Framework-Aware Knowledge Activation

> Identifying when knowledge interpretation requires explicit mental model switching rather than neutral retrieval.

## The Gap

The Seed covers:
- **Framework-dependent knowledge**: Different frameworks produce different interpretations (tag as `framework-dependent: true`)
- **Contradictory knowledge**: Notes that directly conflict (contradiction resolution)
- **Unlearning-required knowledge**: Prior beliefs that block new understanding

But it lacks guidance for **framework-aware activation** — situations where an AI agent must deliberately switch interpretive frameworks to answer a query correctly. This is about the *process* of knowledge retrieval, not the nature of the knowledge itself.

## Why This Matters

When someone asks "Is this a good investment?", the answer depends on which financial philosophy you apply:
- Value investing framework → examines fundamentals, P/E ratios, intrinsic value
- Momentum investing framework → examines price trends, relative strength
- Quantitative framework → examines statistical patterns, factor exposures

The same data yields different answers. Without framework-aware activation, an AI might:
1. Pick one framework arbitrarily (potentially wrong for the user's needs)
2. Apply multiple frameworks inconsistently (confusing output)
3. Default to whatever framework produced the most recent note in the vault

This is especially problematic when:
- User context doesn't specify the framework (most common)
- The question spans multiple frameworks ("what do experts think?")
- The user holds implicit framework assumptions they're not aware of

## Proposed Seed Rule

**Rule:** For knowledge that yields different interpretations under different frameworks, explicitly tag with `framework-aware: true` and document which frameworks apply, how they differ, and when each is appropriate.

**Why:** Without explicit framework tagging, AI agents cannot reliably activate the correct interpretive context, leading to answers that are technically correct but contextually wrong.

**Test:** For knowledge in framework-sensitive domains (finance, medicine, criticism, strategy): (1) Does the note document which interpretive frameworks apply? (2) Can you identify what answer each framework would produce? (3) Is there guidance on framework selection?

**Implementation:**
```yaml
framework-aware: true
applicable-frameworks:
  - name: "Value Investing"
    key-metrics: ["P/E ratio", "book value", "margin of safety"]
    answer-for-query: "Conservative but potentially undervalued"
  - name: "Momentum Investing"
    key-metrics: ["RSI", "price trend", "relative strength"]
    answer-for_query: "Weak recent performance suggests avoiding"
framework-selection-guidance:
  - when: "User seeks long-term value"
    use: "Value Investing"
  - when: "User seeks short-term gains"
    use: "Momentum Investing"
default-framework: "State which framework is default or recommended"
```

## Related Concepts

### Framework-Dependent (Already Covered)
The Seed already covers `framework-dependent: true` for knowledge that differs by framework. This exploration is about **activation** — ensuring the right framework is applied at retrieval time.

### Unlearning-Required (Different)
Unlearning-required is about *replacing* a blocking belief. Framework-aware is about *selecting* the right interpretive context — both frameworks may be valid.

### Multi-Perspective (Similar but Different)
Multi-perspective knowledge presents multiple viewpoints. Framework-aware knowledge is about which interpretive model to apply, not which opinion to present.

## Examples of Framework-Aware Knowledge

| Domain | Knowledge | Framework A Interpretation | Framework B Interpretation |
|--------|-----------|---------------------------|---------------------------|
| Finance | High P/E stock | Overvalued (value) | Strong growth expectations (momentum) |
| Medicine | Chest pain | Cardiac (if risk factors) | Musculoskeletal (if trauma) |
| Literary Criticism | Ambiguous ending | Intentional ambiguity | Author uncertainty |
| Strategy | Market entry timing | First-mover advantage | Fast-follower advantage |
| Nutrition | High-fat diet | Heart-healthy (olive oil) | Unhealthy (trans fat) |

## Edge Cases

### Framework Ambiguity
Some questions genuinely don't specify a framework. The rule should guide AI to either:
1. Ask for clarification
2. Present multi-framework analysis
3. Default to the user's apparent context (inferred from history)

### Framework Conflicts
When frameworks produce directly contradictory answers, this is different from framework-aware — it's a contradiction that needs resolution (covered by existing Seed rules).

### Implicit Frameworks
Users often hold frameworks they don't explicitly state. The AI should:
1. Track user framework preferences over time
2. Detect framework assumptions in questions
3. Flag when assumptions might be wrong

## Testing Framework-Aware Activation

For an AI agent using this vault, test:
1. **Query**: "Is this a good stock?" (no framework specified)
2. **Expected**: Agent detects framework-ambiguous query
3. **Expected**: Agent either asks for clarification OR applies default framework with explicit framing
4. **Expected**: Agent can explain how a different framework would yield different conclusions

## Implementation Path

1. Tag existing notes in framework-sensitive domains
2. Add `framework-selection-guidance` to relevant notes
3. Consider framework hub notes for major domains
4. Track which framework was applied in query responses

## See Also
- [[Frontier Exploration - Framework-Dependent Knowledge]] — Already covers tagging
- [[Seed Rule - Contradiction Detection]] — For when frameworks conflict
- [[Frontier Exploration - Multi-Perspective Knowledge]] — Presenting multiple viewpoints
