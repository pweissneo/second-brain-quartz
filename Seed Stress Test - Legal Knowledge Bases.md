---
last-reviewed: 2026-03-22
confidence: emerging
author-type: ai-assisted
lifecycle: seed-extension
tags:
  - stress-test
  - legal
  - domain-specific
  - source-classification
  - reasoning-patterns
  - jurisdiction
---

# Seed Stress Test: Legal Knowledge Bases

> Can the Seed's rules handle the unique demands of legal knowledge management? This note explores gaps and proposes solutions.

## Domain Overview

Legal knowledge bases face unique challenges:
- **Jurisdiction specificity** — Laws differ by country, state, municipality
- **Source hierarchy** — Constitution > statutes > regulations > case law
- **Legal citation** — Specific formats for cases, statutes, regulations
- **Temporal validity** — Laws are amended, repealed, superseded
- **Confidentiality** — Attorney-client privilege, work product doctrine
- **Reasoning patterns** — Precedent-based, analogical, deductive

## Stress Test Results

### Test 1: Source Type Classification

**Problem:** The Seed discusses source reliability and verification, but legal knowledge requires explicit source TYPE classification:

- **Primary legal sources**: Constitutions, statutes, regulations, case law
- **Secondary legal sources**: Law review articles, treatises, restatements
- **Tertiary legal sources**: Legal encyclopedias, digests, practice guides

**Question:** Does the Seed have guidance on organizing by source type?

**Finding:** The Seed lacks explicit source type classification. For legal KBs, source type determines authority:
- A statute is binding; a law review article is persuasive
- This hierarchy affects verification and confidence

### Test 2: Legal Citation Handling

**Problem:** Legal citations have specific formats:
- Case: *Smith v. Jones*, 123 U.S. 456 (2020)
- Statute: 42 U.S.C. § 1983
- Regulation: 29 C.F.R. § 1910.1200

**Question:** Does the Seed address domain-specific citation formats?

**Finding:** No explicit guidance. Legal citations should be:
- Preserved exactly as-is (precision matters)
- Linked to full text where possible
- Tagged by jurisdiction

### Test 3: Jurisdiction Handling

**Problem:** Legal knowledge is jurisdiction-specific:
- US federal vs. US state law
- Civil law vs. common law systems
- International treaties

**Question:** Does the Seed handle multi-jurisdiction knowledge?

**Finding:** Partial coverage (see 2026-03-17 edge case for legal 5:1 ratio), but gaps remain:
- No explicit `jurisdiction:` field requirement
- No guidance on jurisdiction conflicts
- No handling of jurisdictional overlaps

### Test 4: Legal Reasoning Patterns

**Problem:** Legal reasoning differs from other domains:

1. **Stare decisis** — Binding precedent vs. persuasive precedent
2. **Analogical reasoning** — "This case is like that case"
3. **Deductive reasoning** — Rule + facts = conclusion
4. **Policy reasoning** — What the law SHOULD be

**Question:** Does the Seed address domain-specific reasoning patterns?

**Finding:** No explicit guidance on:
- How to organize precedent relationships
- How to represent binding vs. persuasive authority
- How to track legal reasoning chains

### Test 5: Temporal Validity of Law

**Problem:** Laws change:
- Amendments (modified)
- Repeals (abolished)
- Supersession (replaced by newer law)
- Judicial reversal (case overruled)

**Question:** Does the Seed handle temporal validity for legal knowledge?

**Finding:** Partial coverage (see 2026-03-17 edge case for temporal validity), but gaps:
- No explicit handling of "law amended" vs. "law repealed"
- No guidance on tracking judicial decisions that change interpretation

### Test 6: Confidentiality Constraints

**Problem:** Legal knowledge has privilege constraints:
- Attorney-client privilege
- Work product doctrine
- Confidential sources

**Question:** Does the Seed address confidentiality in knowledge bases?

**Finding:** The Seed has general guidance (see privacy rules) but legal-specific gaps:
- No guidance on capturing legal experience vs. privileged information
- No handling of "what I learned in court" vs. "what my client told me"

### Confidentiality Tiers (from Frontier Exploration)

Unlike other professional domains, legal knowledge has legally-protected confidentiality levels:

