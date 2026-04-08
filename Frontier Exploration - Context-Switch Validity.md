---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
confidence: emerging
lifecycle: staging
author-type: ai-assisted
knowledge-type: conceptual
gap-status: identified
gap-priority: high
tags:
  - frontier-exploration
  - context-validity
  - contextual-truth
  - equivalence
  - context-modes
  - context-gates
---

# Frontier Exploration - Context-Switch Validity

> How should knowledge bases handle knowledge that is true in some contexts but false in others — where truth is not time-dependent but context-dependent?

## The Gap

The Seed covers:
- **Temporal validity** — knowledge that changes over time ("verify within 30 days")
- **Temporal validity bounds** — "true until event X"
- **Context-gated knowledge** — knowledge that requires certain context to be relevant

But it does NOT adequately cover:
- **Context-switch validity** — knowledge that is factually TRUE in one context but FALSE in another, independent of time
- **Interaction modes** — how knowledge is *presented* for different use contexts (performative, exploratory, compressed)

This exploration merges related notes on context handling into a unified framework.

## Three Types of Context in Knowledge Bases

### Type 1: Context-Gated Knowledge (applies vs irrelevant)

> Knowledge that is factually correct but only applies in specific contexts.

Some knowledge is **conditionally true** — it depends on context that may not be obvious:
- "The subway runs 24/7" — true in NYC, false in most cities
- "You need a visa for entry" — depends on your citizenship
- "This library works in browsers" — depends on build configuration

Without explicit context gating:
1. **False applicability** — Users assume knowledge applies to them when it doesn't
2. **Silent failures** — Actions fail because preconditions aren't met
3. **Context blindness** — Notes don't signal what context is needed

### Type 2: Context-Switch Validity (true vs false)

> Knowledge that is TRUE in some contexts but FALSE in others, independent of time.

This is distinct from:
- Contradictory sources (one is wrong)
- Subjective preferences (no right answer)
- Equivalent alternatives (all valid in all contexts)
- Context-gated knowledge (only relevant in certain contexts)

| Statement | True In | False In |
|-----------|--------|----------|
| "Tap water is safe to drink" | Most developed countries | Many developing countries |
| "You can legally brew beer at home" | Most US states, UK, Germany | Utah, Norway, some localities |
| "This recipe makes 5% ABV beer" | With typical ingredients | At high altitudes |
| "Standard voltage is 120V" | US, Japan | EU, UK, Australia |
| "You need a license to drive" | Most jurisdictions | Some countries |

### Type 3: Interaction Modes (how knowledge is presented)

> Knowledge that requires different representations for different use contexts.

The same knowledge needs different structures depending on HOW it's being used:

| Context | Same Knowledge Needs... |
|---------|------------------------|
| Kitchen (cooking) | Step-by-step, measurement-heavy, actionable |
| Reference (planning) | Overview, high-level, explorable links |
| Emergency (stressed) | Critical warnings, simplified, bolded |
| Learning (practicing) | Progressive, scaffolded, self-testing |

Current Seed rules treat knowledge as something to be read, linked, verified, updated. But some knowledge fundamentally changes based on HOW it's being used.

## Unified Solution Framework

### Frontmatter Fields

For context-gated and context-switch knowledge:

```yaml
context-gate: true
context-type: geographic|temporal|identity|technical|resource
context-conditions:
  - condition: "location"
    values: ["NYC Metro Area"]
    note: "Only applies to NYC subway"
context-validity:
  - scope: geographic
    true-in: ["US", "CA", "UK"]
    false-in: ["EU", "AU"]
    note: "Voltage standards differ"
interaction-mode: performative|exploratory|compressed|progressive|comparative
```

### Proposed Seed Rules

**Rule:** Tag context-dependent knowledge with explicit gate conditions — knowledge that is true but only applies in specific contexts must be labeled with `context-gate: true` and context conditions.

**Why:** Without explicit context gates, users and AI agents assume applicability broader than warranted.

**Test:** For notes with context-dependent applicability: (1) Is there a `context-gate: true` tag? (2) Are all conditions explicitly listed? (3) Can a reader determine if this knowledge applies to them?

---

**Rule:** Identify knowledge validity scopes — explicitly state all contexts where a claim is TRUE and where it is FALSE or unknown.

**Why:** Knowledge that is true in one context but false in another has bounded applicability. Without scope, knowledge bases universalize locally true claims.

**Test:** Can you identify at least one context where this claim would NOT hold?

---

**Rule:** Identify knowledge interaction modes at capture time — determine whether knowledge is primarily performative, exploratory, compressed, progressive, or comparative, and structure accordingly.

**Why:** Knowledge has different optimal structures for different uses. A recipe as a linked concept graph fails in the kitchen; emergency steps as exploratory prose fail in crisis.

**Test:** For any note, can you identify its primary interaction mode? Could someone in that mode use it effectively without restructuring?

### Interaction Mode Definitions

| Mode | Description | Characteristics | Example |
|------|------------|-----------------|----------|
| Performative | Execute step-by-step | Numbered steps, imperative voice, no branching | Recipes, instructions |
| Exploratory | Browse and discover | Rich links, non-linear, examples | Concept explanations |
| Compressed | Quick recall under stress | Keywords, warnings, critical paths only | Emergency procedures |
| Progressive | Learning over time | Prerequisite chains, scaffolding | Tutorials, curricula |
| Comparative | Decision-making | Tables, trade-offs, context factors | Tool selection, framework comparison |

## Why This Matters for Seed Construction

When an AI builds a knowledge base from scratch using only Seed rules:

1. **False universalization risk**: Capturing "tap water is safe" without context makes it look universally true
2. **Verification without scope**: Verifying the fact doesn't capture its bounded applicability
3. **Cross-context transfer errors**: Knowledge from one context applied to another produces failures
4. **Mode mismatch**: Creates beautiful concept graphs useless when actually cooking
5. **No validity scope**: The Seed has no field or rule for "applies in context X, Y"

## Domain Examples

### Cooking
- Kitchen mode → Step-by-step recipe with precise measurements
- Planning mode → Overview, ingredients list, timing
- Shopping mode → Quantities, store-specific items
- Current Seed: Creates linked atomic notes but doesn't support context-optimized views

### First Aid / Emergency
- Normal Seed: Creates well-linked knowledge graph
- Emergency context: Requires compressed mode, bold warnings, offline capability
- Could be life-threatening if wrong mode used

### Legal Knowledge
- Context-switch: "You can record without consent" — True in single-party consent states, false in two-party
- Context-gate: Professional role requirements vary by jurisdiction

## Connections to Existing Seed Work

- [[Frontier Exploration - Knowledge Validity Window Handling]] — extends temporal validity to context validity
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]] — extends alternative context-sensitivity
- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]] — context-switch could be a distinct knowledge type
- [[Note Types and Templates]] — Could extend with mode specification

## Open Questions

1. How should the Seed test for context-switch validity during verification?
2. Should context-scopes be searchable/filterable?
3. How do we handle unknown contexts (we don't know where it ISN'T true)?
4. How do we handle notes that serve multiple modes? Multiple representations?
5. What's the minimum viable set of modes to optimize for?

---

*This note was created during frontier exploration and merged from related notes on context handling. It captures an emerging concept about context-dependent knowledge representation that could become future Seed rules.*