---
last-reviewed: 2026-04-04
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: verified
tags:
  - structural-health
  - health-check
---

# Structural Health Check - 2026-04-04

> Automated structural analysis finding: vault has adoption gaps for new Seed rules.

## Findings

### 1. Access Pattern Tag Adoption: LOW (17/500+ = ~3%)

Only 17 notes have `access-pattern:` frontmatter, despite this being a Seed rule since 2026-04-03.

**Affected notes with access-pattern:**
- AI-Assisted Knowledge Management Seed.md
- Advanced Pattern Matching.md
- Best Practice - Minimal Organization.md
- Forward References and Planned Knowledge.md
- Multiple Frontier Exploration notes

**Impact:** Notes cannot be filtered by use-case (lookup/learning/decision/inspiration), reducing vault utility for different access patterns.

### 2. Low Outgoing Links: MULTIPLE NOTES

Notes with only 2-3 outgoing wikilinks (below recommended minimum):

```
2 links: CLAUDE.md, Seed Gap notes, Seed Refinement notes
3 links: Best Practices notes, Frontier Exploration notes
```

**Impact:** Knowledge is not well-connected, reducing graph traversal effectiveness.

### 3. Apparent Orphan Risk: ENTIRE VAULT (FALSE POSITIVE)

**Finding:** All notes show 0 incoming links in simple grep scan.

**Analysis:** This is a false positive. The grep was looking for `[[filename]]` but many links use descriptive text like `[[Linking Principle]]` instead of `[[Linking Principle.md]]`. 

**Verification:** Confirmed `_root.md` is linked from 20+ notes.

**Status:** OK — no action needed, but health check methodology needs refinement.

## Recommendations

1. **Access Pattern Migration:** Prioritize adding access-pattern tags to hub notes (Best Practices Hub, Seed Development Hub, Frontier Exploration Hub) and high-traffic reference notes

2. **Link Density Audit:** Review Seed Refinement and Seed Gap notes for potential link enrichment — many are structural/meta notes that should link to foundational content

3. **Methodology Improvement:** Update health check scripts to handle both `[[Note Name]]` and `[[Note Name.md]]` link formats

## Test Criteria

- [ ] Access-pattern adoption >50% for hub notes
- [ ] All Seed Refinement notes have ≥3 outgoing links
- [ ] Health check script handles both link formats

## Related

- [[AI-Assisted Knowledge Management Seed]] — Foundation rules
- [[Structural Health Check - 2026-04-03]] — Previous check
- [[Seed Gap - Access-Pattern-Aware Knowledge Organization]] — Gap now addressed