| Level | Description | Can Be Captured? |
|-------|-------------|------------------|
| Public | Court filings, published opinions | Yes, freely |
| Confidential | Client communications | Only with consent |
| Work Product | Attorney analyses prepared for litigation | Restricted |
| Privileged | Attorney-client communications | Generally no |

**Seed Gap:** The Seed's `application-scope` field doesn't capture legal confidentiality tiers. An AI agent capturing "legal strategy notes" wouldn't know to distinguish privileged from non-privileged content.

### Test 7: Authority Hierarchy

**Problem:** Legal sources have explicit hierarchy:
1. Constitutional law (highest)
2. Statutes
3. Regulations
4. Case law (binding when on point)
5. Case law (persuasive from other jurisdictions)
6. Secondary sources (lowest)

**Question:** Does the Seed handle source hierarchy?

**Finding:** The Seed has `consensus-level` but not `authority-level`. These are different:
- Consensus: Do experts agree?
- Authority: What level of the hierarchy?

## Edge Cases

### Edge Case: Multi-Jurisdiction Analysis

A note discussing "contract formation requirements" might cover federal common law, California law, and New York law — all different. How to structure?

**Solution:** Use scope tags for each jurisdiction:
```
jurisdiction: [federal-common-law, california, new-york]
```
Create separate atomic notes for jurisdiction-specific rules, linked from a hub.

### Edge Case: Ethical Walls

In law firm settings, different practice areas must be strictly separated (corporate vs. litigation, IP vs. employment). A knowledge base might need per-client or per-matter isolation.

**Solution:** Use explicit scope boundaries:
```
ethical-wall: [practice-area, client-name]
access-level: firm-wide|practice-area|client-specific
```

### Edge Case: Pending Legislation

Laws that haven't passed yet but are being tracked. Not quite "current law" but valuable to capture.

**Solution:** Temporal status field:
```
legal-status: enacted|pending|proposed|defeated
effective-date: YYYY-MM-DD (if enacted)
```

### Edge Case: Research vs Analysis

Legal knowledge bases often mix:
- **Primary sources** — Statutes, regulations, case law
- **Secondary sources** — Law review articles, treatises, practice guides
- **Analytical content** — Your own analysis, memos, briefs

**Seed Gap:** There's no guidance on separating raw legal research from synthesized legal analysis. A note about "the First Amendment" could be a statute summary or original analysis — these have different reliability characteristics.

## Proposed Solutions

### Solution 1: Add Source Type Frontmatter

```yaml
source-type: primary-legal  # Constitution, statute, regulation, case law
source-type: secondary-legal  # Law review, treatise, restatement
source-type: tertiary-legal  # Encyclopedia, practice guide
legal-authority: binding|persuasive
jurisdiction: US-federal|US-state|NY|California|civil-law|common-law
```

### Solution 2: Add Legal Citation Fields

```yaml
citation-format: legal-bluebook
citation-exact: "*Smith v. Jones*, 123 U.S. 456 (2020)"
linked-source: https://supremecourt.gov/...
case-status: good-law|overruled|doubted|distinguished
```

### Solution 3: Add Jurisdiction Scope

```yaml
jurisdiction-scope: federal|state|local|international
jurisdiction-detail: US|NY|CA|DE (for corporations)
legal-system: common-law|civil-law|religious-law
```

### Solution 4: Legal Reasoning Pattern Guidance

```yaml
reasoning-pattern: precedent  # Stare decisis based
reasoning-pattern: analogical  # Case comparison
reasoning-pattern: deductive  # Rule application
reasoning-pattern: policy  # Legislative intent
precedent-relationship: binding|persuasive|distinguished|overruled
```

### Solution 5: Legal Temporal Validity

```yaml
legal-status: valid|amended|repealed|superseded|overruled
effective-date: 2020-01-01
amendment-date: 2024-06-15
repeal-date: null
superseded-by: "[[New Law Note]]"
judicial-overruled: "[[Case Note]]"
overrule-date: 2023-03-15
```

### Solution 6: Confidentiality Handling

```yaml
privilege-type: attorney-client|work-product|confidential-source
capture-allowed: yes|no|limited
limitation-note: "Can capture general experience, not specific case details"
confidentiality-level: public|confidential|work-product|privileged
ethics-review-required: true|false
```

