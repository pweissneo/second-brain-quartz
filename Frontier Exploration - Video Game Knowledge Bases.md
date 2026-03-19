---
last-reviewed: 2026-03-17
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: domain-analysis
tags:
  - frontier-exploration
  - video-games
  - gaming
  - version-dependencies
---

# Frontier Exploration: Video Game Knowledge Bases

> How would an AI agent build a knowledge base about video games using only the current Seed rules? Where would it get stuck?

## Domain Overview

Video game knowledge bases face unique challenges that differ significantly from other domains:

- **Version-dependent mechanics** — Games receive patches that change how things work
- **Platform-specific content** — Different features across PC, PlayStation, Xbox, Nintendo
- **Achievement/trophy tracking** — Metadata-heavy, platform-specific achievement data
- **Time-limited events** — Holiday events, collaborations, seasonal content
- **DLC ecosystems** — Complex ownership and content relationships
- **Speedrun knowledge** — Frame-perfect timing, patch-specific strategies
- **Modding communities** — Unofficial modifications change gameplay
- **Emulation considerations** — How games behave differently in emulators

---

## Where the Seed Gets Stuck

### 1. Version Dependencies (Critical Gap)

**Problem:** A note about "how to beat [Boss]" might be completely wrong after a patch. The Seed has version tracking for software frameworks but not for games.

**Seed rules fail because:**
- Diminishing returns test assumes knowledge is stable
- Verification workflow assumes time-based decay, not instant invalidation
- Confidence markers don't account for "this was correct but patch changed it"

**Example:**
- Note: "Use weapon X to defeat Boss Y" — written in January
- Patch (March): Boss Y now resistant to weapon X
- Note still shows "confidence: high" but is now false

**What the Seed needs:**
- Game version tracking (patch number, date, DLC version)
- Platform-specific tagging
- "Last verified for patch: X.X"
- Automatic deprecation triggers when patch notes contradict existing knowledge

### 2. Achievement and Trophy Knowledge

**Problem:** Achievement data is:
- Platform-specific (PSN achievements ≠ Xbox achievements ≠ Steam)
- Time-consuming to verify manually
- Metadata-heavy (thousands of achievements per game)

**Seed rules fail because:**
- Verification by execution is impractical (would require 100% completion)
- Source verification is complex (different APIs, different achievement lists)
- Atomicity is challenged (individual achievement vs. game overview)

**What the Seed needs:**
- Achievement notes should link to verification sources (api tracks, completion guides)
- Allow "partially verified" status (achievement verified, not full game)
- Platform tagging is mandatory, not optional

### 3. Time-Limited Events

**Problem:** Some knowledge is only relevant during specific time windows:
- Holiday events (December seasonal events)
- Collaboration events (limited-time crossovers)
- Server shutdowns (online games going offline)

**Seed rules fail because:**
- Obsolescence detection assumes gradual decay, not instant expiration
- Staleness markers don't account for "valid until [date]"

**What the Seed needs:**
- `expiration-date` frontmatter for time-limited knowledge
- Clear disposition when event ends (archive, deprecate, delete)
- Distinguish "event knowledge" from permanent game knowledge

### 4. DLC and Expansion Complexity

**Problem:** Modern games have complex DLC relationships:
- Base game + Season Pass + Individual DLC packs
- Remastered versions that include DLC
- Platform-exclusive content
- Cancelled/never-released DLC

**Seed rules fail because:**
- Ownership tracking is complex
- Content overlap isn't clear

