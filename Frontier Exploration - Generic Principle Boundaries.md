---
last-reviewed: 2026-04-04
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-type: frontier-exploration
discovered: 2026-04-04
analysis-notes: "Exploring when principles become so generic they become useless. The Seed optimizes for atomic, specific knowledge but doesn't address how to handle knowledge that applies to everything."
tags:
  - frontier-exploration
  - generic-knowledge
  - principle-bounds
---

# Frontier Exploration - Generic Principle Boundaries

## The Problem

The Seed optimizes for specific, actionable knowledge. Atomic notes are better than sprawling ones. Link diversity matters. But there's an edge case the Seed doesn't address: **What happens when a principle is TOO general?**

### Examples of Too-Generic Knowledge

1. "Good knowledge bases have good notes" — technically true, useless
2. "Connect related ideas together" — valid Seed rule, not knowledge
3. "Useful information should be easy to find" — meta-knowledge, not domain knowledge
4. "Always verify claims before adding" — operational guideline, not content

These statements are:
- Always true
- Applicable to any domain
- Self-referential (about knowledge management itself)
- Not actionable without more specific guidance

### Why This Matters for AI Agents

When building a knowledge base from scratch, AI agents face pressure to create "foundational" notes. Without boundaries, they may create:
- Philosophy notes that explain what knowledge IS
- Epistemology notes about how to know things
- Meta-notes about the vault itself
- General principles that apply to every domain (and none)

These aren't inherently bad, but they risk:
1. **Vault bloat**: Generic notes that don't add specific value
2. **Circular reasoning**: Knowledge about knowledge management filling the vault
3. **Noise pollution**: Important specific knowledge buried in meta-content
4. **False depth**: Vault appears developed but lacks actionable content

## Current Seed Coverage

The Seed covers:
- **Atomicity**: Notes should be focused on one idea
- **Link diversity**: At least 2 outgoing links per note
- **Construction phase**: Relaxed standards during bootstrap
- **Hub creation**: When topics need organization

What's missing:
1. **Generic principle detection**: How to identify when knowledge is too general
2. **Usefulness threshold**: At what point does a principle become "useful" vs "obvious"
3. **Meta-knowledge boundary**: How much meta-knowledge belongs in the vault
4. **Domain specificity requirement**: When should principles be grounded in specific domains

## The Boundary Pattern

Generic principle risk increases when:

1. **Could apply to ANY domain** — if the principle works for cooking AND physics AND music without modification, it's probably too generic
2. **Doesn't suggest specific actions** — if the next step is "apply this principle" without guidance on HOW, it's probably too generic
3. **Replaces domain knowledge** — if understanding this note means you don't need domain-specific notes, it's probably meta (and probably useless)
4. **Equivalent to common sense** — if a human with no knowledge management background would find this obvious, it probably doesn't need to be a note

### Test: Is This Too Generic?

**Question 1:** Can you give a concrete example in a specific domain?
- If YES → likely specific enough
- If NO → too generic

**Question 2:** Does this change what you DO (not just what you think)?
- If YES → likely actionable
- If NO → too generic to matter

**Question 3:** Would a domain expert find this useful?
- If YES → likely adds value
- If NO → probably obvious to anyone who would use the vault

**Question 4:** Does this require knowledge of the vault itself?
- If YES → meta-knowledge (acceptable in small doses)
- If NO → domain knowledge (preferred)

## Proposed Seed Rules

### Rule: Limit meta-knowledge to 5% of vault content

**Why:** Meta-knowledge (knowledge about knowledge management) is necessary but inert. Too much meta swamps domain knowledge, making the vault feel bureaucratic rather than useful.

**Test:** Count notes tagged "meta-knowledge" or with titles containing "Knowledge Management", "Vault", "Note". Is total <5% of vault?

### Rule: Generic principles must have domain-specific examples

**Why:** Even truly general principles (like "connect related ideas") become useful when shown in context. A principle without examples is a slogan, not knowledge.

**Test:** For any principle note:
1. Can you give 3 concrete examples in specific domains?
2. Do examples show different contexts that require different implementations?
3. Are examples connected viawikilinks to domain-specific notes?

### Rule: Reject principles that are equivalent to instructions

**Why:** If a note is just telling you what to do (rather than explaining something), it's operational guidance, not knowledge. The operational notes (CLAUDE.md, HEARTBEAT.md) are for instructions — domain content should be knowledge.

**Test:** Could this note be a checklist item? If yes, it's probably operational, not knowledge.

### Rule: Test generic principles against the "So What?" test

**Why:** Generic principles often fail the "so what?" test — they're true but don't change anything. Knowledge should matter.

**Test:** After reading this principle, can you say:
- "I will do X differently" (action change)
- "I understand Y better" (understanding change)
- "I will look for Z in the future" (awareness change)

If none of the above, the principle may be too generic to matter.

## Edge Cases

### Acceptable Meta-Knowledge

Some meta-knowledge IS valuable:
- **Conventions**: How to name notes, where to put them
- **Operational reminders**: When to verify, how to link
- **Retrieval paths**: How to find knowledge in the vault
- **Construction guidance**: When the vault is "complete"

The key distinction: **Meta-knowledge that helps you USE the vault** vs **meta-knowledge that explains knowledge itself**.

### Domain-General vs Too-Generic

Not all domain-general knowledge is bad:
- "Debugging principles" apply to cooking, coding, and cars — but they're specific enough to matter
- "Signal-to-noise ratio" applies to radio, writing, and research — but has concrete implications

The line: **Domain-general principles have specific implications; too-generic principles don't**.

## Examples

### Too Generic (Should Not Be Notes)

❌ "Good knowledge is accurate"
❌ "Connect related ideas together"  
❌ "Knowledge should be organized"
❌ "Verify before trusting"

### Domain-General (Acceptable When Linked to Examples)

✓ "Debug at the component level" (with links to: cooking, code, cars)
✓ "Start with the simplest explanation" (with links to: medicine, mechanics, troubleshooting)
✓ "Trade-offs are inevitable" (with links to: real estate, recipes, design)

### Specific (Always Welcome)

✓ "Brining adds moisture to protein" (cooking)
✓ "Check error logs first" (programming)
✓ "Verify permits before renovation" (home improvement)

## Test Criteria

- [ ] Can you identify a concrete use case for this principle?
- [ ] Does this principle change any specific action?
- [ ] Is this more specific than "be good"?
- [ ] Does it require domain knowledge to understand?
- [ ] Are there 3+ wikilinks to domain-specific examples?

## Related Notes

- [[Frontier Exploration - Knowledge Type and Process Type Taxonomy Interaction]] (knowledge types)
- [[Seed Gap - Distributed Understanding Threshold]] (when understanding is "complete")
- [[Linking Principle]] (what makes a good link)
- [[Anti-Patterns in Knowledge Management]] (what to avoid)

---

*This note captures a potential frontier gap: the Seed optimizes for actionable, specific knowledge but doesn't explicitly warn against principles that are so general they become meaningless. The proposed rules provide heuristics for distinguishing useful domain-general knowledge from empty generic slogans.*