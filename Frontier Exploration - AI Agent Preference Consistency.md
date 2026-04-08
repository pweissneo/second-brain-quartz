---
knowledge-type: structural
last-reviewed: 2026-04-04
last-updated: 2026-04-04
confidence: emerging
author-type: ai-assisted
lifecycle: evergreen
level: frontier-exploration
verification-status: unverified
verification-mode: source
retrieval-mode: hybrid
tags:
  - frontier-exploration
  - multi-agent
  - collaboration
  - consistency
---

# Frontier Exploration - AI Agent Preference Consistency in Collaborative Knowledge Bases

## The Gap

The Seed provides extensive guidance on single-agent knowledge management: capture, verification, organization, retrieval. It also covers multi-agent coordination at the structural level (who owns which notes, conflict resolution). However, there's a gap in how multiple AI agents maintain consistent **treatment philosophy** when working on the same vault.

When multiple AI agents contribute to a knowledge base:
- Different agents may apply different verification rigor to similar notes
- Capture thresholds may vary (one agent is conservative, another is liberal)
- Linking styles may diverge (one uses many links, one uses few)
- Confidence calibration may be inconsistent
- Naming conventions may drift over time

Without explicit preference alignment, the vault develops internal inconsistency that undermines its coherence — even if structural rules are followed.

## Why This Matters

1. **Inconsistent quality**: A reader can't trust that "verified" means the same thing across notes
2. **Hidden fragmentation**: Different agent "styles" create invisible sub-vaults within the vault
3. **Maintenance confusion**: When an agent revisits another agent's notes, unclear what standards to apply
4. **Verification drift**: Verification ratios may look healthy but mask inconsistency across agents

## What the Seed Currently Covers

The Seed has rules for:
- [[Seed Rule Addition - Multi-Agent Knowledge Base Coordination]] — structural coordination
- [[Seed Refinement - Multi-Framework Domain Reasoning]] — reasoning consistency
- Confidence markers across domains
- Verification priority hierarchies

**What's missing:**
- No rule for preference/standard alignment between agents
- No mechanism for calibrating agent "strictness" consistently
- No shared vocabulary for treatment decisions beyond frontmatter

## Proposed Approach: Preference Alignment Protocol

**Rule:** When multiple AI agents contribute to a knowledge base, establish and document explicit preference alignment rules that all agents commit to following.

**Why:** Structural coordination ensures notes don't conflict, but treatment coordination ensures notes receive consistent quality treatment. Without preference alignment, identical knowledge may receive different verification, capture, or confidence treatment depending on which agent last touched it.

**Test:** (1) Can you identify preference alignment rules that all agents follow? (2) Do similar notes receive similar treatment regardless of which agent created or modified them? (3) Can a new agent joining the vault quickly understand the established treatment philosophy?

### Preference Categories to Align

1. **Capture threshold**: When is knowledge worth adding?
   - Conservative: Only if it passes 3+ utility criteria
   - Liberal: Add if it passes 1+ utility criteria
   - Document the threshold explicitly

2. **Verification rigor**: When is verification "complete"?
   - Strict: Require 3+ independent sources
   - Moderate: Require 2+ sources or 1 authoritative
   - Lenient: Self-consistency is sufficient
   - Document by knowledge type

3. **Linking density**: How many outgoing links per note?
   - Dense: 5+ links per note
   - Moderate: 2-4 links per note  
   - Sparse: 1-2 links per note
   - Document minimum/maximum by note type

4. **Confidence calibration**: When to use each level?
   - High: Verified by 3+ independent sources, consensus mainstream
   - Medium: Verified by 1-2 sources, or single authoritative source
   - Low: Unverified but internally consistent
   - Emerging: Novel observation, not yet validated

5. **Naming conventions**: Document all sub-conventions
   - Note title patterns
   - Tag conventions
   - Frontmatter usage

### Implementation

```yaml
# In a shared agent-preferences.md file
preference-alignment:
  capture-threshold: "2+ utility criteria must pass"
  verification-rigor:
    procedural: "2+ sources or 1 authoritative"
    conceptual: "logical consistency + 1+ source"
    factual: "2+ independent sources"
    experiential: "self-consistency + reflection"
  linking-density:
    default: "2-5 outgoing links"
    reference-note: "1-3 links"
    hub-note: "5-10 links"
  confidence-usage:
    high: "verified by 3+ sources, consensus mainstream"
    medium: "verified by 1-2 sources"
    low: "internally consistent, unverified"
    emerging: "novel observation, not yet validated"
  naming-convention: "descriptive-noun-phrase"
  sub-conventions:
    equipment: "model numbers (A7IV, R5)"
    technique: "action-object pattern"
```

### New Agent Onboarding

When an AI agent begins working on a vault:
1. Read agent-preferences.md (or equivalent)
2. Audit 5 random notes to calibrate to existing style
3. Apply preference alignment to all new contributions
4. Flag any preferences that seem inconsistent with vault patterns

### Periodic Calibration

Quarterly check that:
1. New notes follow preference alignment
2. No drift in verification ratios (would indicate rigor drift)
3. No drift in linking density (would indicate style drift)
4. No drift in confidence usage (would indicate calibration drift)

## Edge Cases

1. **Single-agent vault**: Preferences still useful for continuity across sessions; treat "past self" as "other agent"

2. **Agent model upgrades**: When agent model changes, may need recalibration — audit 10 notes after model change

3. **Human-AI collaboration**: When humans add notes, may apply different standards — document human-added notes differently if needed

4. **Different agent capabilities**: Some agents may have different verification abilities — adjust preference alignment for capability differences

## Test for AI Agents

1. Can you find the preference alignment rules for this vault?
2. Do recent notes follow these preferences?
3. When you create a new note, does it align with existing style?
4. Can you detect if notes were created by different "agents" with different styles?

## Related Seed Rules

- [[Seed Rule Addition - Multi-Agent Knowledge Base Coordination]] — structural coordination
- [[Seed Refinement - Multi-Framework Domain Reasoning]] — reasoning consistency
- [[Seed Stress Test - Confidence Markers Rule Across Domains]] — confidence calibration
- [[Linking Principle]] — link quality standards
- [[Best Practice - Progress Over Perfection]] — capture threshold guidance