**What the Seed needs:**
- DLC ownership matrix
- Content scope tagging (what's in each DLC)
- Platform exclusivity notes

### 5. Emulation vs. Original Behavior

**Problem:** Games behave differently in emulators:
- Performance differences
- Bug differences
- Netcode differences (online play)

**What the Seed needs:**
- Emulation status tagging
- Verified-on-platform metadata

---

## Proposed Seed Rules

### Rule: Track game version scope for mechanics knowledge

**Rule:** For notes about game mechanics, strategies, or exploits, include `game-version:` and `patch:` frontmatter when applicable.

**Why:** Game mechanics change with patches. Knowledge that was correct may become incorrect. Version tracking enables automatic deprecation when patches release.

**Test:** For strategy/technique notes: (1) Is there a `game-version:` field? (2) Is there a `patch:` field for patch-specific knowledge? (3) Is there an `expires-after-patch:` field for patch-specific content?

### Rule: Implement time-limited knowledge lifecycle

**Rule:** For knowledge about time-limited events, include `valid-from:` and `valid-until:` frontmatter with explicit disposition after expiration.

**Why:** Time-limited knowledge (events, collaborations, server shutdowns) becomes irrelevant after expiration. Explicit lifecycle prevents stale knowledge from being served.

**Test:** For event notes: (1) Are there validity date fields? (2) Is there post-expiration disposition? (3) Is the note auto-archived or deprecated after validity ends?

### Rule: Separate platform-specific content with explicit tagging

**Rule:** For achievements, features, or content that differs across platforms, use mandatory `platform:` frontmatter with values like `pc`, `playstation`, `xbox`, `nintendo`, `multiplatform`.

**Why:** Platform differences are fundamental, not minor variations. Untagged platform knowledge misleads users about applicability.

**Test:** For any note about features/achievements: (1) Is there a `platform:` field? (2) Does the note make clear which platforms it applies to? (3) Are cross-platform notes explicitly marked?

### Rule: Verify speedrun knowledge against current category definitions

**Rule:** Speedrun strategies must include `category:` (any%, 100%, glitchless, etc.) and `verified-with:` linking to current leaderboard or route documentation.

**Why:** Speedrun routes change with game updates, new glitches discovered, or category definition changes. Outdated routes may no longer be valid for current records.

**Test:** For speedrun notes: (1) Is there a `category:` field? (2) Is there a `verified-with:` linking to current documentation? (3) Is there a `route-date:` showing when the route was verified?

---

## Metadata Recommendations

```yaml
# Video game-specific frontmatter
game-title: "Game Name"
game-version: "1.0"
patch: "2.1.5"
platform: playstation
dlc-scope: "Season Pass"
valid-from: 2024-12-01
valid-until: 2025-01-15
expires-after-patch: true
server-status: active | shutdown | emulated
category: any% | 100% | glitchless
route-date: 2025-01
verified-with: [[Speedrun.com Leaderboard]]
achievement-verified: partial  # Some achievements verified, not full game
```

---

## Test Cases

### Test Case 1: Boss Strategy

**Input:** Note about defeating a boss in an action RPG

**Current Seed behavior:**
- Atomicity: Pass (one boss strategy = one idea)
- Links: Pass (links to related strategies)
- Verification: Unclear — when does it expire?

**With proposed rules:**
- Check `patch:` field — if patch released after note, flag for review
- Check `game-version:` — verify against current game version
- If note predates patch, auto-deprecate with "patch changed" marker

### Test Case 2: Holiday Event

**Input:** Note about a limited-time holiday event

**Current Seed behavior:**
- No mechanism for time-limited content
- Obsolescence detection doesn't trigger — knowledge isn't "wrong" just "no longer relevant"

**With proposed rules:**
- Check `valid-until:` — past date triggers archive/deprecate
- Post-expiration disposition: Archive as historical record

### Test Case 3: Achievement Guide

**Input:** Note about obtaining a specific achievement

**Current Seed behavior:**
- Verification by execution is impractical
- Confidence markers don't account for partial verification

**With proposed rules:**
- Check `achievement-verified:` — partial counts toward verification
- Check `platform:` — ensure matches user's platform

---

## Related

- [[Frontier Exploration - AI Model Version Dependencies in Knowledge Bases]] — Similar version tracking challenges
- [[Frontier Exploration - Time-Limited Knowledge]] — General approach to expiry
- [[Seed Stress Test - Video Game Knowledge Base]] — Future stress test to validate rules
- [[AI-Assisted Knowledge Management Seed]]

---

## Areas for Further Exploration

1. **Modding knowledge** — How to handle community modifications that change game behavior
2. **Competitive gaming strategies** — Meta-dependent knowledge that changes with patches
3. **Emulator-specific knowledge** — Differences between original hardware and emulation
4. **Game preservation** — How to capture knowledge about discontinued games/servers
