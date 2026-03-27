---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - review-cycle
  - knowledge-aging
  - deprecation
---

# Frontier Exploration - Knowledge Aging and Review Cycle Management

> When should knowledge be reviewed, refreshed, or deprecated? How do you manage knowledge lifecycle beyond simple "last-reviewed" timestamps?

## The Problem

The Seed covers verification (checking if knowledge is correct) and correction (handling wrong knowledge), but lacks explicit guidance on:

1. **How often should different types of knowledge be reviewed?** — A recipe from 2020 might still be valid; a tech note from 2020 almost certainly isn't
2. **What triggers a review cycle?** — Time-based? Usage-based? Evidence-based?
3. **How do you distinguish knowledge that has "aged well" from knowledge that has "aged out"?**
4. **What's the deprecation pathway?** — When knowledge is retired, what happens to it?

## Existing Coverage

The Seed touches on related concepts:
- Verification ratio tracking (50% of new captures verified within 30 days)
- Verification ceiling (pause exploration when >40% unverified)
- Correction workflow (marking incorrect/outdated knowledge)
- Expiration intervals (some knowledge expires faster)
- Version-upgrade paths (documenting transitions)

What's missing: **explicit knowledge aging management and review cycle design**

## Gap Analysis

### What's NOT Covered

1. **Review frequency by knowledge type** — Technical knowledge may need quarterly review; foundational principles may need annual review; historical knowledge may never need review

2. **Usage-triggered review** — Knowledge that's frequently accessed but rarely verified may indicate stale content

3. **Aging indicators** — What signs suggest knowledge has aged beyond its validity?
   - Broken links to external sources
   - Version information that's outdated
   - Confidence markers that don't match current understanding

4. **Graceful deprecation** — When knowledge is retired:
   - Archive vs. delete decision
   - Preservation of "why this was wrong" context
   - Cross-references to corrected/updated versions

5. **Review automation** — Can the vault suggest what needs review, or is it purely manual?

## Potential Seed Rule

```
Rule: Design explicit knowledge review cycle based on knowledge type and volatility — 
document review frequency, trigger conditions, and deprecation pathway.
Why: Without review cycle design, verification happens ad-hoc, leading to either 
over-verification (wasted effort) or under-verification (stale content). Knowledge 
ages at different rates; review cycles should match.
Test: Can you categorize knowledge by review frequency? Do high-velocity knowledge 
types have shorter cycles than stable knowledge? Is there a clear deprecation pathway 
for retired knowledge?
```

## Implementation Sketch

```yaml
# Knowledge lifecycle fields
review-cycle: quarterly|annual|biannual|as-needed
last-reviewed: 2026-03-24
next-review: 2026-06-24
review-trigger: time-based|usage-based|evidence-based
aging-indicator: stable|aging|stale|deprecated

# Deprecation pathway
knowledge-status: active|maintained|deprecated|archived
deprecation-date: 2026-03-24
superseded-by: [[New Note]]
reason-deprecated: "Version升级|incorrect|source-lost|merged"
```

## Test Scenario

**Domain:** Programming knowledge

**Current Seed approach:**
- Track verification-status
- Mark corrections with metadata
- Version-scoped knowledge has expiry

**What's missing:**
- When should a "how to use React Hooks" note be reviewed? (Answer: when React version changes)
- When should "how to write a for loop" be reviewed? (Answer: almost never — fundamentals rarely change)
- What's the review frequency for design patterns? (Answer: less frequent than API knowledge)
- How do you track that knowledge has "aged well" vs. needs updating?

## Questions to Resolve

1. Should review cycles be:
   - Fixed by knowledge type (all tech notes = quarterly)?
   - Dynamic based on external changes (detect version updates)?
   - Usage-informed (frequently accessed but never verified = priority)?

2. What's the deprecation-to-archive pathway?
   - Keep all deprecated knowledge with clear markers?
   - Archive to separate folder?
   - Delete after X days?

3. Should "aging well" be a signal?
   - Knowledge that's been correct for 2+ years with no changes might be "stable" 
   - Does stable knowledge need less frequent review?

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] - verification rules
- [[Frontier Exploration - Knowledge Deprecation and Obsolescence Management]]
- [[Seed Stress Test - Error Knowledge Capture in Programming]]
- [[Frontier Exploration - When a Note Has Become Obsolete]]

## Next Steps

This frontier needs:
1. Testing review cycle approaches across domains (tech vs. cooking vs. philosophy)
2. Determining trigger-based vs. time-based review
3. Establishing deprecation best practices
