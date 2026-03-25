---
last-reviewed: 2026-03-19
last-updated: 2026-03-19
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-types
  - decision-making
  - branching-knowledge
---

# Frontier Exploration: Decision-Tree Knowledge Organization

> Identifying how to organize knowledge that's about making choices — choosing between options, troubleshooting, diagnostic reasoning.

## The Knowledge Type

Some knowledge is fundamentally about **choosing between alternatives**:
- Troubleshooting: "If X, then check Y; if not X, check Z"
- Decision frameworks: "If goal is A, choose method B; if goal is C, choose method D"
- Conditional knowledge: "Depends on X — when A, do B; when C, do D"

This is distinct from:
- **Sequential knowledge** (do A, then B, then C)
- **Conceptual knowledge** (understanding X)
- **Procedural knowledge** (how to do X)

## Why This Is Hard

1. **Non-linear structure**: Traditional notes are linear (A → B → C). Decision trees branch.
2. **Context sensitivity**: The "right" choice depends on multiple factors
3. **Overlapping conditions**: Real decisions aren't clean if/else — factors combine
4. **Updates are painful**: Adding a new option requires updating multiple branches

## Current Seed Coverage

The Seed covers:
- Sequential knowledge (`temporal-type: sequential`)
- Iterative-evaluative knowledge (`process-type: iterative`)
- Cyclic-branching knowledge (verse/chorus structure)
- Framework-dependent knowledge

But it lacks explicit guidance for **diagnostic/troubleshooting knowledge** or **multi-factor decision frameworks**.

## Proposed Approach

### Option 1: Typed Links for Branches

Use typed wikilinks to represent branches:
- `[[If X applies→Note A]]`
- `[[If not X→Note B]]`

**Pros**: Preserves graph structure, searchable
**Cons**: Hard to visualize the full tree

### Option 2: Decision Table Notes

Create notes that explicitly document decision matrices:

```markdown
# Decision: Which Method to Use

| Context | Method A | Method B | Method C |
|---------|----------|----------|----------|
| Goal is X | ✓ Best | ✗ Overkill | ~ Possible |
| Goal is Y | ✗ Insufficient | ✓ Best | ~ Possible |
| Goal is Z | ~ Possible | ✓ Best | ✗ Missing |
```

**Pros**: Complete overview, easy to update
**Cons**: Doesn't capture nuance well

### Option 3: Flowchart with Linked Notes

Represent each decision point as a note, linked conditionally:

```
[[Decision: Problem Type]]
  ├─→ [[Solution: Type A Problem]]
  └─→ [[Solution: Type B Problem]]
```

**Pros**: Modular, each note is atomic
**Cons**: Hard to see full picture

### Option 4: Explicit Condition Metadata

Add frontmatter to capture decision context:

```yaml
decision-type: troubleshooting|selection|prioritization
conditions:
  - factor: [what matters]
    values:
      A: [use approach 1]
      B: [use approach 2]
factors-weighted: true|false
recommended: [primary choice]
alternatives:
  - [[Note for alternative 1]]
  - [[Note for alternative 2]]
```

**Pros**: Machine-readable, queryable
**Cons**: Schema complexity

## Proposed Seed Rules

### Rule: Decision-Tree Knowledge Tagging

> **Rule:** For notes representing choices or troubleshooting steps, use `decision-type:` frontmatter with values `troubleshooting`, `selection`, `prioritization`, or `context-dependent`.
> **Why:** Decision-tree knowledge has different structure requirements than linear procedural knowledge. Tagging enables appropriate formatting and tooling.
> **Test:** Can you identify all notes that represent choices or branching logic?

### Rule: Capture Decision Factors Explicitly

> **Rule:** For decision notes, document: (1) What factors matter, (2) How each factor affects the choice, (3) What the recommended default is, (4) What alternatives exist.
> **Why:** Without explicit factor documentation, decision notes become "it depends" notes that don't actually help make decisions.
> **Test:** Can you make a decision using ONLY this note, without consulting other notes?

### Rule: Link to Underlying Concepts

> **Rule:** Each decision branch should link to notes explaining WHY that option applies.
> **Why:** Decision trees without concept links are bare branching — users need to understand the reasoning, not just the choice.
> **Test:** Can you trace each decision branch to its supporting rationale?

### Rule: Document Edge Cases

> **Rule:** For decisions with exceptions, document edge cases separately or add explicit "except when" conditions.
> **Why:** Generic decisions that ignore edge cases mislead users.
> **Test:** Can you identify the boundary conditions where this decision rule fails?

## Edge Cases

### Edge Case: Multi-Factor Decisions

When multiple factors combine (not independent), decision tables fail.

