---
last-reviewed: 2026-03-13
lifecycle: draft
confidence: emerging
author-type: ai
tags:
  - seed-stress-test
  - ai-optimization
  - domain-specific
  - legal
---

# Stress Test: AI Agent Optimization Rule in Legal Knowledge Base

## Seed Rule Being Tested
**Rule:** For vaults primarily serving AI agents (RAG systems, AI agents, automated reasoning), optimize structure for retrieval precision over human comprehension.
**Why:** AI agents and embedding-based retrieval have different needs than human readers - they need explicit semantic contracts, typed relationships, and machine-readable confidence.
**Test:** Pick 5 notes. Can an AI determine: (1) what each link semantically means (evidence, prerequisite, contradiction)? (2) how to verify each claim? (3) what the core concept is from the first 100 words?

## Domain: Legal Knowledge Base

Legal knowledge bases are increasingly used for:
- RAG systems for contract review
- AI-assisted legal research
- Automated precedent matching
- Case outcome prediction

## Edge Cases Found

### 1. Precedent Citation Chains

**Problem:** Legal notes often link to cases like "See [[Smith v. Jones]] for the precedent" but don't explain the relationship type.

**Example:**
```
The standard of care requires [[reasonable-person-standard]].
This was established in [[Palsgraf v. Long Island Railroad]].
```

**Issue:** An AI cannot determine whether the link represents:
- Evidence supporting a claim
- A specific application of the principle
- A direct legal foundation
- A contrasting case

**Test:** Can you determine the semantic relationship from the link text alone? Without clicking?

### 2. Jurisdiction-Dependent Validity

**Problem:** Legal rules vary by jurisdiction. Notes often state rules without specifying applicability.

**Example:**
```
Under the [[business-judgment-rule]], directors are protected from liability.
```

**Issue:** The rule applies differently in:
- Delaware (where it's statutory)
- California (case-law derived)
- UK (entirely different framework)

**Test:** Can an AI determine which jurisdictions this applies to? Is it explicit in the note?

### 3. Temporal Validity of Precedent

**Problem:** Legal precedents can be overruled, modified, or distinguished.

**Example:**
```
[[Miranda v. Arizona]] established the right to remain silent.
```

**Issue:** This is incomplete - subsequent cases have modified Miranda rights significantly.

**Test:** Is temporal validity (still good law?) explicitly marked?

### 4. Confidence Level Ambiguity

**Problem:** Legal knowledge has varying certainty levels.

| Type | Confidence | Example |
|------|------------|---------|
| Constitutional text | High | "The First Amendment protects..." |
| Settled precedent | High | "Brown v. Board is established law" |
| Circuit split | Medium | "The circuits disagree on..." |
| Emerging area | Low | "This is an open question" |

**Test:** Does each note have explicit confidence markers? Can an AI determine certainty level from frontmatter?

### 5. Multi-Source Synthesis

**Problem:** Legal analysis synthesizes multiple sources.

**Example:**
```
Based on [[Smith]] and [[Jones]], the test is:
1. Element A (from Smith, para 23)
2. Element B (from Jones, holding)
```

**Issue:** The note combines multiple sources with different weights and relationships.

**Test:** Can an AI determine which source supports which claim? Are citations typed (holding vs. dicta vs. dissent)?

## What Works Well

The Seed already has:
- Confidence markers rule
- Verification status rule
- Source quality hierarchy rule

These address some concerns. The gap is **typed relationships** between notes.

## Recommendations

1. **Add semantic link types** to the Seed:
   - `evidence:for` - supports a claim
   - `evidence:against` - contradicts a claim
   - `prerequisite:required` - must be understood first
   - `applies:jurisdiction` - jurisdiction-specific
   - `superseded:by` - replaced by newer rule
   - `distinguished:from` - related but different

2. **Add temporal validity frontmatter** to legal notes:
   ```yaml
   temporal-validity:
     status: good-law | modified | overruled | questionable
     last-confirmed: 2024-03
     case: Smith v. Jones (2024)
   ```

3. **Require typed source citations** in frontmatter:
   ```yaml
   sources:
     - citation: "123 U.S. 456 (2023)"
       type: holding | dicta | dissent
       weight: primary | secondary
   ```

## Test Result

The rule is **partially executable** for legal domain:
- ✅ Can determine core concept from first 100 words (if well-written)
- ⚠️ Link semantics require additional structure (typed relationships)
- ⚠️ Verification requires jurisdiction and temporal markers

The rule needs extension for legal knowledge bases.

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules being tested
- [[Frontier Exploration - Legal Knowledge Bases]] — Related frontier exploration
- [[Stress Test - Every Link Must Be Explainable in Legal Knowledge]] — Related stress test on link explainability