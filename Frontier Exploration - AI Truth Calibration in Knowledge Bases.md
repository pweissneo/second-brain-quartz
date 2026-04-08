---
last-reviewed: 2026-04-07
lifecycle: exploratory
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
tags:
  - frontier-exploration
  - ai-generated
  - truth-calibration
  - hallucination
  - verification
  - agent-truth
---

# Frontier Exploration: AI Truth Calibration in Knowledge Bases

## The Gap

The Seed handles knowledge verification from authoritative sources, experiential verification, and tool-dependent verification — but lacks explicit guidance for knowledge that AI agents generate themselves (synthesis, inference, analogical reasoning) versus knowledge that AI agents retrieve or cite from external sources. When an AI creates new knowledge from its training, there's no provenance chain to verify, no source to check — yet this knowledge may be valuable. The Seed needs a framework for truth calibration of AI-generated content.

## Why This Matters

### The AI Authorship Problem

1. **No provenance chain:** AI-generated knowledge has no citation trail
2. **Unknown training data:** We don't know what the LLM "knows" or where it came from
3. **Confabulation risk:** AIs produce confident-sounding false statements
4. **Self-generated appears verified:** AI agents might treat their own outputs as higherconfidence than warranted
5. **Distinguishing inference from retrieval:** When an AI "knows" something, is it retrieved or synthesized?

## The Knowledge Source Spectrum

| Type | Provenance | Verification Approach |
|------|------------|---------------------|
| External sourced | Clear source citation | Source quality assessment |
| AI synthesized | No source, from training | Confidence calibration |
| AI inferred | Partial reasoning chain | Reasoning validation |
| AI analogical | Source-to-target mapping | Analogy strength check |
| AI remembered | Prior vault content | Internal consistency |

## Proposed Seed Rules

### Rule: Tag AI-Generated Knowledge with Creation Mode

**Why:** Knowledge the AI generates (synthesizes, infers, derives) has different reliability characteristics than knowledge it retrieves or cites. Without explicit tagging, the vault conflates sourced knowledge with self-generated knowledge.

**Test:** For notes created by AI agents: (1) Is there ai-created-mode frontmatter? (2) Can you distinguish retrieved vs. synthesized content? (3) Does confidence reflect creation mode?

**Implementation:**
```yaml
ai-created-mode: retrieved|synthesized|inferred|analogical|remembered
synthesized-from: [reasoning chain or none]
inference-confidence: medium|medium-high|highspeculative
analogy-source: [source domain if analogical]
```

### Rule: Apply Explicit Confidence Calibration for AI Synthesis

**Why:** AI-synthesized knowledge should start at lower confidence than sourced knowledge — the AI doesn't know its training sources, can't verify them, and may confabulate. The Seed needs explicit calibration rules.

**Test:** (1) Do AI-generated notes have appropriately-calibrated confidence? (2) Is there a mechanism to upgrade confidence over time? (3) Are high-confidence AI claims flagged for review?

**Confidence Calibration:**
- Retrieved content: calibrate as if sourced
- Synthesized: default to emerging, require validation
- Inferred: default to emerging, require reasoning check
- Analogical: default to speculative, require mapping validation
- Remembered (from vault): treat as source

### Rule: Track What AI Knows vs. What It Can Verify

**Why:** An AI agent may "know" something (confidently produce it) but lack ability to verify it — either because there's no verification pathway or because it can't access verification tools. The gap between knowledge and verification ability needs explicit tracking.

**Test:** For AI-generated claims: (1) Can the agent verify this claim? (2) Is verification pathway documented? (3) Does confidence reflect verification ability?

**Implementation:**
```yaml
ai-knows: true
ai-can-verify: true|false
verification-pathway: source-check|inference|analogy|none
verification-status: verified|inference-possible|impossible
```

### Rule: Distinguish Hallucination from Creative Inference

**Why:** Not all unverified AI outputs are hallucinations — some are genuinely novel inferences that happen to be untestable. The Seed needs to distinguish between false confabulations and creative leaps.

**Test:** Is there a framework for distinguishing hallucination from plausible-but-unverified inference?

**Framework:**
- **Hallucination:** False factual claim, would be verifiable, isn't
- **Creative inference:** Novel claim, untestable but plausible
- **Category error:** Claim that appears factual but is actually framework-dependent

**Handling:**
- Hallucination: flag-as-false, correct if possible
- Creative inference: calibrate as speculative
- Category error: document framework-dependence

### Rule: Apply Different Trust Weighting by Source Mode

**Why:** In hybrid vaults (AI-assisted creation), knowledge from different sources should receive different trust weights. Treating all notes equally loses important reliability distinctions.

**Test:** Can you calculate trust-weighted confidence for the vault that distinguishes source modes?

**Trust weights:**
- External source (verified): 1.0
- External source (unverified): 0.7
- AI synthesized: 0.5
- AI inferred: 0.4
- AI analogical: 0.3
- AI hallucination suspect: 0.1

## Test Scenario

An AI agent working on a cooking knowledge base produces a note:
- Claims "simmering at low heat prevents toughing meat"
- The agent says this from its training (synthesized)
- No source is cited
- Same claim exists in a source
- Agent doesn't know the source

What's the confidence? What's the verification approach?

## Related Notes

- [[Seed Gap - AI-Synthesized Knowledge Provenance]] — provenance for AIcreated content
- [[Seed Gap - AI Agent Behavior Patterns in Knowledge Management]] — agent behavior in vaults
- [[Seed Gap - Multi-Agent Knowledge Base Coordination]] — coordination between agents
- [[Seed Stress Test - Verification Mode Conflict Resolution in Medical Knowledge]] — conflict resolution patterns