**Example:** "Which diet?" depends on: goals, health conditions, budget, time, preferences — all interacting.

**Solution:** Use factor hierarchy (primary factor → secondary factors) or create separate decision sub-notes for each factor combination.

### Edge Case: Subjective vs. Objective

Some decisions have objective answers (troubleshooting), others are subjective (aesthetic choices).

**Solution:** Tag with `decision-nature: objective | subjective | hybrid`. For subjective decisions, capture what different evaluators value, not one "right" answer.

### Edge Case: Decision Trees That Grow

Initial decisions may have too few branches; over time, more options emerge.

**Solution:** Use version or `last-reviewed` metadata. Flag decisions that haven't been updated in >6 months as potentially stale.

### Edge Case: Conflicting Decision Advice

Note A says "choose X for goal A" and Note B says "choose Y for goal A" — contradictory decision frameworks.

**Solution:** Apply contradiction detection rules. Tag with `framework-dependent: true` and link to competing frameworks.

## Examples

### Example 1: Troubleshooting

```markdown
---
decision-type: troubleshooting
factors:
  - name: symptom
    values:
      error-msg-X: [[Fix X]]
      error-msg-Y: [[Fix Y]]
      no-error: [[No action needed]]
---
# Troubleshooting: Installation Failures

## Decision Tree

1. Are you seeing an error message?
   - Yes → Which error?
     - "Permission denied" → [[Fix: Permission Denied]]
     - "Module not found" → [[Fix: Missing Module]]
   - No → [[Check: Silent Failures]]
```

### Example 2: Method Selection

```markdown
---
decision-type: selection
recommended: method-b
factors:
  - name: dataset-size
    values:
      small: method-a
      large: method-b
  - name: interpretability-needed
    values:
      true: method-c
      false: method-b
---
# Selecting a Data Analysis Method

## Decision Factors

| Factor | Method A | Method B | Method C |
|--------|----------|----------|----------|
| Dataset <1000 rows | ✓ | ~ | ✓ |
| Dataset >10000 rows | ✗ | ✓ | ~ |
| Needs explanation | ✓ | ~ | ✗ |
| Speed priority | ~ | ✓ | ✓ |

## Recommended Default

**Method B** — works well in most situations.

See [[Method B Explained]] for details.
```

### Example 3: Context-Dependent

```markdown
---
decision-type: context-dependent
decision-nature: subjective
---
# Choosing a Programming Language

This decision depends entirely on context. There is no universally "best" language.

## Factor: Project Type
- Web frontend → JavaScript/TypeScript
- Systems programming → Rust/C
- Data analysis → Python
- Mobile → Swift/Kotlin

## Factor: Team Expertise
- Existing codebase → Use what team knows
- New project → Consider long-term maintainability

## See Also
- [[Language Comparison Matrix]]
- [[Team Skills Assessment]]
```

## Implementation

```yaml
# Decision note frontmatter
decision-type: troubleshooting|selection|prioritization|context-dependent
decision-nature: objective|subjective|hybrid
recommended: primary-choice
alternatives:
  - [[Alternative 1]]
  - [[Alternative 2]]
factors:
  - name: factor-name
    values:
      value-a: [[Choice A]]
      value-b: [[Choice B]]
edge-cases:
  - [[Edge Case 1]]
  - [[Edge Case 2]]
last-decision-update: 2026-03
review-trigger: [what triggers a review]
```

## Relationship to Existing Seed Rules

| Existing Rule | Relationship |
|---------------|--------------|
| Sequential knowledge | Complementary — sequential is linear, decision is branching |
| Framework-dependent knowledge | Related — both acknowledge context matters |
| Correction metadata | Related — decision updates may require correction |
| Atomicity | Constrains — each decision point should be atomic |
| Typed links | Enables — typed links can represent branches |

## Tests

1. **Can you make a decision using this note alone?** If you need to consult other notes to understand a branch, the decision note isn't atomic enough.

2. **Can you identify all factors that matter for this decision?** If factors are missing, the decision guidance is incomplete.

3. **Can you trace each choice to its supporting rationale?** Decision notes should link to explanations, not just conclusions.

4. **Is the decision still valid?** Check last-updated dates. Old decisions may reflect outdated conditions.

5. **Are edge cases documented?** Generic decisions without edge cases mislead users.

## Related Notes

- [[Decision Tree Knowledge]] — Earlier brief exploration (superseded by this note)
- [[Frontier Exploration - Condition-Triggered Knowledge]]
- [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]]
- [[Frontier Exploration - Trade-off Knowledge Capture]]
- [[Handling Contradictory Sources]]
- [[AI-Assisted Knowledge Management Seed]]
