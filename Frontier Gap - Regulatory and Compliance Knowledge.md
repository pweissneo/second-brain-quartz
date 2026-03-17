---
last-reviewed: 2026-03-16
last-updated: 2026-03-16
lifecycle: emergent
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-gap
  - regulatory
  - compliance
  - legal
---

# Frontier Gap: Regulatory and Compliance Knowledge

Building a knowledge base about consumer products, warranties, safety regulations, or compliance requirements reveals gaps in the Seed's coverage.

## The Problem

Regulatory knowledge has properties that standard Seed rules don't address:

1. **Rapidly changing laws** - A warranty note accurate last month may be legally incorrect today
2. **Jurisdiction stacking** - EU, US federal, US state, UK, CA all have different rules that may conflict
3. **Legal vs practical distinction** - "What the law requires" differs from "what actually protects you"
4. **Liability language** - Compliance knowledge can create liability if presented as advice
5. **Expiration tracking** - Regulations have effective dates, amendment dates, and sunset provisions

## What's Missing from Seed

### Missing Rule: Regulatory Knowledge Dating

**Rule:** Regulatory knowledge notes must include `regulatory-date:` (when the law was captured), `regulatory-valid-until:` (expiration or review date), and `jurisdiction:` tags.
**Why:** Unlike static knowledge, regulatory content has built-in obsolescence. Without explicit dating, AI agents cannot distinguish current regulations from superseded ones.
**Test:** For any regulatory claim: (1) Is there a specific jurisdiction? (2) Is there an effective date? (3) Is there a review trigger (new administration, scheduled review, amendment)?
**Edge case:** Some regulations have no expiration but are subject to enforcement changes. Mark as `regulatory-valid-until: ongoing` with `enforcement-status:` field.

### Missing Rule: Legal Hierarchy Tracking

**Rule:** Distinguish primary sources (statutes, regulations) from secondary (commentary, guides) from tertiary (summaries, blog posts).
**Why:** Legal knowledge hierarchy is explicit - primary sources have binding authority, tertiary do not. The Seed's general source quality rules don't capture this.
**Test:** For any legal claim: Can you trace to primary source? Is the note tagged with `legal-source-tier: primary|secondary|tertiary`?

### Missing Rule: Compliance Scope Mapping

**Rule:** For products/services spanning jurisdictions, map which regulations apply where rather than presenting universal claims.
**Why:** A product sold in EU and US may comply with different standards in each market. Single "this product is compliant" claims are incomplete.
**Test:** For cross-jurisdiction products: Does the note specify which regulation applies in which market?

### Missing Rule: Disclaimer Layering

**Rule:** Compliance notes must have explicit `compliance-disclaimer:` fields distinguishing: (a) what the law requires, (b) what the manufacturer claims, (c) what practical protection provides.
**Why:** "This product meets safety standards" (legal) differs from "This product is safe" (practical). Conflating them misleads readers.
**Test:** Can you separate legal compliance from practical safety from marketing claims?

## Related Frontier Notes

- [[Frontier Exploration - Legal Knowledge Bases]] - More detailed legal KB guidance
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]] - Liability management
- [[Frontier Exploration - Jurisdiction and Region-Dependent Knowledge]] - Geographic scope handling
