---
last-reviewed: 2026-03-16
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
schema-version: "1.0"
domain-familiarity: assessed
tags:
  - frontier-exploration
  - culinary
  - recipe-creation
  - menu-design
  - meal-coordination
  - creative-composition
---

# Frontier Exploration: Recipe, Menu, and Meal Coordination Knowledge

## The Gap

The Seed addresses cooking techniques, procedures, and ingredients (see: Seed Stress Test - Cooking Knowledge Base). But there's a distinct knowledge domain that the Seed doesn't explicitly cover: **recipe and menu design** — the creative composition aspect of cooking — AND **multi-dish meal coordination** — orchestrating multiple interdependent dishes.

Building a knowledge base about *creating* recipes (not just *executing* them) and *coordinating meals* (not just cooking dishes) surfaces challenges the Seed doesn't have explicit rules for.

## Two Related but Distinct Knowledge Types

### 1. Recipe and Menu Design Knowledge (Creative Composition)

This is about the creative composition aspect of cooking — designing recipes and constructing menus.

**What's Different About Recipe/Menu Design?**

- **Creative Composition vs Technical Execution:** Cooking technique knowledge is about procedures (temperatures, times, methods). Recipe design knowledge is about composition — how elements combine into a whole. "Searing creates a Maillard reaction" is technique. "Sweet + acid + fat + umami creates balanced flavor" is composition.

- **Multi-Dimensional Aesthetic Judgment:** Menu design requires balancing flavor profiles (sweet, sour, salty, bitter, umami, spicy), textures (crisp, creamy, crunchy, smooth), aromatics (herbal, smoky, floral), visual presentation, palate cleansing between courses, and cultural context.

- **Knowledge That Exists in Practice But Not Rules:** Experienced recipe developers operate with intuitive principles that aren't documented — "a dish needs contrast," "build from foundation to finish," "think in layers."

### 2. Multi-Dish Meal Coordination Knowledge (Event Orchestration)

This is about coordinating multiple interdependent dishes — a meal where timing, flavor balance, and resource management must be orchestrated together.

**What's Different About Meal Coordination?**

- **Coordination vs Execution:** Individual recipe knowledge is atomic; coordination knowledge is orthogonal. A recipe is a procedure to execute; meal coordination is about orchestrating multiple procedures together.

- **Resource Management:** Shared equipment, oven space, stovetop slots, timing conflicts — these are distinct from individual recipe knowledge.

- **Timing Relationships:** When does the soup go out relative to the roasted chicken? What can be made ahead vs. must be fresh? These are coordination decisions.

## Where an AI Agent Would Get Stuck

### Scenario: Building a Recipe Development Knowledge Base

An AI agent following the Seed tries to organize recipe design knowledge:

1. **Atomicity fails:** How do you split "flavor balancing" into atomic notes when it's inherently about relationships between multiple elements?

2. **Linking guidance fails:** The Seed requires 2+ outgoing links per note. But composition principles connect to everything — they're meta-principles, not content nodes.

3. **Diminishing returns fails:** Is "flavor wheel theory" useful? It connects to many topics, but its utility is hard to assess without actually creating dishes and testing them.

4. **Source quality fails:** Unlike law or medicine, there's no authority hierarchy in recipe design. A famous chef's intuition isn't necessarily "better" than a home cook's experiment.

5. **Temporal knowledge fails:** Recipes and trends change, but slowly. What's "classic" vs "trendy" vs "dated" in recipe design?

### Scenario: Building a Multi-Dish Meal Knowledge Base

- "How do I plan a 3-course meal?" — no explicit guidance
- "Which dishes should I serve before fish vs. after?" — no rule
- "How do I time a soup + roasted chicken + dessert?" — procedural but multi-dish
- "What should I cook given only a sheet pan and one pot?" — constraint-based planning

## Proposed Seed Rules

### Rule: Organize Creative Composition as Principles, Not Procedures

**Rule:** For creative composition knowledge (recipe design, menu planning, artistic creation), organize around principles rather than procedures. Create hub notes for compositional concepts (flavor balance, texture contrast, aromatics) that connect to specific examples, rather than organizing around specific recipes.

**Why:** Composition knowledge is inherently about relationships between elements. Organizing by principles creates a reusable framework; organizing by specific recipes creates a collection that doesn't transfer.

**Test:** For notes about creative composition: (1) Does this express a principle that could apply to multiple creations? (2) Does it connect to examples of that principle in action? (3) Could someone use this to create something new, or only to replicate something existing?

**Edge case:** Specific recipes with unique value (family recipes, signature dishes) should remain as specific notes, but should link to the compositional principles they embody.

### Rule: Create Coordination Knowledge Separate from Item Knowledge

**Rule:** For domains with interdependent multi-item creation (cooking meals, event planning, project portfolios), create coordination knowledge separate from item knowledge — document timing relationships, resource conflicts, and sequencing rules as atomic notes.

**Why:** Individual item notes (recipes, tasks) are atomic; coordination knowledge is orthogonal. Without explicit coordination notes, the vault contains recipes but lacks meal-level guidance.

**Test:** Can you find coordination notes for multi-item events? Do timing relationships exist as separate notes? Are resource conflicts documented?

**Edge cases:**
- Some domains have natural coordination structures (concert programs, meeting agendas) — treat similarly
- Multi-dish coordination knowledge is often personal/preference-based — capture individual context
- Make-ahead vs. fresh timing creates different coordination requirements

## What This Adds to the Seed

This frontier reveals that the Seed treats "procedural content" as a single category, but there's a meaningful distinction between:
- **Technical procedures** (how to execute)
- **Creative composition** (how to design)  
- **Event coordination** (how to orchestrate multiple procedures)

The Seed addresses procedural content well. Creative composition benefits from principle-based organization. Coordination knowledge requires separate atomic notes for timing and resources.

This is similar to how the Seed distinguishes thinking tools from domain knowledge, but for different axes: creative composition vs technical execution vs coordination.

## Related Seed Rules

- [[Seed Stress Test - Cooking Knowledge Base]] — covers cooking techniques and procedures
- [[Frontier Gap - Embodied Knowledge]] — covers execution uncertainty and compositional creativity
- [[Frontier Exploration - User Situational Constraints]] — constraint-based planning
- [[Frontier Exploration - Equipment and Tool Dependencies]] — resource constraints
- [[Handling Temporal Knowledge]] — timing and sequencing