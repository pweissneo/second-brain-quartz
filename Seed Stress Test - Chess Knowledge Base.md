---
last-reviewed: 2026-03-12
lifecycle: evergreen
confidence: emerging
knowledge-type: analysis
tags:
  - seed-stress-test
  - chess-domain
  - edge-case
---

# Seed Stress Test: Chess Knowledge Base

Testing Seed rules against the chess domain reveals unique challenges for managing chess knowledge.

## Domain Overview

Chess knowledge bases face distinct challenges:
- Massive canonical knowledge (opening theory, endgame tablebases)
- Personal knowledge (own games, analysis)
- Sequential knowledge (game progression, move sequences)
- Expert/beginner gap (notation literacy)
- Judgment-heavy content (evaluation, annotations)

---

## 1. Word Count / Atomicity Rule

**Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Chess Application:**
- Opening surveys: 2000+ words covering variations
- Endgame manuals: 500+ pages
- Game annotations: 300-800 words typical

**Edge Cases:**
1. **Opening surveys**: "The Sicilian Defense" at 5000 words — is this multiple ideas?
   - Verdict: Should split by main line (Sicilian Open, Dragon, Najdorf)
2. **Endgame books**: "Rook Endgames" — single theme, massive depth
   - Verdict: Keep together as reference; atomicity applies to topics, not length
3. **Game annotations**: "My Game vs Carlsen" at 400 words
   - Verdict: Should be one atomic unit (the game analysis)

**Suggested Improvement:**
> For reference KBs (like endgames): notes >300 are acceptable when covering one coherent theme at depth. For learning KBs (like annotated games): apply strict 100-300 limit.

---

## 2. At Least 2 Links Rule

**Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true`.

**Chess Application:**
- "King's Indian Attack" → links to "Open Games," "White Opening Strategies"
- "Rook Lift" → links to "Rook Endgames," "Strategic Patterns"

**Edge Cases:**
1. **Single-variation openings**: "Petrov's Defense" — only naturally connects to "Open Games" and "Black Defenses"
2. **Deep analysis notes**: "Analysis of Game 6 World Championship 2024" — specific, may only link to players
3. **Notation-heavy reference**: "Algebraic Notation" — foundational, should be tagged

**Issue:** Chess notation is foundational but often overlooked. Every chess note depends on notation understanding.

**Proposed Solution:**
Add "Algebraic Notation" equivalent to foundational primitives list.

---

## 3. Foundational Primitives in Chess

The Seed mentions cooking primitives (salt, oil, water). Chess equivalents:
- **Algebraic Notation** — all chess communication depends on it
- **The Board** — coordinate system (a1-h8)
- **Piece Movement Rules** — base knowledge everything builds on
- **Checkmate** — the winning condition

These should all have `foundational: true`.

---

## 4. Sequential Knowledge - Game Recording

**Rule:** Distinguish sequential knowledge with `temporal-type: sequence`.

**Chess Application:**

| Type | Example | temporal-type |
|------|---------|---------------|
| Game replay | Move 1.e4 → 1...c5 → 2.Nf3 | linear |
| Opening theory | Main line → side lines → traps | branching |
| Analysis tree | If 12.Bg5 instead of 12.Rfe1 | conditional |
| Endgame study | Key squares → Zugzwang → conversion | iterative |

**Edge Cases:**
1. **Opening branches**: Theory tree has multiple valid continuations — not linear
2. **Game annotations**: Contains both linear (moves) and conditional (alternatives)
3. **Analysis vs. Play**: "What I played" (linear) vs "What I should have played" (conditional)

**Suggested Metadata:**
```yaml
temporal-type: linear | branching | conditional | iterative
contains-moves: true  # for notes with move sequences
analysis-tree: true   # for notes with multiple branches
```

---

## 5. Personal vs. Canonical Knowledge

**Rule:** Tag notes with `knowledge-type: canonical|analysis|personal`

**Chess Application:**

| Note | Type | Rationale |
|------|------|-----------|
| "Ruy Lopezz Theory" | canonical | Established opening knowledge |
| "My Game vs Smith" | personal | Individual game |
| "Assessment: +0.7" | analysis | Interpretation of position |
| "Kasparov's Annotations" | analysis | Expert interpretation of others' games |

**Edge Cases:**
1. **Training notes**: "My tactics training results" — personal operational
2. **Opening repertoire**: "My White Repertoire" — personal but synthesized
3. **Historical games**: "Morphy vs Anderssen" — canonical (historical record)

---

## 6. Expertise Level Tagging

**Rule:** Tag expertise level for knowledge appropriate at certain skill levels.

**Chess Application:**
- **Beginner**: Piece values, basic checkmates (queen+king vs king)
- **Intermediate**: Opening principles, basic tactics, king safety
- **Advanced**: Deep opening theory, strategic patterns, endgame technique
- **Expert**: Tablebases, psychological elements, correspondence chess

**Issue:** The gap is extreme. "How the pieces move" vs "最新的AI变化" (latest AI developments) — both chess, vastly different levels.

**Proposed Metadata:**
```yaml
expertise-level: beginner | intermediate | advanced | expert
prerequisites: ["Piece Movement", "Checkmate Patterns"]
```

---

## 7. Verification Status

**Rule:** For procedural content, include `verification-status: unverified | tested | community-validated`.

**Chess Application:**
- **Opening novelties**: "My new 12th move" — unverified
- **Standard opening lines**: "Ruy Lopez Exchange" — community-validated (centuries of play)
- **Endgame tablebases**: "7-piece tablebase" — tested (mathematically proven)
- **Engine evaluations**: "+1.2 for White" — tested but context-dependent

**Edge Cases:**
1. **Engine evaluations**: Should indicate which engine and version
2. **Human annotations**: "Magnus says +0.5" — analysis, not verified fact

---

## 8. Time-Sensitive Knowledge

**Rule:** Use `as-of:` for knowledge captured at a specific point.

**Chess Application:**
- **Opening theory**: "Current state of the Sicilian" — needs date, changes monthly
- **Player ratings**: "Carlsen 2830" — historical snapshot
- **Tournament results**: "Candidates 2024 winner" — factual, dated

**Issue:** Chess theory evolves faster than almost any other domain. Opening books from 1990 are largely obsolete.

**Suggested Rule Addition:**
> For rapidly-evolving domains (chess openings, tech), include `review-frequency:` field indicating how often note needs updating.

---

## 9. External Service Dependencies

**Rule:** Track dependencies on external services.

**Chess Application:**
- **Chess.com/ Lichess links**: Game URLs
- **Chessable/Learn**: Opening training platforms
- **Engine analysis**: Stockfish, Leela versions
- **Database references**: Chessgames.com, 365chess.com

---

## 10. Multi-Modal Knowledge

Chess is inherently multi-modal:
- **Notation** (text)
- **Diagrams** (images)
- **Video** (analysis videos)
- **Interactive** (analysis boards)

**Rule:** Text must stand alone, but chess notes without diagrams are often incomplete.

**Edge Case:** "The Greek Gift sacrifice" — describing 13.Bxf7+ without showing the position is nearly useless.

**Suggested Addition:**
> For visual domains (chess, diagrams, maps), include `diagram-required: true` when text cannot convey the knowledge alone.

---

## Summary of Chess-Specific Metadata

```yaml
# Chess-specific frontmatter
contains-moves: true       # Has move sequences
analysis-tree: true        # Has alternative lines
game-reference: "lichess.org/game/123456"  # External game link
expertise-level: beginner | intermediate | advanced | expert
opening-variation: "Sicilian Defense / Najdorf Variation"
eco-code: "B90"           # Encyclopedia of Chess Opening code
review-frequency: monthly  # How often theory changes
diagram-required: true    # Visual position essential
```

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Domain-Specific Knowledge Bases]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Stress Test - Tags vs Links Rule in Gardening]]
- [[Handling Temporal Knowledge]]
- [[Frontier Exploration - Knowledge-Type Canonical vs Analysis]]
- [[Seed Stress Test - Experiential Knowledge Rule in Pottery]]
- [[Seed Stress Test - Self-Contained Notes in Photography]]
- [[Stress Test - AI Optimization Rule in Legal Knowledge Base]]
- [[Stress Test - Knowledge-Type Rule in Investing]]
