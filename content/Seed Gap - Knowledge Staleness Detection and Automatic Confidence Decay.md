---
last-reviewed: 2026-03-30
last-updated: 2026-03-30
confidence: emerging
author-type: ai-assisted
lifecycle: draft
meta-type: seed-gap
schema-version: "1.0"
gap-type: seed-missing
gap-status: identified
gap-priority: high
gap-phase: analysis
gap-severity: useful
gap-source: frontier-exploration
---

# Seed Gap - Knowledge Staleness Detection and Automatic Confidence Decay

## Gap Identification

**What is missing from the Seed:**

The Seed has rules for:
1. Domain velocity classification (fast/medium/slow/static) — [[Seed Rule - Domain-Velocity-Aware Confidence Decay]]
2. Confidence markers with numeric levels — [[Confidence Markers]]
3. Ephemeral knowledge tagging (`knowledge-timelessness: ephemeral`)
4. Review cycles for time-sensitive knowledge

**What's missing:**
- **Staleness detection** — How does an AI agent know WHEN knowledge has become stale? What specific indicators trigger decay?
- **Automatic confidence decay** — Domain velocity sets review intervals, but there's no mechanism to automatically degrade confidence as time passes beyond review cycle
- **Staleness indicators** — What specific markers (date fields, version numbers, source timestamps) should trigger staleness alerts?

## The Problem

Current rules assume knowledge maintainers will manually review and update notes. But:
1. **No automatic detection**: AI agents cannot identify which notes have likely become stale without explicit staleness indicators
2. **No decay mechanism**: Even with domain velocity classification, there's no rule for how confidence degrades over time between reviews
3. **Missing triggers**: What specific signals should cause an AI agent to flag a note as potentially stale?

### Example Scenario

A note was last verified 6 months ago about "Best Node.js Frameworks 2024" with `confidence: 0.9`. Since then:
- Domain velocity is "fast" (technology)
- Review cycle should be ~90 days
- But the note still shows 0.9 confidence with no staleness indicator
- An AI agent using this note for retrieval gets false high confidence

## Current Seed Coverage

```markdown
# From Seed - Domain Velocity
domain-velocity: fast  # Review cycle: 30-90 days
# From Seed - Confidence Markers
confidence: 0.9  # High confidence
# From Seed - Ephemeral
knowledge-timelessness: ephemeral
```

What's **NOT** covered:
- `last-verified:` field vs `last-updated:` field distinction
- Automatic staleness threshold calculation
- Confidence decay formula (e.g., `current_confidence = original_confidence * decay_factor^(days_since_review / review_interval)`)
- Staleness indicator metadata (`staleness-score:`, `needs-review:`)

## Proposed Seed Rule

### Rule: Implement automatic staleness detection with explicit metadata

**Rule:** For knowledge bases in fast or medium velocity domains, include explicit staleness tracking — use `last-verified:` date (distinct from `last-updated:`) and derive staleness score from domain velocity and days since verification.

**Why:** Domain velocity classification tells you how OFTEN to review, but not WHEN a specific note has become stale. Without automatic staleness detection, AI agents cannot reliably assess whether retrieved knowledge is current. Manual review tracking is insufficient at scale.

**Test:** For vaults in fast/medium velocity domains:
1. Do notes have `last-verified:` (separate from `last-updated:`)?
2. Is there a formula/rule for calculating staleness score?
3. Can an AI agent query for "notes with staleness score > 0.7"?
4. Do retrieval results include staleness-aware confidence adjustments?

### Rule: Apply automatic confidence decay between reviews

**Rule:** Apply confidence decay formula based on domain velocity and time since last verification — reduce effective confidence by a decay factor for each review cycle interval that has passed without verification.

**Why:** A note verified 11 months ago should have lower effective confidence than one verified 1 month ago, even if both show the same original confidence. Without decay, AI agents overweight stale high-confidence notes.

**Test:** 
1. Does the vault use a decay formula? (e.g., `effective_confidence = original_confidence * 0.9^(cycles_overdue)`)
2. Do retrieval results show effective (decayed) confidence?
3. Can you identify which notes have decayed confidence < 0.5?

### Implementation Schema

```yaml
# Core staleness fields
last-verified: 2025-06-15  # When knowledge was last confirmed accurate
last-updated: 2025-12-01  # When note was last edited (any reason)
domain-velocity: fast  # Determines decay rate

# Computed fields (can be derived, not always stored)
staleness-score: 0.73  # 0 = fresh, 1 = fully stale
needs-review: true     # Derived from staleness-score > threshold
effective-confidence: 0.63  # Original confidence adjusted for staleness

# Decay parameters (could be domain-level defaults)
decay-rate: 0.1  # 10% confidence loss per review cycle
review-interval-days: 90  # Domain-velocity derived
```

### Decay Formula Proposal

```
staleness_score = min(1.0, days_since_verified / (review_interval_days * 2))
effective_confidence = original_confidence * (1 - decay_rate) ^ staleness_score
```

Where:
- `days_since_verified = current_date - last_verified`
- `review_interval_days` from domain-velocity (fast=90, medium=180, slow=365, static=never)
- `decay_rate` configurable per domain (default 0.1 = 10% per full cycle)

### Edge Cases

1. **Static domains**: No staleness tracking needed for mathematics, history, philosophy
2. **Ephemeral knowledge**: Staleness doesn't apply (use `knowledge-timelessness: ephemeral`)
3. **Verified evergreen notes**: Some knowledge doesn't decay (fundamental principles) — use `staleness-immune: true`
4. **Active vs historical**: Notes about historical events should preserve original confidence even if "stale" — use `knowledge-type: historical`
5. **Grace period**: Apply staleness calculation only after first review interval passes (not immediately after creation)

## Related Seed Rules

- [[Seed Rule - Domain-Velocity-Aware Confidence Decay]] — foundation for decay rate by domain
- [[Confidence Markers]] — confidence scoring system
- [[Frontier Exploration - Knowledge Aging and Review Cycle Management]] — review cycle timing
- [[Frontier Exploration - Determining Domain Velocity]] — how to classify domains
- [[Handling Temporal Knowledge]] — temporal knowledge types
- [[Frontier Exploration - Ephemeral and Event-Based Knowledge]] — ephemeral knowledge distinction

## Gap Lifecycle

- **Status**: identified → analyzed
- **Next**: Write proposed rule in full Rule/Why/Test format for Seed integration
- **Priority**: High — Without staleness detection, AI agents cannot reliably assess knowledge currency

---

*Identified during FRONTIER_EXPLORATION heartbeat 2026-03-30 — the Seed has domain velocity and confidence markers but lacks automatic staleness detection and decay mechanisms.*
