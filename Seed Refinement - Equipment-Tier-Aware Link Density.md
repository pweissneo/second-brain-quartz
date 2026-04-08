---
last-reviewed: 2026-04-07
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-refinement
  - link-density
  - equipment-tier
  - domain-specific
resolution-status: proposed
---

# Seed Refinement: Equipment-Tier-Aware Link Density

## Overview

The Seed's note-type-aware link density rule (line 2319) addresses different link expectations for different note types. However, stress testing against woodworking domain revealed a gap: **equipment-dependent knowledge** has fundamentally different connectivity patterns than general domain knowledge.

## Gap Identified

### Equipment-Tier Knowledge Connectivity

**Scenario:** A note about "Table Saw Resaw Technique" naturally links to:
- Table Saw (equipment note)
- Resawing (technique)

That's 2 links — barely meets threshold. But for a **hand-tool-only woodworker**, this note is essentially disconnected from their knowledge graph. The links exist structurally but don't create usable paths for all equipment tiers.

**Current Seed gap:** The note-type-aware rule addresses content function (exploratory, safety, foundational, filter) but doesn't address **applicability context** — whether a note's knowledge is usable across different user equipment tiers.

## Proposed Seed Rule Addition

### Rule: Apply Equipment-Tier Awareness to Link Density

**Rule:** For knowledge in craft and skill-based domains where technique applicability depends on equipment access, ensure that equipment-specific notes either:
1. Link to a generic principle note usable across all equipment tiers, OR
2. Include frontmatter indicating `equipment-tier:` scope

**Why:** Equipment-dependent knowledge has different connectivity needs than general knowledge. A technique note that only links to specific equipment notes is structurally valid but practically isolated for users with different equipment. The link density rule measures structural health, not practical accessibility across user contexts.

**Test:** (1) For craft/skill notes about equipment-dependent techniques: Do they link to generic principle notes accessible regardless of equipment tier? (2) Is `equipment-tier:` frontmatter present when no generic principle exists? (3) Can a user with minimal equipment navigate from equipment-specific notes to concepts they can actually apply?

**Implementation:**
```yaml
equipment-tier: professional|home-workshop|hand-tools-only|universal
```

**Example:**
- Good: "Cutting Dovetails" links to [[Hand Tool Dovetail Technique]] (hand-tools-only) AND [[Mechanical Dovetail Method]] (equipment-specific)
- Acceptable: "Table Saw Dovetail Jig" has `equipment-tier: professional` and links to [[Jig Setup Guide]]
- Problem: "Dovetail Layout" with 2 links to specific jigs but no generic principle

**Domain applicability:** Woodworking, metalworking, pottery, photography, audio engineering, any domain where tool selection affects technique feasibility.

---

*Refinement generated during: SEED_STRESS_TEST heartbeat (2026-04-07)*