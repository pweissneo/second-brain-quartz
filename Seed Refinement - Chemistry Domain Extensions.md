---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-30
lifecycle: evergreen
confidence: emerging
tags:
  - seed-refinement
  - chemistry-domain
  - domain-specific
---

# Seed Refinement: Chemistry Domain Extensions
> Rule extensions for chemistry knowledge bases derived from stress testing.
**Rule:** In chemistry knowledge bases, distinguish procedural content from conceptual content when applying atomicity rules — allow notes >300 words for complete synthesis procedures and lab protocols, but enforce 100-300 word limits for conceptual content (mechanisms, theories, explanations).
**Why:** Chemistry knowledge bases contain two fundamentally different types: (1) executable procedural knowledge (synthesis steps, lab protocols) that must stay together for usability, and (2) conceptual knowledge (reaction mechanisms, theories) that benefits from atomicity. Treating both the same way either breaks procedural content or fragmentizes conceptual content.
**Test:** For notes >300 words: (1) Is this an executable procedure (synthesis, protocol, technique)? (2) Would splitting it make it harder to use in practice? If yes to both, keep together. Otherwise, split into atomic conceptual units.
**Rule:** In chemistry knowledge bases, apply a relaxed 4-hop threshold instead of the standard 3-hop rule — every note must be reachable from `_root.md` in 4 hops or fewer.
**Why:** Chemistry's natural hierarchical organization (element → compound → reaction → mechanism → conditions) creates deep taxonomic paths that legitimately exceed 3 hops. Forcing flatter organization would either create artificial hubs or lose important domain context.
**Test:** Can all chemistry notes reach `_root.md` in ≤4 hops? For notes at hops 5+, either add intermediate hub notes or tag with `deep-taxonomy: true` if the path reflects natural domain structure.
**Rule:** In chemistry knowledge bases, use dual verification status — distinguish "source-verified" (authoritative literature, NIST databases, SDS sheets) from "practically-verified" (personally executed and confirmed).
**Why:** Chemistry verification differs by knowledge type: theoretical data (pKa values, thermodynamic constants) can be verified through authoritative sources without personal execution, but procedural knowledge (synthesis success, technique mastery) requires practical verification. Treating both the same undervalues source verification or overvalues unexecuted procedures.
**Test:** Check frontmatter for `verification-type:` (source|practical|both). For safety-critical procedures, require practical verification. For factual data (constants, properties), source verification is sufficient.
**Rule:** In chemistry knowledge bases, apply `condition-dependent: true` frontmatter to notes where content varies by reaction conditions (solvent, temperature, concentration, catalyst) before marking as contradictory.
**Why:** Apparent contradictions in chemistry often reflect different conditions rather than conflicts. The same reaction can have different yields, rates, or products under different conditions. Flagging as contradictory without checking conditions obscures valuable context-dependent knowledge.
**Test:** Before creating a contradiction note, check if the difference might be due to conditions. Tag with `condition-dependent: true` and document the condition variations.
**Rule:** In chemistry knowledge bases, use explicit `knowledge-type:` frontmatter with values: factual (periodic properties, constants), procedural (syntheses, techniques), conditional (reaction conditions, yields), relational (structure-activity), temporal (reaction rates, stability).
**Why:** Chemistry spans multiple knowledge types that behave differently. Factual knowledge (constants) is stable; procedural knowledge (syntheses) is executable; conditional knowledge (conditions) is context-dependent. Treating all as generic notes loses this distinction.
**Test:** Does each chemistry note have explicit `knowledge-type:` frontmatter? Are knowledge-type-specific rules applied (e.g., procedural notes allow >300 words)?
**Rule:** In chemistry knowledge bases, preemptively tag foundational concepts with `foundational: true` to avoid false orphan detection — include: atom, molecule, chemical bond, periodic table, mole (unit), chemical reaction, oxidation state.
**Why:** The 2+ links rule may flag foundational chemistry notes as orphans if they're referenced but don't explicitly link out. Preemptively tagging these as foundational ensures they're not flagged while acknowledging they're referenced throughout the vault.
**Test:** Are foundational chemistry concepts tagged with `foundational: true`? Do they have at least 1 outgoing link explaining their role?
---
## Summary
| Extension | Applies To | Override |
|-----------|-----------|----------|
| Relaxed atomicity | Procedural content >300 words | Override standard 100-300 rule |
| 4-hop threshold | All chemistry notes | Override standard 3-hop rule |
| Dual verification | All chemistry notes | Add verification-type field |
| Condition-dependent tags | Notes with apparent contradictions | Before marking contradictory |
| Knowledge-type frontmatter | All chemistry notes | Required field |
| Foundational tags | Core chemistry concepts | Avoid false orphan flags |
## Related
- [[Seed Stress Test - Chemistry Knowledge Base]] — Original stress test that identified these gaps
- [[Seed Development Hub]] — Hub for all seed refinements and extensions
- [[Seed Refinement - Assembly Process Type Extensions]] — Similar domain extension pattern
- [[Seed Refinement - Knowledge Source Type Domain Adaptation]] — Verification type refinement approach
- [[Seed Refinement - Domain-Velocity-Aware Confidence Decay]] — Related confidence decay rules
- [[Frontier Exploration - Dual-Nature Domain Handling]] — Context for domain-specific overrides
- [[Handling Contradictory Sources]] — General contradiction handling (chemistry uses `condition-dependent` flag)
