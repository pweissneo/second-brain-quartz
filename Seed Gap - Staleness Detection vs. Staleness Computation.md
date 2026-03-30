---
last-reviewed: 2026-03-30
last-updated: 2026-03-30
confidence: emerging
author-type: ai-assisted
lifecycle: seed-gap
meta-type: seed-gap
schema-version: "1.0"
gap-type: seed-missing
gap-status: identified
gap-priority: high
gap-phase: analysis
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-03-30
tags:
  - seed-gap
  - staleness
  - confidence-decay
  - knowledge-maintenance
  - automation
---

# Seed Gap - Staleness Detection vs. Staleness Computation

## Gap Identification

**What knowledge is missing:**

The Seed has staleness *detection* — it defines three states (time-stale, reality-obsolete, context-shift) with qualitative detection methods. But it lacks staleness *computation* — a quantitative mechanism to automatically calculate how stale any given note has become.

This is a gap between "knowing what staleness is" and "being able to measure it algorithmically."

## The Gap in Detail

### Current Seed Coverage

The Seed defines:
1. **Staleness types** — time-stale (review needed), reality-obsolete (replacement needed), context-shift (user situation changed)
2. **Detection triggers** — mechanical (days-since-review > review-interval), semantic (source changed, version mismatch), user-reported (situation change)
3. **Domain velocity** — sets review intervals by domain (fast=30-90 days, medium=90-180 days, slow=180-365 days, static=never)
4. **Confidence markers** — numeric and qualitative levels

### What's Missing

**Automatic staleness scoring** — a formula that takes `last-verified` date + domain velocity → produces a staleness score (0=fresh, 1=fully stale).

**Confidence decay mechanics** — a rule that adjusts effective confidence based on staleness score between reviews.

**Computable retrieval signals** — AI agents can query "notes with staleness score > 0.7" or "effective confidence < 0.5".

### Why This Matters

The gap creates a practical failure: AI agents know staleness EXISTS but cannot CALCULATE it. Detection rules describe staleness qualitatively; staleness computation would make it programmatically accessible.

Without computation:
- AI agents cannot automatically surface stale notes for review
- Retrieval results include notes with outdated confidence levels
- The gap between "last updated" and "last verified" is invisible
- No way to prioritize review queue by staleness severity

### The Specific Missing Pieces

1. **last-verified field** — distinct from last-updated (when note was edited vs. when knowledge was confirmed accurate). Currently only `last-updated` exists.

2. **Staleness score formula** — something like: `staleness_score = min(1.0, days_since_verified / (review_interval_days * decay_threshold_multiplier))`

3. **Effective confidence adjustment** — derived from staleness score + original confidence. E.g., `effective_confidence = original_confidence * (1 - decay_rate)^staleness_score`

4. **Staleness-aware retrieval** — rules for how staleness score affects knowledge selection, ranking, or warning flags

5. **Override for evergreen/ever-valid knowledge** — fundamental principles that never decay (mathematical proofs, historical facts about events before photography) need `staleness-immune: true`

### Relationship to Existing Seed Rules

| Existing Rule | Relationship |
|---|---|
| Staleness vs. obsolescence detection | Foundation — defines the three states |
| Domain-velocity confidence decay | Partial coverage — establishes review intervals but not decay formula |
| Confidence markers | Target — decay applies to confidence scores |
| last-updated field | Partial — captures editing time, not verification time |
| Knowledge debt tracking | Related — staleness score feeds into debt calculation |

The existing Seed has all the *ingredients* but lacks the *recipe* — the formula that combines them into an actionable computation.

## Proposed Seed Rule

### Rule: Implement Staleness Scoring with Automatic Confidence Decay

**Rule:** For knowledge bases tracking time-stale knowledge, use `last-verified` (distinct from `last-updated`) to compute a staleness score and apply automatic confidence decay between review cycles.

**Why:** Detection rules tell you staleness EXISTS; staleness scoring makes it MEASURABLE. Without quantitative staleness scores, AI agents cannot automatically prioritize review queues, adjust effective confidence, or surface knowledge needing attention. The gap between "knowledge verified" and "note edited" is invisible without explicit tracking and computation.

**Test:** For vaults with time-stale knowledge:
1. Can you compute a staleness score for any note using `last-verified` + domain velocity?
2. Does retrieval include effective confidence (original adjusted by staleness)?
3. Can you list all notes with staleness score > 0.7?
4. Do notes have `last-verified` and `last-updated` as separate fields?
5. Can you identify notes that are "stale but not obsolete" (verified accuracy but overdue for review)?

