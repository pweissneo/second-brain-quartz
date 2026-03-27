---
last-reviewed: 2026-03-26
lifecycle: deprecated
confidence: high
author-type: ai-assisted
tags:
  - seed-gap
  - anti-pattern
  - positive-knowledge
  - structural-asymmetry
  - deprecated
schema-version: "1.0"
gap-status: resolved
gap-resolution: 2026-03-26
gap-resolution-note: Created 8 Best Practice notes - one for each anti-pattern. Updated Best Practices Hub with links to all 8. This note is now deprecated as the gap has been fully addressed.
deprecated-date: 2026-03-26
deprecated-reason: superseded
replaced-by: [[Best Practices Hub]]
---

# Seed Gap: Anti-Patterns Without Corresponding Best Practices

> ⚠️ **DEPRECATED**: This gap has been resolved. The corresponding best practices have been created and are linked from [[Best Practice Hub]]. This note is preserved for historical context.

## The Gap

The vault has 8 anti-pattern notes documenting what NOT to do in knowledge management:
- Anti-Pattern - Link Inflation
- Anti-Pattern - Missing Negative Knowledge
- Anti-Pattern - Neglecting Maintenance
- Anti-Pattern - Note Hoarding
- Anti-Pattern - Over-Organization
- Anti-Pattern - Perfectionism
- Anti-Pattern - Single-Source Dependency
- Anti-Pattern - Tool Overfocus

Plus a hub note "Anti-Patterns in Knowledge Management" that links to all of them.

**However, there are no "Best Practices" or "Recommended Practices" notes to document what TO do.** The Anti-Pattern - Missing Negative Knowledge note explicitly states: "For every dedicated negative knowledge note, there should be a corresponding positive note showing the right approach." But this balance is not implemented in the vault.

## Where AI Gets Stuck

When building a knowledge base following this vault's example:
1. AI sees anti-patterns documented (what to avoid)
2. AI looks for corresponding best practices (what to do)
3. AI finds none — no "Best Practice - Link Quality" or "Recommended Practice - Organization"
4. The vault creates an imbalanced model: readers know what to avoid but not what to pursue

This violates the explicit balance rule stated in the Anti-Patterns hub note.

## What the Seed Is Missing

The Seed includes rules for:
- Anti-patterns (what to avoid)
- Negative knowledge capture
- Quality over quantity in linking

But it doesn't include:
- Explicit anti-pattern-to-best-practice pairing requirements
- Structural templates for "Recommended Practices" notes
- Test criteria for positive/negative balance in the vault

## Proposed Seed Extension

**Rule:** For every dedicated anti-pattern note, there should be a corresponding "Best Practice" or "Recommended Practice" note showing the correct approach.

**Why:** Anti-patterns alone create an incomplete mental model. Users know what to avoid but not what to pursue. The balance rule in the Anti-Patterns hub is explicit but not enforced.

**Test:** Can you find a best practice note for each anti-pattern? Is there a hub note linking both positive and negative patterns?

**Implementation:**
```yaml
# For anti-pattern notes
paired-with: [[Best Practice - Corresponding Topic]]

# For best practice notes
counterpart-antipattern: [[Anti-Pattern - Corresponding Topic]]
```

## Example Pairs (Resolved)

| Anti-Pattern | Best Practice | Status |
|--------------|---------------|--------|
| Anti-Pattern - Link Inflation | Best Practice - Link Quality | ✅ |
| Anti-Pattern - Note Hoarding | Best Practice - Selective Capture | ✅ (merged) |
| Anti-Pattern - Over-Organization | Best Practice - Minimal Organization | ✅ |
| Anti-Pattern - Neglecting Maintenance | Best Practice - Regular Review | ✅ |

## Related Notes

- [[Anti-Patterns in Knowledge Management]] — States the balance rule but doesn't enforce it
- [[Anti-Pattern - Missing Negative Knowledge]] — Discusses negative knowledge without positive counterpart
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules (gap: no positive/negative pairing requirement)