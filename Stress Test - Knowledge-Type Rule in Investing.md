---
last-reviewed: 2026-03-12
confidence: emerging
lifecycle: active
author-type: ai-assisted
tags:
  - seed-stress-test
  - knowledge-type
  - investing
  - edge-case
---

# Stress Test: Knowledge-Type Tagging Rule in Investing

## Domain
Investing / Finance Knowledge Bases

## Seed Rule Under Test

> **Rule:** For domains where authoritative knowledge coexists with personal analysis, tag notes with `knowledge-type: canonical|analysis|personal` to distinguish established consensus from interpretation.
> 
> **Why:** Many domains have knowledge ranging from "established fact" (canonical, authoritative) to "personal interpretation" (analysis, opinion). Chess opening theory vs your game annotations; medical guidelines vs physician opinion; official documentation vs blog tutorials. Without explicit tags, AI agents cannot distinguish what experts agree on from individual interpretation.
> 
> **Test:** Pick 5 notes in a domain with both canonical and analysis knowledge (chess, law, medicine, investing). Can you categorize each as canonical (established consensus), analysis (informed interpretation), or personal (individual opinion)? Do they have knowledge-type tags?

---

## Does the Rule Make Sense for Investing?

**Yes, strongly.** Investing has a clear hierarchy:

### Canonical Knowledge (Widely Accepted)
- **Financial statements** — balance sheets, income statements
- **Mathematical formulas** — compound interest, DCF valuation
- **Regulatory frameworks** — SEC rules, fiduciary standards
- **Historical data** — actual price returns, dividend yields
- **Economic principles** — supply/demand, interest rate effects

### Analysis (Informed Interpretation)
- **Stock analysis** — whether a company is "undervalued"
- **Market timing** — whether we're in a bull/bear market
- **Sector recommendations** — "tech is overvalued"
- **Economic forecasts** — "inflation will decline in Q3"
- **Comparison analysis** — "Company X is better than Company Y"

### Personal Knowledge (Individual Experience)
- **Trade journals** — "What worked for me"
- **Personal portfolio** — "I hold AAPL at $150"
- **Psychology notes** — "I panic sold in 2020"
- **Lessons learned** — "I should have held longer"

---

## Edge Cases Identified

### Edge Case 1: The "Consensus" Problem — What's Canonical in Investing?

In many fields, canonical knowledge is clear. In investing, even seemingly factual statements can be contested:

**Example:** Is "diversification reduces risk" canonical or analysis?
- **Traditional view:** Canonical — well-established portfolio theory
- **Critique:** Analysis — some argue concentrated portfolios beat diversified
- **Reality:** It's canonical in academic finance, but contested in practice

**The Test Fails:** The rule assumes canonical vs. analysis is obvious. In investing, many "facts" are actually contested frameworks.

### Edge Case 2: Historical Data vs. Interpretation

**Example:** "S&P 500 returned 10% annually from 1928-2023"
- Is this canonical (historical data) or analysis (selected time period)?
- Different start/end dates yield different results
- The choice of what to include IS analysis

**The Test Fails:** Historical data appears factual, but selection choices introduce interpretation.

### Edge Case 3: Expert vs. Amateur Analysis

**Example:** Warren Buffett's analysis vs. a retail investor's analysis
- Both are "analysis" per the tag
- But one carries vastly more weight
- The tag doesn't distinguish expertise levels

**The Test Fails:** Analysis from a CFA differs from analysis from a beginner, but both would be tagged "analysis."

### Edge Case 4: Framework-Dependent Recommendations

**Example:** "Value investing beats growth investing"
- **Within value framework:** Could be treated as canonical (the framework's core principle)
- **Across frameworks:** Clearly analysis/opinion
- **In practice:** Depends on time period, definition of "value"

**The Test Fails:** The same statement can be canonical within one framework and analysis outside it.

### Edge Case 5: Personal Knowledge That Becomes Canonical

**Example:** A famous investor's "lesson learned" becomes widely cited
- Originally: Personal knowledge ("what worked for me")
- Over time: Becomes canonical advice (" Buffett says...")
- The knowledge-type changes over time

**The Test Fails:** Knowledge-type is static in the rule, but knowledge evolves.

### Edge Case 6: Quant vs. Qual Analysis

**Example:** 
- **Quant analysis:** "P/E ratio below 15 is undervalued" — seems factual
- **Qual analysis:** "The CEO is trustworthy" — clearly opinion

Both could be tagged "analysis," but they have different reliability.

**The Test Fails:** The rule doesn't distinguish types of analysis.

### Edge Case 7: Forward-Looking Statements

**Example:** "This stock will rise to $200"
- Is this analysis? prediction? speculation?
- All could be considered "personal" since no one knows the future

**The Test Fails:** The rule doesn't handle speculative knowledge well.

### Edge Case 8: Conflicting "Canonical" Sources

**Example:** Different rating agencies give different ratings
- Moody's says A, S&P says B
- Both claim to be "canonical" analysis
- Reader sees two "canonical" sources contradicting each other

**The Test Fails:** Canonical doesn't mean unanimous.

---

## The Real Issue

The knowledge-type rule assumes:
1. Canonical vs. analysis is clearly distinguishable
2. Analysis quality is uniform
3. Frameworks don't affect what's "canonical"
4. Knowledge-type is static

Investing violates all four assumptions.

---

## Proposed Refinements

### Refinement 1: Add Framework Tags

For investing (and economics), add `framework:` tags:

```yaml
knowledge-type: analysis
framework: value-investing | growth-investing | momentum | etf-only
```

**Test:** Can you identify which framework the analysis assumes?

### Refinement 2: Add Expertise Level to Analysis

```yaml
knowledge-type: analysis
expertise-level: professional | educated-amateur | retail
credentials: CFA | CPA | MBA | self-taught
```

**Test:** Does the note disclose the analyst's credentials?

### Refinement 3: Add Temporal Scope to Data

```yaml
knowledge-type: canonical
data-range: 1928-2023  # specific time period
data-source: NYU Stern | Shiller | Morningstar
```

**Test:** Is the time period and source explicit for data claims?

### Refinement 4: Add Confidence to Forward-Looking Statements

```yaml:
knowledge-type: analysis
prediction-confidence: high | medium | low | speculation
time-horizon: 1-year | 5-year | 10-year
```

**Test:** Is uncertainty explicitly acknowledged?

### Refinement 5: Track Knowledge Evolution

```yaml
knowledge-type: personal  # was-originally: personal
was-originally: personal
became-canonical: 2020-01-01  # when it became widely accepted
canonical-source: Warren Buffett  # who popularized it
```

**Test:** Can you trace how this knowledge evolved?

---

## Test for Investing Knowledge Base

Applying the refined rules to an investing vault:

1. **Pick 5 investment advice notes**
   - Does each have `knowledge-type: canonical|analysis|personal`?
   - If analysis: Does it have `framework:` tag?
   - If analysis: Does it have `expertise-level:` or credentials?

2. **Pick 5 data notes**
   - Does each have `data-range:` and `data-source:`?
   - Can you verify the data from the source?

3. **Pick 5 prediction notes**
   - Does each have `prediction-confidence:`?
   - Is the time horizon explicit?

4. **Pick 5 "lessons learned" notes**
   - Are these marked `knowledge-type: personal`?
   - Do they acknowledge they're one person's experience?

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Graph Traversal Efficiency]]
- [[Confidence Markers]]
- [[Frontier Exploration - Probabilistic Knowledge]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]]
