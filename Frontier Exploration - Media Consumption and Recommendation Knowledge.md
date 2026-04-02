---
last-reviewed: 2026-03-19
last-updated: 2026-03-25
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - media
  - recommendations
  - personal-knowledge
  - ranking
domain: media-consumption
test-type: frontier-exploration
---

# Frontier Exploration: Media Consumption and Recommendation Knowledge

> Exploring how knowledge bases should handle personal media consumption tracking, recommendations, and ranked lists.

## The Domain

Media consumption knowledge encompasses:
- **Books**: Fiction, non-fiction, technical, comics
- **Movies & TV**: Films, series, documentaries, shorts
- **Video games**: Console, PC, mobile, board games
- **Podcasts**: Shows, episodes, hosts
- **Music**: Albums, artists, songs, playlists

This domain is distinct from general "collection" knowledge because:
- Content is time-released (new books, movies, games constantly arriving)
- Personal ratings are inherently subjective but can be structured
- Recommendations depend on context (mood, company, time available)
- Spoiler management is critical
- Sequential consumption (series, franchises, discographies)

## Knowledge Types in This Domain

### 1. Consumption Records
- What you've consumed (read, watched, played)
- When you consumed it
- Your rating/reaction
- Basic metadata (author, director, year, genre)

### 2. Contextual Preferences
- What you like in different contexts
- Mood-based preferences
- Company-dependent preferences (watch alone vs. with partner vs. with kids)
- Time-available preferences (short vs. long content)

### 3. Recommendations
- Suggestions from others
- Your own recommendations for others
- Recommendations based on specific criteria

### 4. Rankings and Lists
- Favorites lists (top 10 movies, best albums)
- Category rankings (scifi books, horror movies)
- Personal "best of" compilations

### 5. Sequential Tracking
- Series progress (book 2 of 5, season 3 of 7)
- Franchise consumption order
- Ongoing series monitoring

### 6. Spoiler Management
- What spoilers you've encountered
- Which media you've consumed that others haven't
- Safe discussion boundaries

## Gaps Revealed in Current Seed

### Gap 1: Ranked/List Knowledge Without Clear Structure

The Seed doesn't address how to handle ranked knowledge - notes that express "X is better than Y" in a specific domain.

**Current state**: No guidance on:
- How to structure ranked lists (numerical rankings, tiers, categories)
- When to use a single note vs. separate notes per item
- How to handle ties or near-ties
- Whether rankings should include reasoning or just results

**Example issue**: 
- "My Top 10 Sci-Fi Books" - single note or 10 separate notes?
- If rankings change over time, how to track evolution?
- How to handle "this replaced that" in rankings?

**Test**: Can you find explicit guidance on structuring ranked knowledge in the Seed?

### Gap 2: Temporal Preference Knowledge

The Seed lacks guidance on capturing how personal preferences evolve over time.

**Current state**: 
- No guidance on capturing "I used to prefer X but now prefer Y"
- No structure for preference change tracking
- No framework for distinguishing current vs. past preferences

**Example issue**:
- Your taste in music changed from pop to classical - how to capture both?
- A movie you loved at 20 but now find problematic
- Preferences that are seasonal (horror movies at Halloween)

**Test**: Can you find guidance on capturing evolving personal preferences?

### Gap 3: Context-Dependent Recommendation Knowledge

The Seed doesn't address knowledge that's true in one context but not another within personal media.

**Current state**:
- No framework for "best for X" type knowledge
- No structure for conditional recommendations (best for date night, best for flying)
- No guidance on conflict resolution when contexts conflict

**Example issue**:
- "The best movies for date night" ≠ "the best movies overall"
- A game that's great for short sessions vs. long sessions
- Books that are good for commute vs. vacation

**Test**: Is there guidance on context-dependent recommendations?

### Gap 4: Spoiler Management Knowledge

The Seed doesn't address how to track and manage spoiler information.

**Current state**:
- No guidance on spoiler tagging
- No structure for "I've seen X, haven't seen Y"
- No framework for safe/unsafe discussion boundaries

**Example issue**:
- A note about a TV show that contains spoilers
- Tracking which media others have consumed for safe conversation
- Knowing what NOT to include in shared recommendations

**Test**: Can you find guidance on spoiler-aware knowledge management?

### Gap 5: Sequential Consumption Tracking

The Seed doesn't address tracking progress through sequential media (series, franchises).

**Current state**:
- No guidance on "consumption state" tracking
- No framework for "to consume next" vs. "currently consuming" vs. "completed"
- No structure for abandoned/in-progress/completed states

**Example issue**:
- Book series: read 3 of 7, want to continue
- TV series: watched seasons 1-3, need to catch up on 4
- Video game series: played 2, want to play 3 next

**Test**: Is there guidance on sequential media consumption states?

### Gap 6: Recommendation Provenance

The Seed lacks guidance on capturing where recommendations come from.

**Current state**:
- No structure for "who recommended this"
- No framework for weighting recommendations by source
- No guidance on tracking recommendation accuracy

**Example issue**:
- Friend A's recommendations are usually good for horror
- Critic B's recommendations for documentaries are reliable
- Reddit recommendation that turned out to be bad

