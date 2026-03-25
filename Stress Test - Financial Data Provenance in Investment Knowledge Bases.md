---
last-reviewed: 2026-03-22
confidence: emerging
lifecycle: evergreen
author-type: ai-assisted
tags:
  - seed-stress-test
  - financial-data
  - data-provenance
  - investing
  - edge-case
---

# Stress Test: Financial Data Provenance in Investment Knowledge Bases

## Domain
Finance / Investment Knowledge Bases

## Seed Rule Under Test

> **Rule:** For historical financial data claims (returns, ratios, statistics), add `data-range:` and `data-source:` frontmatter to enable verification and understand selection bias.
> 
> **Why:** Financial data claims ("average returns", "typical valuations") depend heavily on time period and source. Without provenance, readers cannot assess applicability or verify accuracy.
> 
> **Test:** For financial data notes, is the specific time period explicit? Can you verify the data from the cited source?

---

## Why Financial Data is Special

Financial data differs from other temporal knowledge because:

1. **Selection bias is pervasive** — Time period choice dramatically affects results
2. **Multiple sources disagree** — Different databases give different numbers
3. **Survivorship bias** — Failed companies disappear from historical data
4. **Inflation effects** — Nominal vs. real returns differ substantially
5. **Frequency matters** — Daily, monthly, annual data yield different results

---

## Edge Cases Identified

### Edge Case 1: The "Average Return" Problem

**Claim:** "The stock market has returned 10% annually on average"

**What's Missing:**
- **Time period?** 1928-2023? 1950-2023? Last 10 years?
- **Source?** NYU Stern? S&P? Shiller?
- **Inflation-adjusted?** Nominal or real?
- **Which index?** S&P 500? Total market? Dow Jones?

**The Test Fails:** A simple "10% return" claim is meaningless without provenance.

### Edge Case 2: The Survivorship Bias Trap

**Claim:** "Active funds underperform index funds"

**What's Missing:**
- **Data includes defunct funds?** (survivorship bias inflates performance)
- **Time period?** Different decades show different results
- **Fund categories?** US equity? Global? Sector?

**The Test Fails:** Without knowing if dead funds are included, the claim cannot be verified.

### Edge Case 3: Different Sources, Different Numbers

**Claim:** "The S&P 500 P/E ratio is currently 25"

**What's Missing:**
- **Which source?** Shiller? Bloomberg? Forward P/E? Trailing P/E?
- **Measurement date?** The number changes daily
- **Averaged or point-in-time?** Monthly average vs. specific day

**The Test Fails:** Multiple authoritative sources give different P/E ratios.

### Edge Case 4: The Inflation Adjustment Question

**Claim:** "Bonds returned 5% annually"

**What's Missing:**
- **Nominal or real?** 5% nominal ≈ 2% real (with 3% inflation)
- **Which inflation measure?** CPI? PCE? Treasury yields?
- **Before or after fees?**

**The Test Fails:** Without inflation adjustment, returns are misleading.

### Edge Case 5: The Time Horizon Arbitrary Choice

**Claim:** "Value stocks beat growth stocks"

**What's Missing:**
- **Time period?** 1926-2023 (value wins)? 2010-2023 (growth wins)?
- **Definition of value/growth?** High/low P/E? Book value? Momentum?
- **Size adjustment?** Large-cap? Small-cap? All caps?

**The Test Fails:** The same claim can be true or false depending on arbitrary choices.

### Edge Case 6: The Data Frequency Effect

**Claim:** "Monthly rebalancing improves returns"

**What's Missing:**
- **Transaction costs included?**
- **Tax implications?**
- **Data frequency?** Monthly vs. quarterly vs. annual

**The Test Fails:** Without frequency and cost details, the claim is incomplete.

### Edge Case 7: Geographic Scope Ambiguity

**Claim:** "Emerging markets offer higher returns"

**What's Missing:**
- **Which emerging markets?** All?特定 region?
- **Currency denomination?** Local currency or USD?
- **Time period?** Different periods favor different regions

**The Test Fails:** Geographic scope dramatically affects the claim.

### Edge Case 8: The "Since Inception" Problem

**Claim:** "Fund XYZ has returned 12% since inception"

**What's Missing:**
- **Inception date?** Older funds have longer track records
- **Market conditions at inception?** Bull market vs. bear market start
- **Manager tenure?** Has the same manager been there?

**The Test Fails:** "Since inception" hides more than it reveals.

---

## Proposed Frontmatter Schema

For financial data claims, the Seed should require:

```yaml
data-provenance:
  data-range: "1928-2023"  # or specific dates
  data-source: "NYU Stern"  # or Morningstar, Shiller, etc.
  data-frequency: annual|monthly|daily
  inflation-adjusted: true|false
  nominal: true  # if not inflation-adjusted
  currency: USD  # or EUR, GBP, etc.
  survivorship-bias: accounted-for|not-accounted-for|unknown
  index-name: "S&P 500"  # for index-specific claims
  fund-count: 2000  # for fund comparison claims
  methodology: "equal-weighted" | "market-cap-weighted"  # how calculated
```

---

## Test for Financial Data Notes

1. **Pick 10 financial data claims**
   - Does each have `data-range:` specifying the time period?
   - Does each have `data-source:` citing the original database?
   - Can you verify the number from the source?

2. **Pick 5 return claims**
   - Are returns nominal or real (inflation-adjusted)?
   - Are fees/costs included?

3. **Pick 5 comparison claims** (e.g., "A beats B")
   - Can you identify the methodology?
   - Does the claim acknowledge selection effects?

4. **Pick 5 forward-looking claims**
   - Is the time horizon specified?
   - Is confidence level indicated?

---

## Related

- [[Seed Gap - Finance and Investment Knowledge Bases]]
- [[Stress Test - Knowledge-Type Rule in Investing]]
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]]
- [[Frontier Exploration - Probabilistic Knowledge]]
- [[AI-Assisted Knowledge Management Seed]]
