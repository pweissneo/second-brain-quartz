---
last-reviewed: 2026-03-18
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
status: draft
review-by: 2026-03-25
tags:
  - frontier-exploration
  - board-games
  - strategy
  - experiential-knowledge
---

# Frontier Exploration - Board Game Knowledge Bases

> Notes on capturing knowledge about strategy games, board games, and tabletop gaming.

## The Challenge

Board game knowledge presents unique challenges:
- Rules are precise (must be followed exactly)
- Strategy knowledge is deeply experiential (learned through play)
- Meta-strategy (how to learn games efficiently) is distinct from in-game strategy
- Some games have perfect information, others have hidden information
- Strategy varies dramatically by player count and skill distribution

## Why Standard Approaches May Fail

### Atomicity Challenges
- "Opening theory" in chess vs "general principles" - where's the boundary?
- Strategy concepts often require context (the position, the phase, the player count)
- Some advice is only valid at certain player counts

### Verification Challenges
- Strategy effectiveness depends on opponents (what works against novices may fail against experts)
- Meta-strategy (how to learn) is difficult to verify (did you learn faster?)
- Some knowledge is table-specific (house rules, group dynamics)

### Linking Challenges
- Games connect to: rules, strategies, expansions, player count variants
- The same concept applies differently at different player counts
- Strategy often contradicts: "control the center" vs "attack the edges"

## Seed Gaps Identified

### Gap 1: Player-Count Dependent Knowledge
The Seed doesn't explicitly handle knowledge that is TRUE at one player count but FALSE at another.
- "Rush strategies work" - true in 2-player, false in 6-player
- " alliances are important" - true in multiplayer, false in 2-player

**Rule needed:** Player-count scoping - explicit tagging of when strategy advice applies

### Gap 2: Skill-Level Dependent Knowledge
Strategy advice for beginners often contradicts expert strategy.
- "Don't trade pieces" (beginner: maintain material) vs "Trade pieces when ahead" (expert: simplify to winning endgame)
- The Seed covers expertise levels but not the specific case where advice CONTRADICTS based on skill level

**Rule needed:** Skill-tier specific variants with explicit contradiction markers

### Gap 3: Hidden Information Games
Games with hidden information (cards, dice, secret objectives) require different strategy than perfect information games.
- Probability becomes central
- Bluffing and deception are valid strategies
- "Good positions" can be misread due to hidden information

**Rule needed:** Information-state tagging (perfect-information vs hidden-information domains)

### Gap 4: Meta-Learning About Games
How to LEARN a game is distinct from how to PLAY well:
- Rule acquisition strategies
- Practice methodologies
- How to find practice partners
- How to analyze your own games

**Rule needed:** Meta-procedural knowledge - knowledge about how to acquire knowledge, separate from the knowledge itself

### Gap 5: Table/Group Specific Knowledge
House rules, group dynamics, and play style preferences are:
- True for your specific group
- False or harmful in tournament settings
- Not transferable but still valuable

**Rule needed:** Scope-specific knowledge with explicit transfer warnings

## Proposed Seed Rules

### Rule: Scope Strategy Knowledge by Player Count
When capturing strategy notes, include explicit `player-count:` frontmatter:
- `player-count: 2` - only applies to 2-player games
- `player-count: 3-4` - applies to small group
- `player-count: 5+` - applies to large group
- `player-count: any` - universal

### Rule: Tag Skill-Contradicto ry Advice
When capturing advice that contradicts based on expertise level, use:
```yaml
skill-tier-contradiction: true
beginner-advice: "Don't trade pieces"
expert-advice: "Trade when ahead"
transition-point: "When you understand endgame fundamentals"
```

### Rule: Distinguish Information Transparency
For game strategy notes:
```yaml
information-state: perfect-information|hidden-information|mixed
probability-relevant: true|false
bluffing-valid: true|false
```

### Rule: Capture Meta-Learning Separately
Separate how to learn from what to know:
```yaml
meta-type: rule-acquisition|practice-methodology|self-analysis|opponent-study
knowledge-type: meta-procedural vs in-game
```

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] - Core Seed rules including expertise-level tagging
- [[Seed Stress Test - Chess Knowledge Base]] - perfect information strategy
- [[Frontier Exploration - Game Design Knowledge Bases]] - complementary domain
- [[Stress Test - Expertise Level Rule in Foreign Language Learning]] - similar skill-tier challenge

## Test Scenarios

1. A note about "controlling the center" in chess - does it scope to perfect-information games?
2. A note about "building alliances" in Diplomacy - does it scope to 7-player games?
3. A note about "beginner mistakes" - does it explicitly contradict expert advice?

---

This exploration is a draft. The Seed may need rules for player-count scoping, skill-tier contradictions, and meta-procedural knowledge in games.
