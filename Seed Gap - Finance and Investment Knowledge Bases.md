---
last-reviewed: 2026-03-18
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - finance
  - investing
  - domain-specific
  - stress-test-findings
---

# Seed Gap: Finance and Investment Knowledge Bases

> Identifying refinements identified by stress tests but not yet incorporated into the Seed.

## Domain: Finance and Investment

Finance and investment knowledge bases have unique characteristics that stress-tested the Seed and revealed gaps where proposed refinements were identified but not incorporated into the actual Seed rules.

## Stress Test Findings

The following Seed stress tests were conducted:
1. **Seed Stress Test - Finance and Investment Knowledge Base** (2026-03-14)
2. **Stress Test - Knowledge-Type Rule in Investing** (2026-03-12)
3. **Stress Test - Temporal Knowledge Rule in Stock Trading** (2026-03-12)

The temporal knowledge stress test validated existing rules. The other two identified gaps that need Seed incorporation.

## What's Missing from the Seed

### Gap 1: Financial Advisory Level Distinction

The Seed has general disclaimer guidance but lacks domain-specific advisory levels for finance.

**Proposed Rule:** For finance/investment knowledge bases, add `financial-advisory-level:` frontmatter:
- `general-education`: Principles anyone can learn (e.g., "diversification reduces risk")
- `planning-guidance`: Frameworks for personal planning (e.g., "60/40 portfolio allocation")
- `personalized-advice`: Requires individual assessment (cannot be in KB)

**Why:** Finance advice ranges from universal principles to specific recommendations that require personalized assessment. Without explicit level tagging, readers cannot distinguish what's applicable universally vs. what needs professional advice.

**Test:** Can you categorize financial notes by advisory level? Do general-education notes include appropriate disclaimers?

### Gap 2: Investment Framework Tagging

The Seed covers competing frameworks but not domain-specific framework tags for investing.

**Proposed Rule:** For investment analysis notes, add `investment-framework:` frontmatter:
- `value-investing`: Focus on intrinsic value and margin of safety
- `growth-investing`: Focus on future earnings growth
- `momentum`: Focus on trend following
- `index-passive`: Focus on broad market exposure
- `factor-investing`: Focus on specific factors (value, momentum, size)

**Why:** Investment advice that contradicts ("value beats growth" vs. "growth beats value") often stems from different frameworks, not conflicting facts. Tagging frameworks enables readers to understand which perspective informs the analysis.

**Test:** For investment advice notes, can you identify which framework the analysis assumes? Does each framework-based note have the appropriate tag?

### Gap 3: Analysis Expertise Level

The Seed's knowledge-type tags don't distinguish expertise levels within analysis.

**Proposed Rule:** For analysis-type knowledge in finance, add `expertise-level:` frontmatter:
- `professional`: CFA, CPA, professional investor, published researcher
- `educated-amateur`: Has formal education but not professional
- `retail`: Individual investor without formal training

**Why:** A Warren Buffett analysis vs. a retail investor's analysis both count as "analysis" per the Seed, but carry different weight. Expertise tagging enables appropriate skepticism.

**Test:** For analysis notes, can you identify the author's credentials? Is expertise level documented?

### Gap 4: Data Range and Source for Historical Financial Data

The Seed covers temporal knowledge but not the specific issue of financial data selection bias.

**Proposed Rule:** For financial data claims (returns, ratios, statistics), add:
- `data-range`: Specific time period (e.g., "1928-2023")
- `data-source`: Original source (e.g., "NYU Stern", "Shiller", "Morningstar")

**Why:** Financial data claims depend heavily on time period selection. "S&P 500 returns 10%" vs. "7%" depends on start/end dates. Without explicit range and source, readers cannot verify or understand selection bias.

**Test:** For financial data notes, is the specific time period explicit? Can you verify the data from the cited source?

### Gap 5: Prediction Confidence for Forward-Looking Statements

The Seed doesn't have specific guidance for prediction confidence in finance.

**Proposed Rule:** For forward-looking financial statements, add:
- `prediction-confidence: high|medium|low|speculation`
- `time-horizon: 1-year|5-year|10-year|long-term`

**Why:** "This stock will rise" differs from "earnings may grow" but both are forward-looking. Confidence levels help readers assess certainty.

**Test:** For prediction notes, is uncertainty explicitly acknowledged? Is the time horizon specified?

### Gap 6: Framework-Dependent Knowledge

The Seed treats knowledge as universally true/false but finance has framework-dependent knowledge.

**Proposed Rule:** For framework-dependent claims, add `framework-dependent: true` and list applicable frameworks.

**Why:** "Low P/E indicates undervalued" is true within value framework but not universally. Framework-dependent tagging prevents misapplication.

**Test:** Can you identify claims that are true in one framework but not others? Are they appropriately tagged?

## Why These Gaps Matter

1. **Real-world harm**: Finance advice without appropriate disclaimers can cause financial harm
2. **Confusion**: Untagged framework conflicts appear as factual contradictions
3. **Misleading confidence**: Predictions without confidence levels appear more certain than warranted
4. **Selection bias**: Historical data without range/source misleads about what's "normal"

## Relationship to Existing Seed Rules

These gaps are NOT covered by:
- General disclaimer guidance (needs finance-specific levels)
- Knowledge-type tags (don't handle expertise distinction)
- Temporal knowledge rules (don't address data selection bias)
- Confidence markers (don't have finance-specific prediction confidence)

## Proposed Seed Refinements

### Refinement to Existing Rule: Advisory Validity

Add to the advisory validity tracking rule:

> For financial advisory content, use `financial-advisory-level:` to distinguish education from personalized advice. Financial notes should default to `financial-advisory-level: general-education` unless they explicitly qualify as planning-guidance with documented constraints.

### New Seed Rule: Investment Framework Tagging

> **Rule:** For investment analysis notes, tag with `investment-framework:` to identify which investment philosophy informs the analysis.
> **Why:** Investment frameworks (value, growth, momentum) often produce contradictory advice that reflects philosophical differences, not factual disagreements.
> **Test:** Can you identify the investment framework for analysis notes? Do framework-tagged notes acknowledge alternative frameworks exist?

### New Seed Rule: Financial Data Provenance

> **Rule:** For historical financial data claims, include `data-range:` and `data-source:` frontmatter to enable verification and understand selection bias.
> **Why:** Financial data claims ("average returns", "typical valuations") depend heavily on time period and source. Without provenance, readers cannot assess applicability.
> **Test:** Can you verify financial data claims from the cited source? Is the time period selection explained?

### New Seed Rule: Prediction Confidence in Finance

> **Rule:** For forward-looking financial statements, include `prediction-confidence:` and `time-horizon:` to explicitly acknowledge uncertainty.
> **Why:** Financial predictions are often presented as certainty when they're actually speculation. Explicit confidence markers enable appropriate skepticism.
> **Test:** Can you identify the confidence level and time horizon for prediction notes? Are speculative claims appropriately labeled?

## Related Notes

- [[Seed Stress Test - Finance and Investment Knowledge Base]]
- [[Stress Test - Knowledge-Type Rule in Investing]]
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]]
- [[Frontier Exploration - Probabilistic Knowledge]]
- [[AI-Assisted Knowledge Management Seed]]
