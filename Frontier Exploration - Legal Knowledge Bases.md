---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - legal-knowledge
  - domain-specific
  - confidentiality
---

# Frontier Exploration - Legal Knowledge Bases

## The Gap

The Seed covers jurisdiction-dependent knowledge and professional credentialing, but legal knowledge has unique characteristics that would stump an AI building a legal knowledge base from scratch:

1. **Confidentiality hierarchy** — attorney-client privilege, work product doctrine, and ethics rules create strict confidentiality tiers that affect what can be captured
2. **Authority weight** — distinguishing binding precedent (controlling jurisdiction) from persuasive authority (other jurisdictions)
3. **Temporal legal status** — cases can be "good law," "questioned," "overruled," or "distinguished" with explicit status
4. **Ethical walls** — legal knowledge bases may need strict separation to avoid conflicts of interest

## Why Legal Knowledge Is Different

### Confidentiality Tiers

Unlike other professional domains, legal knowledge has legally-protected confidentiality levels:

| Level | Description | Can Be Captured? |
|-------|-------------|------------------|
| Public | Court filings, published opinions | Yes, freely |
| Confidential | Client communications | Only with consent |
| Work Product | Attorney analyses prepared for litigation | Restricted |
| Privileged | Attorney-client communications | Generally no |

**Seed Gap:** The Seed's `application-scope` field doesn't capture legal confidentiality tiers. An AI agent capturing "legal strategy notes" wouldn't know to distinguish privileged from non-privileged content.

### Authority Weighting

Legal knowledge requires tracking not just whether something is true, but whether it's binding:

- **Controlling authority** — Must be followed in the relevant jurisdiction
- **Persuasive authority** — May be cited but doesn't bind
- **Overruled** — No longer good law
- **Distinguished** — Still good law but doesn't apply to these facts

**Seed Gap:** The Seed has `confidence: high/emerging/disputed/obsolete` but doesn't distinguish between "disputed" (experts disagree on the law) and "overruled" (the law changed). These are fundamentally different status types.

### Research vs Analysis

Legal knowledge bases often mix:
- **Primary sources** — Statutes, regulations, case law
- **Secondary sources** — Law review articles, treatises, practice guides
- **Analytical content** — Your own analysis, memos, briefs

**Seed Gap:** There's no guidance on separating raw legal research from synthesized legal analysis. A note about "the First Amendment" could be a statute summary or original analysis — these have different reliability characteristics.

## Proposed Rules

### Rule: Legal Knowledge Must Track Authority Status

**Why:** Legal statements depend on whether the supporting authority is binding or persuasive, current or superseded. Without authority tracking, legal advice becomes unreliable.

**Test:** For any legal claim:
1. Is there a supporting case/statute/regulation?
2. Is that authority still good law?
3. Is it binding in the relevant jurisdiction or only persuasive?

**Implementation:**
```
authority-status: controlling|persuasive|overruled|distinguished
jurisdiction: [federal, state, specific-state]
court-level: supreme|appellate|trial
```

### Rule: Legal Confidentiality Tiers Must Be Documented

**Why:** Capturing privileged information incorrectly can waive attorney-client privilege or work product protection. Legal knowledge bases need explicit confidentiality tracking.

**Test:** Can you categorize each legal note as:
1. Public domain (published case, statute)
2. Non-privileged analysis (your own work)
3. Potentially privileged (may need review)
4. Definitely privileged (do not capture without guidance)

**Implementation:**
```
confidentiality: public|internal|privileged|work-product
ethics-review-required: true|false
```

### Rule: Legal Research Must Be Separated from Legal Analysis

**Why:** Primary sources (cases, statutes) are stable; your analysis is subject to error. Mixing them creates misleading reliability signals.

**Test:** For a legal note:
1. Is this primarily a summary of primary sources?
2. Or is this original legal analysis?
3. Can a reader distinguish facts (what the law says) from opinion (what you think it means)?

**Implementation:**
```
legal-content-type: primary-source|secondary-source|analysis|synthesis
verification-status: verified-against-source|cited-not-verified|original-analysis
```

### Rule: Track Case Status Over Time

**Why:** A case cited today may be overruled next year. Legal knowledge bases need temporal tracking beyond "last-reviewed."

**Test:** For each case citation:
1. Is there a case-status field (good-law, questioned, overruled)?
2. When was the case status last verified?
3. Are there pending challenges that might affect status?

**Implementation:**
```
case-status: good-law|questioned|overruled|distinguished|pending
status-verified-date: YYYY-MM-DD
pending-challenges: [case-names]
```

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

## Test for AI Agents

```
Building a legal knowledge base:
1. Does each legal claim cite authority with jurisdiction?
2. Is authority status (controlling/persuasive/overruled) tracked?
3. Can you distinguish primary sources from analysis?
4. Are confidentiality tiers documented?
5. Can you trace when legal status was last verified?
```

## Related

- [[Stress Test - Every Link Must Be Explainable in Legal Knowledge]]
- [[Frontier Exploration - Professional Credentialing Requirements]]
- [[Handling Contradictory Sources]] — relevant when circuits split
- [[Handling Temporal Knowledge]] — relevant for case law evolution
- [[Handling Temporal Knowledge]] — critical for legal citation checking
