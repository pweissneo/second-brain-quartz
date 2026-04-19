---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: emerging
confidence: high
tags:
  - seed-refinement
  - capture-sequence
  - bootstrap
  - domain-agnostic
---

# Seed Refinement: Domain-Aware Capture Sequence Test Executability

## Problem Identified

The domain-aware capture sequence rule (added 2026-04-06) has a test that is not executable by AI in unfamiliar domains.

**Original test asks AI to:**
1. Identify the first 5 concepts to capture in the correct phase order
2. Explain WHY that sequence  
3. Determine when to switch from "building foundations" to "filling gaps"

**The problem:** These require domain knowledge that AI doesn't have when bootstrapping an unfamiliar domain. The test conflates:
- **Explicit requirements** (safety in phase 1) — verifiable by AI
- **Domain-specific identification** (what are the foundations of pottery?) — not verifiable by AI without existing expertise

## Refined Rule

**Rule (REFINED 2026-04-07):** Apply domain-aware capture sequence during bootstrap — capture in order: (1) Safety-critical knowledge (what could cause harm), (2) Core principles and essential techniques, (3) Materials and tools, (4) Standard procedures, (5) Advanced applications.

**Why:** The Seed covers what to capture and when to create notes but provides no guidance for determining capture SEQUENCE in unfamiliar domains. Without explicit sequencing, agents default to encounter-order or interest-driven capture, producing suboptimal vault structures where safety knowledge is delayed, foundations are mixed with applications, and the graph develops in the wrong order.

**Test (REFINED):** For a new domain bootstrap:
1. Is there explicit capture-sequence documentation (note or frontmatter) listing the phase order?
2. Does the documentation mention safety-critical knowledge first?
3. Are phase transition criteria explicitly defined?
4. Is the 50/30/20 bootstrap allocation (foundations/applications/exploration) applied or planned?
5. For agents with domain knowledge: Can you identify the first 5 concepts in correct phase order?

**Implementation:** Use frontmatter to track bootstrap phase:
```yaml
bootstrap-capture-phase: foundations|applications|transitioning
capture-sequence-documented: true
safety-documented-first: true
phase-transition-criteria: "explicit criteria for when to transition"
bootstrap-allocation: "50/30/20 or custom ratio"
```

**For AI agents in unfamiliar domains:** The test verifies that explicit documentation exists. The AI should create or request capture-sequence documentation rather than trying to infer domain fundamentals from nothing.

**For AI agents with domain knowledge:** The full test applies — identify concepts, explain sequence, determine transition timing.

## Rationale

The refinement separates "can the AI execute this?" from "is the vault doing it correctly?" by:
1. Making basic compliance testable by any AI (documentation exists)
2. Making full effectiveness testable by knowledgeable AI (correct identification)
3. Adding frontmatter tracking to make progress measurable

This maintains the rule's intent (proper sequencing) while removing the assumption that AI has domain knowledge it may not have.

## Related

- [[Seed Gap - Domain-Aware Capture Sequence Test Executability]] — Gap that identified this issue
- [[AI-Assisted Knowledge Management Seed.md]] — Original rule (line 186)
- [[Frontier Exploration - Capture Priority Sequence for Unfamiliar Domains]] — Original frontier note