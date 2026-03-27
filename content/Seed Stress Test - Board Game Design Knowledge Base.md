---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - board-games
  - game-design
  - experiential-knowledge
  - diminishing-returns
---

# Seed Stress Test: Board Game Design Knowledge Base

**Date:** 2026-03-24  
**Domain:** Board Game Design  
**Method:** SEED_STRESS_TEST

---

## Rule Under Test

**Rule:** Apply diminishing returns testing before adding notes — skip if note fails 2+ of: utility, connection, uniqueness, effort.

**Modified Test (Game Design):** For game design notes:
1. Does this apply to a specific design phase?
2. Does it have clear scope boundaries (genre, player count, skill tier)?
3. Is playtest feedback tagged as experiential before synthesis?
4. Could this inspire new mechanics even if it fails other tests?

Count as passing if yes to 1-2 OR yes to 4 (ideation exemption).

---

## Domain Overview

Board game design knowledge bases face unique challenges:
- **Phase-dependent utility:** Ideas valuable in ideation may fail in development
- **Genre-specific knowledge:** Worker placement vs. deck building vs. social deduction
- **Player-count sensitivity:** Strategy validity changes dramatically by player count
- **Skill-tier contradictions:** Beginner advice often contradicts expert advice
- **Hidden information mechanics:** Perfect vs. imperfect information requires different strategy
- **Experiential knowledge:** Game "fun" cannot be verified by sources — only playtesting
- **Meta-strategy:** How to learn games is distinct from how to play well

---

## Stress Test Results

### 1. Construction Phase Model

**Rule:** Use construction-phase model — apply relaxed standards during bootstrap, tighten as vault matures.

**Test in Game Design:**
- Skeleton phase: 1-20 notes
- At 50 notes: evaluate orphan rate, hub creation, domain coverage

**Result:** The rule makes sense for game design with one major adaptation needed:

**Issue Found:** Game design has distinct PHASES (ideation → prototyping → development → refinement → playtesting) that affect construction more than note count. A note count threshold doesn't capture phase transitions.

**Recommendation:** Add `design-phase:` frontmatter (ideation|prototyping|development|refinement|playtesting) and apply phase-aware thresholds instead of note-count-based ones.

---

### 2. Diminishing Returns Test

**Rule:** Skip or defer if note fails 2+ of: utility, connection, uniqueness, effort.

**Test in Game Design:**

| Criterion | Assessment |
|-----------|------------|
| Utility | Phase-dependent — idea valuable in ideation may fail in development |
| Connection | Genre-specific — worker placement connects to different pool than deck building |
| Uniqueness | Hard to assess — many mechanics are variations on common themes |
| Effort | Playtest feedback requires synthesis, not just capture |

**Edge Cases Found:**

#### Phase-Aware Utility

**Problem:** A note about "action economy" is high-utility in development (balancing) but may be premature in ideation (focus on core mechanic first).

**Test Failure:** The diminishing returns test doesn't account for phase-dependent utility. A note can be valuable but premature.

**Recommendation:** Add `phase-utility:` field (ideation|prototyping|development|refinement|playtesting|all-phase) to indicate when knowledge is most useful.

#### Genre-Scoped Uniqueness

**Problem:** "Deck building" as a mechanic is not unique — hundreds of games use it. But "deck building in cooperative games" might be novel.

**Test Failure:** Uniqueness assessment needs genre scope. A mechanic that's common overall may be novel within a specific genre context.

**Recommendation:** Require `genre-scope:` field for uniqueness assessment. Uniqueness should be evaluated within genre, not across all games.

#### Player-Count Dependency

**Problem:** "Rush strategies work" is true in 2-player chess but false in 6-player Diplomacy.

**Test:** The Seed doesn't explicitly handle knowledge that's TRUE at one player count but FALSE at another.

**Recommendation:** Add `player-count:` field with values (2-player|3-4-player|5-6-player|any) to enable player-count-aware utility assessment.

---

### 3. Verification Ratio Rule

