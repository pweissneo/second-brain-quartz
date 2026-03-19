---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
confidence: emerging
knowledge-type: frontier-exploration
lifecycle: active
author-type: ai-assisted
review-by: 2026-03-25
tags:
  - frontier-exploration
  - obsolescence
  - knowledge-lifecycle
  - detection
---

# Frontier Exploration - Knowledge Obsolescence Detection

## The Problem

The Seed has rules for:
- **Staleness** — knowledge that was accurate but may now be outdated due to time passage (news, market data, software versions)
- **Confidence markers** — including `confidence: obsolete`
- **Deprecation** — marking notes as superseded with replacement pointers

But there's a gap: **how does an AI systematically DETECT when knowledge has become obsolete?** The Seed assumes obsolescence is knowable, but doesn't provide a method for identifying it.

## Why This Matters

Without obsolescence detection, an AI agent cannot:
1. **Distinguish stale from obsolete** — Is this knowledge simply old, or has the underlying reality changed?
2. **Identify context shifts** — Knowledge that was correct for a specific situation but is no longer applicable (job change, relationship status, tool migration)
3. **Know when to escalate** — What triggers human review vs. automated updates
4. **Measure obsolescence rate** — Track how quickly knowledge becomes unusable

## Obsolescence Triggers to Consider

### External Triggers (detectable)
- **Source changed** — The source document/article was updated
- **Version mismatch** — The tool/version the knowledge applies to has changed
- **Link rot** — External references are dead
- **Authority superseded** — Legal precedent changed, scientific consensus shifted

### Internal Triggers (inferred)
- **Contradiction detected** — New knowledge contradicts existing knowledge
- **Gap in applicability** — Knowledge assumes context that no longer exists
- **Negative evidence accumulation** — Multiple failed applications suggest the knowledge is wrong

### Context Shift Triggers (requires user input)
- **Situation changed** — Your context differs from what the note assumes (job, location, relationship)
- **Tool/technology changed** — You switched tools and the knowledge no longer applies
- **Goals changed** — Your objectives shifted and the knowledge is no longer relevant

---

## Special Case: External Extinction

**When the thing described no longer exists** — a specific type of obsolescence that requires different handling.

### Examples of External Extinction

- **Product Discontinuation** — Knowledge about a discontinued camera model, out-of-print book
- **Service Shutdown** — Knowledge about a defunct API, discontinued platforms
- **Relationship Dissolution** — Knowledge about former employers, ex-partners
- **Organizational Death** — Knowledge about dissolved companies, defunct institutions
- **Biological/Physical Extinction** — Knowledge about extinct species, destroyed landmarks

### Why Standard Rules Fail

Standard obsolescence assumes:
1. Knowledge can be refreshed (source still exists)
2. The thing described still exists (can re-verify)
3. Updates are possible (can get new information)

External extinction breaks all three — the product is discontinued, service is shut down, entity is dissolved.

### Proposed Tagging Strategy

```yaml
extinction-type: product|service|relationship|organization|location
extinction-date: YYYY-MM-DD
extinction-source: discontinuation-notice|shutdown-announcement|verified-absence
historical-status: archived|reference-only|deprecated
```

### Disposition Options

1. **Archive** — Keep as historical record (discontinued products you might re-buy, past employment)
2. **Reference-only** — Mark as historical, reduce priority (defunct services, dissolved orgs)
3. **Deprecate** — Keep link but mark superseded (replaced products, migrated services)
4. **Delete** — Remove when no future value (temporary accounts, short-lived events)

### Confirmation Methods

- Product discontinuation: Check manufacturer website, press releases, archive.org
- Service shutdown: Check status pages, news articles, social media
- Organizational death: Business registries, news archives

---

## Proposed Seed Rule

**Rule:** Implement obsolescence detection with explicit triggers — separate staleness (time-based) from obsolescence (reality-based) and context shift (user-based).

**Why:** Staleness is mechanical (time passed); obsolescence is semantic (reality changed); context shift is personal (your situation changed). Treating all three the same causes false positives (flagging accurate but old knowledge) and false negatives (missing genuinely obsolete knowledge).

**Test:** Can you categorize knowledge gaps as: (1) time-stale (review needed), (2) reality-obsolete (replace needed), (3) context-shift (user-specific)? Do you have detection methods for each?

## Questions for the Seed

1. Should obsolescence be a lifecycle stage separate from deprecation?
2. How do we distinguish "was never accurate" from "was accurate, now obsolete"?
3. What's the minimum evidence threshold for marking something obsolete vs. stale?

## Related Notes

- [[Confidence Markers]] — Existing confidence framework
- [[Note Lifecycle Management]] — Lifecycle stages
- [[Handling Temporal Knowledge]] — Time-based knowledge
- [[Frontier Exploration - Knowledge Debt]] — Tracking quality debt

**Note:** This note now incorporates content from the merged "Frontier Exploration - Knowledge Obsolescence by External Extinction.md" (2026-03-18).

---

*This is a frontier exploration note. The insights here may become Seed rules if they prove universally applicable through stress testing.*
