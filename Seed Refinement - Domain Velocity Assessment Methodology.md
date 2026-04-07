---
last-reviewed: 2026-04-05
last-updated: 2026-04-05
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: meta
access-pattern: learning
tags:
  - seed-refinement
  - domain-velocity
  - assessment-methodology
  - frontier-integration
related-seed-rule: Domain Velocity Classification
---

# Seed Refinement - Domain Velocity Assessment Methodology

## Integration Target

Integrate into [[AI-Assisted Knowledge Management Seed.md]] under the Domain Velocity Classification section (around line 4243).

## New Content to Add

**Rule (NEW - 2026-04-05):** For domains not in the predefined velocity list, assess velocity using a signal-based methodology — evaluate source stability, update frequency, consensus rate, and evidence half-life to classify the domain.
**Why:** The Seed provides velocity classifications for known domains (technology=fast, philosophy=static) but offers no method for assessing NEW domains. When bootstrapping a knowledge base in an unfamiliar domain (woodworking, beekeeping, urban planning), AI agents cannot determine appropriate review intervals without explicit assessment guidance. This creates either arbitrary intervals or skipped verification.
**Test:** (1) Can you apply the signal-based assessment to any unknown domain? (2) Does the methodology produce a defensible velocity classification? (3) Are the signals evidence-based, not arbitrary?

**Assessment Methodology:**

### Signal 1: Source Stability
- **Fast indicators**: Primary sources frequently updated (software docs, market data), official guidance changes within months, version numbers increment rapidly
- **Slow indicators**: Primary sources stable (classic texts, foundational papers), guidance is decades-old, version numbers rare

### Signal 2: Update Frequency  
- **Fast**: New research/articles daily (technology, finance), standards updated annually
- **Slow**: New research/articles yearly or less (mathematics, history), standards unchanged for decades

### Signal 3: Consensus Rate
- **Fast**: Active debate, paradigm shifts possible (AI research, economic theory)
- **Slow**: Established consensus, rare challenges (organic chemistry, anatomical facts)

### Signal 4: Evidence Half-Life
- **Fast**: Knowledge becomes obsolete within 1-2 years (software versions, market data)
- **Slow**: Knowledge valid for decades or centuries (mathematical proofs, historical records)

**Classification thresholds:**
- Fast: 3+ fast signals → 30-90 day review
- Medium: Mixed signals → 90-180 day review  
- Slow: 3+ slow signals → 180-365 day review
- Static: All slow signals + established consensus → annual or never

**Edge case:** Dual-nature domains (legal knowledge has fast statutory changes + slow case law). Apply layered velocity - separate review intervals for different knowledge types within the domain.

## Gap Addressed

Addresses gap in [[Frontier Exploration - Determining Domain Velocity]] - converts exploration note into actionable Seed rule with testable methodology.

## Confidence Note

**Confidence assessment**: The methodology is systematic but the thresholds are heuristic. Consider this a starting point to be refined through stress-testing across diverse domains.