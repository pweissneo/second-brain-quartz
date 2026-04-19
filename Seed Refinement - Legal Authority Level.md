---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
confidence: emerging
lifecycle: seed-refinement
tags:
  - seed-refinement
  - legal
  - domain-specific
  - authority-level
  - source-hierarchy
---

# Seed Refinement: Legal Authority Level

> Refinement to address gap found in SEED_STRESS_TEST for legal knowledge bases

## Gap Identified

The Seed has `source-type` (primary/secondary/tertiary) but lacks explicit **legal authority level** — the strict hierarchy that determines whether a legal source is binding or merely persuasive.

**Why this matters:**
- A US Supreme Court case is **binding** in all federal courts and state courts on federal questions
- A law review article is **persuasive** but not binding
- A case from another jurisdiction may be **persuasive** but not binding in your jurisdiction
- A case that was **overruled** is no longer good law

Without authority tracking, an AI agent could cite overruled cases as if they were still valid.

## Proposed Seed Rule Addition

**Rule:** For legal knowledge bases, include `authority-level:` frontmatter reflecting the strict hierarchy of legal sources.

**Why:** Not all legal sources are equal. A statute is binding; a law review article is persuasive. This affects how knowledge should be weighted in legal reasoning. Without explicit authority level, AI agents cannot apply proper legal hierarchy.

**Test:** For legal notes:
1. Can you identify the authority level (constitutional | statutory | regulatory | case-binding | case-persuasive | secondary)?
2. Does the note reflect the proper hierarchy in how it's presented?
3. Are binding authorities distinguished from persuasive authorities?

**Implementation:**
```yaml
authority-level: constitutional    # Highest - constitution
authority-level: statutory        # Statutes, codes
authority-level: regulatory       # Agency regulations
authority-level: case-binding     # Case law controlling in your jurisdiction
authority-level: case-persuasive # Case law from other jurisdictions
authority-level: secondary       # Law reviews, treatises, restatements
authority-level: tertiary         # Legal encyclopedias, digests
```

## Distinction from Other Fields

- **Source type** answers: "What kind of source is this?" (primary/secondary/tertiary)
- **Authority level** answers: "How binding is this source in legal reasoning?"

These are orthogonal:
- A primary source (case law) can be overruled → authority level changes
- A secondary source (treatise) is always secondary → never becomes binding

## Additional Legal Metadata

Consider adding alongside authority-level:

```yaml
jurisdiction: US-federal|US-state-CA|US-state-NY
case-status: good-law|overruled|doubted|distinguished|questioning
precedent-relationship: binding|persuasive|distinguished|overruled
legal-content-type: primary-source|secondary-source|analysis|synthesis
```

## Test for AI Agents

```
Building a legal knowledge base:
1. Does each legal claim cite authority with jurisdiction?
2. Is authority level (binding vs. persuasive) tracked?
3. Are overruled cases clearly marked?
4. Can you distinguish primary sources from analysis?
```

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — source-type (line ~2732)
- [[Seed Stress Test - Legal Knowledge Bases]] — full stress test analysis
- [[Handling Contradictory Sources]] — relevant when circuits split
- [[Frontier Exploration - Jurisdiction and Legal Authority Type Handling]]

---

**Status:** This refinement is emerging. Test against your legal vault before adding to Seed proper.