---
last-reviewed: 2026-04-04
knowledge-type: meta
last-updated: 2026-04-04
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: verified
gap-status: identified
gap-priority: high
gap-type: seed-extension
tags:
  - frontier-exploration
  - ai-verification
  - ai-synthesis
  - provenance
  - knowledge-source
level: frontier
problem-type: verification
---

# Frontier Exploration - AI Knowledge Provenance and Verification

This note consolidates guidance on both: (1) tracking AI-synthesized knowledge provenance when you create it, and (2) detecting and verifying AI-generated content in external sources.

> **Origins:** This note merges content from "Frontier Exploration - AI Synthesis Provenance" and "Frontier Exploration - AI-Generated Knowledge Detection and Verification" to eliminate redundancy while preserving both perspectives.

---

## Part 1: AI-Synthesized Knowledge Provenance

### What Is AI-Synthesized Knowledge?

AI-synthesized knowledge differs from:
- **Copying**: Reproducing what a source says
- **Summarizing**: Condensing a single source
- **Translating**: Converting between formats
- **Inferring**: Drawing direct conclusions (syllogistic)

AI synthesis involves:
- Combining insights from multiple sources
- Identifying patterns across domains
- Creating novel connections
- Generating actionable insights from existing knowledge

### Proposed Rule

**Rule:** Tag AI-synthesized knowledge with synthesis metadata — document the sources combined, the reasoning chain, and explicit confidence calibration based on synthesis depth.

**Why:** AI agents need to be explicit about where knowledge came from. Synthesis knowledge has different reliability characteristics than source knowledge. Without explicit tagging, AI agents and human users cannot appropriately weight this knowledge.

**Test:** For knowledge claims used in decisions: (1) Can you identify whether this was read (source), experienced (personal), or synthesized (reasoning)? (2) Does synthesized knowledge document the source chain? (3) Is confidence appropriately calibrated (synthesis typically lower than direct source)?

**Implementation:**
```yaml
knowledge-source-type: synthesis
synthesis-type: cross-source|inductive|deductive|analogical
synthesis-sources:
  - [[Note A]]
  - [[Note B]]  
  - [[Note C]]
reasoning-chain: "Step-by-step explanation of how sources combine to yield this insight"
synthesis-confidence-calibration: high|medium|low  # typically lower than single-source
synthesis-validity-conditions: "What would make this synthesis invalid"
last-synthesized: 2026-04-04
```

**Synthesis types:**
- **Cross-source**: Combining multiple sources to create new insight (e.g., "A says X, B says Y, therefore Z")
- **Inductive**: Generalizing from specific instances to broader principle
- **Deductive**: Applying general principles to specific cases
- **Analogical**: Mapping knowledge from one domain to another

**Confidence calibration:**
- Single authoritative source → high confidence
- Multiple independent sources agreeing → high confidence  
- Cross-source synthesis with clear reasoning → medium-high confidence
- Analogical transfer from distant domain → medium-low confidence
- Inductive generalization from few instances → low confidence

### Distinction from Existing Rules

- Different from `knowledge-source-type: analysis` — analysis applies deductive/statistical methods to data; synthesis combines multiple knowledge pieces
- Different from `synthesis-vs-authority` — inverse authority is about challenging sources; synthesis provenance is about documenting emergence
- Related to `author-type: ai-assisted` — tracks whether content was AI-generated vs human-authored

---

## Part 2: AI-Generated Content Detection and Verification

### The Problem

When building a knowledge base from sources (articles, books, documents), an AI agent may encounter content that was:
- Written entirely by humans (traditional verification)
- Written by AI and presented as human content
- A mix of human and AI content (AI-assisted writing is common)
- Synthesized by AI but presented without disclosure

Current Seed rules assume source provenance is known. The verification rules work when you can categorize a source as "peer-reviewed article" or "personal blog." But AI-generated content often masquerades as human-written content, and detecting it requires different methods.

### Why This Matters for Knowledge Management

1. **Prevalence** — AI writing tools are ubiquitous; much "human-written" content now has AI involvement
2. **Quality variance** — AI content ranges from excellent to hallucinated; can't assume reliability
3. **Verification failure** — Traditional source quality checks (peer review, author credentials) don't apply to AI content
4. **Disclosure gaps** — Most AI-generated content is not labeled as such
5. **Multi-layered** — AI content may cite human sources, creating nested verification challenges

### Detection Heuristics

Stylistic markers that suggest AI generation:
- **Over-generalization** — Claims without specific evidence or examples
- **Formulaic structure** — predictable paragraph patterns, overly clean transitions
- **Missing nuance** — Binary framing (pros/cons, benefits/drawbacks) without context
- **Citation absence** — Making claims that would normally require sources but citing none
- **Inconsistent specificity** — Mixing highly specific technical terms with vague abstractions
- **Tonal uniformity** — No personality, hedging patterns that feel mechanical

**Important:** These are heuristics, not proofs. Human writers can exhibit these patterns; AI can avoid them. But these markers help prioritize verification effort.

### Verification Protocol

For suspected AI content, apply layered verification:

1. **Claim isolation** — Extract specific factual claims from the text
2. **Source triangulation** — Verify claims against 2+ independent sources (prefer human-authored)
3. **Consistency check** — Does the AI content contradict itself or other AI content on the same topic?
4. **Temporal validation** — Check if knowledge requires up-to-date information (AI training cutoff matters)
5. **Domain expert review** — For high-stakes domains, flag for human expert review

### Trust Threshold Framework

| Confidence Source | AI Content | Human Content |
|-------------------|------------|---------------|
| Peer-reviewed | Accept (verify date) | Accept |
| Established author | Flag for date check | Accept |
| Unknown source | Reject/verify heavily | Verify basics |
| Self-published | Reject | Verify basics |

For AI-suspected content from unknown sources: default to verification burden = high.

### Domain-Specific Considerations

- **Technical/programming** — High hallucination rate; verify code examples independently
- **Medical/health** — Critical; AI medical advice can be dangerous; require expert review
- **Historical** — AI may confidently state false historical "facts"; verify dates and sources
- **Creative/literary** — AI can produce competent but derivative work; different quality bar
- **News/current events** — AI training cutoff means outdated; check date aggressively

---

## Test Questions

1. When creating AI-synthesized knowledge, do you document the sources combined and reasoning chain?
2. When encountering a source with AI-like stylistic markers, do you have a verification protocol?
3. Does verification burden increase for suspected AI content (more sources, date checks, expert review)?
4. Do you treat AI-suspected content differently in high-stakes domains (medical, legal, technical)?
5. Can you distinguish between AI-translated, AI-assisted, and AI-generated content?

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — foundation rules on source tracking
- [[Confidence Markers]] — confidence levels and calibration
- [[Handling Contradictory Sources]] — AI content may contain systematic errors
- [[Best Practice - Multi-Source Synthesis]] — synthesis best practices
- [[Seed Gap - Staleness Detection vs. Staleness Computation]] — AI knowledge ages differently
- [[Verification Hierarchy]] — verification priority system