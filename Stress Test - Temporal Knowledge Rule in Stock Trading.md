---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags: [seed-stress-test, temporal-knowledge, domain-trading]
---

# Stress Test: Temporal Knowledge Rule in Stock Trading

## The Rule Under Test

**Rule:** Separate time-sensitive data from static knowledge — link to live sources for rapidly changing information, use point-in-time references with dates for moderately temporal knowledge.

**Test:** Scan for notes containing specific values (prices, counts, current dates as facts). Check: (1) Is this likely to change? (2) Is there a source URL for current data? (3) Should this be a link instead?

## Domain: Stock Trading

Stock trading is an excellent stress test because:
1. Prices change every second
2. Market conditions shift daily
3. Economic indicators update regularly
4. Trading strategies have historical performance data

### Scenario 1: Stock Price as Fact

**Note content:**
"Apple Inc. (AAPL) is trading at $175.50 per share."

**Analysis:**
- Is this likely to change? Yes — prices change every trading session
- Is there a source URL? Perhaps a link to Yahoo Finance
- Should this be a link instead? YES

**Problem:** If this note sits for 6 months, the price is completely wrong. A reader in the future would have false information.

**Edge case:** If the note is specifically about "the price on the day I bought" or "the price when I wrote this analysis," that's a valid temporal reference. But it needs a clear date marker.

### Scenario 2: P/E Ratio as Static Knowledge

**Note content:**
"Apple's price-to-earnings ratio is 28.5."

**Analysis:**
- Is this likely to change? Yes — both price and earnings fluctuate
- Could be interpreted as "current P/E" or "average P/E over past 12 months"
- Needs clarification: Is this a point-in-time fact or a range?

**Edge case:** If discussing valuation methodology (e.g., "A P/E of 20-30 is considered fair for tech companies"), that's static knowledge.

### Scenario 3: Trading Strategy Performance

**Note content:**
"My momentum strategy returned 23% in 2023."

**Analysis:**
- This is historical performance data — needs a clear date
- Should include: time period, benchmark comparison, risk metrics
- Not "current" but also not "eternal truth"

**Problem:** If the strategy changed, the old performance may no longer be relevant. Need lifecycle tracking.

### Scenario 4: Fundamental Analysis Principles

**Note content:**
"Value investors seek stocks with low P/E ratios because..."

**Analysis:**
- This is static knowledge — principles of investing don't change daily
- No temporal markers needed
- This passes the rule

### Scenario 5: Economic Indicator

**Note content:**
"The current unemployment rate is 3.7%."

**Analysis:**
- Unemployment rates are published monthly — not real-time but not eternal
- Needs clear date: "as of January 2024"
- Or link to BLS for latest data

## Edge Cases Discovered

### Edge Case 1: Tutorial Content
A tutorial on "How to read a stock chart" may include example prices. These are illustrative, not factual. Should be marked as examples.

### Edge Case 2: Backtesting Results
Strategy backtest results are historical but can inform future decisions. Need: (1) Clear time period, (2) Disclaimer that past performance doesn't guarantee future results.

### Edge Case 3: Market Sentiment
"Currently bullish on tech" — sentiment changes fast. Link to a sentiment indicator or mark with date.

### Edge Case 4: Dividend Information
Dividends are announced in advance but paid on specific dates. Need: (1) Ex-dividend date, (2) Payment date, (3) Amount.

## Rule Refinements Needed

1. **Distinguish illustrative from factual examples:** Tutorial prices are examples; analysis prices are facts needing dates/links.

2. **Add "point-in-time" marker:** Notes with temporal data should use frontmatter like `data-date: 2024-01-15` or `data-as-of: 2024-Q1`

3. **Lifecycle applies to temporal data:** Even well-dated information can become obsolete if the underlying situation changes. Add guidance: "Review temporal notes when market conditions shift significantly."

4. **Link vs. embed decision:** 
   - Embed: Historical analysis you're building upon
   - Link: Current prices, live data, anything that renders the note time-sensitive

## Test for AI Agents

Given a note about stocks:
1. Does it contain specific numbers (prices, ratios, percentages)?
2. If yes: Is there a date marker OR a link to live data?
3. If no to both: Flag as potentially stale

## Related
- [[Handling Temporal Knowledge]] - Related note on temporal knowledge
- [[AI-Assisted Knowledge Management Seed]] - The Seed rule being tested
- [[Graph Maintenance]] - For reviewing temporal notes
- [[Note Lifecycle Management]] - For tracking obsolescence
