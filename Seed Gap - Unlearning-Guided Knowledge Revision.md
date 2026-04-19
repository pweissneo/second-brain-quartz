---
last-reviewed: 2026-04-09

status: resolved
last-identified: 2026-04-07
last-resolved: 2026-04-09
resolution: Seed already handles this scenario through correction metadata (line ~3100), verification mode conflict resolution, and unlearning-required frontmatter. The distinction between fact-update, belief-revision, and model-unlearning is captured by verification-status (unverified→verified→discredited) and confidence markers. Unlearning pathway preservation is covered by correction metadata fields. No new rule needed.
lifecycle: seed-gap
confidence: medium
author-type: ai-assisted
---

# Seed Gap: Unlearning-Guided Knowledge Revision

## Gap Identification

**Domain:** Knowledge base bootstrap and maintenance
**Related Seed rules:** Correction metadata (line ~3100), verification mode conflict resolution

## The Problem

The Seed has robust rules for handling contradictory sources and correction metadata, but lacks guidance on a specific scenario: **when the vault itself contains incorrect knowledge that was previously correct but has become outdated through domain evolution, or when personal experimentation reveals that previously-captured "knowledge" was actually wrong.**

Current coverage:
- [[Handling Contradictory Sources]] - covers source-vs-source conflicts
- [[Seed Rule - Distributed Understanding]] - covers comprehension gaps  
- Correction metadata - covers when/how to mark knowledge as wrong

**What's missing:** A systematic framework for **unlearning-triggered knowledge revision** - the process of not just correcting a fact, but actively replacing the mental model that held the incorrect information. This is distinct from:
1. Source contradictions (two external sources disagree)
2. Verification failures (claim fails check)
3. Outdated information (was true, now false)

The unlearning case is: **I believed X was true, captured it, and now realize my entire understanding was wrong - not just the fact, but the model.**

## Why This Matters for AI Knowledge Management

Without explicit unlearning guidance, AI agents handling knowledge revision will:
1. Simply replace the incorrect note with correct information
2. Preserve minimal metadata about the correction
3. Lose the "why I believed this" and "what replaced my understanding" context

This is problematic because:
- The original incorrect model might have been useful for understanding WHY others hold that belief
- The correction path reveals something about domain learning curves
- Future retrieval needs context about what understanding replaced the wrong one
- AI agents need to recognize when they're encountering unlearning scenarios vs simple updates

## Proposed Seed Rules

### Rule: Distinguish knowledge updates from unlearning events

**Why:** Not all corrections are equal - some are simple fact updates, others require model-level revision. AI agents need to recognize which type they're dealing with to handle appropriately.

**Test:** (1) Is the incorrect knowledge being replaced with incompatible understanding (not just different facts)? (2) Would a human who knew the old belief need to actively change their mental model? (3) Does the correction invalidate related knowledge that was dependent on the wrong model? If yes to 2+, it's unlearning; if yes to 1, it's model-level unlearning.

**Implementation:**
```yaml
revision-type: fact-update|belief-revision|model-unlearning
# fact-update: single fact was wrong (simple replacement)
# belief-revision: understanding was partially wrong (context needed)
# model-unlearning: entire mental model was wrong (full replacement)
```

### Rule: Preserve the unlearning pathway for future reference

**Why:** Wrong beliefs contain valuable meta-knowledge: why you believed it, what made it compelling, what triggered the realization. This context is essential for understanding domain learning curves and helping others avoid the same mistake.

**Test:** (1) Does the corrected note include why the original was believed? (2) Is there documentation of what triggered the unlearning? (3) Is the new understanding explicitly recorded? (4) Can you trace the full belief → correction → replacement pathway?

**Implementation:**
```yaml
unlearning-pathway:
  belief-origin: "what made this compelling"
  correction-trigger: "what revealed the error"
  replacement-understanding: "[[Link to new understanding]]"
  related-corrections: ["notes also corrected by this unlearning"]
```

### Rule: Tag unlearning events for review by future agents

**Why:** Unlearning is expensive - if an agent encounters the same incorrect belief elsewhere or discovers the replacement was also wrong, they need to trace back through the full correction history.

**Test:** (1) Can you query all unlearning events in the vault? (2) Do unlearning notes link to their correction triggers? (3) Is there a way to find notes that might contain beliefs invalidated by a given unlearning event?

**Implementation:**
```yaml
unlearning-event: true
# Enables: grep -l "unlearning-event: true" *.md
# Enables: backlink tracking through correction pathways
```

## Edge Cases to Handle

1. **False unlearning** - Sometimes you "unlearn" something only to discover later it was actually correct. Need reversal tracking.
2. **Cascading unlearning** - One model-level unlearning can invalidate dozens of dependent notes.
3. **Social unlearning** - When you realize your understanding was wrong because you learned it from a specific person/source.
4. **Pre-capture unlearning** - Before capturing knowledge, check if you're unlearning something from your own prior knowledge.

## Related Notes

- [[Handling Contradictory Sources]] - Source-vs-source conflicts
- [[Frontier Exploration - Unlearning-Required Knowledge]] - Broader context on unlearning in knowledge bases
- [[Seed Rule - Distributed Understanding]] - Comprehension gaps
- [[Correction Metadata in Seed]] - Current correction system (needs expansion)

## Test Scenario

Create a knowledge base about a domain you're learning. Capture some incorrect beliefs, then discover they're wrong. Apply the proposed rules:
1. Can you classify the revision as fact-update/belief-revision/model-unlearning?
2. Does the unlearning pathway capture why you believed and what replaced it?
3. Can you find all notes affected by the cascading unlearning?
4. Does future retrieval of the old belief route you to the correction?

If you can answer all four, the rules work. If you can't, the gap needs refinement.

---