---
last-reviewed: 2026-03-23
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - capture-strategy
  - utility
  - uncertainty
---

# Frontier Exploration: Knowledge Option Value

> How to handle knowledge that has uncertain, potential, or future utility — the "option value" problem in knowledge capture.

## The Problem

The Seed covers:
- **Utility testing**: Does this improve vault answers?
- **Diminishing returns**: Skip notes failing utility + connection + uniqueness + effort tests
- **Prioritization signals**: Blocking > high-utility > gap > curiosity

But the Seed MISSES: **Knowledge option value** — knowledge that isn't immediately useful but may become valuable under uncertain future conditions. Examples:

- **Technical niche knowledge**: A specific debugging technique for a framework you don't currently use
- **Domain adjacency**: Information about a field you might enter someday
- **Capability building**: Knowledge that expands thinking even if not immediately applicable
- **Rarely-used expertise**: Specialized skills with low frequency but high impact when needed
- **Foundational for unknown futures**: Basics that will matter when you least expect it

## Why This Is Different from Current Utility Rules

The current utility test asks: "Does this improve answers for CURRENT needs?"

Option value asks: "Might this matter for POSSIBLE future needs?"

| Aspect | Current Utility | Option Value |
|--------|----------------|-------------|
| Timeframe | Immediate | Future (uncertain) |
| Certainty | Known useful | Potentially useful |
| Measurement | Clear improvement | Speculative |
| Cost of capture | Low | Variable |
| Cost of missing | Low | Potentially high |

## The Gap in Current Seed Rules

An AI building a knowledge base with current Seed rules would:
- ✓ Capture high-utility knowledge that improves current answers
- ✓ Apply diminishing returns to avoid bloat
- ✓ Prioritize blocking knowledge over curiosity
- ✗ Not know how to handle "this might matter someday" knowledge
- ✗ May systematically under-capture option-value knowledge
- ✗ No framework for assessing potential future utility

This creates a systematic bias toward **current relevance** over **future optionality**, which can leave the vault unprepared for:
- Career changes into new domains
- Unexpected problem types
- Rare but high-impact scenarios
- Adjacent opportunities

## Key Questions for Option Value Knowledge

1. **What's the cost of capturing now vs. later?**
   - If capture is cheap: capture now
   - If capture requires rare access (interview, event, experiment): capture now
   - If capture will be easy later (stable information): defer

2. **What's the cost of missing it?**
   - Can you recreate it from memory? → lower cost of missing
   - Is the source one-time/ephemeral? → higher cost of missing
   - Will it become harder to find? → higher cost of missing

3. **How many "future self" scenarios does this enable?**
   - Enables 1 future use → lower option value
   - Enables multiple future paths → higher option value
   - Enables fundamental capability shifts → highest option value

4. **What's the specificity vs. transferability tradeoff?**
   - Highly specific to current context → lower option value
   - Generalizable principles → higher option value

## Proposed Seed Extension

### Rule: Distinguish utility types in frontmatter

```yaml
utility-type: immediate|potential|deferred
potential-utility_scenarios:
  - scenario: "Future domain X"
    likelihood: low|medium|high
    timeframe: near|medium|long
potential-cost_of_missing: low|medium|high
capture_urgency: now|when_convenient|defer
```

### Rule: Apply different capture strategies by utility type

**Immediate utility**: Apply standard diminishing returns test
- Capture if passes utility + connection + uniqueness + effort

**Potential utility (option value)**: Apply modified test
- Capture if: high cost of missing OR (enables multiple future paths AND capture is cheap)
- Don't apply standard diminishing returns — different optimization target

**Deferred utility**: Don't capture yet, note the gap
- Create a "knowledge gap" note instead
- Document what would trigger capture when you reach that domain

### Rule: Track option value knowledge separately

**Why**: Option value knowledge requires different review cycles and may need re-evaluation as vault needs evolve.

**Test**: Can you identify option-value notes by their `utility-type: potential` frontmatter? Are they organized in a way that enables periodic re-evaluation (at least quarterly)?

```
Option Value Knowledge/
  ├── Domain Adjacency/     # Neighboring fields you might enter
  ├── Capability Building/  # Skills that expand what you can do
  ├── Rare-but-Critical/  # Low-frequency, high-impact scenarios
  └── Niche Technical/     # Specific knowledge for edge cases
```

### Modified Diminishing Returns Test for Option Value

Instead of:
> Skip if fails 2+ of: utility, connection, uniqueness, effort

Use for potential utility:
> Capture if: (cost_of_missing = high) OR ((future_paths >= 2) AND (capture_cost = low))

This preserves option value knowledge while avoiding capturing everything.

## Test Case: Building a Programming Knowledge Base

An AI building a programming vault with current Seed rules would:
- ✓ Capture immediately useful patterns (error handling, testing)
- ✓ Apply diminishing returns to avoid duplicate tutorials
- ✗ Systematically skip "obscure language features" that aren't currently used
- ✗ Ignore framework-adjacent knowledge (DevOps, databases) until needed
- ✗ Miss rare debugging scenarios until encountering them

With option value rules:
- Capture "obscure language features" as potential utility with likelihood标注
- Note DevOps as domain adjacency gap, capture basics now, details when needed
- Track rare-but-critical error scenarios separately
- Create option value hub to periodically review potential utility knowledge

## Option Value Assessment Heuristics

### High Option Value Indicators
- [ ] Enables capability you don't have but might want
- [ ] Source is ephemeral (one-time talk, closing business, dying expert)
- [ ] Knowledge is foundational for multiple possible paths
- [ ] Captured knowledge transfers to multiple domains
- [ ] Cost of recreating later is high

### Low Option Value Indicators
- [ ] Highly specific to current context only
- [ ] Easy to find later when needed
- [ ] Stable information that won't change
- [ ] Captures would be redundant with easily-available resources
- [ ] No clear "future self" scenario where this matters

## Questions This Raises

1. How do you prevent option value capture from becoming unbounded?
2. How often should option value knowledge be re-evaluated?
3. Does option value change with vault maturity?
4. How do you distinguish genuine option value from "someday" fantasy?

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core rules
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]] — Current utility test
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — Gap identification
- [[Frontier Exploration - Building Knowledge Bases in Unfamiliar Domains]] — Unknown domain bootstrapping

---

*This Frontier Exploration was identified during a vault heartbeat using FRONTIER_EXPLORATION on 2026-03-23.*
