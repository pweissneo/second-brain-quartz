---
last-reviewed: 2026-03-14
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
- seed-stress-test
- confidence-markers
- investing-domain
- financial-knowledge
---

# Seed Stress Test: Confidence Markers in Personal Finance/Investing

## Seed Rule Being Tested
**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.

**Why:** Readers need to distinguish established facts from debated hypotheses without reading source chains.

**Test:** Do notes with contested claims include confidence metadata?

**Additional Rule:** Notes with `confidence: high` should have `last-reviewed` within a domain-appropriate timeframe — legal (6 months), scientific (12 months), general (12 months).

---

## Domain Overview

Personal finance/investing knowledge bases face unique challenges:
- **Historical data vs predictions**: Past returns ≠ future returns
- **Time horizon sensitivity**: Strategies valid over 30 years may fail over 5 years
- **Market regime dependence**: Strategies work in some market conditions, not others
- **Advice vs information**: "How tax-advantaged accounts work" (information) vs "You should max out your 401k" (advice)
- **Backtesting illusion**: Historical simulation ≠ live performance

---

## Edge Case 1: Historical Facts vs Future Predictions

**Problem:** The most common error in investing knowledge bases is conflating historical data with future predictions.

**Example 1: Stock Market Returns**
- ❌ "Stocks return 10% annually on average" — marked `confidence: high`
- ✅ "Stocks have returned ~10% annually from 1928-2023" — `confidence: high` (historical)
- ⚠️ "Stocks will return ~10% annually going forward" — should be `confidence: disputed` or `confidence: emerging`

**Why the Test Fails:** The rule says "distinguish established facts from debated hypotheses." But "stocks return 10% on average" is factually ambiguous — it's true historically, false predictively. The test doesn't distinguish temporal scope.

**Recommendation:** Add `temporal-scope:` field:
```yaml
confidence: high
temporal-scope: historical  # what happened
temporal-scope: projected  # what models predict
temporal-scope: unknown  # genuinely uncertain
```

**Example 2: The "Safe Withdrawal Rate"**
- "4% withdrawal rate is safe" — historically tested, but only for 30-year horizons in US markets
- Marked `confidence: high` in many sources
- Actually: debated, with Trinity Study showing 4% as upper bound, not guarantee

**The Test Fails:** This is presented as high-confidence fact but is actually conditional analysis.

---

## Edge Case 2: Time Horizon Sensitivity

**Problem:** Many investment claims are only true for specific time horizons.

**Examples:**

1. **"Stocks always recover"**
   - True for 30-year horizons in US history
   - False for 1-year horizons (they crash regularly)
   - The claim is meaningless without time specification

2. **"Buy the dip"**
   - Profitable strategy over 10+ year horizons
   - Can lose money over 1-3 year horizons
   - Depends on ability to hold through drawdowns

3. **"Dividends provide steady income"**
   - True for multi-decade holding periods
   - Dividends can be cut during recessions (2008, 2020)

**The Test Fails:** The confidence marker doesn't capture the time horizon dependency. A note marked `confidence: high` that only applies to 30-year horizons misleads someone planning for 10 years.

**Recommendation:** Add `holding-period:` field:
```yaml
confidence: high
holding-period: 30-years  # minimum
holding-period: any  # all horizons
```

---

## Edge Case 3: Market Regime Dependence

**Problem:** Investment strategies perform differently in different market conditions ("regimes").

**Examples:**

1. **"Bonds provide diversification"**
   - True in normal markets (stocks down, bonds up)
   - False in 2022 (both stocks and bonds fell together)
   - Regimes change unpredictably

2. **"Value outperforms growth over time"**
   - True in long historical studies
   - Growth dominated 2010-2021
   - Value has no guaranteed "return to mean"

3. **"Cash is trash"** (Ray Dalio quote)
   - True in inflationary environments
   - False when interest rates near zero (2009-2021)

**The Test Fails:** A strategy marked `community-validated` based on one market regime may be inappropriate when the regime shifts.

**Recommendation:** Add `market-regime:` or `validity-conditions:`:
```yaml
confidence: emerging
validity-conditions:
  - "Works in normal markets (both asset classes not correlated)"
  - "May fail in stress regimes (correlation increases)"
```

---

## Edge Case 4: Backtesting vs Live Performance

**Problem:** Investment strategies are often validated through backtesting (simulated historical trading) which overestimates real-world performance.

**Examples:**

1. **Momentum strategies** — Work in backtests, fail in live trading due to:
   - Transaction costs not accounted for
   - Liquidity constraints
   - Self-fulfilling prophecy (strategy becomes popular → loses edge)

2. **Factor investing** — Factors discovered in academic data often:
   - Disappear after publication (alpha decays)
   - Work in backtests but underperform live

3. **Options strategies** — Backtested options returns often:
   - Ignore bid-ask spreads
   - Assume perfect execution
   - Fail to account for market impact

**The Test Fails:** A strategy marked `tested` or `community-validated` may only be tested on historical data, not live performance.