### Solution 7: Authority Level

```yaml
authority-level: constitutional|statutory|regulatory|case-binding|case-persuasive|secondary
hierarchy-position: 1  # 1 = highest
```

### Solution 8: Legal Content Type

```yaml
legal-content-type: primary-source|secondary-source|analysis|synthesis
verification-status: verified-against-source|cited-not-verified|original-analysis
```

## Seed Rule Candidates

### Rule: Add Source Type Frontmatter

> For knowledge domains with distinct source hierarchies (legal, academic, medical), include explicit `source-type:` frontmatter to distinguish primary, secondary, and tertiary sources.

**Why:** Source type affects authority and verification approach. Primary sources are authoritative; tertiary sources are useful but less so.

**Test:** In legal/academic/medical notes, can you identify the source type? Do notes have explicit `source-type:` markers?

### Rule: Handle Domain-Specific Reasoning Patterns

> For knowledge domains with distinct reasoning patterns (legal, historical, scientific), include explicit `reasoning-pattern:` frontmatter to guide how knowledge should be evaluated.

**Why:** Legal reasoning (precedent) differs from scientific reasoning (evidence hierarchy). Without explicit patterns, AI agents apply wrong reasoning approaches.

**Test:** Can you identify the reasoning pattern for domain-specific notes? Do notes have explicit `reasoning-pattern:` markers?

### Rule: Add Authority Level for Legal Knowledge

> For legal knowledge bases, include `authority-level:` frontmatter reflecting the hierarchy: constitutional > statutory > regulatory > case-binding > case-persuasive > secondary.

**Why:** Not all legal sources are equal. A statute is binding; a law review article is persuasive. This affects how knowledge should be weighted.

**Test:** Can you identify the authority level of legal notes? Do they reflect the proper hierarchy?

### Rule: Legal Knowledge Must Track Authority Status

**Why:** Legal statements depend on whether the supporting authority is binding or persuasive, current or superseded. Without authority tracking, legal advice becomes unreliable.

**Test:** For any legal claim:
1. Is there a supporting case/statute/regulation?
2. Is that authority still good law?
3. Is it binding in the relevant jurisdiction or only persuasive?

### Rule: Legal Confidentiality Tiers Must Be Documented

**Why:** Capturing privileged information incorrectly can waive attorney-client privilege or work product protection. Legal knowledge bases need explicit confidentiality tracking.

**Test:** Can you categorize each legal note as:
1. Public domain (published case, statute)
2. Non-privileged analysis (your own work)
3. Potentially privileged (may need review)
4. Definitely privileged (do not capture without guidance)

### Rule: Legal Research Must Be Separated from Legal Analysis

**Why:** Primary sources (cases, statutes) are stable; your analysis is subject to error. Mixing them creates misleading reliability signals.

**Test:** For a legal note:
1. Is this primarily a summary of primary sources?
2. Or is this original legal analysis?
3. Can a reader distinguish facts (what the law says) from opinion (what you think it means)?

### Rule: Track Case Status Over Time

**Why:** A case cited today may be overruled next year. Legal knowledge bases need temporal tracking beyond "last-reviewed."

**Test:** For each case citation:
1. Is there a case-status field (good-law, questioned, overruled)?
2. When was the case status last verified?
3. Are there pending challenges that might affect status?

## Test for AI Agents

```
Building a legal knowledge base:
1. Does each legal claim cite authority with jurisdiction?
2. Is authority status (controlling/persuasive/overruled) tracked?
3. Can you distinguish primary sources from analysis?
4. Are confidentiality tiers documented?
5. Can you trace when legal status was last verified?
```

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — source-reliability, verification-status
- [[Stress Test - 5-1 Ratio Legal Domain]] — existing legal edge case in Seed
- [[Frontier Exploration - Professional Credentialing Requirements]]
- [[Handling Contradictory Sources]] — relevant when circuits split
- [[Handling Temporal Knowledge]] — relevant for case law evolution and citation checking

---

**Note:** This note combines content from both Frontier Exploration and Seed Stress Test notes on Legal Knowledge Bases to eliminate redundancy. The rules proposed here may not be fully mature. Test them against your vault before adding to the Seed proper.
