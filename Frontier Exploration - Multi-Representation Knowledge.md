---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - multi-modal
  - variants
  - representation
  - interaction-modes
---

# Frontier Exploration - Multi-Representation and Context-Dependent Knowledge

> How does the Seed handle knowledge that requires different representations for different contexts and use cases?

## The Problem

The Seed assumes each piece of knowledge has a single canonical form - one note = one idea. But many domains require handling multiple simultaneous representations of the same knowledge:

1. **Educational differentiation** - Same concept needs multiple presentations for different learner levels
2. **Musical forms** - Same compositional idea expressed in different structural templates
3. **Skill levels** - Knowledge that applies differently to beginners vs experts
4. **Cultural contexts** - Same knowledge with different valid interpretations across cultures
5. **Use case variation** - Same knowledge needs different formats for different interactions (step-by-step vs exploratory vs emergency)

## Observed Gap Pattern

Looking at existing Seed gap notes, a common theme emerges:

### Gap Notes with Multi-Representation Needs

| Gap Note | Representation Challenge |
|----------|-------------------------|
| Education & Pedagogy | Same lesson, multiple difficulty levels for different grades |
| Music Composition | Same compositional idea expressed through different forms |
| Learning Progression | Same knowledge, different presentation for different mastery levels |
| Expertise-Level Dependent | Same concept, different explanation depth for different levels |
| Context-Gated | Same knowledge, requires different context to understand |

### What These Share

All involve:
- **Variant needs** - Multiple presentations of the "same" underlying knowledge
- **No single "correct" variant** - Each variant is valid for its context
- **Context-dependent selection** - The user determines which variant applies
- **Shared core** - All variants share some common knowledge

## Interaction Modes (Practical Use Cases)

Beyond structural variants, knowledge changes based on **how** it's being used:

| Context | Same Knowledge Needs... |
|---------|------------------------|
| Kitchen (cooking) | Step-by-step, measurement-heavy, actionable |
| Reference (planning) | Overview, high-level, explorable links |
| Emergency (stressed) | Critical warnings, simplified, bolded |
| Learning (practicing) | Progressive, scaffolded, self-testing |

### Mode Examples

**1. Recipes**
A recipe note is read VERY differently when:
- **In the kitchen, actively cooking** → Need clear steps, exact measurements, no distractions
- **Planning a menu for the week** → Need overview, ingredients list, timing
- **Shopping for ingredients** → Need quantities, store-specific items

**2. First Aid / Emergency Procedures**
When someone is having a medical emergency:
- Can't read a wall of text
- Need bold, high-contrast critical steps
- Sequential first, then details
- Should work offline

**3. Technical Troubleshooting**
- **Initial problem**: Broad, exploratory ("why is my system slow?")
- **During diagnosis**: Specific, test-driven, linked to diagnostics
- **Solution applied**: Verification steps, what to watch for

## Current Seed Limitations

### Atomicity Assumption

The Seed's atomicity rule assumes one idea per note. But multi-representation knowledge challenges this:

- Is "fractions" one idea or multiple? (3rd grade, 6th grade, adult refresher)
- Is "sonata form" one idea or multiple? (Mozart style, Beethoven style, modern)
- Is "investment risk" one idea or multiple? (beginner explanation, advanced analysis)

### Link Structure Limitation

Current linking assumes notes connect to other notes. But multi-representation needs:
- Variants that all link to a shared base concept
- Selection criteria for which variant applies
- Fallback paths (if level X, try note A; if level Y, try note B)

### Verification Complexity

Verification assessment treats all notes equally. But multi-representation needs:
- Verification that applies to the pattern, not just each variant
- Cross-variant consistency checks
- Context-specific verification (does this variant work for its intended audience?)

## Solution Patterns

### Pattern 1: Base-Variant Structure

```yaml
# Base concept note
title: Fractions
type: concept-base
variants:
  - "Fractions - Grade 3 Introduction"
  - "Fractions - Grade 6 Deep Dive"
  - "Fractions - Adult Refresher"
core-knowledge: "Part-to-whole relationships represented as a/b"
audience-intent: mixed

# Variant note
title: Fractions - Grade 3 Introduction
base-concept: "Fractions"
variant-type: audience-level
target-audience: grade-3
difficulty: beginner
```

**When to use:** Same knowledge needing different presentations for different audiences

### Pattern 2: Interaction Mode Tags

