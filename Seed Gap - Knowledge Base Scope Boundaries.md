---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-gap
confidence: medium
author-type: ai-assisted
gap-status: proposed
gap-priority: medium
gap-phase: implementation
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-04-03
---

# Seed Gap - Knowledge Base Scope Boundaries

## The Gap

The Seed provides extensive guidance on **how** to manage knowledge (atomicity, linking, verification, lifecycle), but lacks explicit rules for **what** knowledge belongs in a given vault — and more importantly, what **doesn't**.

Without scope boundaries, vaults tend to grow infinitely. Every interesting piece of knowledge feels "relevant" until the vault becomes a sprawling, unfocused collection. The Seed's current stance ("never declare complete") prevents premature closure but doesn't distinguish between "growing healthily" and "expanding aimlessly."

## Why It Matters

- **Maintenance burden:** Every note requires ongoing verification and maintenance. Unbounded growth creates unsustainable maintenance debt.
- **Retrieval quality:** Large, unfocused vaults have lower signal-to-noise ratios. Relevant knowledge becomes harder to find.
- **Purpose clarity:** A vault without boundaries lacks identity. It's harder for users (and AI agents) to understand what the vault is "for."
- **Opportunity cost:** Resources spent capturing low-priority knowledge are resources not spent deepening high-priority areas.

## What the Seed Currently Covers

The Seed already includes several scope-related rules:

1. **Exclusion Criteria Rule (line ~1467):** "Define explicit exclusion criteria — document what knowledge is systematically excluded and why." Tests for: public utility knowledge, ephemeral knowledge, duplicates, decorative knowledge, scope-violating knowledge, high-maintenance low-value knowledge.

2. **Vault Purpose Rule:** Every vault must have a root note stating purpose in one sentence — this implicitly defines scope.

3. **Domain Allocation Rule:** Tracks domain-level boundaries and portfolio percentages.

4. **Diminishing Returns Rule:** Provides utility-based capture thresholds.

## What's Missing (Distinct from Current Coverage)

1. **Scope definition criteria** — How to determine if a topic belongs in the vault (beyond just exclusion)
2. **Boundary negotiation rules** — How to handle knowledge that "barely" fits
3. **Completion indicators** — What signs suggest a domain is "complete enough"
4. **Scope evolution** — How to adjust boundaries as the vault matures (beyond just allocation rebalancing)

The existing exclusion rule focuses on what to NOT capture. This gap is about defining what the vault IS — the positive identity that guides what gets included, not just excluded.

## Proposed Rule (Refined)

**Rule:** Define explicit scope identity — a one-sentence vault identity statement that captures what the vault IS (not just what it excludes), plus criteria for evaluating borderline topics against this identity.

**Why:** The Seed's exclusion rule (what not to capture) doesn't answer the positive question "what is this vault for?" Without explicit identity, vaults grow as a collection of "not-excluded" items rather than as a coherent knowledge base. The identity statement becomes the decision framework for borderline cases.

**Test:** (1) Can you state the vault's identity in one sentence that distinguishes it from a general "everything interesting" collection? (2) Do you have 3+ criteria for evaluating borderline topics against this identity? (3) When a borderline topic is proposed, can you explain why it fits or doesn't fit using these criteria? (4) Has the identity statement been reviewed in the last 90 days?

**Implementation:** Create an Identity Statement note with:
```yaml
vault-identity: "A [adjective] knowledge base for [audience] focusing on [core domains]"
scope-criteria:
  - criterion: "Relates to core domain X, Y, or Z"
    evaluation: "Does this topic connect to our stated focus areas?"
  - criterion: "Creates unique value beyond public sources"
    evaluation: "Does this contain personal context not available via web search?"
  - criterion: "Fits our audience's needs"
    evaluation: "Would our target audience find this useful?"
borderline-review: quarterly
last-identity-review: 2026-04-03
```

**Completion indicators:** A domain is "complete enough" when:
- All foundational notes exist (prerequisites, core terminology)
- Major subtopics have at least one verified note
- New notes in the domain are predominantly refinement/edge cases rather than foundational gaps
- Retrieval tests return satisfactory results for common queries

## Edge Cases

- **Adjacent knowledge:** Knowledge that's "interesting but not quite X" — how to handle borderline cases
- **Cross-domain scope:** Vaults covering multiple domains need domain-level boundaries
- **Personal vs. impersonal:** Where is the line between personal notes and vault knowledge?
- **Time-bounded scope:** Some vaults should cover a specific time period (e.g., "2024 project") — how to define temporal boundaries
- **Audience scope:** Who is this vault for? Knowledge appropriate for experts may confuse beginners, and vice versa

## Related Notes

- [[Frontier Exploration - Knowledge Exclusion and Boundary Management]] — existing frontier note on boundaries
- [[Frontier Exploration - Domain-Specific Knowledge Bases]] — multi-domain scope handling
- [[The Knowledge Portfolio]] — portfolio-level allocation as boundary mechanism
- [[Best Practice - Selective Capture]] — capture boundaries (operational, not scope-defining)

## Stress Test Scenarios

- **Recipe vault:** Should a recipe vault include nutrition science? Restaurant history? Food photography tips?
- **Programming vault:** Should it include hardware specs? Company culture? Career advice?
- **Personal vault:** Where's the line between "knowledge I want to remember" and "personal diary"?

---

**Note:** This gap overlaps with [[Seed Gap - Domain-Level Resource Allocation]] but addresses different aspects: resource allocation is about *how much* to invest in each domain, scope boundaries are about *what* belongs in the vault at all.