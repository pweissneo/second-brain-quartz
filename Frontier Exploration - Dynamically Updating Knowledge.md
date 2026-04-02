---
last-reviewed: 2026-03-31
last-updated: 2026-03-28
confidence: medium
lifecycle: experimental
author-type: ai-assisted
---

# Frontier Exploration - Dynamically Updating Knowledge

## The Problem

The Seed has rules for capturing knowledge and verifying it, but there's a gap: **knowledge that requires ongoing updates** rather than one-time verification.

### Examples of Dynamically Updating Knowledge

- **Software dependencies** — libraries that receive security patches
- **Regulatory requirements** — laws that change
- **Financial benchmarks** — interest rates, inflation figures
- **Best practice guidelines** — medical recommendations that evolve
- **Version numbers** — software versions, tool versions
- **Geographic data** — maps, travel advisories
- **Statistical data** — population figures, economic indicators

### Why This Is Different From Temporal Knowledge

The Seed covers [[Handling Temporal Knowledge]] (knowledge about time-bound events and dates). But there's a separate category: **knowledge that changes over time** and requires periodic updates, not just temporal awareness.

The difference:
- **Temporal knowledge** — "On March 15th, 2024, the temperature was 72°F"
- **Dynamically updating knowledge** — "Current Python version is 3.12.5" (will be wrong next month)

### Where the Current Seed Falls Short

1. **Verification assumes static knowledge** — The Seed's verification rules assume knowledge, once verified, remains valid. But some knowledge invalidates itself over time.

2. **No update cadence guidance** — The Seed doesn't tell you how often to check if knowledge is still current.

3. **No "staleness" indicators** — There's no frontmatter field to mark when knowledge was last confirmed current vs. last verified as historically accurate.

4. **Capture vs. maintenance confusion** — For dynamic knowledge, the cost is ongoing maintenance, not just initial capture. The capture-to-verify ratio doesn't capture this.

## Proposed Framework

### Categorize Knowledge by Update Pattern

| Type | Example | Update Pattern |
|------|---------|----------------|
| Static | Historical facts, recipes | Verify once |
| Temporal | Event dates, schedules | Time-based retrieval |
| Dynamic | Version numbers, rates | Ongoing refresh |
| Cyclical | Seasonal information | Periodic check |

### Frontmatter Extensions

```yaml
update-pattern: static|temporal|dynamic|cyclical
last-confirmed-current: 2026-03-15  # for dynamic knowledge
update-cadence: weekly|monthly|quarterly|yearly  # for dynamic knowledge
stale-if-unchecked-days: 90  # trigger for review
```

### Rules to Add

**Rule:** For dynamically updating knowledge, establish an explicit update cadence based on the knowledge's volatility.
**Why:** Without cadence, dynamic knowledge silently becomes stale. A quarterly update for software versions makes sense; daily for interest rates; yearly for demographic data.
**Test:** Can you categorize dynamic knowledge by update cadence? Is there a schedule for checking each category?

**Rule:** Mark dynamically updating knowledge with `last-confirmed-current` date, not just `last-reviewed`.
**Why:** `last-reviewed` means "I checked this and it's still valid." `last-confirmed-current` means "This value was current as of this date." The distinction matters for knowledge that changes.
**Test:** Do you distinguish between "verified as historically accurate" and "confirmed as currently accurate"?

**Rule:** For dynamic knowledge, evaluate maintenance burden before capture — calculate ongoing cost, not just initial cost.
**Why:** Capturing a software version seems cheap, but if you capture 50 software versions, that's 50 ongoing maintenance items. Capture decisions should factor in lifecycle cost.
**Test:** Do you track maintenance burden for dynamic knowledge? Do you capture less dynamic knowledge when maintenance cost is high?

**Rule:** Prune stale dynamic knowledge when update burden exceeds utility — delete rather than maintain.
**Why:** Some dynamic knowledge becomes low-value over time (old software versions, deprecated tools). Rather than maintain indefinitely, prune and keep only what's actively useful.
**Test:** Can you identify dynamic knowledge that's no longer useful? Do you have a process to delete it rather than update forever?

## Test Case: Building a Software Knowledge Base

Imagine building a knowledge base for programming. Using current Seed rules:

1. ✓ You capture Python best practices
2. ✓ You verify them against documentation
3. ✗ You capture "Python 3.12.5 is current" — but didn't plan for updates
4. ✗ You capture "Use pip for packages" — without noting it's now legacy
5. ✗ You capture "Black formats code" — without tracking version updates

Result: The vault accumulates stale dynamic knowledge that creates maintenance debt.

With dynamic knowledge rules:

1. ✓ Capture static knowledge (principles, patterns)
2. ✓ Capture dynamic knowledge with update cadence (versions, tools)
3. ✓ Mark dynamic items with `last-confirmed-current`
4. ✓ Include update reminders in frontmatter
5. ✓ Prune old versions when new ones replace them

Result: Dynamic knowledge is manageable, not a maintenance burden.

## Related Notes

- [[Handling Temporal Knowledge]] — time-bound knowledge
- [[Frontier Exploration - Real-Time API-Dependent Knowledge]] — live data integration
- [[Frontier Exploration - Knowledge-Aware Review Cycles]] — review cycles
- [[Seed Stress Test - Version-Upgrade Path Knowledge]] — version tracking in specific domains