```yaml
# For performative knowledge (executed step-by-step)
interaction-mode: performative
example: recipes, instructions, procedures

# For exploratory knowledge (browsed and discovered)
interaction-mode: exploratory
example: concept explanations, background reading

# For compressed knowledge (quick recall under stress)
interaction-mode: compressed
example: emergency procedures, troubleshooting quick-start

# For progressive knowledge (learning over time)
interaction-mode: progressive
example: tutorials, curricula, skill development

# For comparative knowledge (decision-making between options)
interaction-mode: comparative
example: tool selection, framework comparison
```

### Pattern 3: Expertise-Level Tiers

```yaml
# Level-specific entry
title: Risk Assessment - Beginner
target-level: beginner
prerequisites:
  - Basic definitions
extends: "Risk Assessment - Core Concept"

title: Risk Assessment - Advanced
target-level: advanced
prerequisites:
  - Statistics basics
extends: "Risk Assessment - Core Concept"
```

**When to use:** Progressive depth levels for the same topic

### Pattern 4: Expression Variants

```yaml
title: Sonata Form
variant-validity:
  - classical-period
  - romantic-period
  - 20th-century
expression-variants:
  classical: "Sonata Form - Classical"
  romantic: "Sonata Form - Romantic"
  modern: "Sonata Form - Modern"
```

**When to use:** Domain where knowledge expression varies by tradition/era/style

## Proposed Seed Rule

**Rule:** For knowledge that legitimately requires multiple simultaneous representations, use base-variant structure with explicit variant linking. Additionally, tag knowledge with its primary interaction mode (performative, exploratory, compressed, progressive, comparative).

**Why:** Treating all variants as separate unrelated notes fragments the knowledge graph and makes variant selection difficult. Base-variant structure maintains coherence while supporting multiple valid representations. Interaction mode tagging helps users and AI agents present the right format for the current context.

**Test:** For knowledge domains requiring multiple presentations: (1) Does a base concept note exist? (2) Do variants link explicitly to base? (3) Is there criteria for which variant applies? (4) Can you find all variants from the base note? (5) Is interaction mode tagged for context-dependent knowledge?

**Variant scenarios:**
- Audience variants (different reader types need different presentations)
- Level variants (different expertise levels need different depth)
- Context variants (different situations need different examples)
- Temporal variants (knowledge evolved, old/new forms both valid)
- Cultural variants (different cultural contexts interpret differently)

**Not variant scenarios:**
- Updates to incorrect knowledge (this is correction, not variant)
- Personal vs general (this is applicability, not representation)
- Related but distinct concepts (these are separate notes, not variants)

## Stress Test

**Scenario A: Cooking**

A recipe for "pasta sauce" could have:
- Vegetarian variant
- Meat variant  
- Spicy variant
- Quick weeknight version
- Long-simmered professional version

Analysis:
- Core knowledge (sauce technique) is the same
- Each variant modifies the same base technique
- Selection depends on context (diet, time, occasion)
- **Verdict:** Use base-variants for technique plus a hub note

**Scenario B: Programming**

A tutorial for "async programming" could have:
- JavaScript version
- Python version
- C# version

Analysis:
- Core concept (async/await) is the same
- Implementation differs significantly per language
- Each language version needs its own complete content
- **Verdict:** These are related but separate notes - link them but don't use base-variant (too much divergence)

**Scenario C: Emergency Knowledge**

First aid procedures need:
- Detailed reference version (for learning)
- Compressed action version (for emergencies)

Analysis:
- Same underlying knowledge, different interaction modes
- **Verdict:** Use interaction-mode tagging, not separate variants

## Related Notes

- [[Seed Gap - Education and Pedagogy Knowledge Bases]] - Education differentiation
- [[Seed Gap - Music Composition Knowledge Bases]] - Musical form variants
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] - Level variants
- [[Frontier Exploration - Context-Gated Knowledge]] - Context requirements
- [[Frontier Exploration - Multi-Perspective Knowledge]] - Different viewpoints
- [[Frontier Exploration - Comparative Knowledge Structures]] - Comparing different structures
- [[Frontier Exploration - Knowledge Context Frames]] - Purpose-specific presentations

## Questions for Further Exploration

1. When does base-variant become over-engineering? (When variants share very little)
2. How to handle new variants? (Update the base's variant list)
3. Should interaction modes be separate from base-variant structure?
4. How do interaction modes affect verification requirements?
5. Can variants "inherit" verification from base?

---

**Status:** Frontier exploration - combines two related notes (Multi-Representation + Context-Dependent Interaction) into unified treatment. Testing needed.