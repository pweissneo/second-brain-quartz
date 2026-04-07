---
last-reviewed: 2026-03-21
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - vault-management
  - structural
level: frontier
schema-version: "1.0"
knowledge-type: conceptual
---

# Frontier Exploration: Vault Reset and Rebuild Decisions

> When does it make more sense to start fresh than to continue repairing an existing knowledge base?

## The Problem

The Seed covers:
- Construction phase (skeleton → flesh → muscle → maturity)
- Completion criteria for ending construction
- Knowledge debt tracking
- Vault splitting when exceeding 200 notes

What's missing: **guidance for the inverse scenario** — when a vault has degraded to the point where starting over would be faster than repairing.

## When Rebuilding Might Be Better

### Symptom 1: Structural Rot

- More than 30% of notes are orphaned or nearly-orphaned
- Hub-and-spoke structure has collapsed into random links
- Hop depth from root exceeds 5 for more than 20% of notes
- No clear purpose coherence remains

**Test:** Run `graph_isolated_nodes` and `graph_hubs`. If orphan rate >30% or if hubs have less than 3 connections each, structural rot is advanced.

### Symptom 2: Schema Collapse

- Multiple competing naming conventions with no dominant pattern
- Frontmatter fields proliferated beyond 10+ with no documentation
- Tags have exploded (100+ tags with no controlled vocabulary)
- No way to determine which schema version notes use

**Test:** Count unique naming patterns and frontmatter fields. If you can't identify a dominant convention, schema has collapsed.

### Symptom 3: Quality Debt Beyond Recovery

- Verification ratio below 20% for 6+ months
- Knowledge debt score >0.50 (critical)
- More than 50% of notes are stale (>90 days since review)
- Contradictory claims have accumulated without resolution

**Test:** Calculate knowledge debt score. If >0.50 and no progress on reduction for 6+ months, recovery timeline exceeds reasonable bounds.

### Symptom 4: Purpose Drift

- Original purpose stated in `_root.md` no longer matches actual content
- Vault has become a "dumping ground" for unrelated topics
- Multiple competing purposes have emerged without explicit separation
- Cross-vault links exceed 10% of total links

**Test:** Read `_root.md` and compare to actual content distribution. If mismatch >50%, purpose has drifted.

### Symptom 5: Technology Lock-In

- Vault depends on deprecated plugins with no migration path
- Custom scripts have become unmaintainable
- Data format has become obsolete
- Tool vendor has sunset the product

**Test:** Can the vault function with basic Markdown only? If not, technology dependency is critical.

## The Rebuild Decision Framework

### When to Rebuild

| Condition | Threshold | Recovery Effort |
|-----------|------------|-----------------|
| Structural rot | Orphan rate >30% | >20 hours |
| Schema collapse | No dominant pattern | >15 hours |
| Quality debt | Score >0.50 | >40 hours |
| Purpose drift | Mismatch >50% | >10 hours |
| Tech lock-in | Cannot export cleanly | Varies |

**Decision:** If total recovery effort >40 hours AND no improvement in last 90 days → consider rebuild.

### When NOT to Rebuild

- Vault is <50 notes (just refactor, don't rebuild)
- Problems are localizable to specific domains (split instead)
- Only 1-2 symptoms present (repair is faster)
- Recent improvement trend (continue current path)
- Vault contains unique data that cannot be recreated

### The Hybrid Approach

Instead of full rebuild, consider:
1. **Archive and start fresh** — Move old vault to /archive/, create new vault with Seed
2. **Selective migration** — Only import notes that pass quality thresholds
3. **Parallel vault** — Maintain old for reference, build new for current work

## Rebuild Protocol

If rebuild is chosen:

1. **Audit first** — Document what went wrong (this becomes meta-knowledge)
2. **Export有价值** — Extract notes worth preserving using quality filters
3. **Document conventions** — Write down what failed so new vault avoids it
4. **Seed-first** — Build new vault starting with Seed, add content incrementally
5. **Set completion criteria** — Define when new vault is "done enough"

## What This Teaches About Knowledge Bases

1. **Prevention > cure** — Regular maintenance prevents accumulated decay
2. **Purpose clarity matters** — Clear purpose prevents drift
3. **Schema enforcement** — Early schema decisions compound
4. **Quality over quantity** — A small clean vault beats a large messy one
5. **Failure is data** — A failed vault contains lessons for the next attempt

## Related

- [[Frontier Exploration - Vault Merging and Migration]]
- [[Frontier Exploration - Multi-Vault Architecture]]
- [[AI-Assisted Knowledge Management Seed]] (construction phase, knowledge debt)
- [[Graph Maintenance]]
- [[Schema]]

## Seed Rule Candidate

**Rule:** Track recovery effort vs. rebuild cost — when accumulated decay would take longer to repair than to rebuild, choose rebuild.

**Why:** Continuing to repair a severely degraded vault wastes effort that could build a healthier foundation. Without explicit comparison, AI agents default to repair (sunk cost fallacy).

**Test:** For each of the 5 symptom categories, estimate repair hours. Sum all 5. If total >40 hours AND no improvement in last 90 days → recommend rebuild discussion.
