---
last-reviewed: 2026-03-28
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: frontier-exploration
tags:
  - frontier-exploration
  - domain-velocity
  - knowledge-decay
  - confidence
  - review-cycles
---

# Frontier Exploration: Determining Domain Velocity for New Knowledge Bases

> When bootstrapping a knowledge base in an unfamiliar domain, how do you determine the domain's knowledge velocity — and why does it matter?

## The Problem

The Seed provides domain-velocity classification for some known domains:
- Fast-changing: technology, finance, social media (30-day review)
- Moderate: medicine, law, photography (90-day review)
- Slow: philosophy, mathematics, history (180-365 day or never)

But when you encounter a domain NOT in this list — woodworking, beekeeping, urban planning, classical music — the Seed offers no guidance on how to DETERMINE the velocity. You must reverse-engineer the velocity from first principles.

## Why This Matters

Without domain velocity assessment:
- AI agents default to arbitrary review intervals
- Fast-velocity domains accumulate false confidence (stale knowledge seems reliable)
- Slow-velocity domains suffer unnecessary review overhead
- The 5:1 ratio may not apply if personal knowledge also decays at different rates

## Signals for Domain Velocity Assessment

### Signal 1: Source Stability

**Fast velocity indicators:**
- Primary sources are frequently updated (software docs, market data)
- Official guidance changes within months (regulations, standards)
- Version numbers increment rapidly (software, protocols)

**Slow velocity indicators:**
- Primary sources are stable (classic texts, foundational papers)
- Official guidance is decades-old (legal precedent, mathematical proofs)
- Version numbers are rare or nonexistent

**Assessment method:** Count how many primary sources have been updated in the last 12 months. If >50% updated, fast velocity.

### Signal 2: Error Reversal Rate

