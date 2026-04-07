---
last-reviewed: 2026-03-25
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
verification-status: verified
tags:
  - seed
  - stress-test
  - construction-phase
  - game-development
  - domain-adaptation
---

# Seed Stress Test: Construction Phase Model in Game Development

> Testing the Construction Phase Model rule in the game development domain.
> Date: 2026-03-25

## Rule Under Test

**Rule:** Use construction-phase model to guide structural decisions — apply relaxed standards during bootstrap, tighten as vault matures.

**Why:** The Seed's rules assume a mature vault with existing structure. During construction (first 50 notes), early structural decisions create the foundation. Relaxing rules temporarily while tracking phase enables better decisions; tightening later ensures quality.

**Test:** Can you identify the vault's construction phase? For vaults <50 notes: Is orphan rate tracked? Are structural decisions being evaluated? Is there a plan to tighten rules after bootstrap?

---

## Domain Analysis: Game Development

### Unique Characteristics

Game development knowledge bases have distinct properties that affect how construction phases should work:

1. **Multidisciplinary nature** - Game dev spans programming, art, audio, design, production, QA
2. **Engine-specific knowledge** - Unity, Unreal, Godot each have unique patterns and APIs
3. **Version-dependent content** - Engine versions (Unity 2022 vs 2023, Unreal 4 vs 5) have breaking changes
4. **Platform fragmentation** - PC, console, mobile, web each have distinct requirements
5. **Genre-specific patterns** - RPGs, FPS, strategy games have very different architecture needs
6. **Iterative vs waterfall** - Game dev is highly iterative; knowledge becomes obsolete through playtesting

### Construction Phase Challenges in Game Dev

#### Challenge 1: Multi-Track Bootstrap

Unlike music composition (single discipline), game dev has parallel tracks that may grow at different rates:

| Track | Example Notes | Growth Rate |
|-------|---------------|-------------|
| Programming | AI behaviors, physics, networking | Fast |
| Art | Asset pipelines, shaders, animation | Medium |
| Design | Game mechanics, level design, UX | Fast |
| Audio | Sound design, music implementation | Slow |
| Production | Sprint planning, QA workflows | Medium |

**Stress Test Question:** Should the construction phase be applied per-track or to the entire vault?

**Recommendation:** Apply construction phase at vault level but track maturity per domain track. This allows tightening rules for mature tracks (e.g., programming) while keeping relaxed standards for emerging ones (e.g., audio).

#### Challenge 2: Engine Version Churn

A game dev vault might have notes about:
- Unity 2020 LTS (still widely used)
- Unity 2022 LTS (current stable)
- Unity 6 (preview)
- Unreal Engine 4 (legacy)
- Unreal Engine 5 (current)

**Stress Test Question:** Should version-specific notes be treated as separate "mini-vaults" with their own construction phases?

**Recommendation:** Use `engine-version:` frontmatter to tag engine-specific notes. Apply construction-phase relaxed rules to each version cluster independently, OR consolidate to current LTS only.

#### Challenge 3: Genre-Dependent Knowledge

Notes about game architecture differ radically by genre:
- RPG: Inventory systems, quest chains, dialogue trees
- FPS: Weapon mechanics, movement systems, map design
- RTS: Pathfinding, resource management, AI opponents
- Simulation: Realism vs gameplay balance, physics tuning

**Stress Test Question:** Should genre-specific hub notes be created before or after general game architecture?

**Recommendation:** Create genre-agnostic foundations first (core programming patterns, general design principles) before genre-specific content. This follows the Seed's "foundational concepts before applications" rule.

#### Challenge 4: Tutorial vs Production Knowledge

Game dev knowledge falls into two categories:
- **Tutorial knowledge** - How to learn, beginner guides (high turnover)
- **Production knowledge** - Actual implementation patterns used in shipped games (more stable)

**Stress Test Question:** Should these be separated into different vaults or mixed?

