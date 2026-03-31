---
last-reviewed: 2026-03-28
last-updated: 2026-03-28
lifecycle: historical
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - schema
  - lifecycle
redirect: "[[Schema]]"
---

# Seed Refinement: Lifecycle Field Extension (RESOLVED)

## Status: RESOLVED (2026-03-28)

This refinement has been **incorporated into Schema.md**.

## The Issue

The Schema.md defines standard lifecycle values:
- evergreen, transient, seed-extension, living, historical, perpetual-beta

But the vault uses additional values:
- `frontier-exploration` - for notes exploring new problem spaces
- `seed-gap` - for identified gaps in Seed rules
- `seed-refinement` - for Seed rule refinements

## Resolution

Updated Schema.md to include extended lifecycle values:
```
| `lifecycle` | evergreen, transient, seed-extension, living, historical, perpetual-beta, frontier-exploration, seed-gap, seed-refinement, abandoned | Note lifecycle stage |
```

## Test for Gap Closure

✅ 1. Does Schema.md include `frontier-exploration`? — **YES**
✅ 2. Does Schema.md include `seed-gap`? — **YES**
✅ 3. Does Schema.md include `seed-refinement`? — **YES**
✅ 4. Does Schema.md include `abandoned`? — **YES**

## Related Notes

- [[Schema]] — Updated with extended lifecycle values
- [[Seed Gap Note Lifecycle Management]] — Existing guidance for seed-gap notes
- [[Note Lifecycle Management]] — Core lifecycle model
- [[Confidence Markers]] — Confidence field usage in the vault

---

*Note discovered and resolved during:* FLUFF_DETECTOR (2026-03-28)