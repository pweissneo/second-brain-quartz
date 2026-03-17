---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
lifecycle: active
confidence: emerging
author-type: ai-assisted
status: draft
review-by: 2026-03-24
tags:
  - frontier-exploration
  - obsolescence
  - knowledge-lifecycle
  - external-dependencies
---

# Frontier Exploration - Knowledge Obsolescence by External Extinction

> How to handle knowledge about things that no longer exist — discontinued products, deprecated services, ended relationships, dissolved organizations.

## The Problem

Standard obsolescence rules handle knowledge that was once true but is now false:
- "Company X was acquired" (fact changed)
- "Software version 2.0 is current" (version superseded)  
- "This law applies in 2024" (temporal validity expired)

But there's a different obsolescence type: **external extinction** — when the thing the knowledge describes literally no longer exists. The knowledge isn't wrong; it's about something gone.

## Examples of External Extinction

### Product Discontinuation
- Knowledge about a discontinued camera model
- Notes on a discontinued software product
- Reviews of out-of-print books

### Service Shutdown
- Knowledge about a defunct API
- Notes on discontinued services (e.g., Google Reader)
- Procedures for platforms that shut down

### Relationship Dissolution
- Knowledge about former employers
- Notes on ex-partners (personal vaults)
- Historical organizational knowledge

### Organizational Death
- Knowledge about dissolved companies
- Notes on defunct institutions
- Historical entities that no longer exist

### Biological/Physical Extinction
- Knowledge about extinct species
- Notes on destroyed landmarks
- Locations that no longer exist (razed buildings, flooded towns)

## Why Standard Rules Fail

The Seed's obsolescence rules assume:
1. Knowledge can be refreshed (source still exists)
2. The thing described still exists (can re-verify)
3. Updates are possible (can get new information)

External extinction breaks all three assumptions:
- The product is discontinued — no new information possible
- The service is shut down — can't re-verify functionality
- The entity is dissolved — no one to ask

## The Core Challenge

**When something no longer exists, the knowledge becomes historical by default, but the Seed doesn't have a clear category for "extinct knowledge" vs. "obsolete knowledge" vs. "current knowledge."**

## Existing Seed Coverage

The Seed covers:
- Time-stale (needs review)
- Reality-obsolete (facts changed)
- Context-shift (your situation changed)

Missing:
- **Entity-extinct** (the thing described no longer exists)

## Proposed Handling

### Tagging Strategy

```yaml
extinction-type: product|service|relationship|organization|location
extinction-date: YYYY-MM-DD
extinction-source: how confirmed ( discontinuation-notice | shutdown-announcement | verified-absence )
historical-status: archived|reference-only|deprecated
```

### Decision Framework

For each note about an external entity, ask:

1. **Does the entity still exist?** 
   - Yes → Apply standard rules (review, update, verify)
   - No → Continue to 2

2. **Is knowledge about it still valuable?**
   - Yes → Mark as historical, preserve
   - No → Deprecate or delete

3. **Is the knowledge reproducible?**
   - Yes → Could recreate later if needed
   - No → Must preserve (unique information)

### Disposition Options

1. **Archive** — Keep as historical record with appropriate tagging
   - Use for: discontinued products you might re-buy, past employment
   
2. **Reference-only** — Mark as historical, reduce priority
   - Use for: defunct services, dissolved organizations
   
3. **Deprecate** — Keep link but mark as superseded
   - Use for: replaced products, migrated services
   
4. **Delete** — Remove when no future value
   - Use for: temporary accounts, short-lived events

## The Verification Problem

How do you CONFIRM something is extinct?

- **Product discontinuation**: Check manufacturer website, press releases, archive.org
- **Service shutdown**: Check status pages, news articles, social media announcements  
- **Relationship dissolution**: Personal knowledge (mark with confidence level)
- **Organizational death**: Business registries, news archives

## Proposed Seed Rules (Draft)

### Rule: External Extinction Detection

**Rule:** For knowledge about external entities (products, services, organizations), periodically verify the entity still exists before marking as stale.

**Why:** Knowledge about non-existent things is different from stale knowledge — it's not wrong, but it's no longer actionable. Detection requires different verification than fact-checking.

**Test:** Can you confirm each entity your knowledge references still exists? For entities that no longer exist, is knowledge appropriately tagged as historical?

### Rule: Extinction-Type Tagging

**Rule:** Tag knowledge about extinct entities with extinction-type, extinction-date, and historical-status.

**Why:** Different extinction types have different future value:
- Product discontinuation → could be relevant if product resurfaces
- Service shutdown → usually permanently dead
- Relationship dissolution → personal relevance only
- Organizational death → historical interest only

**Test:** For notes about external entities, can you categorize the entity's existence status?

### Rule: Extinction Triggers Review

**Rule:** When external entities are confirmed extinct, review all knowledge about them within 30 days to determine disposition.

**Why:** Extinction creates a decision point — should this knowledge be preserved, archived, or deleted? Without time-bound review, extinct knowledge accumulates as "zombie" notes that appear current but are about nothing.

**Test:** Do you have a process for handling knowledge when its subject is confirmed extinct?

## Edge Cases

### Partial Extinction
- Product line discontinued but brand continues → keep brand knowledge
- Service shut down in one region but continues elsewhere → note jurisdiction

### Resurrection
- Discontinued products get reissued (Polaroid cameras, vinyl records)
- Extinct services relaunch (Threadly, Google Reader alternatives)
- Track resurrection potential for high-value knowledge

### Knowledge Was Wrong
- Distinguish "knowledge was always wrong" from "knowledge was correct but entity is now gone"
- Apply different handling: delete wrong knowledge, archive extinct knowledge

## Relationship to Other Rules

- **Verification Avoid**: For entities that no longer exist, verification is impossible. Use source analysis instead.
- **Regulatory Dating**: Extinct entities may have historical regulatory relevance
- **Place-Specific Knowledge**: Extinct places are a form of location extinction

## Status

This exploration is in draft. The rules above are preliminary and need testing across different extinction types.

## Related

- [[AI-Assisted Knowledge Management Seed]] — Obsolescence rules
- [[Frontier Exploration - Knowledge Obsolescence Detection]] — General obsolescence
- [[Frontier Exploration - Knowledge From Obsolescing Domains]] — Domains that are dying
- [[Stress Test - Verification Status Rule in Home Repair]] — Verification challenges
