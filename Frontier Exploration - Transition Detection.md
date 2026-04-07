---
last-reviewed: 2026-04-05
last-updated: 2026-04-05
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: meta
access-pattern: learning
gap-status: proposed
---

# Frontier Exploration - Transition Detection in Knowledge Management

> How should AI agents detect and handle transitions — both vault maturity shifts and goal/context changes?

## The Gap

The Seed covers several types of transitions but lacks explicit detection mechanisms:

1. **Exploration-Exploitation transitions** — when to stop adding new topics and start deepening
2. **Goal/Context transitions** — when knowledge becomes irrelevant because user priorities changed
3. **Staleness and Obsolescence** — when knowledge expires (already covered in Seed)

The Seed provides ratio-based guidance:
> New vaults favor exploration (70/30), mature vaults favor exploitation (80/20)

But it doesn't address:
- **When** to trigger the transition
- **What signals** indicate the transition point
- **How to handle** goal-transitioned knowledge specifically

This note consolidates both transition types into actionable detection mechanisms.

## Part 1: Exploration-Exploitation Transition Triggers

### Current Guidance Is Vague

The Seed says:
- New vaults: <50 notes = exploration
- Mature vaults: >200 notes = exploitation

But this is arbitrary. A 200-note vault on narrow topics might be deeply developed, while a 200-note vault covering many domains might be shallow.

### Executable Transition Triggers

**Trigger 1: Diminishing Returns Detection**
When new topics produce fewer connections than existing topics, exploitation likely offers better returns.

**Test (EXECUTABLE):** 
1. For the last 10 notes added, query incoming link count for each
2. Calculate 5-note moving average of incoming links
3. If average declined for 2 consecutive windows → transition toward exploitation

**Example calculation:**
- Window 1 (notes 1-5): avg 2.3 incoming links
- Window 2 (notes 2-6): avg 1.8 incoming links ← declining
- Window 3 (notes 3-7): avg 1.5 incoming links ← declining → TRIGGER

**Trigger 2: Core Hub Saturation**
When major topic hubs have <3 sub-notes, the topic isn't developed enough to exploit.

**Test (EXECUTABLE):**
1. Identify top 5 hubs by incoming link count
2. For each hub, count distinct outgoing links
3. If average <3 for 3+ hubs → continue exploration

**Note:** Filter out _root.md from hub list (it's artificially high)

**Trigger 3: Retrieval Failure Rate**
When unable to find answers in the vault, it indicates gaps (exploration) not depth.

**Test (EXECUTABLE):**
1. Log each retrieval query with success/failure flag
2. Success = found ≥2 relevant notes with actionable content
3. Calculate failure rate over rolling 30-day window
4. If failure rate >20% → continue exploration

## Part 2: Goal/Context Transition Detection

### The Problem

When users change their goals, projects, or life priorities, knowledge that was previously useful becomes irrelevant — not because it was wrong, but because the context that made it applicable no longer exists.

**Goal/context transition** is different from:
- **Staleness**: Knowledge correct but time has passed (needs review)
- **Obsolescence**: Knowledge correct but reality changed (needs replacement)
- **Context-shift**: Knowledge applies to others but not you personally

Examples:
- Notes about preparing for a job interview for a role you decided not to pursue
- Research on a city you were considering moving to, but you've chosen elsewhere
- Learning resources for a skill you decided not to acquire
- Project planning for an initiative you abandoned
- Recipe collections for dietary restrictions you've lifted

### Why It Matters

Without goal tracking, AI agents cannot distinguish:
1. **Maintenance waste**: Agents continue verifying knowledge no longer relevant
2. **Retrieval confusion**: Users get content that is accurate but goal-irrelevant
3. **Goal drift invisibility**: Vault doesn't reflect user's evolving priorities

### Executable Goal Transition Detection

**Test (EXECUTABLE):**
1. For purpose-specific notes, check for `applicable-goal:` frontmatter
2. Maintain a simple "current goals" list in vault metadata
3. Flag notes whose applicable-goal is no longer in current goals
4. Apply handling: archive (keep with goal context), tag (mark as goal-transitioned), or delete

**Handling options:**
- Archive: Keep with explicit goal context in metadata
- Tag: Mark as `goal-transitioned: true`
- Delete: Remove if no historical value

## Proposed Seed Rule

**Rule:** Track both vault-maturity transitions AND goal/context dependencies — use executable triggers for exploration-exploitation shifts, and goal metadata for purpose-specific knowledge.

**Why:** Without explicit transition detection, AI agents rely on arbitrary thresholds and cannot distinguish between stale (time), obsolete (reality), or goal-transitioned (priorities changed) knowledge. Both transition types waste maintenance effort when undetected.

**Test:** 
1. For vault transitions: Do you use diminishing returns, hub saturation, or retrieval failure triggers?
2. For goal transitions: Can you identify what goal made knowledge applicable? Is there a mechanism to detect goal changes?

## Related Notes

- [[Seed Gap - Knowledge Deprecation and Obsolescence Management]]
- [[Frontier Exploration - Note Completion Criteria]]
- [[Frontier Exploration - When a Note Has Become Obsolete]]
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]]
- [[AI-Assisted Knowledge Management Seed.md]]