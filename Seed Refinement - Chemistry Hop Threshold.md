---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-06
lifecycle: evergreen
confidence: high
tags:
  - seed-refinement
  - chemistry-domain
  - hop-rule
---

# Seed Refinement: Chemistry Hop Threshold

**Rule (ADD to 3-hop rule section):** Allow hop depth up to 4 for chemistry and other natural-hierarchy domains.

**Why:** Chemistry's natural hierarchical organization (element → compound → reaction → condition) legitimately exceeds 3 hops. The periodic table → functional groups → specific reactions chain produces 4-5 hops naturally. Applying strict 3-hop rule would either force artificial hub creation (adding noise) or incorrectly flag valid notes as orphans.

**Test:** For chemistry vaults: Do chains from root to specific concepts exceed 3 hops? If yes, is the path through natural domain taxonomy (not artificial hubs)? If both yes, the domain legitimately needs 4 hops.

**Domain applicability:** This relaxation applies to any domain with inherent hierarchical taxonomy:
- Chemistry: elements → compounds → reactions → conditions
- Biology: kingdom → phylum → class → order → family → genus → species
- Legal: jurisdiction → area → topic → specific-case
- Medical: system → condition → treatment → variant

**See also:**
- [[Seed Stress Test - Chemistry Knowledge Base]] (documents the gap)
- [[Seed Stress Test - Biology Knowledge Base]] (likely similar)
- [[Seed Stress Test - Legal Knowledge Bases]] (likely similar)