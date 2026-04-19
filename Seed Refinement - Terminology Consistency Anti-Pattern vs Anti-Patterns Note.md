---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-08
lifecycle: emerging
confidence: emerging
tags:
  - seed-gap
  - terminology
  - anti-patterns
gap-status: identified
gap-phase: analysis
gap-priority: medium
gap-severity: nice-to-have
gap-source: redundancy-scan
---

# Seed Refinement - Terminology Consistency Anti-Pattern vs Anti-Patterns Note

## Observed Redundancy

The vault contains:
1. **Anti-Patterns in Knowledge Management.md** — a hub note consolidating anti-pattern knowledge
2. **Seed Refinement - Anti-Pattern Merge Pattern.md** — a seed refinement about merging anti-patterns

These are distinct:
- Anti-Patterns in Knowledge Management = content note (what anti-patterns exist)
- Seed Refinement - Anti-Pattern Merge Pattern = process note (how to merge them)

However, the naming collision creates confusion about whether "Anti-Pattern" is a content category or a process category.

## Gap Analysis

The Seed uses "anti-pattern" terminology for both:
1. Knowledge anti-patterns (what not to do in a domain)
2. Process anti-patterns (what not to do in vault management)

The Seed Rule about anti-patterns assumes anti-patterns = content anti-patterns. Process anti-patterns (e.g., "note hoarding", "perfectionism delay") are handled differently.

## Proposed Rule Refinement

**Rule (REFINED):** Distinguish between content anti-patterns (negative knowledge within a knowledge domain) and process anti-patterns (negative patterns in vault management).

**Why:** Using the same term for both creates structural confusion. Content anti-patterns are captured as domain knowledge; process anti-patterns are meta-knowledge about vault operations. They require different handling, verification, and organization.

**Test:** 
1. Can you distinguish content anti-pattern notes from process anti-pattern notes by their frontmatter?
2. Are content anti-patterns organized by domain (linked to domain hubs)?
3. Are process anti-patterns organized by vault operation type (linked to vault management notes)?

**Implementation:**
```yaml
anti-pattern-type: content|process
# Content anti-patterns: knowledge about what doesn't work in a domain
# Process anti-patterns: meta-knowledge about vault operations
```

**Current vault status:**
- Content anti-patterns: consolidated in [[Anti-Patterns in Knowledge Management]] (protected hub)
- Process anti-patterns: documented in Seed Refinement notes

## Resolution

This is a terminology alignment issue, not a structural issue. The Seed rule should clarify that "anti-pattern" can refer to either content or process, and handle them consistently.

## Next Step

This gap should be analyzed for integration into the Seed - specifically updating the Anti-Patterns rule to clarify the distinction.

---
discovered: 2026-04-08
resolved: 2026-04-08
resolved-by: [[Seed Refinement - Terminology Consistency Anti-Pattern vs Anti-Patterns Note]] (this note)