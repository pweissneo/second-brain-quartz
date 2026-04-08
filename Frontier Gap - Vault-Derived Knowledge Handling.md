---
last-reviewed: 2026-04-08

knowledge-type: meta
access-pattern: decision
retrieval-mode: hybrid
verification-approach: self-consistency
confidence: medium
lifecycle: emerging
gap-status: identified
gap-priority: medium
gap-phase: discovery
discovered: 2026-04-05
---

# Frontier Gap: Vault-Derived Knowledge Handling

## The Problem

The Seed tracks knowledge source types (intuition, analysis, authority, experiment) and synthesis methods (cross-source, inductive, deductive, analogical). But there's a gap: **knowledge that emerges from the vault itself** — insights derived by combining, extrapolating, or inferring from multiple existing notes.

This is second-order knowledge that didn't come from external sources. It was synthesized by the AI from the knowledge base's existing content.

## Examples

- An agent combines principles from "learning" and "spaced repetition" notes to derive a personalized study methodology that wasn't in any single source
- An agent identifies a pattern across 20 woodworking notes and creates a meta-principle about tool selection that no source explicitly states
- An agent infers a domain-specific heuristic from Seed rules applied to a new domain (e.g., "5-1 ratio applies to cooking, but what about seasoning intensity?")

## Why It Matters

1. **Verification is different** — Source knowledge can be traced to external verification. Vault-derived knowledge can only be verified through internal consistency and cross-domain stress testing.

2. **Confidence should be lower** — Derived principles have less grounding than source-backed knowledge. The Seed currently doesn't distinguish this.

3. **Derivation chains matter** — If the source notes change, the derived knowledge may need re-evaluation. There's no mechanism to track this dependency.

4. **Attribution is unclear** — If derived knowledge turns out to be wrong, who/what is responsible? The sources? The AI that derived it?

## Current Seed Coverage

The Seed covers:
- Knowledge source type (intuition/analysis/authority/experiment)
- Synthesis metadata (synthesis-sources, synthesis-method)

What's missing:
- Distinction between external-source synthesis and vault-internal derivation
- Verification approach for second-order knowledge
- Derivation chain tracking for dependency-aware updates
- Confidence calibration for derived vs. source-backed knowledge

## Proposed Rule

**Rule:** Tag knowledge derived from vault content (not external sources) with `knowledge-derivation: vault-internal` and track source notes through `derived-from:` with a list of vault note references.

**Why:** The Seed tracks synthesis from external sources but doesn't distinguish knowledge synthesized internally from vault content. This creates verification ambiguity — vault-derived knowledge lacks external grounding and needs different validation.

**Test:** (1) Can you identify notes that are derived from vault content rather than external sources? (2) Do derived notes link back to their source notes? (3) Is confidence appropriately lower for vault-derived knowledge? (4) Is there a mechanism to re-evaluate derived knowledge when source notes change?

**Implementation:**
```yaml
knowledge-derivation: external-source|synthesis|vault-internal
derived-from:
  - [[Note Name]]
  - [[Another Note]]
derivation-method: combination|extrapolation|inference|pattern-identification
derived-confidence: reduced  # vs source confidence
last-derivation-review: 2026-04-05
```

**Verification approach for vault-derived knowledge:**
1. **Cross-domain stress test** — Does the principle hold in a different domain?
2. **Source-note sensitivity** — If any source note changes, does derived knowledge still hold?
3. **Internal consistency** — Does derived knowledge contradict other vault knowledge?
4. **Confidence calibration** — Default to lower confidence until verified through use

## Edge Cases

- **Hybrid derivation** — Knowledge derived from both external sources AND vault content. Tag both: `knowledge-source-type: synthesis` AND `knowledge-derivation: vault-internal` with both external and vault sources.
- **Multi-hop derivation** — Derived knowledge based on other derived knowledge. Track full derivation chain; treat confidence as compounding reduced.
- **Successful derivation** — If vault-derived knowledge proves correct over time, this is evidence for the derivation method. Update confidence accordingly.

## See Also

- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]] (knowledge-type framework)
- [[Frontier Exploration - Knowledge Synthesis Quality]] (synthesis quality)
- [[Seed Refinement - Reasoning Strategy Implementation Gaps]] (reasoning traceability)
- [[AI-Assisted Knowledge Management Seed]] (source type tracking - line ~400)