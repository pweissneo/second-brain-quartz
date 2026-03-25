---
last-reviewed: 2026-03-21
last-updated: 2026-03-21
confidence: emerging
level: frontier
lifecycle: evergreen
author-type: ai-assisted
tags:
  - frontier-exploration
  - trade-off
  - knowledge-structure
  - decision-making
---

# Frontier Exploration: Trade-off Knowledge Capture

> Knowledge about what you gain and lose when choosing one approach over another is fundamentally different from knowledge about the approaches themselves — and current Seed rules don't explicitly address capturing it.

## The Problem

The Seed provides rules for organizing knowledge, but when you choose one organizational approach, you inevitably sacrifice another. This "what you give up" knowledge is valuable but currently invisible in vaults:

- **Atomicity vs. Context**: Splitting into atomic notes loses the coherent narrative; keeping together loses reusability
- **Breadth vs. Depth**: Covering many topics superficially vs. few topics deeply
- **Discovery vs. Stability**: Hub structures change as understanding evolves vs. fixed structures that become rigid
- **Flexibility vs. Performance**: General-purpose organization vs. optimized for specific queries
- **Novelty vs. Reliability**: New/unusual knowledge vs. well-verified mainstream knowledge

Current Seed rules discuss trade-offs in specific contexts (construction phases, diminishing returns) but don't treat **trade-off knowledge as a distinct knowledge type** that should be explicitly captured.

## Examples

### Example 1: Hub Structure Decisions

You create a hub for "Woodworking Joints" with spokes for dovetail, mortise-tenon, dowel, etc.
- **Gain**: Easy navigation, clear taxonomy
- **Lose**: Notes about joinery might link to the hub but not to each other (reduced cross-linking)

This trade-off isn't captured anywhere.

### Example 2: Verification Strictness

You apply strict verification (70% ratio) for a medical knowledge base:
- **Gain**: High confidence in accuracy
- **Lose**: Slower capture rate, might miss time-sensitive knowledge

### Example 3: Atomicity Decisions

A recipe for "Sunday Roast Chicken" is 800 words including technique, timing, and sides:
- **Split**: Each component becomes reusable (can use the roasting technique elsewhere)
- **Keep**: The complete experience is preserved, context isn't lost

The decision made (and rationale) isn't captured as knowledge.

## Why This Matters

1. **Informed Reorganization**: When you eventually refactor, knowing what you gained/lost helps avoid repeating the same trade-offs
2. **Context for Future You**: Future-you won't remember why certain decisions were made
3. **Teaching Others**: If the vault is shared, understanding the reasoning behind structure helps others adapt
4. **Avoiding Regret**: Knowing what you're sacrificing prevents "grass is always greener" refactoring loops

## Proposed Rule

### Rule: Capture structural trade-offs as explicit knowledge notes

**Why:** Trade-off knowledge has unique characteristics:
- It's meta-level (about the vault, not in the vault)
- It's time-sensitive (trade-offs change as vaults evolve)
- It's personal (what you value differs from others)

Without explicit capture, trade-off decisions become invisible and unreviewable.

**Test:** Can you identify 3+ structural trade-offs you've made? Are they documented somewhere?

**Implementation:**

```yaml
trade-off-category: organization|verification|atomicity|structure
trade-off-type: gain-lose|either-or|compromise
description: "What you gain vs. lose"
rationale: "Why this trade-off was chosen"
alternatives-considered:
  - "Option A: ..."
  - "Option B: ..."
review-trigger: "When to reconsider this decision"
last-reviewed: 2026-03-21
```

**Example frontmatter:**
```yaml
trade-off: "Atomicity over context for technique notes"
gain: "Techniques are reusable across recipes"
lose: "Complete recipe context split across notes"
rationale: "I reference techniques more often than specific recipes"
revisit-when: "Recipe notes become hard to use in isolation"
```

## Test Cases

### Test Case 1: Recipe Organization

Domain: Cooking knowledge base

Trade-off decision: Organize recipes by technique (roasting, grilling, braising) vs. by meal type (breakfast, lunch, dinner) vs. by cuisine (Italian, Japanese, Mexican)

- **Current decision**: By technique
- **Gain**: Easy to find techniques, good for learning cooking methods
- **Lose**: Harder to plan complete meals, cuisine relationships invisible
- **When to revisit**: If meal-planning queries become frequent

### Test Case 2: Note Size Standards

Domain: General vault

Trade-off decision: Strict 100-300 word limit vs. flexible sizing

- **Current decision**: Flexible (allow longer for procedures)
- **Gain**: Practical usability for executables
- **Lose**: Some inconsistency, harder to predict note size
- **When to revisit**: If search results become unpredictable

### Test Case 3: Verification Standards

Domain: Medical knowledge base

Trade-off decision: High verification threshold (70%) vs. standard (50%)

- **Current decision**: 70% (high-stakes domain)
- **Gain**: Reliable knowledge for decisions
- **Lose**: Slower capture, might miss emerging information
- **When to revisit**: If capture rate drops below 5 notes/month

## Related Notes

- [[Note Insertion Strategy]]
- [[Note Lifecycle Management]]
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]]
- [[Frontier Exploration - Vault Construction Completion Criteria]]
- [[Frontier Exploration - Knowledge Maintenance]]
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]

## Questions for Seed Update

1. Should trade-off notes be their own category, or embedded in structural notes?
2. How often should trade-offs be reviewed? (Annually? When problems emerge?)
3. Should trade-offs be domain-specific (per hub) or vault-level?
4. How to handle trade-offs that conflict with each other?

## Gap Status

This is a **frontier exploration** — the concept is identified but lacks:
- [ ] Extensive testing across domains
- [ ] Refined rules with clear tests
- [ ] Integration with existing Seed rules
- [ ] Practical implementation examples

**Next steps:** Test trade-off capture in one vault for 30 days, document outcomes, refine rule.
