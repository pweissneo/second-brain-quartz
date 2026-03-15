---
last-reviewed: 2026-03-13
confidence: emerging
lifecycle: active
author-type: ai-assisted
tags:
  - frontier-exploration
  - game-design
  - iterative-design
  - experiential
---

# Frontier Exploration - Game Design Knowledge

> Game design knowledge has unique properties that stress-test Seed assumptions about atomicity, verification, and experiential capture.

## The Problem

Game design is an iterative, experiential domain where theory often conflicts with playtest results. Building a knowledge base about game design using only current Seed rules would miss critical distinctions.

## Unique Knowledge Types in Game Design

### 1. Mechanical Knowledge (The Rules)

**Description:** The explicit systems that govern game behavior.

**Challenge:** Mechanics must be internally consistent - changing one rule can have cascading effects on others.

**Current Seed Gap:** No rule for handling knowledge where changes have systemic ripple effects across the vault.

**Structure:**
```yaml
knowledge-type: mechanical
consistency-requirements: high
affects: [other-mechanics]
```

### 2. Experiential Knowledge (The Feel)

**Description:** How the game "feels" to play - pacing, flow, tension, satisfaction.

**Challenge:** This is inherently tacit - hard to articulate, but experienced instantly.

**Covered by:** [[Frontier Gap - Embodied Knowledge]]

**Additional Challenge:** "Feel" is game-specific - what creates flow in an action game differs from an RPG.

### 3. Player Psychology Knowledge

**Description:** How players think, learn, and make decisions in games.

**Challenge:** Player psychology is both:
- General (cognitive biases, learning curves)
- Game-specific (genre conventions, skill progression)

**Current Seed Gap:** No rule for knowledge that exists on two abstraction levels simultaneously.

### 4. Balancing Knowledge

**Description:** Quantitative adjustments to achieve desired outcomes.

**Challenge:** 
- Numerical sensitivity (small changes = big effects)
- Context-dependent (what works in one game fails in another)
- Often contradicted by playtest results

**Structure:**
```yaml
knowledge-type: balancing
sensitivity: high|medium|low
verified-by: playtest|mathematical-analysis|community-feedback
```

### 5. Narrative-Structural Knowledge

**Description:** Story structure in games (quests, arcs, branching).

**Challenge:** 
- Interactive vs linear narrative
- Player agency vs authorial intent
- Environmental storytelling (show don't tell)

**Covered by:** [[Frontier Exploration - Iterative Creative Knowledge]]

## Gap Analysis: Where would an AI get stuck?

An AI building a game design knowledge base using only current Seed rules would struggle with:

1. **Mechanical consistency tracking** - Would not track how rule changes cascade
2. **Balancing sensitivity** - Would treat all numerical knowledge as equal sensitivity
3. **Playtest vs theory conflicts** - Would not have framework for when to trust data over intuition
4. **Genre conventions** - Would not distinguish universal game principles from genre-specific conventions
5. **Player skill progression** - Would not capture learning curve design knowledge

## Proposed Seed Rules

### Rule: For knowledge domains with high systemic interdependence, include `affects` and `affected-by` metadata

**Why:** In systems (games, economies, ecosystems), changing one element affects others. Without explicit tracking, vault becomes inconsistent.

**Test:** For notes about system elements: (1) Does frontmatter list what else this affects? (2) Can you trace dependencies? (3) When this changes, is there a process to review affected notes?

### Rule: For quantitative balancing knowledge, include sensitivity metadata

**Why:** A +1 change to damage in a game might be trivial or game-breaking depending on context. Sensitivity tagging helps prioritize review.

**Test:** For numerical recommendations: Is there sensitivity: high/medium/low? Can you identify which changes require thorough testing?

### Rule: Distinguish playtest-validated knowledge from theoretical knowledge

**Why:** Game design has high theory-practice gap. What "should" work often doesn't.

**Test:** For game design notes: (1) Is there verification-by: playtest/theory/community? (2) When theory and playtest conflict, is playtest weight higher? (3) Are there explicit "theory says X but playtest showed Y" notes?

### Rule: For genre-specific knowledge, include genre scope

**Why:** Game design conventions vary dramatically by genre. RPG stats don't apply to platformers.

**Test:** For game design notes: Is there genre-scope: [action, rpg, strategy, etc.]? Can you distinguish universal principles from genre-specific conventions?

## Related Notes

- [[Frontier Gap - Embodied Knowledge]] — The "feel" of games
- [[Frontier Exploration - Iterative Creative Knowledge]] — Design iteration
- [[Frontier Gap - Embodied Knowledge]] — The "feel" of games and experiential knowledge
- [[Stress Test - Hub Note Rule in Woodworking]] — Similar iterative domain
- [[Stress Test - Atomicity Rule Across Domains]] — Atomicity in mechanical systems

## Test Case: Building a Game Design Knowledge Base

Using only current Seed rules, an AI would:
- Create atomic notes for each mechanic
- Link mechanics to each other
- Use confidence markers appropriately
- Track verification status

But it would NOT capture:
- That mechanical changes cascade (need `affects` metadata)
- That numerical balancing has sensitivity levels
- That playtest results override theory
- That genre conventions are scope-specific

This represents a domain where systemic interdependence and high theory-practice gap require special handling.
