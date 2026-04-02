---
last-reviewed: 2026-03-29
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
gap-type: seed-missing
gap-status: identified
gap-priority: medium
gap-source: frontier-exploration
discovered: 2026-03-26
schema-version: "1.0"
---

## What Is AI-Synthesized Knowledge?

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

## Examples

### Example 1: Cross-Domain Pattern Recognition
- Source A: "Exercise improves mood through endorphin release"
- Source B: "Social connection improves mood through oxytocin"
- AI Synthesis: "Physical social activities may compound mood benefits through multiple neurotransmitter pathways"

### Example 2: Practical Implication Synthesis
- Source A: "Coffee has 95mg caffeine per cup"
- Source B: "Caffeine has 5-hour half-life"
- Source C: "Adults should sleep 7-9 hours"
- AI Synthesis: "Stop caffeine by 2pm to ensure sleep quality"

### Example 3: Framework Transfer
- Source A: (Business) "Market segmentation improves targeting"
- Source B: (Education) "Differentiated instruction improves learning"
- AI Synthesis: "Personalization works by matching approach to segment characteristics"

### Example 4: Cooking Synthesis (from complementary note)
When combining:
- [[Maillard Reaction]] (chemical principle)
- [[Temperature Guide]] (practical thresholds)
- [[Searing Techniques]] (method knowledge)

To produce: "Searing creates flavor compounds through the Maillard reaction at 280°F+ surface temperature"

This synthesis needs metadata documenting:
- Sources combined
- Reasoning chain (high heat → maillard → flavor)
- That this is a synthesis, not a direct source claim
- Confidence calibration appropriate for cross-domain synthesis

---

# Frontier Exploration - AI Synthesis Provenance

## The Gap

The Seed tracks knowledge source types (intuition, analysis, authority, experiment) but lacks guidance for **AI-synthesized knowledge** — conclusions derived from combining multiple sources through reasoning chains that aren't explicitly documented anywhere.

When an AI agent synthesizes new knowledge from 3+ sources, the resulting insight isn't verifiable through any single source. It's "emergent knowledge" that exists only because of the synthesis. This is distinct from:
- **Source verification**: Checking if sources say X
- **Authority weighting**: Choosing which source to trust
- **Personal experience**: What you tried and what happened

The synthesis itself IS the source.

## Why This Matters

Without synthesis provenance tracking:
1. AI agents cannot distinguish "I reasoned this out" from "I read this somewhere"
2. Verification attempts fail — no single source to verify against
3. Confidence miscalibration — synthesized knowledge might be more or less reliable than source-based
4. Re-synthesis is invisible — if sources change, the synthesis may need updating but there's no audit trail

## Proposed Rule

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
last-synthesized: 2026-03-26
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

**Distinction from existing rules:**
- Different from `knowledge-source-type: analysis` — analysis applies deductive/statistical methods to data; synthesis combines multiple knowledge pieces
- Different from `synthesis-vs-authority` — inverse authority is about challenging sources; synthesis provenance is about documenting emergence

## Example

When a cooking knowledge base combines:
- [[Maillard Reaction]] (chemical principle)
- [[Temperature Guide]] (practical thresholds)
- [[Searing Techniques]] (method knowledge)

To produce: [[Searing creates flavor compounds through the Maillard reaction at 280°F+ surface temperature]]

This synthesis needs metadata documenting:
- Sources combined
- Reasoning chain (high heat → maillard → flavor)
- That this is a synthesis, not a direct source claim
- Confidence calibration appropriate for cross-domain synthesis

## Connection to Existing Seed Rules

Links to:
- [[AI-Assisted Knowledge Management Seed]] — extends source tracking
- [[Frontier Exploration - AI-Synthesized Knowledge]] — complementary note on synthesis risks
- [[Knowledge Source Type Tracking]] — extends existing source type rule