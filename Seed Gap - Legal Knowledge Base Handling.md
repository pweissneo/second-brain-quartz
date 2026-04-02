---
last-reviewed: 2026-04-02
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - legal
  - jurisdiction
  - authority
gap-status: identified
gap-priority: medium
gap-source: frontier-exploration-law-2026-04-02
gap-phase: discovery
---

# Seed Gap: Legal Knowledge Base Handling

> Identified gap: The Seed lacks guidance for building knowledge bases in legal domains.

## The Gap

When stress-testing the Seed against a legal knowledge base, the following situations have no explicit rule:

1. **Jurisdiction-specific knowledge** — Legal knowledge varies by jurisdiction (federal, state, local). No guidance on structuring jurisdiction-dependent notes.
2. **Legal authority hierarchy** — Distinguishing binding precedent from persuasive authority (vs. general "source quality" rules)
3. **Overruled case law** — How to handle cases that have been explicitly overruled
4. **Attorney-client privilege** — How to handle knowledge that's constrained by privilege
5. **Legal verification timeline** — When is legal knowledge "verified" vs. primary sources vs. secondary interpretation

## Stress Test Output

From applying Seed rules to law domain:

### Where AI Gets Stuck

- How to handle jurisdiction-specific knowledge (federal vs state vs local)?
- How to distinguish binding precedent from persuasive authority?
- How to handle case law that has been overruled?
- How to structure statutory code vs case law vs secondary sources?
- When is legal knowledge "verified" (primary source vs secondary interpretation)?
- How to handle attorney-client privilege in personal knowledge bases?
- What's the lifecycle for legal knowledge that gets superseded?

### Current Seed Gaps

- No explicit jurisdiction handling (federal/state/local)
- No guidance on legal authority hierarchy (binding vs persuasive)
- No rule for overruled cases
- No rule for privilege-constrained knowledge

## Proposed Seed Rules

### Rule: Jurisdiction-Specific Legal Knowledge

**Rule:** For legal knowledge bases, tag notes with jurisdiction scope and handle jurisdiction-specific content as separate variants.

**Why:** Legal rules vary by jurisdiction. Federal law differs from state law, which differs from local ordinance. Without jurisdiction tagging, knowledge becomes unreliable.

**Test:** Can you filter notes by jurisdiction? Does jurisdiction-specific knowledge include scope metadata?

### Rule: Legal Authority Hierarchy

**Rule:** Distinguish binding authority (controlling precedent) from persuasive authority (non-binding authority) and secondary sources.

**Why:** Not all legal sources carry equal weight. Following a non-binding source as if it were controlling creates incorrect knowledge.

**Test:** Can you categorize legal sources by authority level? Do binding vs. persuasive sources have different confidence weighting?

### Rule: Overruled Case Handling

**Rule:** When a legal case is overruled, mark the original with correction metadata rather than deleting.

**Why:** Overruled cases contain valuable context about legal reasoning evolution.

**Test:** Can you identify overruled cases with correction metadata? Is there a link to the overruling case?

## Related

- [[Seed Stress Test - Legal Knowledge Base]]
- [[Frontier Exploration - Cross-Jurisdictional Legal Knowledge Handling]]
- [[AI-Assisted Knowledge Management Seed]]