**Recommendation:** Distinguish test methods:
```yaml
verification-status: tested
test-method: backtest  # simulated historical
test-method: live-paper  # simulated with real market data
test-method: live-production  # real money deployed
```

---

## Edge Case 5: Advice vs Information

**Problem:** The Seed distinguishes information from advice, but investing makes this particularly critical due to liability.

**Examples:**

1. **Information**: "A 401k is a tax-advantaged retirement account"
   - Factual, can be marked `confidence: high`
   - No liability for incorrect advice

2. **Advice**: "You should contribute to a 401k"
   - Depends on individual circumstances
   - Could be wrong (if employer match is poor, debt is high, etc.)
   - Marking this `confidence: high` is dangerous

3. **Analysis**: "For someone with 30+ years horizon, higher equity allocation is generally appropriate"
   - This is nuanced analysis
   - Should be `knowledge-type: analysis`
   - Should include `confidence: emerging` (not universally true)

**The Test Fails:** The current rule doesn't specifically address financial advice liability.

**Recommendation:** Add financial-specific fields:
```yaml
advisory-type: information  # factual, no action recommended
advisory-type: analysis  # conditional, depends on situation
advisory-type: recommendation  # specific action suggested
disclaimer-required: true
disclaimer-text: "Not financial advice. Consult a professional."
```

---

## Edge Case 6: Changing Market Conditions Make Knowledge Obsolete

**Problem:** Financial knowledge can become obsolete as markets change.

**Examples:**

1. **"Bond yields are low"** — True in 2020 (0% interest), false in 2024 (5% yields)
   - A note marked `confidence: high` about low yields is now wrong

2. **"REITs provide inflation hedge"** — Historically true, debated post-2022
   - High confidence marking may be outdated

3. **"Bitcoin is uncorrelated to stocks"** — Was true, now disputed (correlation increased)
   - Marked as fact in some sources, now clearly wrong

**The Test Fails:** The `last-reviewed` rule says 12 months for general knowledge, but financial knowledge can change faster than that.

**Recommendation:** Add financial-specific review intervals:
```yaml
last-reviewed: 2024-03-15
review-interval: 6-months  # for market-dependent knowledge
review-interval: 12-months  # for general principles
```

---

## Edge Case 7: Jurisdiction and Tax Knowledge

**Problem:** Financial advice varies enormously by jurisdiction.

**Examples:**

1. **"Roth IRA grows tax-free"** — Only true in the US
   - UK has ISA, Canada has TFSA, other countries have different vehicles

2. **"401k match is free money"** — US-specific
   - Other countries have different employer retirement schemes

3. **"Mortgage interest is tax-deductible"** — US-specific
   - Other countries have different rules

**The Test Fails:** The Seed has jurisdiction rules for legal/medical, but investing needs the same treatment.

**Recommendation:** Already covered by existing jurisdiction rules, but emphasize in testing:
```yaml
jurisdiction: US  # required for tax/regulatory knowledge
```

---

## Summary of Recommended Fields

For comprehensive investing/financial knowledge:

```yaml
---
confidence: high | emerging | disputed | obsolete
knowledge-type: canonical | analysis | personal
temporal-scope: historical | projected | unknown
holding-period: N-years | any
validity-conditions: [list of conditions where this applies]
market-regime: [normal | stressed | any]
test-method: backtest | live-paper | live-production
advisory-type: information | analysis | recommendation
disclaimer-required: true
disclaimer-type: financial
jurisdiction: [list]
last-reviewed: 2026-03-14
review-interval: 3-months | 6-months | 12-months
---
```

---

## The Core Insight

The confidence markers rule is necessary but insufficient for financial/investing knowledge bases because:

1. **Historical facts ≠ predictions** — "was" is not "will be"
2. **Time horizons matter** — "always" is meaningless without specifying duration
3. **Regimes change** — strategies that worked may stop working
4. **Backtests ≠ live** — simulation is not reality
5. **Advice ≠ information** — recommendations have liability implications
6. **Knowledge decays** — market conditions change, making knowledge obsolete

The current rule's test ("Do notes with contested claims include confidence metadata?") doesn't address the nuance that financial claims can be:
- Factual but conditionally true
- Historically true but predictively uncertain
- Valid in one regime but not another

---

## Recommendations for Seed Update

**Suggested refinement to confidence markers rule:**

> For domains with inherent uncertainty (investing, economics, forecasting), add supplementary fields to confidence markers:
> - `temporal-scope`: distinguishes what HAS happened from what WILL happen
> - `holding-period`: specifies minimum time horizon for validity
> - `validity-conditions`: documents regime/condition dependencies
>
> For advice-type notes in regulated domains (financial, legal, medical), include explicit advisory-type and disclaimer fields.

---

## Related
- [[Stress Test - Verification Status Rule in Home Repair]]
- [[Confidence Markers]]
- [[Information vs Advice]]
- [[Handling Temporal Knowledge]]
- [[Domain-Specific Knowledge Types]]
