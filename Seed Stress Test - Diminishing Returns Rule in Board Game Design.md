---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
confidence: medium
author-type: ai-assisted
knowledge-type: frontier-exploration
lifecycle: draft
tags:
  - seed-stress-test
  - diminishing-returns
  - board-games
  - game-design
  - experiential-knowledge
---

# Seed Stress Test: Diminishing Returns Rule in Board Game Design

**Domain tested:** Board Game Design  
**Rule tested:** "Use diminishing returns testing before adding notes to existing topics"  
**Date:** 2026-03-18

## Analysis

### Does this rule make sense for board game design?

**Partially.** Board game design is a hybrid domain that combines:
1. **Technical mechanics** (probability, game theory, systems design) — objectively testable
2. **Creative design** (theme, narrative, player experience) — subjective, execution-dependent
3. **Experiential playtesting** — requires actually playing to verify

The standard diminishing returns test assumes you can evaluate utility without execution. But in game design:
- A mechanic that seems redundant in description may create emergent gameplay
- A theme that sounds similar to existing games may resonate differently
- Playtest feedback is often contradictory (some players love, others hate)

### Is the rule's Test executable?

**Test:** "Skip or defer if the note fails 2+ of: utility (improves vault answers), connection (links to 2+ existing naturally), uniqueness (adds new knowledge), effort (maintenance worth value)"

**Problems in game design:**

1. **Utility is context-dependent:** A note about "deck building mechanics" has high utility for someone designing a deck builder, zero utility for someone designing a party game. The test assumes utility is measurable independent of the designer's current project.

2. **Uniqueness is misleading:** Most game mechanics have been done. "Unique" in game design often means "adds YOUR specific context" rather than "not available elsewhere."

3. **Connection quality varies by project phase:** During early design exploration, many connections feel natural but later become irrelevant. During refinement, connections are tighter but fewer.

### Edge cases identified

#### 1. Mechanic Inspiration Notes

**Problem:** Notes about "mechanics to explore" may fail all four tests but be essential for creative ideation. "What if dice drafting?" seems:
- Low utility (not answering a question)
- Few connections (nothing to link to yet)
- Not unique (dice drafting exists)
- Low effort (just an idea)

Yet such notes are valuable seeds for design exploration.

**Resolution:** Add "ideation-phase" category exempt from diminishing returns. Tag with `design-phase: ideation|exploration|development|refinement`.

#### 2. Playtest Feedback Notes

**Problem:** Playtest feedback is highly contextual and often contradictory. A note capturing "Player A loved the combat system, Player B hated it" fails uniqueness (playtest feedback is common) but has high value for specific design迭代.

**Resolution:** Playtest notes should be tagged `knowledge-type: experiential` with `verification-status: testing`. They don't count toward diminishing returns calculations until synthesized into design principles.

#### 3. Genre-Specific Knowledge

**Problem:** Strategy advice that works in one genre (e.g., "economy engines are strong") may be harmful in another (e.g., party games). The diminishing returns test doesn't account for genre-specific validity.

**Resolution:** Add `genre-scope:` frontmatter to indicate which game genres the knowledge applies to. The test should check: does this add uniqueness within its genre scope?

#### 4. Player Count Dependency

**Problem:** "Rush strategies work well" is true in 2-player abstracts but FALSE in 4+ player games. Knowledge validity changes with player count — the test doesn't account for this.

**Resolution:** Add `player-count:` field with values `2-player|3-4-player|5+-player|any`. Diminishing returns test should verify scope is defined.

#### 5. Skill Tier Dependency

**Problem:** Strategy that works for beginners often contradicts expert strategy. "Don't trade pieces" (maintain material) vs "Trade pieces when ahead" (simplify to winning endgame). The test assumes advice is universally valid.

**Resolution:** Add `skill-tier:` field with values `beginner|intermediate|expert|universal`. Knowledge contradicting across tiers should be documented with explicit contradiction markers.

## Proposed Edge Cases

**Edge case (NEW - stress test 2026-03-18):** In board game design and similar creative-experiential hybrid domains, diminishing returns testing needs significant modification:

- **Phase-aware testing:** Apply different thresholds based on design phase:
  - Ideation: No diminishing returns — encourage exploration
  - Exploration: Relaxed test (fail 3+ of 4 to skip)
  - Development: Standard test (fail 2+ of 4 to skip)
  - Refinement: Strict test (fail 1+ of 4 to skip)

- **Project-specific utility:** For design-in-progress vaults, utility should be measured against the current project, not abstract "vault answers."

- **Experiential exemption:** Playtest feedback notes don't count toward diminishing returns until synthesized into design principles.

- **Genre and scope tagging:** Require `genre-scope:`, `player-count:`, and `skill-tier:` fields to enable accurate uniqueness assessment.

**Modified test for game design:**
For game design notes: (1) Does this apply to a specific design phase? (2) Does it have clear scope boundaries (genre, player count, skill tier)? (3) Is playtest feedback tagged as experiential before synthesis? (4) Could this inspire new mechanics even if it fails other tests?

Count as passing if yes to 1-2 OR yes to 4 (ideation exemption).

## Related Seed Rules

- [[Frontier Exploration - Board Game Knowledge Bases]]
- [[Seed Stress Test - Diminishing Returns Rule in Machine Learning Data Science]] (rapidly-evolving technical domain)
- [[Seed Stress Test - Cooking Knowledge Base]] (experiential domain)
- [[Seed Stress Test - Photography Knowledge Base]] (hybrid technical-aesthetic)

---

*This note captures a stress-test finding. If validated, propose edge case addition to the diminishing returns rule in the Seed.*

- [[AI-Assisted Knowledge Management Seed]] (source of rules being tested)
