---
last-reviewed: 2026-04-01
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - frontier-exploration
  - interactive-narrative
  - game-narrative
  - branching-story
  - creative-writing
---

# Frontier Exploration: Interactive Narrative Knowledge

> How should knowledge bases handle narrative knowledge that branches based on reader/player choices?

## The Problem

The Seed covers creative composition and creative project knowledge bases, but interactive narrative — where the story structure depends on reader/player decisions — is a distinct domain needing specialized guidance:

- **Branching structure** — Not linear like novels/plays, but tree/graph structures
- **State tracking** — Reader choices create persistent state affecting future branches
- **Variable endpoints** — Multiple endings, not a single conclusion
- **Re-read/replay value** — Knowledge structured for exploration, not single consumption
- **Choice architecture** — Author makes design decisions about player agency

## Gap Analysis

### What the Seed Covers

The Seed has solid foundations:

1. **Creative composition rules** (Rule 63-66) — Principles + examples pattern
2. **Creative project knowledge base** (Rule 68-72) — Phase tracking for creative projects
3. **Narrative knowledge** — Some coverage in frontier notes

### What's Missing

1. **Branching Structure Organization**
   - The Seed assumes linear or network knowledge structures
   - Interactive narrative uses tree/graph structures
   - No guidance on organizing branching knowledge

2. **State Management Knowledge**
   - Interactive narratives track state (inventory, relationships, flags)
   - No Seed guidance for state-dependent knowledge
   - How to document state mechanics

3. **Choice Point Documentation**
   - Key decision points that branch the narrative
   - How to organize write-around/branch-around knowledge
   - Tracking which choices lead to which outcomes

4. **Replay/Re-experience Knowledge**
   - Unlike linear media, interactive narrative is meant to be experienced multiple times
   - Knowledge structure should enable multiple entry points
   - Organization differs from "read once" media

5. **Variable Epilogue/Ending Knowledge**
   - Endings dependent on accumulated choices
   - How to document ending conditions and requirements
   - Relationship between ending types and branch paths

## Domain Examples

### Interactive Fiction (IF) / Choice-Based Games

Current Seed issues:
- Note organization assumes linear progression
- Branches create "orphaned" paths not connected to main narrative
- Choice state mechanics aren't documented as dependencies
- Multiple endings aren't connected to choice conditions

### Visual Novels

Specific issues:
- Route structure (true route vs. pseudo-route)
- Relationship tracking between characters
- CG/scene unlocking based on choices
- Flag systems for story progression

### Tabletop RPG Campaign Notes

Issues:
- Branching based on player decisions
- State tracking (NPC attitudes, inventory, quest progress)
- Multiple potential campaigns from same setup
- GM vs. player knowledge boundaries

### CYOA (Choose Your Own Adventure) Books

Issues:
- Page-to-page branching structure
- Condition-based navigation
- Reader agency vs. author planning

## Unique Knowledge Types Needed

### 1. Branch Map Knowledge

```yaml
interactive-type: branch-map
structure: tree|graph|hub-and-spoke
branch-points: number
ending-count: number
```

### 2. State Variable Knowledge

```yaml
interactive-type: state-tracker
variables: [list]
trigger-conditions: [logic]
persistence: session|permanent
```

### 3. Choice Architecture Knowledge

```yaml
interactive-type: choice-architecture
choice-type: meaningful|cosmetic|milestone
stakes-level: high|medium|low
reveal-hidden: true|false
```

### 4. Route Documentation

```yaml
interactive-type: route
route-name: string
prerequisites: [list]
exclusive: true|false
endpoint: string
```

## Proposed Seed Enhancement

### Rule: Branch-Aware Note Organization

For interactive narrative knowledge:
1. Branch maps document structure, not just content
2. State variables tracked as dependency knowledge
3. Each major branch point has dedicated documentation
4. Multiple endings linked to their prerequisite conditions

```yaml
interactive-narrative: true
story-structure: branching|linear-with-branches|hub-and-spoke
branch-count: number
ending-count: number
requires-state-tracking: true|false
```

### Rule: Variable Endpoint Organization

For knowledge about variable endings:
1. Document each ending condition
2. Track which branches lead to which endings
3. Note shared vs. unique ending content
4. Document relationship between endings

### Rule: Choice Consequence Capture

For choice point knowledge:
1. Document what's affected by each choice
2. Track irreversible vs. reversible choices
3. Document "lock-out" conditions (choices that close future paths)
4. Note player agency level (meaningful vs. illusion)

### Test for Interactive Narrative Knowledge

For notes about branching stories:
1. Does branch structure map exist?
2. Are state dependencies documented?
3. Can you trace choice → consequence?
4. Are multiple endings linked to their conditions?
5. Is replay value considered in organization?

## Connection to Existing Seed Rules

- **[[AI-Assisted Knowledge Management Seed]]** — Creative composition rules (Rule 63-66), Creative project knowledge base (Rule 68-72)
- [[Seed Gap - Creative Project Phase Knowledge]] — Phase tracking for creative projects
- [[Frontier Exploration - Creative Writing Knowledge Base Gaps]] — Related creative writing guidance
- [[Frontier Exploration - Problem-Centered Knowledge Organization]] — For choice point organization
- [[Frontier Exploration - Multi-Representation Knowledge]] — For multiple ending representations

## Why This Matters

Interactive narrative is a growing medium (games, visual novels, ARGs, TTRPGs):
- Existing Seed rules assume linear or network knowledge
- Branching structures are fundamentally different
- No existing guidance for state-dependent knowledge organization
- Growing gap as interactive media expands

The Seed covers "what to capture" but not "how to organize branching knowledge."