**Rule:** Verify at least 50% of new captures within 30 days.

**Test in Game Design:**

**Major Issue:** Game design knowledge (especially about "fun") CANNOT be verified through source checking. A note claiming "this mechanic is fun" must be verified through playtesting, not reading rules or reviews.

**Test Failure:** Standard verification workflow assumes source verification is possible. But game design verification requires empirical testing.

**Recommendation:** The Seed's new rule about "empirical validation" (2026-03-24) is critical for game design. Apply:
- `validation-mode: empirical` for claims about fun, engagement, balance
- Track empirical evidence separately from source quality
- Set realistic verification timelines (playtesting cycles take weeks, not days)

---

### 4. Atomicity in Game Design

**Rule:** Every note must contain exactly one idea, summarizable in one sentence.

**Test in Game Design:**

#### Edge Case: Mechanics vs. Concepts

**Problem:** A note about "deck building" could be:
- A MECHANIC (how it works mechanically)
- A GENRE (games that use this mechanic)
- A PRINCIPLE (why it's engaging)
- A TROUBLESHOOTING guide (common deck building problems)

These are genuinely different ideas that could legitimately be in separate notes.

**Analysis:** The atomicity rule works IF the note clearly serves one purpose. But game design notes often conflate mechanic + principle + example.

**Recommendation:** Apply `knowledge-modality:` tagging to distinguish:
- `modality: mechanic-definition` — what the mechanic IS
- `modality: genre-context` — games that use this mechanic
- `modality: design-principle` — why it works (or doesn't)
- `modality: troubleshooting` — common problems and solutions

#### Edge Case: Complete Game Notes

**Problem:** A comprehensive note about a specific game (e.g., "Terraforming Mars") might cover:
- Core mechanics
- Strategy overview
- Play experience
- Variants and expansions
- Comparison to similar games

This exceeds 300 words easily but is arguably ONE idea (everything about this game).

**Test:** Is this one game comprehensively covered, or multiple ideas bundled?

**Recommendation:** Allow single-game notes to exceed 300 words when they cover one complete game. The test should be: "Could this note help someone play this specific game?" If yes, keep together.

---

### 5. Confidence Markers in Game Design

**Rule:** Use confidence markers to indicate reliability.

**Test in Game Design:**

| Claim Type | Appropriate Confidence |
|------------|------------------------|
| "Rules allow X" | High (verifiable fact) |
| "This mechanic is fun" | Low/emerging (subjective, requires testing) |
| "This combo is overpowered" | Emerging (meta-dependent, player-skill dependent) |
| "Experts recommend Y" | Medium (expert consensus exists in some circles) |

**Issue Found:** Many game design claims are treated as facts when they're really subjective or meta-skill dependent.

**Recommendation:** Default to `confidence: emerging` for any claim about:
- Fun, engagement, enjoyment
- Balance (depends on playtest data)
- Difficulty (depends on target audience)
- Best practices (depends on genre and target market)

---

### 6. The 5:1 Personal-to-General Ratio

**Rule:** Capture insights, decisions, and experiences (personal) over restatable facts (general).

**Test in Game Design:**

**Analysis:**

| Type | Personal or General? |
|------|---------------------|
| "Rules of Catan" | General (publicly available) |
| "My house rules for Catan" | Personal |
| "How to design a engine-building game" | General (widely available) |
| "Why my engine-building prototype failed" | Personal (unique experimentation) |
| "Deck building is popular" | General |
| "My playtest showed deck building + cooperative works" | Personal |

**Edge Cases Found:**

#### Game Weight/Skill Tier Knowledge

**Problem:** "This game is for experienced players" is presented as fact but is really a generalization. What's "complex" for a beginner may be "simple" for a veteran.

**Recommendation:** Use `applicability-scope:` field. A game that's "complex" for beginners but "medium" for experts should tag both: `skill-tier: beginner,experienced` with appropriate scope notes.

#### "Fun" Is Not Transferable

**Problem:** "This game is fun" is presented as general knowledge but is really one play group's experience.

**Recommendation:** Treat "fun" claims as personal-equivalent. The note should document: WHO found it fun, under WHAT conditions, with WHAT play group composition.

---

### 7. Experience-Level Knowledge Gating

**Rule:** Distinguish beginner vs. expert knowledge.

**Test in Game Design:**

**Major Issue:** In game design, advice for BEGINNERS often CONTRADICTS advice for EXPERTS:

| Beginner Advice | Expert Advice |
|-----------------|----------------|
| "Don't trade pieces" (maintain material) | "Trade pieces when ahead" (simplify to winning endgame) |
| "Focus on one strategy" | "Build flexible, respond to opponents" |
| "Play cards you're dealt" | "Manipulate the market/card supply" |

**These are direct contradictions**, not just different complexity levels.

**Recommendation:** The Seed needs explicit contradiction handling for skill-tier-dependent knowledge:
- Tag notes with `contradicts-skill-tier: beginner|expert`
- Create synthesis notes that acknowledge the contradiction with resolution guidance

---

### 8. Tagging for Game Design

**Rule:** Use controlled vocabularies for taxonomy tags.

**Test in Game Design:**

Proposed tagging schema for game design notes:

```yaml
# Core tags
tags:
  - board-game
  - game-design

# Genre scoping
genre-scope: 
  - worker-placement
  - deck-building
  - area-control
  - social-deduction
  - engine-building

# Design phase
design-phase: ideation|prototyping|development|refinement|playtesting

# Player count applicability
player-count: 2|3-4|5-6|any

# Skill tier
skill-tier: beginner|intermediate|advanced|any

# Information type
information-type: perfect-information|imperfect-information

# Knowledge modality
knowledge-modality: mechanic-definition|genre-context|design-principle|troubleshooting|balance-analysis|playtest-feedback
```

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Construction Phase | Phase transitions don't map to note count | Add `design-phase:` frontmatter |
| Diminishing Returns | Phase-dependent utility | Add `phase-utility:` field |
| Diminishing Returns | Genre-scoped uniqueness | Require `genre-scope:` for uniqueness assessment |
| Diminishing Returns | Player-count dependency | Add `player-count:` field |
| Verification | Fun can't be source-verified | Apply empirical validation mode |
| Atomicity | Mechanics vs. concepts | Use `knowledge-modality:` |
| Atomicity | Complete game notes | Allow single-game notes to exceed 300 words |
| Confidence | "Fun" treated as fact | Default to `confidence: emerging` for subjective claims |
| 5:1 Ratio | "Fun" claims are personal-equivalent | Tag "fun" claims with `applicability-scope:` |
| Expertise Gating | Beginner/expert contradictions | Add contradiction handling for skill-tier |

---

## Recommendations for Seed

1. **Design Phase Tagging:** Add `design-phase:` (ideation|prototyping|development|refinement|playtesting) as standard frontmatter for game design notes.

2. **Phase-Aware Utility:** Add `phase-utility:` field to indicate when knowledge is most valuable.

3. **Genre Scope:** Require `genre-scope:` for uniqueness assessment within game design.

4. **Player Count Tagging:** Add mandatory `player-count:` field for strategy notes.

5. **Skill-Tier Contradiction Handling:** Create mechanism for notes that directly contradict based on target skill level.

6. **Empirical Validation:** Explicitly apply empirical validation mode to game design knowledge about "fun", balance, and engagement.

7. **Information Type Tagging:** Add `information-type: perfect-information|imperfect-information` for mechanic notes.

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Board Game Knowledge Bases]]
- [[Frontier Exploration - Game Design Knowledge Bases]]
- [[Seed Stress Test - 5-1 Ratio Across Domains]] (for ratio edge cases)
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]] (for diminishing returns edge cases)
- [[Seed Gap - Sensory Anchor Standardization]] (for experiential verification)
- [[Seed Stress Test - Knowledge Modality Rule in Cooking]] (for modality tagging precedent)
- [[_root]]
