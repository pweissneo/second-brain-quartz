---
last-reviewed: 2026-03-23
lifecycle: seed-extension
confidence: emerging
verification-status: unverified
tags:
  - frontier-exploration
  - knowledge-modes
  - context-dependent
  - interaction-patterns
level: principle
author-type: ai-assisted
---

# Frontier Exploration - Context-Dependent Knowledge Interaction

The Seed provides rules for capturing, organizing, and maintaining knowledge. But there's a gap: **knowledge that requires different interaction patterns depending on the user's context**.

## The Gap

Current Seed rules treat knowledge as something to be:
- Read
- Linked
- Verified
- Updated

But some knowledge fundamentally changes based on **how** it's being used:

| Context | Same Knowledge Needs... |
|---------|------------------------|
| Kitchen (cooking) | Step-by-step, measurement-heavy, actionable |
| Reference (planning) | Overview, high-level, explorable links |
| Emergency (stressed) | Critical warnings, simplified, bolded |
| Learning (practicing) | Progressive, scaffolded, self-testing |

## Examples of Context-Dependent Knowledge

### 1. Recipes
A recipe note is read VERY differently when:
- **In the kitchen, actively cooking** → Need clear steps, exact measurements, no distractions
- **Planning a menu for the week** → Need overview, ingredients list, timing
- **Shopping for ingredients** → Need quantities, store-specific items

Current Seed would capture "recipe" as atomic notes. But the SAME recipe needs different representations for different contexts.

### 2. First Aid / Emergency Procedures
When someone is having a medical emergency:
- Can't read a wall of text
- Need bold, high-contrast critical steps
- Sequential first, then details
- Should work offline

Normal Seed rules would create a well-linked knowledge graph. But the emergency context requires a DIFFERENT mode.

### 3. Technical Troubleshooting
- **Initial problem**: Broad, exploratory ("why is my system slow?")
- **During diagnosis**: Specific, test-driven, linked to diagnostics
- **Solution applied**: Verification steps, what to watch for

The troubleshooting knowledge changes its structure based on the problem state.

### 4. Learning vs Reference
The same knowledge serves two purposes:
- **Reference**: "What is X?" → Quick lookup, atomic, linked
- **Learning**: "How do I learn X?" → Sequential, prerequisites, practice

A knowledge base built for learning needs different structures than one built for reference.

## The Question for the Seed

**How should an AI agent handle knowledge that needs different representations for different use contexts?**

Current Seed rules assume one representation per note. But real knowledge has multiple valid views.

## Proposed Interaction Modes

### Mode 1: Performative
Knowledge designed to be executed step-by-step
- Characteristics: Numbered steps, imperative voice, no branching
- Example: Recipes, instructions, procedures
- Test: Can someone follow this without reading explanations?

### Mode 2: Exploratory
Knowledge designed to be browsed and discovered
- Characteristics: Rich links, non-linear, examples
- Example: Concept explanations, background reading
- Test: Does this invite deeper exploration?

### Mode 3: Compressed
Knowledge for quick recall under stress
- Characteristics: Keywords, warnings, critical paths only
- Example: Emergency procedures, troubleshooting quick-start
- Test: Can this be scanned in 5 seconds?

### Mode 4: Progressive
Knowledge designed for learning over time
- Characteristics: Prerequisite chains, scaffolding, self-assessment
- Example: Tutorials, curricula, skill development
- Test: Does this create a learning path?

### Mode 5: Comparative
Knowledge for decision-making between options
- Characteristics: Tables, trade-offs, context factors
- Example: Tool selection, framework comparison
- Test: Can you compare options side-by-side?

## Domain Examples

| Domain | Performative Mode | Exploratory Mode | Compressed Mode |
|--------|------------------|-------------------|------------------|
| Cooking | Step-by-step recipe | Ingredient stories, techniques | Quick reference card |
| First Aid | Emergency steps | Condition explanations | Warning signs list |
| Programming | Code examples | Concept explanations | API quick reference |
| Fitness | Workout routines | Exercise science | Form checkpoints |

## Proposed Seed Rules

**Rule:** Identify knowledge interaction modes at capture time — determine whether knowledge is primarily performative, exploratory, compressed, progressive, or comparative, and structure accordingly.

**Why:** Knowledge has different optimal structures for different uses. A recipe as a linked concept graph fails in the kitchen; emergency steps as exploratory prose fail in crisis.

**Test:** For any note, can you identify its primary interaction mode? Could someone in that mode use it effectively without restructuring?

**Rule:** Allow multiple representations of the same knowledge base content — maintain both detailed reference versions and context-optimized versions.

**Why:** One-size-fits-all representation loses the specific benefits of each mode. The Seed should support, not prevent, context-specific views.

**Test:** For high-frequency use contexts (kitchen, emergency, quick reference), is there a mode-optimized version? Or does the user have to manually restructure?

**Rule:** Tag knowledge with its context dependencies — note where the knowledge was captured (situation, environment, emotional state) to help future agents understand the context.

**Why:** Knowledge captured in one context may not transfer to another. A troubleshooting note written while frustrated and troubleshooting may miss steps obvious to a calm expert.

**Test:** Can you identify what context the knowledge was originally captured in? Does that context match your current use case?

## The Stress Test

### Cooking Domain
An AI building a cooking knowledge base using only current Seed rules would:
- ✓ Create atomic notes on techniques, ingredients, methods
- ✓ Link between related cooking concepts
- ✗ Not know recipes need different modes for different contexts
- ✗ Not have a "kitchen mode" vs "planning mode" representation
- ✗ Might create a beautiful concept graph that's useless when actually cooking

### Medical/Domain
An AI building a first aid knowledge base:
- ✓ Create linked notes on conditions, treatments, symptoms
- ✗ Would not have emergency-compressed versions
- ✗ Might create explanatory notes when critical-action notes are needed
- ✗ Could literally be life-threatening in emergency context

### What the Seed Needs

The Seed currently has:
- Note Types and Templates (for WHAT notes contain)
- Lifecycle (for WHEN to update)
- Link structure (for HOW to relate)

But missing:
- **Interaction Mode** (for HOW to PRESENT for different uses)
- **Context Optimization** (for WHERE the knowledge will be used)
- **Compression Rules** (for WHEN under stress/speed required)

## Related Notes

- [[Note Types and Templates]] — Could extend with mode specification
- [[Frontier Exploration - Emergency and Crisis Knowledge]] — Related: compressed mode is critical here
- [[Seed Gap - Education and Pedagogy Knowledge Bases]] — Related: progressive mode for learning
- [[Frontier Exploration - Learning Progression and Curriculum Design]] — Related: progressive structure
- **[[AI-Assisted Knowledge Management Seed]]** — See existing rules about `context-frame` (hub + variants pattern) at lines ~945-960 which covers similar ground but focuses on audience/purpose rather than interaction modes. This note extends that thinking to cover HOW knowledge is consumed (step-by-step vs browsing vs under stress).

## Questions for the Seed

1. Should interaction mode be a frontmatter field on notes?
2. How do we handle notes that serve multiple modes? Multiple representations?
3. What's the minimum viable set of modes to optimize for?

---

*This note was created during frontier exploration to identify gaps in the current Seed. It captures an emerging concept about context-dependent knowledge representation that could become a future Seed rule.*