---
last-reviewed: 2026-03-12
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - domain-agnostic
  - authority
  - knowledge-types
---

# Frontier Exploration: Canonical vs Analysis Knowledge

## The Gap

The Seed includes rules for:
- Primary sources vs secondary sources (legal knowledge)
- Illustrative vs factual examples
- Subjective vs objective claims
- Source quality hierarchy

However, there's a gap: **distinguishing canonical/authoritative knowledge from personal analysis** in domains where both types coexist naturally.

## Why This Matters

Many domains have knowledge that exists on a spectrum from "established fact" to "personal interpretation":

- **Chess**: Opening theory (canonical, thousands of games analyzed) vs your own game analysis
- **Law**: Case law (authoritative, precedential) vs legal commentary (analysis, opinion)
- **Medicine**: Clinical guidelines (authoritative) vs physician's personal approach (analysis)
- **Investing**: Market data (factual) vs analyst opinions (analysis)
- **Literature**: Scholarly consensus on interpretation vs personal reading
- **History**: Primary sources vs historian interpretation
- **Programming**: Official documentation vs blog posts/tutorials

Without explicit guidance, AI agents cannot distinguish:
- "This is what experts agree on" (canonical)
- "This is one interpretation" (analysis)
- "This is my opinion" (personal)

## Current Seed Coverage

The Seed has:
- `source-quality` hierarchy (systematic-review → anecdote)
- `claim-type: subjective/objective`
- Legal primary/secondary source distinction
- Consensus markers for subjective claims

But there's no generic rule for "is this canonical/authoritative knowledge or personal/analysis knowledge" applicable across domains.

## Proposed Rule Addition

**Rule:** For domains where authoritative knowledge coexists with personal analysis, tag notes with `knowledge-type: canonical|analysis|personal` to distinguish established consensus from interpretation.
**Why:** Readers and AI agents need to understand whether knowledge represents agreed-upon facts or individual interpretation. Applying personal analysis as if it were canonical misleads; ignoring valuable personal insights wastes knowledge.
**Test:** Pick 5 notes in a domain with both canonical and analysis knowledge (chess, law, medicine, investing). Can you categorize each as canonical (established consensus), analysis (informed interpretation), or personal (individual opinion)? Do they have knowledge-type tags?

## Edge Cases

### Edge Case 1: Personal Analysis That Becomes Canonical
A blogger's unique interpretation gains widespread acceptance and becomes "the standard reading." How to track this transition?

### Edge Case 2: Mixed Notes
A note that presents canonical knowledge THEN adds personal analysis. Should this be one note with sections or two separate notes with links?

### Edge Case 3: Community Consensus
What "counts" as canonical? Academic consensus? Popular consensus? Expert consensus? How to handle contested canonicity?

### Edge Case 4: Credentials Matter
Personal analysis from an expert carries more weight than from a novice. Should `knowledge-type` include a credential or expertise level?

### Edge Case 5: Time-Varying Canonicity
Freudian psychology was once canonical in psychology, now largely superseded. Historical canonical knowledge vs current canonical knowledge.

## Domain-Specific Implementations

### Chess
- Canonical: Opening theory with ECO codes, endgame tablebases, established patterns
- Analysis: Your game annotations, novel opening ideas, engine evaluations
- Tags: `knowledge-type: canonical|analysis`, `analysis-source:` (engine name, personal, etc.)

### Law
- Canonical: Case law, statutes, regulations
- Analysis: Legal commentary, law review articles, blog posts
- Already implemented: `legal-content-type: primary-source|secondary-source|analysis`

### Medicine
- Canonical: Clinical guidelines (AMA, WHO), peer-reviewed research
- Analysis: Physician opinion, hospital protocols, personal experience
- Tags: `knowledge-type: canonical|analysis|experience`

### Investing
- Canonical: SEC filings, earnings reports, market data
- Analysis: Analyst recommendations, blog posts, personal strategy
- Tags: `knowledge-type: canonical|analysis|personal`

### Literature
- Canonical: Published scholarly consensus
- Analysis: Individual readings, critical interpretations
- Tags: `knowledge-type: canonical|analysis|personal`

## Test for AI Agents

Given a note in a domain with canonical/analysis knowledge:
1. Does this domain have established authorities (academia, professional bodies, official bodies)?
2. Is the knowledge presenting what authorities agree on, or one person's interpretation?
3. Is there a `knowledge-type` tag? If not, can you infer which type it is?
4. Would treating this as canonical mislead a reader who doesn't know the difference?

## Related Notes
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[Source Validation Over Time]]
- [[Handling Contradictory Sources]]
- [[Confidence Markers]]
