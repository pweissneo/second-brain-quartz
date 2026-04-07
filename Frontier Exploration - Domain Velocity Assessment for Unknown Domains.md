---
last-updated: 2026-04-05
last-reviewed: 2026-04-05
author-type: ai-assisted
lifecycle: seed-gap
verification-status: unverified
confidence: emerging
evidence-tier: reasoning
knowledge-source-type: analysis
analysis-type: deductive
applicability: universal
recurring: true
utility-type: potential
tags:
  - seed-gap
  - domain-velocity
  - assessment
  - methodology
  - frontier-exploration
seealso:
  - AI-Assisted Knowledge Management Seed
  - Seed Refinement - Domain Velocity Assessment Methodology
  - Frontier Exploration - Determining Domain Velocity
---

# Frontier Exploration - Domain Velocity Assessment for Unknown Domains

## The Gap

The Seed provides velocity classifications for **known domains**:
- Technology, finance, medical research → fast (30-90 day review)
- Philosophy, history, mathematics → slow (180-365 day review)

But when bootstrapping a knowledge base in an **unfamiliar domain** (beekeeping, urban planning, ceramics, linguistics), AI agents cannot determine appropriate review intervals because:
1. The domain isn't in the predefined list
2. No methodology exists for systematic assessment
3. Either arbitrary intervals are chosen or verification is skipped entirely

## Why This Matters

Without domain velocity assessment, AI agents face critical failures:
- **Over-verification**: Treating slow domains as fast wastes effort (verifying math theorems monthly)
- **Under-verification**: Treating fast domains as slow allows harmful stale knowledge (outdated medical advice)
- **Arbitrary decisions**: Without methodology, review intervals become random rather than defensible
- **Capture paralysis**: Agents hesitate to add knowledge to unknown-velocity domains

## Current Seed Coverage

The Seed covers:
- Domain velocity in allocation context (line ~191)
- Fast-moving domain handling for crypto/Web3 (line ~4507)
- Version-dependent knowledge rules
- Confidence decay concepts

What's **missing**:
- Systematic methodology for assessing NEW domains
- Signal-based evaluation (source stability, update frequency, consensus rate, evidence half-life)
- Classification thresholds for unknown domains

## Proposed Solution

The Seed needs a **signal-based assessment methodology** for unknown domains:

### Assessment Signals

| Signal | Fast Indicators | Slow Indicators |
|--------|-----------------|-----------------|
| Source Stability | Frequently updated docs, rapid version increments | Stable classic texts, decades-old guidance |
| Update Frequency | Daily new research, annual standards updates | Yearly or less research, decades-unchanged standards |
| Consensus Rate | Active debate, paradigm shifts possible | Established consensus, rare challenges |
| Evidence Half-Life | Obsolete within 1-2 years | Valid for decades or centuries |

### Classification Thresholds

- **Fast**: 3+ fast signals → 30-90 day review interval
- **Medium**: Mixed signals → 90-180 day review interval
- **Slow**: 3+ slow signals → 180-365 day review interval
- **Static**: All slow + established consensus → annual or never

### Edge Cases

- **Dual-nature domains**: Legal (fast statutory + slow case law) → layered velocity
- **Domain emergence**: New fields may start fast and stabilize → reassess periodically
- **Geographic variation**: Some knowledge is jurisdiction-specific → scope matters

## Integration Target

This gap should be addressed in the Seed's Foundation or Growth section, near the domain allocation rules. The [[Seed Refinement - Domain Velocity Assessment Methodology]] note provides complete proposed rule text in Rule/Why/Test format ready for integration.

## Test Questions

An AI agent bootstrapping a knowledge base about an unfamiliar domain should be able to:
1. Apply the 4-signal assessment methodology
2. Produce a defensible velocity classification
3. Set appropriate review intervals based on evidence, not assumption

If the agent cannot do this, the Seed is incomplete for real-world bootstrapping scenarios.

## Related Notes

- [[Seed Refinement - Domain Velocity Assessment Methodology]] — Proposed Seed rule
- [[Frontier Exploration - Determining Domain Velocity]] — Related exploration
- [[Seed Gap - Domain-Velocity Confidence Decay]] — Related gap
- [[AI-Assisted Knowledge Management Seed]] — Primary Seed file

---

**Status:** Gap identified. Solution proposed via Seed Refinement note. Integration pending.