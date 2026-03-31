---
last-reviewed: 2026-03-21
lifecycle: seed-extension
protected: true
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - cryptocurrency-domain
  - confidence-decay
  - rapid-expiration
---

# Seed Stress Test: Cryptocurrency Knowledge Base

Testing Seed rules for confidence markers and decay functions in the cryptocurrency/domain, which has unique knowledge aging challenges.

## Domain Overview

Cryptocurrency knowledge bases face distinct challenges:
- Extremely rapid knowledge expiration (protocols change in weeks/months)
- High stakes (financial loss possible)
- Technical complexity (math, cryptography, economics intersection)
- Community-driven standards (governance without central authority)
- Speculative vs. technical knowledge overlap

---

## 1. Confidence Decay in Cryptocurrency

**Seed Rule:** Track knowledge debt explicitly — monitor verification backlog, staleness, structural decay, redundancy, and retrieval noise as a composite debt score.

**Cryptocurrency Application:**

### Problem: Exponential Decay
Crypto knowledge decays exponentially, not linearly:
- "How to use Bitcoin" (2014) vs (2024) — fundamentally different
- "DeFi protocols" from 2020 largely obsolete by 2024
- "Mining profitability" changes weekly

**Test Failure:** The Seed's standard 30-day review interval is insufficient. Knowledge from 30 days ago may be 50% obsolete in fast-moving crypto.

### Edge Case: Version-Scoped Knowledge
**Problem:** Notes about specific protocol versions (Ethereum v1 vs v2, Bitcoin segwit vs taproot) have different validity windows.

**Test:** Does the Seed's `review-interval` field accommodate version-scoped knowledge with different decay rates?

### Proposed Refinement:
```yaml
# For rapidly-evolving domains
decay-rate:
  type: exponential  # linear vs exponential
  half-life: 90d  # time for 50% decay in utility
  domain: cryptocurrency
  
# Default review intervals by knowledge type
review-intervals:
  protocol: 30d
  technical: 90d
  analysis: 180d
  history: 365d
```

---

## 2. Confidence Markers in Cryptocurrency

**Seed Rule:** Calibrate confidence systematically using source quality and intended use — set initial confidence at capture, adjust based on evidence over time.

**Cryptocurrency Application:**

### Problem: False Precision
Crypto analysis often presents speculation as fact:
- "Bitcoin will reach $100k" — presented with high confidence
- "This token is a good investment" — subjective presented as objective
- "This protocol is safe" — context-dependent presented as absolute

**Test:** Can you distinguish factual claims from speculative opinions in crypto notes?

### Edge Case: Source Quality Assessment
**Problem:** Crypto sources range from:
- Official documentation (high reliability)
- Developer blogs (medium reliability)  
- Influencer tweets (low reliability)
- Anonymous forum posts (very low reliability)

But all might discuss the same topic.

**Test:** Should confidence calibration include source-type weighting beyond just reliability?

### Proposed Refinement:
```yaml
# For crypto and similar speculative domains
confidence-modifiers:
  speculation-indicator: true  # marks opinion vs fact
  source-type-weighting:
    official-doc: 1.0
    developer-blog: 0.8
    community: 0.5
    social: 0.3
  temporal-validity:  # when knowledge likely expires
    short: <30d
    medium: <90d  
    long: <180d
```

---

## 3. Verification Status in Cryptocurrency

**Seed Rule:** Track source reliability and verification status as separate dimensions.

**Cryptocurrency Application:**

### Problem: Unverifiable Claims
Many crypto claims are inherently unverifiable:
- "This token will succeed"
- "The team is trustworthy"
- "This price prediction is accurate"

These cannot be verified in the traditional sense.

**Test:** How do you handle unverifiable but frequently-needed knowledge?

### Edge Case: Community Validation
**Problem:** Crypto knowledge often becomes "standard" through community use rather than formal verification:
- "Best practices" emerge from collective experience
- "Security vulnerabilities" discovered through exploits
- "Educational content" validated by engagement

**Test:** Should crypto have a `verification-status: verified` equivalent?

---

## 4. Disclaimer Requirements

**Seed Rule:** For knowledge domains where advice and information are easily confused (medical, financial, legal), add explicit disclaimer frontmatter.

**Cryptocurrency Application:**

### Problem: Financial Advice vs. Information
Crypto knowledge is almost entirely financial:
- "How Bitcoin works" = information
- "You should buy Bitcoin" = financial advice
- "This yield farming strategy" = financial advice
- "How to set up a wallet" = information

The line between information and advice is thin in crypto.

**Test:** Should all crypto notes require a disclaimer-type field?

### Proposed Refinement:
```yaml
# For financial/crypto domains
disclaimer-required: true
advisory-type: information|advice|analysis
risk-level: low|medium|high
target-audience: beginner|intermediate|advanced
```

---

## 5. Action Thresholds in Crypto Decisions

**Seed Rule:** Add decision threshold guidance for actionable knowledge — when knowledge recommends a decision, include explicit criteria for when to stop gathering information and act.

**Cryptocurrency Application:**

### Problem: Analysis Paralysis
Crypto markets move fast. The "one more source" problem is severe:
- Waiting for more confirmation = missing opportunities
- Acting too fast = financial loss
- No clear threshold for "enough is enough"

**Test:** Can you define decision thresholds for crypto that account for time sensitivity?

### Proposed Threshold Framework:
```yaml
decision-type: time-sensitive
time-horizon: immediate|24h|week|month
reversibility: high|medium|low
threshold-criteria:
  min-sources: 2
  min-confidence: emerging
  max-wait-time: 24h
```

---

## Summary

The cryptocurrency domain reveals key gaps in Seed confidence handling:

1. **Exponential decay** - Linear review intervals don't work for fast-moving crypto
2. **Speculation detection** - Need to distinguish opinion from fact
3. **Unverifiable claims** - Community validation as alternative to formal verification  
4. **Financial disclaimer layering** - Information vs advice distinction critical
5. **Time-sensitive decisions** - Need explicit thresholds that account for market speed

These gaps suggest the Seed needs domain-specific modifiers for financial/speculative domains with rapid knowledge expiration.

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — Primary Seed rules
- [[Confidence Markers]] — Confidence system
- [[Seed Stress Test - Advisory Validity Tracking in Financial Planning]] — Related financial domain test
- [[Seed Stress Test - Decision Threshold Rule in Software Architecture]] — Threshold guidance