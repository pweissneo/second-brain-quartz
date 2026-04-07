---
last-reviewed: 2026-04-06
lifecycle: staging
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: conceptual
tags:
  - frontier-exploration
  - legal-knowledge
  - jurisdiction
  - authority-hierarchy
access-pattern: decision
retrieval-mode: browse
storage-pattern: network
verification-approach: source
schema-version: "1.0"
---

# Frontier Exploration: Legal Knowledge Base Gaps

> Testing where the Seed fails for legal knowledge domains — a stress test for jurisdiction, authority hierarchy, and the legal information vs. legal advice boundary.

## The Domain

Legal knowledge has unique characteristics that stress-test Seed rules:
- Strong jurisdiction dependence (US ≠ UK ≠ EU ≠ international)
- Complex authority hierarchy (constitution → statute → regulation → case law → commentary)
- Critical information vs. advice distinction (legal information is safe; legal advice requires licensing)
- Temporal validity tied to court decisions (still good law vs. overruled)
- Contradictory sources can all be "correct" in different jurisdictions

## Where the Seed Falls Short

### Gap 1: Jurisdiction Tagging is Insufficient

**Current Seed:** Generic location-dependent knowledge guidance.

**Legal Reality:** A knowledge base about "contract formation" needs to track:
- Which jurisdiction's law applies (US federal, US state, UK, EU, UNCISG)
- Whether the rule is universal vs. jurisdiction-specific
- When multiple jurisdictions apply (choice of law)

**Test Failure:** The Seed's simple location tagging can't capture:
- Federal vs. state splits in the US
- Civil vs. common law differences
- Supranational law (EU directives vs. national implementation)

**Proposed Seed Extension:**
```yaml
jurisdiction-type: domestic|foreign|international|supranational
legal-system: common-law|civil-law|religious|hybrid
jurisdiction-scope: federal|state|local|international
applies-where:
  - United States (federal)
  - European Union
choice-of-law: true|false  # when multiple jurisdictions could apply
```

### Gap 2: Authority Hierarchy is One-Dimensional

**Current Seed:** Authority type = expert/publication/institution.

**Legal Reality:** Legal authority has strict hierarchy:
1. Constitutional law (highest authority)
2. Statutes/legislation
3. Regulations/行政法规
4. Case law (precedents)
5. Official commentary
6. Secondary sources (law review articles, treatises)

**Problem:** A "rule" from case law is weaker than a "rule" from statute. But the Seed treats all authority equally.

**Proposed Seed Extension:**
```yaml
legal-authority-level: constitutional|statutory|regulatory|case-law|commentary|secondary
citation: "Statute Name, Section Number"
precedential-weight: binding|persuasive|illustrative
```

### Gap 3: No Rule for Legal Information vs. Legal Advice

**Critical Gap:** The Seed has no guidance on the legal information vs. legal advice boundary.

**Legal Rule:** In most jurisdictions, only licensed attorneys can give "legal advice" (applying law to specific facts). Anyone can give "legal information" (general legal rules).

**Example:**
- "Under the UCC, a contract for goods is enforceable if there is a valid offer, acceptance, and consideration." = Legal information ✓
- "You should sue the vendor for breach of contract." = Legal advice ✗

**Why This Matters for Knowledge Bases:**
- AI agents generating advice could cause liability issues
- Knowledge bases need explicit tagging to avoid crossing the line
- The distinction affects how knowledge should be phrased (general vs. specific)

**Proposed Seed Rule:**
> **Rule:** Distinguish legal information from legal advice — general legal rules are information; applying law to specific facts is advice and requires explicit disclaimer.
> **Why:** AI-generated knowledge bases can inadvertently cross into unlicensed practice if advice is embedded in notes.
> **Test:** (1) Does the note apply legal rules to specific facts? (2) Is there an explicit disclaimer? (3) Could a reader reasonably interpret this as legal advice?

**Implementation:**
```yaml
legal-content-type: information|advice
disclaimer-required: true
disclaimer-text: "This is legal information, not legal advice. Consult a licensed attorney for advice about your specific situation."
```

### Gap 4: Temporal Validity for Case Law

**Current Seed:** Generic temporal validity windows.

**Legal Reality:** Case law has complex temporal status:
- "Good law" — still valid precedent
- "Overruled" — explicitly rejected by later court
- "Distinguished" — still valid but not applicable to these facts
- "Implicitly overruled" — not directly addressed but incompatible with later decisions

**Proposed Seed Extension:**
```yaml
legal-status: good-law|overruled|distinguished|implicitly-overruled
overruled-by:
  - case-name: "Brown v. Board"
    citation: "347 U.S. 483"
    date: "1954-05-17"
distinguished-by:
  - case-name: "Smith v. Jones"
    citation: "123 F.2d 456"
    date: "2020-03-15"
```

### Gap 5: Contradictory Jurisdiction Sources

**Current Seed:** Contradictory sources handling is generic.

**Legal Reality:** Different jurisdictions can have directly contradictory rules, and BOTH can be correct within their scope.

**Example:** 
- US: "Employment is at-will unless there's a contract"
- EU: "Employment requires written contract with minimum terms"
- Both are "correct" within their jurisdiction.

**Problem:** The Seed's contradiction handling assumes one source is wrong. In legal knowledge, contradictory sources can both be right — the issue is scope.

**Proposed Seed Extension:**
```yaml
contradiction-handling:
  type: jurisdiction-conflict  # NEW type
  resolution: "Apply based on applicable jurisdiction"
  scope-condition: "Determine which jurisdiction's law applies to the specific facts"
```

## Related Seed Rules That Need Updates

- [[Seed Rule - Canonical Domain Structures]] — needs legal domain profile
- [[Seed Gap - Jurisdiction and Legal Authority Type Handling]] — existing gap, this exploration supersedes
- [[Frontier Exploration - Domain-Specific Knowledge Bases]] — general, needs legal-specific guidance
- [[Seed Gap - Legal Knowledge Base Handling]] — existing gap
- [[Handling Contradictory Sources]] — needs jurisdiction-conflict type

## Test Scenarios

### Test 1: Jurisdiction Tagging
Can you build a note about "contract formation" that correctly identifies which jurisdiction's law applies and tags accordingly?

### Test 2: Authority Weighting
Can you prioritize a statutory rule over a case-law rule when they conflict?

### Test 3: Information vs. Advice Boundary
Can you identify when a note crosses from legal information into legal advice?

### Test 4: Temporal Status
Can you track whether a case is still good law or has been overruled?

### Test 5: Jurisdiction Conflicts
Can you handle two contradictory rules from different jurisdictions without declaring one "wrong"?

## Resolution Pathway

This gap cluster suggests the Seed needs a "Jurisdiction-Aware Knowledge" framework that extends the current location-dependent rules with:

1. Multi-level jurisdiction tagging (federal/state/international)
2. Authority hierarchy with weight assignment
3. Domain-specific content type tagging (information vs. advice)
4. Temporal status tracking for precedent-based knowledge
5. Contradiction type recognition (error vs. jurisdiction-scope conflict)

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Gap - Jurisdiction and Legal Authority Type Handling]]
- [[Frontier Exploration - Cross-Jurisdictional Legal Knowledge Handling]]
- [[Frontier Exploration - Liability-Excluding Knowledge]]
