---
last-reviewed: 2026-03-25
last-updated: 2026-03-25
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-freshness
  - temporal-knowledge
  - version-tracking
---

# Frontier Exploration: Knowledge Freshness Dating

> How should knowledge bases track temporal currency — ensuring knowledge is current rather than just verified?

## The Problem

The Seed covers **verification** (is this knowledge correct?) and **correction** (what do we do when it's wrong?), but lacks guidance on **freshness** (when was this last confirmed to be accurate?). In fast-moving domains, verified knowledge can still be outdated.

## Why This Matters

### Verified ≠ Current

A note can be:
- **Verified**: The facts are correct as stated
- **Outdated**: The facts were correct when written but no longer apply

Examples:
- "Python 3.8 is the latest version" — was verified, now outdated
- "Company X offers service Y" — verified, but company may have changed
- "Best practice Z" — was correct, now superseded

### The Gap in Current Seed Rules

| What Seed Covers | What's Missing |
|------------------|----------------|
| Source verification | When was source published? |
| Confidence scoring | Has context changed since verification? |
| Correction workflow | Is the knowledge still applicable? |
| Verification status | Is this current for today's context? |

## Proposed Seed Rules

### Rule: Track knowledge freshness separately from verification

**Why:** Verification confirms correctness; freshness confirms currency. A note can be verified (correct when checked) but stale (context has changed). Separate tracking prevents false confidence.

**Test:** For notes in fast-moving domains (tech, science, business): (1) Does frontmatter include `last-verified:` or `freshness-date:`? (2) Can you identify notes older than the domain's refresh cycle? (3) Is there a protocol for re-checking stale notes?

**Implementation:**
```yaml
last-verified: 2026-01-15  # When knowledge was confirmed accurate
freshness-window: 90d  # How long this remains "fresh" for this domain
freshness-status: fresh|stale|needs-review  # Auto-calculated based on window
```

### Rule: Define domain-specific freshness windows

**Why:** Knowledge in different domains ages at different rates. Software best practices may stale in months; mathematical proofs last centuries.

**Test:** For your vault's major domains: (1) Can you identify appropriate freshness windows? (2) Are windows documented in domain hub notes? (3) Do notes in fast-moving domains have shorter windows?

**Implementation:**
```yaml
# Domain freshness windows (recommended)
tech-software: 90d     # 3 months for software
science-medical: 180d  # 6 months for medical
math-foundation: 36500d  # ~100 years for foundational math
craft-technique: 3650d  # ~10 years for craft techniques
business-market: 30d  # 1 month for market conditions
```

### Rule: Prioritize stale knowledge refresh over new capture when verification ratio is healthy

**Why:** A vault full of verified-but-stale knowledge creates false confidence. When verification is caught up, refreshing stale notes should take priority over adding new content.

**Test:** (1) Can you identify notes marked stale? (2) Is there a stale-note refresh queue? (3) Does vault prioritize stale refresh when verification ratio >50%?

**Implementation:**
```yaml
# Auto-calculate freshness
freshness-status: >
  if (today - last-verified) > freshness_window:
    return "stale"
  elif (today - last-verified) > (freshness_window * 0.7):
    return "needs-review"
  else:
    return "fresh"
```

### Rule: Include temporal metadata for time-sensitive knowledge

**Why:** Some knowledge is explicitly time-bound (prices, versions, events). Without temporal markers, users can't distinguish current from historical knowledge.

**Test:** For knowledge with inherent time dependency: (1) Does frontmatter include `valid-from:` and `valid-until:`? (2) Can you identify which notes apply to current context vs. historical reference?

**Implementation:**
```yaml
valid-from: 2026-01-01
valid-until: 2026-12-31
temporal-scope: current  # current | historical | evergreen
```

## Edge Cases

### Evergreen Knowledge
Some knowledge doesn't stale — mathematical proofs, fundamental principles, classic techniques. Add:
```yaml
temporal-scope: evergreen  # Not subject to freshness windows
```

### Versioned Knowledge
For knowledge with explicit versions (software, specifications):
```yaml
version: "3.0"
version-valid-from: 2026-01-01
superseded-by: "[[Knowledge Name - v2]]"
```

### Historical Reference
Knowledge that's explicitly historical (no longer applicable):
```yaml
temporal-scope: historical
last-verified: 2020-06-15  # Was accurate for its time
historical-context: "Pre-2020 practice, superseded by..."
```

## Domain Examples

### Software Development
- **Fast stale**: Best practices, tool recommendations, framework versions
- **Slow stale**: Design principles, architectural patterns, algorithm explanations
- **Freshness window**: 90 days for practical guidance, multi-year for fundamentals

### Cooking
- **Fast stale**: Restaurant trends, ingredient availability, seasonal recipes
- **Slow stale**: Fundamental techniques, chemistry of cooking, equipment guides
- **Freshness window**: Seasonal for ingredients, multi-year for techniques

### Finance/Investing
- **Fast stale**: Market conditions, specific recommendations, product details
- **Slow stale**: Investment principles, risk frameworks, behavioral insights
- **Freshness window**: 30 days for market info, years for principles

### Medical/Scientific
- **Fast stale**: Treatment protocols, drug information, research findings
- **Slow stale**: Fundamental biology, anatomical knowledge, methodology
- **Freshness window**: 180 days for clinical guidance, decades for foundations

## Interaction with Existing Seed Rules

- **Verification status**: Freshness is orthogonal — a note can be verified but stale
- **Correction workflow**: Stale notes that are wrong should use correction workflow
- **Confidence**: Fresh notes can have lower confidence if evidence is new
- **Construction phase**: New vaults may defer freshness tracking until mature

## Test Cases

### Tech Startup Knowledge Base
- **Evidence**: Version numbers in notes, tool recommendations with dates
- **Solution**: 90-day freshness window for tool/tech notes, evergreen for principles

### Personal Recipe Collection
- **Evidence**: Recipes with seasonal ingredients, ingredient substitutions
- **Solution**: Mark seasonal recipes, annual review cycle for technique notes

### Academic Research Database
- **Evidence**: Citation dates, paper publication dates
- **Solution**: 1-year freshness window for papers, perpetual for theories

### News-Current Affairs Vault
- **Evidence**: Specific events, statistics, named entities
- **Solution**: Short windows (days/weeks), automatic archival after window

## Questions for Further Exploration

1. Should AI agents automatically update freshness dates during edits?
2. How do we handle knowledge where freshness is unknowable (historical events)?
3. Can freshness tracking be automated for versioned knowledge (software docs)?
4. Should freshness affect confidence scores?

## Conclusion

The Seed needs explicit guidance on knowledge freshness — not just verification (correct) or correction (fixed), but temporal currency (still applicable). Fast-moving domains particularly need freshness tracking to prevent misleading users with verified-but-outdated knowledge.

Adding freshness dating would:
1. Prevent false confidence in stale knowledge
2. Guide prioritization of refresh vs. new capture
3. Help users understand temporal applicability
4. Enable automated alerting for stale notes

---

**See also:**
- [[Types of Applicability Boundaries]]
- [[Frontier Exploration - Living Documents]]
- [[AI-Assisted Knowledge Management Seed]] (verification rules)
- [[Seed Gap - Knowledge Reorganization vs In-Place Updates]]
- [[_root]]