### Implementation Schema

```yaml
# Core fields (add to existing frontmatter)
last-verified: 2026-03-01  # When knowledge was last confirmed accurate
last-updated: 2026-03-30  # When note was last edited (may be more recent)
staleness-score: 0.65  # Computed: 0=fresh, 1=fully stale
needs-review: true     # Derived: staleness-score > threshold

# Decay parameters
domain-velocity: fast  # Determines base review interval
decay-rate: 0.1  # 10% confidence loss per review cycle overdue
review-interval-days: 90  # From domain-velocity (fast=90, medium=180, slow=365)

# Computed effective confidence
original-confidence: 0.9
effective-confidence: 0.58  # Original × (1 - decay-rate)^staleness_score

# Override for evergreen knowledge
staleness-immune: true  # Exempt from staleness scoring
```

### Staleness Score Formula

```
staleness_score = min(1.0, days_since_verified / (review_interval_days × decay_threshold_multiplier))

Where:
- days_since_verified = current_date - last_verified
- review_interval_days from domain-velocity (fast=90, medium=180, slow=365, static=N/A)
- decay_threshold_multiplier = 2 (score=1.0 after 2x review interval)
```

### Confidence Decay Formula

```
effective_confidence = original_confidence × (1 - decay_rate) ^ cycles_overdue

Where:
- decay_rate = configurable (default 0.1 = 10% per full cycle overdue)
- cycles_overdue = days_since_verified / review_interval_days
```

### Staleness Thresholds

| Staleness Score | Status | Action |
|---|---|---|
| 0.0 – 0.3 | Fresh | No action needed |
| 0.3 – 0.5 | Aging | Note for routine review |
| 0.5 – 0.7 | Stale | Priority review |
| 0.7 – 1.0 | Critical | Immediate review; lower effective confidence |

### Retrieval Behavior

For staleness-aware retrieval:
- Display effective confidence alongside original in retrieval results
- Flag notes with staleness score > 0.7 as "potentially stale"
- Sort review queue by staleness score descending
- Never use staleness-immune notes for review prioritization

### Edge Cases

1. **Static domains** (mathematics, philosophy, history): No staleness scoring needed — use `domain-velocity: static` to skip computation entirely.

2. **Evergreen notes**: Fundamental principles, proven theorems, historical events before modern era — use `staleness-immune: true` to exempt from decay. These notes don't need review cycles because they're stable by nature.

3. **Notes without last-verified**: Default to staleness_score = 0.5 (assume review needed) and prompt for verification. `last-updated` alone is insufficient — it captures editing, not verification.

4. **Grace period**: Don't compute staleness until first review interval has passed. A note verified 10 days ago in a fast domain isn't stale — staleness computation starts after 1× review interval.

5. **Verification vs. update distinction**: `last-verified` advances when you confirm accuracy; `last-updated` advances on any edit (including non-verification edits like reorganizing, adding links). Keeping them separate enables accurate staleness tracking.

6. **Reality-obsolete vs. time-stale**: A note can be time-stale (overdue for review) AND reality-obsolete (underlying facts changed). Staleness score handles time-stale; obsolescence requires semantic detection (source changed, version mismatch).

## Related Seed Rules

- [[Seed Rule - Distinguish Staleness from Obsolescence]] — defines the three staleness states (foundation)
- [[Seed Rule - Domain-Velocity-Aware Confidence Decay]] — domain velocity sets review intervals (ingredient)
- [[Confidence Markers]] — confidence scoring system (target for decay)
- [[Seed Gap - Knowledge Staleness Detection and Automatic Confidence Decay]] — this gap's discovery note (separate, precursor)

## Gap Lifecycle

- **Status**: integrated
- **Integrated into Seed**: 2026-03-30 — added as "Rule (NEW - 2026-03-30): Implement staleness scoring with automatic confidence decay" in Quality Maintenance section (after staleness from obsolescence distinction rule)
- **Phase**: complete
- **Validation**: Rule follows Seed format (Rule/Why/Test), includes formula, edge cases, and references gap note
- **Priority**: High — Without staleness computation, the Seed's staleness detection remains qualitative, not actionable

---

*Discovered during FRONTIER_EXPLORATION heartbeat 2026-03-30 — reviewed Seed gap notes, found staleness detection exists (three states, detection methods) but staleness computation is missing (score formula, automatic decay, computable retrieval signals).*