**Fast velocity indicators:**
- Commonly held "best practices" that were proven wrong within 1-2 years
- Active debate on fundamentals (what's "correct" keeps changing)
- Predictions frequently fail (technology, markets)

**Slow velocity indicators:**
- Core principles hold for decades or centuries
- Debates are settled (not ongoing)
- Predictions are reliable (historical patterns repeat)

**Assessment method:** Look for "used to believe X, now believe Y" patterns in the domain. Count reversals per year. High reversal rate = fast velocity.

### Signal 3: Practitioner Turnover

**Fast velocity indicators:**
- Practitioners discuss "what changed recently"
- New terminology emerges constantly
- Training/education materials are frequently revised

**Slow velocity indicators:**
- Practitioners reference "timeless" principles
- Terminology is stable
- Classic texts remain current

**Assessment method:** Look at publication dates of foundational texts in the domain. Check if practitioners reference "old" vs. "current" information.

### Signal 4: External Dependency Rate

**Fast velocity indicators:**
- Knowledge depends on external tools/versions that change
- Knowledge is tied to specific products or services
- API/library versions update frequently

**Slow velocity indicators:**
- Knowledge is self-contained (doesn't depend on external state)
- Principles apply regardless of tool version
- No external dependencies

**Assessment method:** Count how many external dependencies a typical note references. High dependency count = faster velocity.

### Signal 5: Community Consensus Stability

**Fast velocity indicators:**
- Active controversies on "what works"
- Multiple competing approaches with no clear winner
- Community "wisdom" shifts noticeably over time

**Slow velocity indicators:**
- Strong consensus on fundamentals
- One dominant approach
- Community wisdom is stable

**Assessment method:** Check for consensus-level markers. If disputed or emerging = faster velocity.

## Mixed-Velocity Domains

Most domains have MIXED velocity:
- **Photography:** Technique is slow (composition, lighting principles), but equipment is fast (cameras, software)
- **Cooking:** Core techniques are slow (sauce-making, heat management), but trends are fast (ingredient popularity, dietary movements)
- **Software:** Language syntax is slow, but libraries and frameworks are fast

**Guidance:** Allow per-note velocity override. The domain velocity taxonomy should be:
```yaml
# At domain level: default velocity
domain-velocity: moderate

# At note level: override allowed
# - Core principles: slow
# - Current recommendations: fast
# - Equipment-specific: very fast
velocity-override: fast
```

## The Velocity-Confidence Interaction

Domain velocity should affect:
1. **Initial confidence ceiling:** Fast domains shouldn't reach "high" confidence without recent verification
2. **Review frequency:** Higher velocity = shorter intervals
3. **Confidence downgrade trigger:** When review overdue, auto-downgrade
4. **Personal knowledge ratio:** In fast domains, your personal insights decay faster too

**Proposed rule:**
> For domains with unknown velocity, start with 90-day default review. After 20 notes, assess velocity using the 5 signals above, then adjust to appropriate interval.

## How to Test Domain Velocity

### Test 1: Source Audit

Pull 10 random notes in the domain:
- When were sources last updated?
- How many sources are from the last 12 months?
- Result: >30% recent = fast velocity

### Test 2: Reversal Count

Search for language indicating reversal:
- "Previously recommended X, now Y"
- "Old approach vs. new approach"
- "Updated guidance"
- Result: >2 per 10 notes = fast velocity

### Test 3: Prediction Accuracy

For predictive knowledge:
- Can you find predictions that failed within 1 year?
- Are predictions dated with expiration windows?
- Result: Failed predictions common = fast velocity

### Test 4: External Dependency Audit

For 10 notes:
- How many external dependencies per note?
- Are dependencies version-specific?
- Result: >2 dependencies per note = fast velocity

## Proposed Seed Rule

### Rule: Assess Domain Velocity Before Setting Review Intervals

> When bootstrapping in an unfamiliar domain, use the 5-signal assessment (source stability, error reversal rate, practitioner turnover, external dependency rate, consensus stability) to determine domain velocity before defaulting to 90-day review.

**Why:** Without velocity assessment, AI agents apply arbitrary intervals. Fast-velocity domains need 30-day review; slow-velocity domains can go 180+ days. Starting with 90-day default is safe, but explicit velocity assessment within the first 20 notes enables appropriate calibration.

**Test:**
1. After 20 notes in a new domain: Can you apply the 5-signal assessment?
2. Does the resulting velocity classification make intuitive sense to practitioners?
3. Have you adjusted review intervals based on assessment?

**Implementation:**
```yaml
# After initial domain capture
domain-velocity-assessment:
  signals-evaluated:
    source-stability: fast|moderate|slow
    error-reversal-rate: fast|moderate|slow
    practitioner-turnover: fast|moderate|slow
    external-dependency-rate: fast|moderate|slow
    consensus-stability: fast|moderate|slow
  overall-velocity: fast|moderate|slow
  review-interval: 30|60|90|180|365|never
  assessed-date: 2026-03-28
  confidence-ceiling: emerging|high
```

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Domain velocity rules
- [[Seed Gap - Domain-Velocity Confidence Decay]] — Related gap note
- [[Seed Stress Test - Automotive Repair Knowledge Base]] — Tested domain with mixed velocity (slow techniques, fast equipment)
- [[Seed Stress Test - Photography Knowledge Base]] — Mixed velocity example
- [[Seed Stress Test - Cooking Knowledge Base]] — Mixed velocity example
- [[Frontier Exploration - Knowledge-Aware Review Cycles]] — Related exploration
- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] — Related but focuses on bootstrapping

## Questions for Seed Incorporation

1. Should the 5-signal assessment be mandatory after 20 notes in a new domain?
2. Should velocity override be allowed per-note within the same domain?
3. How should velocity assessment handle multi-topic domains (e.g., "cooking" has both slow technique and fast trends)?
4. Should there be a velocity confidence indicator — how confident are we in our velocity classification?

---

**Status:** This is frontier exploration. The 5-signal assessment is a proposed methodology that needs testing across multiple domains to validate.
