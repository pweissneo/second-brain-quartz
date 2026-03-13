---
last-reviewed: 2026-03-10
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- legal-domain
- edge-case
---

# Stress Test: Self-Contained Notes Rule in Legal Knowledge

## Seed Rule Being Tested
**Rule:** Every note must be self-contained — readable without clicking any links.
**Test:** Read the note in isolation. Does it make sense without following any links?

## Application to Legal Knowledge Base

### Where the Rule Works Well

In legal knowledge bases, some notes ARE naturally self-contained:

- **Statute texts**: The actual law text is self-contained
- **Case summaries**: Facts, holding, and reasoning are in the note
- **Legal forms**: Template language stands alone

### Edge Case: Legal Terminology

**Problem:** Legal concepts often require understanding of other legal concepts that cannot be self-contained without becoming circular or bloated.

> **Illustrative example** (hypothetical legal knowledge base):
> 
> A note about "Negligence" might say: "A tort involving breach of duty of care..."
> 
> To be self-contained, it would need to define "tort" and "duty of care" inline. But:
> - Defining "tort" requires explaining civil vs. criminal law
> - Defining "duty of care" requires explaining standard of care, foreseeability
> - This balloons a simple concept note into a treatise

### Edge Case: Cross-Jurisdiction Knowledge

**Problem:** A note about a legal concept that exists in multiple jurisdictions (e.g., "Contract") may reference jurisdiction-specific notes but cannot include all variations.

> **Illustrative example** (hypothetical):
> "Contract" note links to Contract Law (US), Contract Law (UK), Contract Law (EU)
> 
> Without clicking these links, the note is incomplete - but including all variations makes it unwieldy.

### Edge Case: Legal Citations

**Problem:** Legal scholarship relies on citations. A note about a case might say "See *Marbury v. Madison*" without explaining what case it is.

> **Illustrative example** (hypothetical):
> "Judicial review was established in *Marbury v. Madison* (1803)"
> 
> A reader unfamiliar with US constitutional history cannot understand this without clicking. But a full explanation of the case makes the note about judicial review into a case summary.

### The Real Issue

The self-containment rule assumes links are "nice to have" for depth. In legal knowledge:
- **Terminology is building-block based** - concepts depend on prior concepts
- **Precision requires citations** - legal claims need sources
- **Jurisdiction creates variation** - universal statements are often wrong

### Recommendation

The rule should be refined to:

**Rule:** Every note must be self-contained for its intended audience — the core claim must be understandable without links, but supporting details and variations may link out.

**Test:** 
1. Read the note as a domain novice. Is the main point clear?
2. Read it as an expert. Are there unsupported claims?
3. For legal: Are factual claims about specific cases/statutes supported with citations (even if not fully explained)?

**Alternative formulation:**
- **Core content**: Self-contained (main concept, key definition)
- **Supporting content**: May link for depth (jurisdiction variations, related concepts)
- **Citations**: Required for factual claims but may link for full source

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
