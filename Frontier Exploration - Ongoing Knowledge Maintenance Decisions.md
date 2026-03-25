---
last-reviewed: 2026-03-24
last-updated: 2026-03-24
author-type: ai-assisted
confidence: emerging
lifecycle: seed-extension
tags:
- frontier-exploration
- maintenance
- knowledge-evolution
---

# Frontier Exploration: Ongoing Knowledge Maintenance Decisions

## The Gap

The Seed covers:
- Handling incorrect/outdated knowledge (correction workflow)
- Deprecation and obsolescence
- Version-upgrade paths (moving from v1 to v2)
- Temporal knowledge (time-stamped facts)
- Expiring knowledge (becomes false after a date)

What's missing: **guidance for knowledge that changes SLOWLY and GRADUALLY**, requiring ongoing maintenance decisions rather than discrete updates.

## The Problem

Some knowledge doesn't have a "version" or "expiration date" - it evolves slowly:
- Best practices that shift as new research emerges
- Personal habits and routines that change over months/years  
- Tool preferences that develop through experience
- Understanding that deepens through repeated exposure

The Seed tells you WHEN knowledge is wrong, but not:
1. **When to UPDATE vs. create a NEW note** - How much change warrants a new note vs. editing the existing one?
2. **How to TRACK change history** - Should you maintain edit history? At what point does change = new knowledge?
3. **When to ARCHIVE vs. preserve** - Old knowledge that's still "correct" but no longer relevant
4. **Maintenance BURDEN assessment** - How to decide if maintaining this knowledge is worth it

## Examples

### Example 1: Personal Productivity System
Your note on "Morning Routine" has been updated 15 times over 2 years. The original version mentioned reading news, now it's meditation. Is this:
- One evolving note (same topic, changing content)?
- Multiple notes that should be split (v1, v2, v3)?
- An archive candidate (old routine no longer relevant)?

### Example 2: Best Practice Evolution  
A note on "Code Review Best Practices" captured in 2024 reflects then-current thinking. In 2026, some points still hold, others shifted. The note was "correct" at capture but now partially stale.

### Example 3: Tool Preference Drift
Your recommendation for "best text editor" evolved: Sublime → VS Code → Neovim. Each had valid reasons. Should this be one note that gets updated, or separate notes per era?

## Why This Matters

Without guidance:
- Notes become Frankenstein - too much change history makes them incoherent
- Or: over-splitting - v1, v2, v3 fragments knowledge that should evolve
- Maintenance burden is invisible until overwhelming
- Old knowledge lingers without being marked for review

## Initial Seed Rule Proposal

**Rule (DRAFT):** Apply different update strategies based on knowledge change pattern:

| Pattern | Strategy | Indicators |
|---------|----------|------------|
| Discrete version (software releases) | Version notes with upgrade paths | Clear v1→v2→v3 milestones |
| Slow evolution (best practices) | Edit in-place with changelog | Gradual drift, no clear version |
| Preference cycles (tools) | Archive old, create new | Complete replacement, different era |
| Deepening understanding | Single evolving note | Same topic, richer content |

**Rule (DRAFT):** Track change intensity using frontmatter:
```yaml
evolution-pattern: discrete|slow|cyclical|deepening
update-frequency: monthly|quarterly|annually|as-needed
last-substantial-change: 2026-01-15
change-count: 5  # number of substantial edits
```

**Test:** For notes updated 3+ times: (1) Can you identify the change pattern? (2) Does the note structure match the pattern? (3) Is there a clearer way to organize this knowledge?

## Domain-Specific Considerations

- **Rapid-change domains** (software): Discrete versioning, clear upgrade paths
- **Slow-change domains** (philosophy, theory): In-place editing with history markers
- **Personal knowledge**: Archive old preferences rather than maintaining history
- **Professional knowledge**: Track change rationale for future reference

## Related Notes

- [[Frontier Exploration - Version-Upgrade Path Knowledge]]
- [[Frontier Exploration - Knowledge Deprecation and Obsolescence Management]]
- [[Frontier Exploration - Knowledge Maintenance Burden]]
- [[Note Lifecycle Management]]

## Questions to Resolve

1. At what point does change = new note vs. edit?
2. Should change history be explicit (changelog) or implicit (git history)?
3. How do you balance coherence (evolving note) vs. traceability (versioned notes)?
4. When does maintenance burden exceed value?

---

*This is an emerging frontier. The rules above are starting points for testing.*
