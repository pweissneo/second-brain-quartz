---
last-reviewed: 2026-03-25
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - seed
  - stress-test
  - inverse-authority
  - personal-finance
  - domain-adaptation
access-pattern: decision
knowledge-type: meta
---

# Seed Stress Test: Inverse Authority Rule in Personal Finance

> Testing the "inverse authority calibration" rule in personal finance/investing domain.
> Date: 2026-03-25

## Rule Under Test

**Rule:** Apply inverse authority calibration — trust personal synthesis over authoritative sources only when synthesis meets explicit criteria.

**Criteria (from Seed):**
1. Synthesis draws from 3+ independent sources
2. Domain is stable (not rapidly evolving)
3. Can explain reasoning step-by-step
4. Has relevant domain expertise
5. Synthesis has made validated predictions

**High-stakes exception:** Medical, legal, safety domains default to authority.

---

## Domain: Personal Finance / Investing

### Analysis

Personal finance sits in a gap not addressed by the current rule:
- **Not high-stakes** like medicine (following wrong advice won't kill you)
- **Not low-stakes** like hobby recommendations (can affect financial wellbeing)
- **Stakes are medium** — significant but not catastrophic

### Stress Test Questions

#### Does the rule work for personal finance?

**Partially.** The 5 criteria are reasonable, but the domain falls into a gap:
- The rule addresses high-stakes (default to authority) and everything else (apply 5 tests)
- Personal finance needs more nuanced guidance

#### Edge Cases Found

**1. The "medium-stakes" threshold is undefined**

The rule has:
- High-stakes: medical, legal, safety → always default to authority
- Everything else: apply 5 tests

Personal finance has real consequences (retirement, debt, financial security) but isn't explicitly addressed. Should there be a "medium-stakes" category with modified criteria?

**2. Domain expertise is harder to assess in finance**

For medicine: credentials are clear (MD, board certification)
For finance: credentials are murky (CFA ≠ investment skill, "financial advisor" has low bar)

How do you assess "relevant domain expertise" when credentials are unreliable indicators?

**3. Prediction validation timeline is problematic**

In medicine: you might know within days if a treatment worked
In finance: you might not know for years if a strategy was sound

The "prediction tested" criterion assumes relatively quick validation. Long timelines make this harder to assess.

**4. Source quality is highly variable in finance**

Financial "authoritative sources" include:
- Peer-reviewed research (strong)
- Industry publications (variable)
- Blog posts labeled as "expert" (weak)
- Sponsored content (conflicted)

The rule assumes "authoritative source" is clearly identifiable, but in finance it's often ambiguous.

**5. Financial "expertise" often means "has survived market cycles"**

A finance expert with 30 years of experience has lived through:
- 2000 dot-com crash
- 2008 financial crisis
- 2020 COVID crash
- 2022 inflation/recession fears

Someone who started investing in 2012 might have "expertise" but only seen bull markets. The rule's "expertise" criterion doesn't account for this.

---

## Proposed Modifications

### Add "medium-stakes" category

```yaml
stakes-category: high|medium|low
# High: medical, legal, safety → default to authority
# Medium: personal finance, career decisions → modified 5-test
# Low: hobbies, entertainment → full 5-test
```

For medium-stakes domains:
- Criteria 1-3 remain the same
- Criteria 4 (expertise): require more explicit credential or track record evidence
- Criteria 5 (prediction): extend validation timeline expectations

### Add expertise evidence requirements

```yaml
expertise-evidence:
  credential: "CFA, CPA, etc."
  track-record-years: 10
  market-cycles-survived: 3
  verifiable-performance: true|false
```

### Add source quality classification for finance

```yaml
authoritative-source-type: peer-reviewed|industry|credentialed-expert|popular|unverified
source-quality-weight: high|medium|low
```

---

## Conclusion

The inverse authority rule needs a "medium-stakes" category for domains like personal finance where:
1. Consequences are significant but not catastrophic
2. Credentials are unreliable expertise indicators
3. Validation timelines are long
4. Source quality is highly variable

The core 5-criteria test remains valid, but should be supplemented with domain-specific guidance for medium-stakes domains.

---

## See Also

- [[AI-Assisted Knowledge Management Seed]] (original rule)
- [[Frontier Exploration - Inverse Authority Problem]]
- [[Seed Stress Test - Expertise Level Inversion in Investing]]
- [[Frontier Exploration - Personal Experience vs Published Knowledge Conflicts]]