**Test**: Can you find guidance on recommendation source tracking?

## Proposed Rules

### Rule: Structure Ranked Knowledge Explicitly

**Rule**: When capturing ranked or tiered knowledge (top 10, favorites lists, ratings), include explicit `ranking-type:` and `ranking-basis:` fields that explain what the ranking measures and how.

**Why**: Rankings without context are meaningless. "Best" can mean many things (most enjoyed, most influential, most underrated). Explicit ranking fields enable appropriate interpretation and future updates.

**Test**: For ranked notes, can you answer: (1) What is being ranked? (2) What criteria define "best"? (3) When should the ranking be updated?

**Implementation**:
```yaml
ranking-type: personal-enjoyment|critical-quality|influence|value
ranking-basis: "What makes something rank higher"
ranking-date: 2026-03-19
ranking-stability: volatile|semi-stable|stable
```

### Rule: Track Preference Evolution

**Rule**: When capturing personal preference knowledge, include temporal context - when the preference was formed, whether it has changed, and what caused the change.

**Why**: Personal preferences evolve. Knowledge that "I like X" without temporal context becomes misleading when preferences shift. Capturing preference evolution preserves both historical understanding and current accuracy.

**Test**: For preference notes, can you answer: (1) Do you still hold this preference? (2) When did it form? (3) Has it changed over time?

**Implementation**:
```yaml
preference-status: current|past|evolving
preference-since: 2020
preference-evolution: "How this preference changed"
trigger-for-change: "What caused the change"
```

### Rule: Tag Context-Dependent Recommendations

**Rule**: For recommendations that apply only in specific contexts, include explicit `recommendation-context:` frontmatter listing the conditions.

**Why**: A recommendation that's perfect for one situation may be terrible for another. Context tags enable appropriate filtering and prevent transferring recommendations to inappropriate situations.

**Test**: For recommendation notes, can you identify: (1) What context makes this recommendation good? (2) What context would make this recommendation bad? (3) Who is this NOT for?

**Implementation**:
```yaml
recommendation-context:
  mood: romantic|adventurous|relaxed
  company: alone|date|party-family|kids
  time-available: quick|moderate|extensive
  budget: low|medium|high
context-excludes: "Where this doesn't apply"
```

### Rule: Implement Spoiler Awareness

**Rule**: For media content knowledge that may contain spoilers, include `spoiler-warning: true` and `spoiler-for:` fields identifying what would be spoiled.

**Why**: Spoiler-free consumption is valuable. Knowledge bases should enable both capturing spoiler information AND protecting against accidental exposure.

**Test**: For media notes, can you identify: (1) Does this contain spoilers? (2) What would be spoiled? (3) For whom is this safe to read?

**Implementation**:
```yaml
spoiler-warning: true
spoiler-for:
  - "[[Media Title]]"
  - "[[Media Title 2]]"
spoiler-severity: minor|moderate|major|ending
spoiler-safe-after: consumed  # Can read after consuming
```

### Rule: Track Sequential Consumption State

**Rule**: For sequential media (series, franchises), include `consumption-state:` and `consumption-progress:` fields tracking position.

**Why**: Sequential media requires state tracking. "I'm reading book 3" is different from "I read all 7" - both are relevant but mean different things for recommendations and discussion.

**Test**: For series/sequence notes, can you answer: (1) What's the current state? (2) What's been consumed? (3) What's next?

**Implementation**:
```yaml
consumption-state: not-started|in-progress|completed|abandoned|paused
consumption-progress:
  current: 3
  total: 7
  started: 2026-01
  completed: ""
abandoned-at: 3
abandoned-reason: "didn't enjoy"
next-in-sequence: "[[Book 4]]"
```

### Rule: Capture Recommendation Provenance

**Rule**: For recommendations (received or given), include `recommendation-source:` and `recommendation-accuracy:` fields.

**Why**: Recommendations vary wildly in reliability. Tracking sources and accuracy enables weighting future recommendations appropriately.

**Test**: For recommendation notes, can you answer: (1) Who recommended this? (2) Were they reliable? (3) Did it turn out good?

**Implementation**:
```yaml
recommendation-source:
  type: friend|critic|algorithm|personal|reddit|newsletter
  name: "Source name"
  reliability-track-record: "Known accuracy"
recommendation-accuracy:
  rated: 5/5
  would-recommend-again: true
  updated-assessment: "Refined opinion after consuming"
```

## Related Notes

- [[Frontier Exploration - Emotional and Sentimental Knowledge]] - Related to personal value
- [[Frontier Exploration - User Situational Constraints]] - Context-dependent knowledge
- [[Handling Temporal Knowledge]] - Time-based knowledge
- [[Active Reading]] - Reading habit tracking (partial coverage)

## Test Questions

1. Can the Seed guide you on structuring a "Top 10 Movies" note?
2. Can the Seed help you track that your music taste changed over time?
3. Can the Seed help you distinguish "good for date night" from "good overall"?
4. Can the Seed help you manage spoiler warnings?
5. Can the Seed help you track "I'm on book 3 of 7"?

If you answered "no" to any of these, the Seed has a gap in media consumption knowledge guidance.
