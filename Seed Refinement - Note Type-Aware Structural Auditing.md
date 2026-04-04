---
last-reviewed: 2026-04-04
lifecycle: seed-refinement-proposal
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - structural-health
  - note-classification
related-seed_rule: structural-health
---

# Seed Refinement: Note Type-Aware Structural Auditing

**Status:** Seed refinement proposal (pending integration)

## Rule Proposal

**Rule:** Distinguish note types when performing structural health audits — apply different link thresholds based on note category.

**Why:** The Seed's "every note must have 2+ outgoing links" rule treats all notes equally, but different note types have different link topologies by design. Gap documentation notes reference the Seed but aren't referenced back. Stress tests verify specific rules with narrow focus. Content notes are the core knowledge that SHOULD have dense connections. Applying uniform standards to wszystkie notes creates false positive violations and misdirects maintenance effort.

**Test:** During structural audit: (1) Can you categorize each low-link note by type (content|gap-documentation|stress-test|operational)? (2) Do content notes have >=2 links while gap docs may have 0-1? (3) Are operational notes (CLAUDE.md, HEARTBEAT.md, etc.) excluded from audit entirely?

## Note Type Taxonomy for Auditing

| Note Type | Expected Links | Examples | Audit Action |
|-----------|----------------|----------|--------------|
| Content | >=2 outgoing | Best practices, concepts, hub notes | Enforce link threshold |
| Gap Documentation | 0-1 outgoing | Seed Gaps, Frontier Explorations | Accept low links |
| Stress Test | 0-1 outgoing | Seed Stress Tests | Accept low links |
| Operational | N/A | CLAUDE.md, _root.md | Exclude from audit |

## Implementation

Use frontmatter to tag note type during creation:

```yaml
note-type: content  # content|gap-documentation|stress-test|operational
```

During structural audit, filter by note-type:
- `note-type: content` → enforce >=2 outgoing links
- `note-type: gap-documentation` → accept 0-1 links (expected)
- `note-type: stress-test` → accept 0-1 links (expected)
- `note-type: operational` → exclude from audit

## Application

When the structural audit finds low-link notes:
1. First categorize by note-type
2. Only content notes with <2 links are violations
3. Gap docs and stress tests with low links are working as designed
4. The audit should report: "X content notes below threshold, Y gap docs, Z stress tests"

## Benefits

- Reduces false positive violations in structural audits
- ProvidesClear action items (only fix content notes)
- Distinguishes "needs work" from "working as designed"
- Enables more accurate vault health metrics

## Edge Cases

- **Seed Refinements:** These are gap-documentation + proposed rule → categorize as gap-documentation
- **Hybrid notes:** If a note serves both purposes, default to content (stricter standard)
- **New notes:** Notes <7 days old may have low links temporarily → check age before flagging

## Related

- [[Structural Health Check - 2026-04-04]] (source of insight)
- [[Seed Rule - Vault Change Tracking]] (tracking note types)
- [[Graph Maintenance]] (vault health checks)