---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-extension
  - frontier-exploration
  - abstraction-levels
---

# Frontier Exploration - Knowledge Abstraction Levels

> **Status:** This exploration has been incorporated into the Seed (Section 4: Navigation - Abstraction Levels rule). This note now serves as a validated example and deeper exploration.

The Seed addresses atomicity, linking, and navigation — and now includes explicit guidance on organizing knowledge at different abstraction levels within the same domain (see: Organize domain knowledge by explicit abstraction levels).

## The Problem

Every domain has knowledge at multiple levels of abstraction:

| Domain | Concrete (Level 1) | Patterns (Level 2) | Principles (Level 3) | Philosophy (Level 4) |
|--------|-------------------|---------------------|---------------------|---------------------|
| Programming | Specific code snippet | Design patterns | SOLID principles | "Code is liability" |
| Cooking | Recipe for coq au vin | Braising technique | Maillard reaction philosophy | "Flavor is contrast" |
| Medicine | Specific treatment protocol | Clinical guideline | Biological mechanism | Evidence hierarchy |
| Writing | Sentence structure | Narrative arc | Story grammar | "Show don't tell" |

A beginner needs Level 1-2. An expert wants Level 3-4. Same domain, different entry points.

## Current Seed Gaps

### Gap 1: No Abstraction-Level Navigation
The Seed requires 3-hop traversal but doesn't account for:
- Notes at different abstraction levels should be DIFFERENT notes (not just linked)
- Users need to find their level quickly
- Experts shouldn't wade through basics; beginners shouldn't face advanced philosophy

### Gap 2: No Guidance on Level Tagging
The Seed mentions difficulty tags but doesn't specify:
- How many levels to use
- What each level means in a domain
- How to link across levels

### Gap 3: No Testing for Level Appropriateness
No test for: "Can a beginner find beginner content? Can an expert find advanced content without filtering?"

## Proposed Seed Extension

### Rule: Organize Domain Knowledge by Abstraction Levels

For vaults with diverse expertise audiences, create explicit abstraction tiers:

**Rule:** Identify 3-4 abstraction levels for your domain. Create hub notes at each level that aggregate notes at that abstraction tier. Ensure users can find their entry point within 2 clicks.

**Why:** Without explicit abstraction levels, experts waste time filtering basics; beginners face inaccessible advanced content. Explicit tiers serve all audiences without duplicating knowledge.

**Test:** (1) Can you identify 3+ abstraction levels in your domain? (2) Does each level have a hub note? (3) Can a beginner reach appropriate content within 2 clicks from the root? (4) Can an expert reach advanced content without passing through beginner material?

### Rule: Link Across Levels, Not Just Within

**Rule:** Each note should link to its adjacent abstraction levels — the pattern it exemplifies, the principle it embodies.

**Why:** Learning flows both down (principle → application) and up (application → principle). Cross-level links enable this flow.

**Test:** Pick 5 random notes. Can you trace both up (to principles) and down (to examples) from each?

### Rule: Use Explicit Level Metadata

**Rule:** Tag notes with `level:` metadata indicating abstraction tier: `level: concrete | pattern | principle | philosophy`.

**Why:** Enables filtering by expertise level. AI agents can then serve appropriate content to appropriate users.

**Test:** Can you filter all notes by level? Does the distribution across levels reflect the domain's natural abstraction hierarchy?

## Domain-Specific Examples

### Medicine
- Level 1 (Concrete): "Amoxicillin 500mg TID for strep throat"
- Level 2 (Pattern): "Antibiotic prescribing protocol"
- Level 3 (Principle): "Bacterial resistance mechanisms"
- Level 4 (Philosophy): "Primum non nocere in antibiotic stewardship"

### Cooking
- Level 1 (Concrete): "Sear steak 3 min per side"
- Level 2 (Pattern): "Maillard reaction technique"
- Level 3 (Principle): "Flavor = fat + acid + heat + umami"
- Level 4 (Philosophy): "Cooking is controlled chemical engineering"

### Software Engineering
- Level 1 (Concrete): "Use std::vector::push_back()"
- Level 2 (Pattern): "Builder pattern for complex objects"
- Level 3 (Principle): "Open/Closed principle"
- Level 4 (Philosophy): "Code is a liability"

## Edge Cases

**Edge Case:** Some domains have only 2 natural levels (simple domains). Don't force 4 levels if 2 suffice.

**Edge Case:** Cross-domain notes may span multiple levels. Tag with primary level; add `also-levels:` for cross-tier content.

**Edge Case:** Level 4 (philosophy) notes are often debatable and subjective. Mark with appropriate confidence markers.

## Relationship to Existing Seed Rules

This extends:
- **Navigation**: Adds multi-level traversal (horizontal + vertical in addition to horizontal)
- **Atomicity**: Notes at each level should still be atomic within that level
- **Multi-Audience**: Provides structural implementation for audience differentiation
- **Prerequisites**: Level-based prerequisites create natural learning paths

## Test for the Vault

1. Pick your primary domain
2. Identify the natural abstraction levels
3. Tag 10 random notes with levels
4. Can you find beginner content without seeing advanced?
5. Can you find advanced content without filtering basics?

---

## Related
- [[Atomic Note Principle]]
- [[Hub Node Creation]]
- [[Frontier Exploration - Jargon vs Plain Language]]
- [[Note Types and Templates]]
- [[Prerequisite Knowledge Tracking]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Stress Test - Knowledge Abstraction Levels Rule in Philosophy]]
