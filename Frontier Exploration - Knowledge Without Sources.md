---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-extension
  - frontier-exploration
  - source-missing
---

# Frontier Exploration - Knowledge Without Sources

> When knowledge has no source — original insights, personal experiments, or unprecedented ideas.

## The Problem

The Seed requires:
> **Rule:** Cite sources — every factual claim should trace back to an origin.

But what about:
- Original research you've conducted
- Personal insights synthesized from experience
- Novel ideas that are entirely your own
- Skills learned without documented sources

## Where the Seed Fails

An AI agent following the Seed strictly might:
1. Refuse to add original insights (no source)
2. Mark personal knowledge as low-confidence (no external validation)
3. Delete or deprecate notes without sources
4. Miss valuable original content

## The Gap

The Seed doesn't address **source-less knowledge** — knowledge that is:
- Original (your own synthesis)
- Empirical (from personal experience)
- Experimental (unproven but documented)
- Intuitive (hard to source but valuable)

## Recommendations

### Rule Addition: Distinguish Source Types

Add frontmatter to distinguish knowledge by source type:

```yaml
source-type: external | original | empirical | experiential
```

| Type | Description | Citation Requirement |
|------|-------------|---------------------|
| external | From books, articles, web | Required |
| original | Your own synthesis | Not required, mark as original |
| empirical | Your own experiments | Document your methodology |
| experiential | From personal experience | Mark as personal |

### For Original Knowledge

- Mark with `source-type: original`
- Add `originality: synthesis | hypothesis | invention`
- Note what sources you combined (if any)

### For Empirical Knowledge

- Mark with `source-type: empirical`
- Document methodology in the note
- Add `verification-status: pending-validation`

### For Experiential Knowledge

- Mark with `source-type: experiential`
- Use confidence markers appropriately
- Note "from personal experience" explicitly

## Test for AI Agents

When processing a note without sources:
1. Is this original insight? → Mark `source-type: original`
2. Is this from personal experiment? → Mark `source-type: empirical`
3. Is this from personal experience? → Mark `source-type: experiential`
4. Could this have sources but doesn't? → Flag for review

## Example

```yaml
---
source-type: original
originality: synthesis
confidence: emerging
author-type: ai-assisted
---

# My Theory on Knowledge Emergence

This is my original synthesis based on combining [[Zettelkasten Method]] 
with [[Emergence in Knowledge Graphs]] principles. I haven't seen this connection 
documented elsewhere.

## The Synthesis

When atomic notes exceed X density, emergence becomes predictable...
```

## Related

- [[Handling Temporal Knowledge]]
- [[Confidence Markers]]
- [[Handling Contradictory Sources]]
- [[AI-Assisted Knowledge Management Seed]] — see "Cite sources" rule
