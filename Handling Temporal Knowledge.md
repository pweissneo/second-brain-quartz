---
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
tags:
  - seed-extension
  - temporal
  - time-sensitive
---

# Handling Temporal and Outdated Knowledge

Knowledge that changes over time requires different treatment than static knowledge. This note covers both proactive handling of temporal knowledge and reactive handling of outdated information.

## The Problem

### Temporal Knowledge
Some knowledge is inherently time-bound:
- Current events and news
- Market data (stock prices, crypto rates)
- Weather forecasts
- Sports scores and standings
- Technology versions and releases
- Population statistics

The Seed's normal rules assume knowledge is relatively static. But temporal knowledge needs special handling.

### Outdated Information
Notes become outdated over time:
- Technology changes
- Understanding evolves
- Facts become incorrect
- Links break

---

## Part 1: Proactive Temporal Knowledge Handling

### Strategy 1: Separate Static from Dynamic

Create distinct note types:
- **Static notes**: Concepts, principles, methods (normal notes)
- **Dynamic notes**: Time-sensitive data (with clear expiration)

```
Tesla Stock Analysis.md     ← Static: analysis methods, factors
Tesla Price Data.md         ← Dynamic: current price (with date)
```

### Strategy 2: Use Point-in-Time References

Instead of embedding the value:
```markdown
# Tesla Stock Price

As of [[date:2026-03-09]], TSLA was trading at $XXX.

See [[Stock Price API]] for current data.
```

### Strategy 3: Link to Live Sources

For rapidly changing data, don't capture — link:
```markdown
# Current Market Data

- S&P 500: [TradingView](https://tradingview.com/spx)
- Bitcoin: [CoinGecko](https://coingecko.com)
```

### Strategy 4: Temporal Metadata

Add frontmatter for time-sensitive notes:
```yaml
---
temporal: true
valid-from: 2026-03-09
valid-until: 2026-03-10
refresh-frequency: daily
---
```

### Strategy 5: Archive Strategy

For historical tracking:
- Create dated snapshots periodically
- Link to archive rather than live source
- Note: "As of Q1 2026, the data showed..."

### Domain Examples

| Domain | Static Notes | Dynamic Notes |
|--------|-------------|---------------|
| Weather | [[Weather Patterns]], [[Climate Zones]] | "Today's forecast" → link to service |
| Technology | [[Python Programming]], [[React Framework]] | "Python 3.14 Release Notes" (with date) |
| Finance | [[Investment Strategies]], [[Risk Management]] | "Current Interest Rates" → link to Fed |
| News | [[Political Systems]], [[Economic Theories]] | "2026 Election Results" → archive link |

---

## Part 2: Reactive Outdated Information Handling

### Strategy 6: Version Tracking

Add metadata to track changes:

```yaml
---
created: 2025-01-15
modified: 2026-03-09
status: [current|needs-update|deprecated]
---
```

### Strategy 7: Deprecation Markers

For outdated notes:

```markdown
# Deprecated: [Old Concept]

> **Status:** This concept has been superseded by [[Note Types]]

**Reason:** [Brief explanation]
**Date:** 2026-03-07
```

### Strategy 8: Evergreen Updates

Per [[Note Lifecycle Management]], iterate on notes rather than abandoning:
- Update instead of creating new
- Keep historical context
- Link to updated versions

### Strategy 9: Regular Review Schedule

Per [[Graph Maintenance]]:
- Quarterly review of old notes
- Check for broken links
- Verify accuracy

### Red Flags for Outdated Content

- Notes with old dates
- Contradictions between notes
- Broken [[Wikilinks]]
- Outdated tool recommendations

---

## The Test

For any note containing time-specific data:

1. **Will this be wrong in 1 month? 1 year?**
2. **Is there a source URL that provides updated values?**
3. **Should this be a link instead of embedded data?**
4. **Has this note been reviewed in the last 90 days?**

If yes to 1-2 and no to 3 → Refactor to separate static from dynamic.
If no to 4 → Add to review queue.

---

## Best Practices Summary

1. **Date everything** - Frontmatter with created/modified
2. **Version your ideas** - Don't delete, deprecate
3. **Review regularly** - [[Self-Improvement Cycle]]
4. **Trust but verify** - Don't assume notes are correct
5. **Separate static from dynamic** - Link to live sources for rapidly changing data
6. **Use temporal metadata** - Mark time-sensitive notes with valid-from/valid-until

---

## Relationship to Seed Rule

The Seed includes this rule:

> **Rule:** Separate time-sensitive data from static knowledge — link to live sources for rapidly changing information, use point-in-time references with dates for moderately temporal knowledge.

This note provides comprehensive implementation guidance, covering both:
- **Proactive handling**: Strategies 1-5 for temporal knowledge
- **Reactive handling**: Strategies 6-9 for outdated information

---

## Related
- [[Note Types]]
- [[Note Lifecycle Management]]
- [[Metadata and Tagging]]
- [[Trust and Verify]]
- [[Graph Maintenance]]
- [[AI-Assisted Knowledge Management Seed]]