**Recommendation:** Keep in same vault but use `knowledge-type: tutorial | production` frontmatter. Apply stricter construction phase rules to production knowledge (it's harder to fix retroactively).

---

## Stress Test Questions

### Does the Construction Phase Model Make Sense for Game Dev?

**Yes, with significant modifications needed:**

1. **Track-specific phases** - Each discipline (programming, art, audio, design) should have its own phase indicator
2. **Engine tagging** - Notes should be tagged with engine version
3. **Genre awareness** - Genre-specific knowledge should build on genre-agnostic foundations
4. **Knowledge type separation** - Tutorial vs production knowledge needs different rigor levels

### Edge Cases in Game Dev

#### Edge Case 1: Cross-Engine Knowledge

Some game dev knowledge transfers across engines:
- Game design patterns (DRY, SOLID applied to games)
- Mathematics (vector math, quaternions)
- Project management (Agile, Scrum)

**Issue:** These should be in a separate "foundations" track that matures faster than engine-specific content.

**Test:** Can you identify foundation notes that would apply regardless of engine choice?

#### Edge Case 2: Deprecated Engine Versions

Notes about deprecated engines (Unity 2019, Unreal 3) may still be valuable for:
- Maintaining legacy games
- Understanding historical patterns
- Learning from past mistakes

**Issue:** Should deprecated content count toward construction phase maturity?

**Recommendation:** Tag deprecated content with `status: deprecated` but don't delete. It still contributes to vault depth.

#### Edge Case 3: Platform-Specific Knowledge

Knowledge that's specific to one platform (PlayStation, Xbox, iOS) has:
- Different performance constraints
- Different certification requirements
- Different API availability

**Issue:** Should platform-specific notes be a separate track?

**Recommendation:** Use `platform:` frontmatter. Apply relaxed standards until core platform-agnostic knowledge is established.

#### Edge Case 4: Community vs Production Standards

Game dev has two overlapping knowledge spheres:
- **Community standards** - What's popular on forums/tutorials
- **Production standards** - What's actually used in shipped games

**Issue:** These often conflict. Community might recommend one pattern, but production teams use another.

**Recommendation:** Track both with `source-type:` and apply higher verification rigor to production-sourced knowledge.

---

## Proposed Modifications to Seed Rule

### For Game Development Vaults

Add domain-specific implementation guidance:

```yaml
# Extended frontmatter for game dev vaults
construction-track: programming|art|audio|design|production|foundation
engine-scope: unity-2022|unreal-5|godot-4|cross-engine
platform-scope: pc|console|mobile|cross-platform
genre-scope: rpg|fps|rts|simulation|cross-genre
knowledge-type: tutorial|production|reference
```

### Modified Relaxed Standards for Game Dev

| Standard | General Vault | Game Dev Vault |
|----------|---------------|----------------|
| Minimum links | 1 | 1 (but must link to track hub) |
| Hop depth | 4 | 5 (cross-track links needed) |
| Note size | 50+ words | 50+ words (30+ for code snippets) |
| Hub threshold | 3 notes | 2 notes per track |

### Transition Criteria Modifications

For game dev vaults, add:
- **Engine maturity** - Has current engine version accumulated 20+ notes?
- **Genre coverage** - Are major target genres represented?
- **Cross-track links** - Can you navigate from programming to art to design?

---

## Test Scenarios

### Scenario 1: New Game Dev Vault (10 notes)

A beginner's game dev vault contains:
1. [[Game Development]] (root)
2. [[Unity Basics]]
3. [[Unreal Basics]]
4. [[Godot Basics]]
5. [[Game Design Fundamentals]]
6. [[Programming Patterns for Games]]
7. [[2D Art Pipeline]]
8. [[3D Art Pipeline]]
9. [[Audio Implementation]]
10. [[Project Management for Games]]

**Test:** What phase is this vault in? What relaxed standards apply?

**Expected:** Skeleton phase (1-20 notes). Relaxed standards: minimum 1 link, allow orphans for engine-specific tracks. Critical: Ensure foundation notes (4-6) have good cross-links.

### Scenario 2: Mature Game Dev Vault (150 notes)

A well-developed vault has:
- 60 programming notes (across 3 engines)
- 40 art notes
- 25 design notes
- 15 audio notes
- 10 production notes

**Test:** Is each track at the same phase? Should they be?

**Expected:** Programming in "muscle" phase, others still in "flesh" or "skeleton". Apply tightening rules to programming track while keeping relaxed for others.

### Scenario 3: Engine Migration

A vault originally built for Unity is being expanded to Unreal.

**Test:** How should the construction phase handle the new engine track?

**Expected:** Create new "Unreal" track in skeleton phase. Don't penalize overall vault maturity for new track's early state.

---

## Conclusion

The Construction Phase Model **works for game development** but needs domain-specific modifications:

1. ✅ Core concept valid - phased growth prevents early mistakes
2. ✅ Modified relaxed standards needed - multi-track nature requires track-specific thresholds
3. ✅ New transition criteria needed - engine, genre, and platform coverage
4. ⚠️ Frontmatter extensions required - construction-track, engine-scope, platform-scope

**Recommendation:** Add a game-development-specific edge case to the Seed rule covering these modifications.
