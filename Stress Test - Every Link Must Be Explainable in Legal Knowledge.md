---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
tags:
  - seed-stress-test
  - legal-domain
  - linking
---

# Stress Test: Every Link Must Be Explainable in Legal Knowledge

## Seed Rule Being Tested
**Rule:** Every link must be explainable in one sentence — no decorative or keyword-match links.
**Why:** Meaningless links inflate the graph without adding navigational or conceptual value.
**Test:** For each link in a note, can you state why the reader should follow it? Remove any link where you cannot.

## Application to Legal Knowledge Base

### The Challenge

Legal knowledge is inherently interconnected:
- Statutes reference other statutes
- Cases cite precedent cases
- Regulations reference statutes
- Legal concepts build on each other

This creates a dense web of connections where determining "explainable" vs "decorative" is complex.

### Edge Cases Found

#### Edge Case 1: Hierarchical Legal References

**Problem:** "Under [[15 U.S.C. § 78j(b)]]..." — is this link explainable?

The link is to a statute section. The explainability test:
- "This statute is the legal authority for the statement" ✓
- But is this meaningful navigation? A reader wouldn't typically "follow" this link to learn more — it's a citation.

**Verdict:** Legal citations ARE explainable but serve a different purpose than typical knowledge links. They establish authority, not teach concepts.

#### Edge Case 2: Precedent Chains

**Problem:** "Established in [[Marbury v. Madison]] and refined in [[Brown v. Board]]"

Two cases linked. Explainability:
- "Marbury established judicial review" ✓
- "Brown extended equal protection to schools" ✓

Both are explainable. But what about: "[[Marbury v. Madison]]" linked from a note about "what is a writ of mandamus"?

The link IS explainable: "Marbury is the case where the Supreme Court first asserted the power of judicial review." ✓

#### Edge Case 3: Umbrella Terms Linking to Specifics

**Problem:** Note discusses "securities law" and links to [[Securities Act of 1933]], [[Securities Exchange Act of 1934]], [[Investment Company Act]], etc.

Is this decorative? "Securities law encompasses these specific statutes" — YES, this is explainable.

But what about: Note discusses "contracts" and links to [[Contract Law]]

This is borderline — "Contract Law" might be too broad. The link should probably go to a more specific concept.

#### Edge Case 4: Legal Terminology Chains

**Problem:** Note defines "fiduciary duty" and links to [[breach of fiduciary duty]], [[duty of care]], [[duty of loyalty]].

Are these explainable?
- "A breach of fiduciary duty is a violation of the fiduciary standard" — somewhat circular
- "Duty of care is the fiduciary standard in business decisions" — explains the concept

Some legal terminology links may be too tautological to be meaningful.

#### Edge Case 5: Cross-References in Legal Analysis

**Problem:** Note: "The plaintiff must prove [[damages]], [[causation]], and [[duty]] to succeed."

Three links in one sentence. Explainable?
- "Damages are the harm the plaintiff suffered" — yes
- "Causation connects the defendant's conduct to the harm" — yes
- "Duty is the legal obligation the defendant owed" — yes

All explainable — but the note might be too dense with links.

### What Works ✓

> **Note:** The links below are illustrative examples demonstrating the linking patterns — they are hypothetical notes showing how to structure legal knowledge links, not links to existing notes.

1. **Case-to-principle links:** "This case established [[judicial review]]"
2. **Statute-to-regulation links:** "[[Rule 10b-5]] implements [[Section 10(b)]]"
3. **Concept-to-example links:** "The doctrine of [[promissory estoppel]] is illustrated by [[Greene v. Commissioner]]"
4. **Historical-progression links:** "The modern approach began with [[Penn Central]] and was refined in [[Lucas]]"

### What Breaks ✗

1. **Links to vague terms:** "Under [[common law]]..." — too broad
2. **Links that are just citations:** "See [[Smith v. Jones]]" without explaining the connection
3. **Circular links:** "A [[proxy]] is someone who acts as a [[proxy]]" — tautology
4. **Excessive linking:** Note with 10+ links where most could be removed without losing meaning

### Refined Test for Legal Domain

```
For each link in a legal note:
1. Does the link go to a SPECIFIC legal concept/case/statute? (not "law" or "legal")
2. Can you state what legal principle the reader learns from following?
3. Is the link a citation (authority) OR a learning path (concept)? 
   - If citation only: consider whether to include
4. Would a first-year law student benefit from following this link?
```

### The Dilemma: Citations vs. Learning Links

Legal writing is full of citations. But citations are different from knowledge links:
- **Citation:** "The statute, [[17 CFR § 240.10b-5]], prohibits..."
- **Learning link:** "[[Insider trading]] is the trading of securities based on material, nonpublic information."

The Seed rule tests learning links, not citations. Legal knowledge bases should distinguish:
- `[[legal citation]]` — for authority (could use special syntax)
- `[[concept link]]` — for learning

### Recommendation

The Seed rule should clarify:
1. **Citations are not subject to the explainability test** — they're authority markers, not learning paths
2. **Learning links must pass the explainability test** — can you learn something from following?
3. **Legal knowledge bases should use different link types** — citations vs. concepts

### Test for AI Agents

```
Given a link in a legal note:
1. Is this a citation (authority) or a concept link (learning)?
2. If concept: Can you state what legal principle the reader learns?
3. If citation: Is there a separate concept link that teaches the principle?
4. Could a first-year law student benefit from following?
```

## Related
- [[Linking Principle]]
- [[Seed Stress Test - Cooking Knowledge Base]] — Comprehensive stress testing (includes link rules)
- [[Stress Test - Tags vs Links Rule in Gardening]]
- [[Domain-Specific Knowledge Bases]]
