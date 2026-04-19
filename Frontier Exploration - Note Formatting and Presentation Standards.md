---
last-reviewed: 2026-04-09
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - frontier-exploration
  - formatting
  - presentation
  - standardization
  - seed-gap
gap-status: open
gap-priority: medium
gap-phase: discovery
gap-severity: moderate
gap-source: redundancy-scan-2026-04-09
discovered: 2026-04-09
---

# Frontier Exploration: Note Formatting and Presentation Standards

> The Seed provides robust rules for note content (atomicity, knowledge types, verification) but lacks guidance on note FORMAT — how notes should LOOK structurally.

## The Discovery

During a redundancy scan (2026-04-09), I examined the vault for notes covering similar content. While no strong merge candidates were found, I noticed significant variation in how notes PRESENT information:

- Some notes open with quotes, others with summaries
- Some have multiple "##" headers, others have none
- Some include extensive "Related" sections, others link inline only
- Some use tables for clarity, others use bullet lists for the same data

This raises a question: **Should the Seed define formatting conventions?**

## Why This Matters

### 1. Consistency Enables Scanning

When all notes follow similar structure, users can quickly find:
- The core insight (usually at top)
- Supporting evidence (usually in body)
- Related links (usually at bottom)
- Test criteria (often in dedicated section)

Without conventions, users never know where to look.

### 2. AI Generation Quality

AI-generated notes may vary in structure based on:
- Which note was used as template
- Session-specific output patterns
- Length/complexity of the knowledge

This creates "voice" variation beyond tone — structural drift.

### 3. Merge/Edit Reliability

When merging notes, inconsistent formatting makes integration harder:
- Different header styles
- Different list formats
- Different section ordering

## Current Seed Guidance (Minimal)

The Seed mentions:
- "Use frontmatter for metadata" — but doesn't define required fields
- "Atomic notes" — but doesn't say how to present atomicity
- Reference to templates in Note Types and Templates.md

But there's no explicit formatting STANDARD.

## What a Formatting Standard Might Include

### Section Ordering Convention

A recommended note structure:
1. **Title/Quote** — One-line insight or relevant quote
2. **Summary** — 1-3 sentences capturing the essence
3. **The Principle** — Core rule/statement
4. **Explanation** — Why this matters
5. **Details** — Supporting information, examples
6. **Implementation** — How to apply
7. **Test** — How to verify compliance
8. **Related** — Links to connected notes

### Formatting Elements

| Element | When to Use |
|---------|-------------|
| Quote blocks | Opening insight, definition |
| Tables | Comparisons, structured data |
| Bullet lists | Multiple items, options |
| Numbered lists | Sequential steps, criteria |
| Code blocks | Technical examples, frontmatter |
| Bold | Key terms, important statements |

### Frontmatter Requirements

Minimum viable frontmatter:
- `title:` — Note title
- `last-reviewed:` — Date of last review
- `lifecycle:` — evergreen|stub|deprecated
- `confidence:` — high|medium|low
- `author-type:` — ai-assisted|ai-generated|human

Recommended frontmatter:
- `knowledge-type:` — Primary type
- `access-pattern:` — lookup|learning|decision|inspiration
- `verification-status:` — verified|unverified|pending

## Edge Cases

### Short Notes (<50 words)
Should short notes follow the full structure? Perhaps simplified:
- Direct statement (no summary needed)
- One example
- One related link

### Long Notes (>1000 words)
Should structure scale with length? Perhaps:
- Add table of contents
- Use sub-sections with anchors
- Break into multiple notes if possible

### Multi-Knowledge-Type Notes
Notes covering multiple types (e.g., procedural + conceptual) may need mixed structure. How to handle?

## The Gap

The Seed lacks explicit **note formatting and presentation standards** — conventions for how notes should look structurally beyond content rules.

This is different from:
- **Voice/tone** — How notes sound (covered in [[Frontier Exploration - Knowledge Base Voice and Persona Consistency]])
- **Content structure** — What goes in notes (covered by atomicity, knowledge types)
- **Visual knowledge** — Images, diagrams (covered elsewhere)

This is about **structural formatting** — section ordering, element usage, presentation consistency.

## Questions for Exploration

1. Should formatting be REQUIRED (strict) or GUIDELINE (flexible)?
2. Can format vary by knowledge type (procedural different from conceptual)?
3. Should AI-generated notes follow stricter format than human notes?
4. Does format matter for retrieval, or only for human reading?

## Test Scenario

**Test:** Pick 10 random notes in the vault. Can you predict where to find:
- The main insight?
- The test criteria?
- Related links?

If yes for most notes → formatting is consistent
If no → formatting varies, standard may help

## Related Notes

- [[Note Types and Templates]] — Current template reference
- [[Frontier Exploration - Knowledge Base Voice and Persona Consistency]] — Related "how it sounds" topic
- [[AI-Assisted Knowledge Management Seed]] — Content rules (missing formatting)
- [[Seed Gap - Knowledge Prioritization Decision Framework]] — Related decision framework exploration

---

**Note:** This exploration was created during a frontier exploration phase of a redundancy scan (2026-04-09). No strong merge candidates were found, but formatting inconsistency was noted as a potential area for Seed guidance.