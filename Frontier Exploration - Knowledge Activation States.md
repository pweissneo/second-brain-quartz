---
last-reviewed: 2026-03-16
confidence: emerging
author-type: ai-assisted
lifecycle: deprecated
review-by: 2026-03-21
tags:
  - frontier-exploration
  - knowledge-activation
  - staging
  - processing
---

# Frontier Exploration: Knowledge Activation States

> ⚠️ **DEPRECATED**: This concept has been adopted into the Seed. See: [[AI-Assisted Knowledge Management Seed#activation-state]] for the current rules.

This frontier exploration proposed tracking when captured knowledge becomes "ready" for practical application — distinct from lifecycle stages (draft → active → evergreen).

## Status: Adopted into Seed

The proposed rules below have been adopted into the Seed. See [[AI-Assisted Knowledge Management Seed]] for the canonical version.

## Original Proposal (Archived)

### The Gap

The Seed provides:
- Staging states (whisper, draft, probe)
- Lifecycle stages (draft → active → evergreen → deprecated → archived)
- Confidence markers (high, emerging, disputed, obsolete)

But the Seed doesn't address:
- When knowledge is "ready" to inform decisions
- What threshold of completeness makes knowledge actionable
- How to track knowledge that's "almost ready" but needs one more piece
- The difference between "captured" and "deployable" knowledge

### Why This Matters

Consider these scenarios:

**Scenario 1: Incomplete Capture**
You capture a key insight from a podcast: "The key to X is Y" — but you didn't note which podcast, when, or the context. The knowledge is captured but not verifiable.

**Scenario 2: Partial Synthesis**
You have notes about the pros and cons of framework A vs framework B, but you haven't written the synthesis note that actually makes the comparison actionable.

**Scenario 3: Unverified Procedure**
You captured a recipe from a blog — but you haven't tried it yet. The procedure exists but isn't verified.

**Scenario 4: Out-of-Date but Usable**
You have notes about "best practices for 2023" — still useful but may need updating.

The Seed's lifecycle stages don't capture this "readiness" dimension. A note can be "active" but not yet ready to inform decisions.

## Adopted Rules Summary

| Rule | Seed Location |
|------|---------------|
| Track knowledge activation state separately from lifecycle | [[AI-Assisted Knowledge Management Seed#activation-state]] |
| Define explicit activation criteria for knowledge types | Same section |
| Include activation state in retrieval results | Same section |

## Test Cases (Preserved for Reference)

### Test Case 1: Research Capture
You capture highlights from 10 papers about topic X.
- Current Seed: "Process within 48 hours"
- Gap: After processing, when is it "ready" to inform a decision? After synthesizing all 10? After verifying citations?

### Test Case 2: Procedure Capture  
Someone shares a fix for a common error.
- Current Seed: Use `verification-status: unverified | tested | community-validated`
- Gap: What does it mean for the knowledge to be "ready"? When can you trust it enough to apply in production?

### Test Case 3: Decision Support
You need to make a decision and query your vault.
- Current Seed: No guidance on how to assess whether vault knowledge is "ready"
- Gap: How do you know if the knowledge informing your decision is sufficient?

## Related Concepts

- [[Frontier Exploration - Incomplete and Provisional Knowledge]] — capturing incomplete knowledge in transitional states
- [[Confidence Markers]] — prioritizing review attention
- [[Frontier Exploration - Vault Query Patterns for Decision-Making]]
- [[Confidence Markers]]

## Questions This Raises

1. Is activation tracking worth the overhead, or is lifecycle + confidence sufficient?
2. How granular should activation states be?
3. Should activation be automatic (based on criteria) or manual (explicit tagging)?

## See Also

- [[AI-Assisted Knowledge Management Seed]] — Foundation rules
- [[Handling Temporal Knowledge]] — Related to knowledge currency
- [[Frontier Exploration - Knowledge Debt]] — Connection to incomplete knowledge
