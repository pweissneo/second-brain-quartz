---
last-reviewed: 2026-03-19
last-updated: 2026-03-19
lifecycle: evergreen
confidence: high
author-type: ai-assisted
verification-status: verified
tags:
  - seed-gap
  - contradiction-handling
  - knowledge-quality
  - conflict-resolution
---

# Seed Gap: Simultaneous Contradiction Detection and Resolution

> **⚠️ UPDATE (2026-03-19):** This gap has been filled by the Seed! The rules below are now incorporated into the Seed. This note remains as expanded implementation guidance.

> Identifying the gap in handling contradictory knowledge that exists concurrently in the vault.

## The Problem

The Seed has rules for handling **temporal contradictions** (outdated knowledge) via the correction metadata system. But it lacks guidance for **simultaneous contradictions** — cases where two notes directly contradict each other at the same point in time.

Examples:
- Note A: "Coffee is good for productivity" (links to studies showing benefits)
- Note B: "Coffee is harmful to productivity" (links to studies showing jitters/ crashes)
- Both have recent dates, both are "verified"

This is different from:
- **Outdated knowledge** (was true, now false) — handled by correction metadata
- **Framework-dependent knowledge** (true in one framework, false in another) — partially handled
- **Personal error** (you synthesized incorrectly) — handled by correction metadata

Simultaneous contradictions are when the vault contains irreconcilable claims with overlapping validity periods.

## Why This Gap Matters

1. **Vault credibility**: Users (and AI agents) cannot trust the vault if it contains unacknowledged contradictions
2. **Decision paralysis**: Contradictory advice renders the vault useless for decision support
3. **User safety**: In high-stakes domains, contradictory medical/financial advice can cause real harm

## Seed Rule Coverage (2026-03-19)

The Seed now includes rules that address this gap:

- **Rule: Detect and resolve simultaneous contradictions** — Check for contradictions between verified notes
- **Rule: Contradiction resolution protocol** — Resolution strategies (prefer reliable, acknowledge uncertainty, escalate)
- **Contradiction detection frontmatter** — `contradiction-status`, `contradiction-with`, `resolution` fields
- **Verification-status: disputed** — For legitimate expert disagreement

See: [[AI-Assisted Knowledge Management Seed#contradiction]] for the canonical rules.

## Original Gap Analysis (Preserved for Reference)

### No Detection Mechanism

The Seed has no rule for:
- How to detect when notes contradict each other
- What counts as contradiction (exact opposite? nuance? framework conflict?)
- Threshold for "significant" contradiction vs. minor variation

### No Resolution Framework

The Seed has conflict resolution for **Seed rule conflicts** but not for **note content conflicts**:
- No guidance on when to keep both notes (acknowledge uncertainty)
- No guidance on when to resolve in favor of one source
- No guidance on how to mark "legitimate uncertainty" vs. "error"

### No Provenance for Claims

Without claim-level provenance:
- Can't trace "who said what"
- Can't update when source is retracted
- Can't distinguish "two experts disagree" from "one source is wrong"

## Proposed Seed Rules

### Rule: Simultaneous Contradiction Detection

> **Rule:** For notes with verification-status: verified, check for direct contradictions before finalizing. A contradiction exists when Note A claims "X is true" and Note B claims "X is false" with overlapping validity periods.
> **Why:** Undetected contradictions create unreliable knowledge bases where users cannot trust any single claim.
> **Test:** Can you identify any pairs of verified notes that directly contradict each other?

### Rule: Contradiction Resolution Protocol

> **Rule:** When a contradiction is detected, apply resolution: (1) If one source is demonstrably more reliable, prefer it and mark the other as corrected; (2) If both sources are equally credible, keep both and tag with `contradiction-status: acknowledged` linking to a synthesis note; (3) If resolution is impossible, escalate to human.
> **Why:** Unresolved contradictions undermine vault reliability. Clear resolution protocol enables AI agents to handle contradictions consistently.
> **Test:** For every detected contradiction, is there a documented resolution?

### Rule: Claim-Level Provenance

> **Rule:** For factual claims in verification-status: verified notes, include `source:` or `claim-author:` frontmatter to enable tracing and updates.
> **Why:** Knowledge without provenance cannot be updated when sources change. Claim-level provenance enables precise maintenance.
> **Test:** Can you trace each verified factual claim to its original source?

### Rule: Legitimate Uncertainty Tagging

> **Rule:** For claims where experts genuinely disagree (not error), tag with `contradiction-status: acknowledged` and link to competing perspectives. Do not mark as "verified" — mark as `verification-status: disputed`.
> **Why:** Some knowledge domains have genuine uncertainty. Pretending there's consensus when there isn't misleads users.
> **Test:** Can you identify which notes represent genuine expert disagreement vs. factual errors?

## Edge Cases

### Edge Case: Nuance vs. Contradiction

Not all disagreement is contradiction. Note A says "coffee improves focus" and Note B says "coffee causes anxiety" might both be true at different dosage levels.

**Test:** Does the contradiction disappear when you add context (dose, timing, individual variation)?

### Edge Case: Framework-Dependent Claims

Value investing says "P/E ratios matter"; momentum investing says "P/E ratios don't predict returns." These are framework-dependent, not contradictions.

**Test:** Can you identify a shared framework that both claims are evaluated against? If not, tag as framework-dependent.

### Edge Case: Local vs. Universal

"Tomatoes need daily water" (container gardening) vs. "Tomatoes need weekly water" (in-ground). These are context-dependent, not contradictions.

**Test:** Do both claims specify their context? Can you create a synthesis note that addresses both?

### Edge Case: Temporal Validity

Note A: "Coffee is healthy" (2020 study) — still valid
Note B: "Coffee causes cancer" (1990 study) — now outdated

This is a temporal contradiction, handled by existing correction rules.

**Test:** Do both claims have current validity periods? Is one marked outdated?

## Implementation

```yaml
# For claims with known contradiction
contradiction-status: acknowledged
contradiction-with: [[Note Name]]
resolution: pending|resolved-in-favor-of|source-required

# For disputed knowledge (legitimate expert disagreement)
verification-status: disputed
dispute-nature: methodological|philosophical|evidential
competing-perspectives:
  - [[Perspective A]]
  - [[Perspective B]]

# For claims with known source
source: [[Source Name]]
source-type: peer-reviewed|expert-opinion|personal-experiment
source-date: 2024-01
```

## Relationship to Existing Seed Rules

| Existing Rule | Gap Addressed |
|---------------|---------------|
| Correction metadata | Temporal contradictions (outdated) |
| Framework tagging | Framework-dependent contradictions |
| Source quality | Provenance (partially) |
| Confidence markers | Uncertainty (partially) |

This gap addresses **simultaneous contradictions** that are neither temporal nor framework-dependent.

## Test Scenarios

1. **Medicine**: Note A claims "aspirin prevents heart attacks" (based on 1988 study); Note B claims "aspirin doesn't prevent heart attacks" (based on 2018 study). Resolution: Mark older as outdated, keep newer.

2. **Nutrition**: Note A claims "fat is unhealthy"; Note B claims "fat is healthy." Both recent, different studies. Resolution: Both marked `verification-status: disputed`, create synthesis noting context-dependence.

3. **Investing**: Note A claims "P/E ratios predict returns" (value framework); Note B claims "P/E ratios don't predict returns" (momentum framework). Resolution: Tag as framework-dependent, not contradiction.

## Related Notes

- [[Anti-Pattern - Missing Negative Knowledge]]
- [[Frontier Exploration - Probabilistic Knowledge]]
- [[Seed Gap - Finance and Investment Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed]]
