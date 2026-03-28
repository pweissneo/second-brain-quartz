---
last-reviewed: 2026-03-28
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - diminishing-returns
  - domain-adaptation
  - stress-test
---

# Seed Refinement: Diminishing Returns Testing Across Domains

> Synthesizing insights from multiple Seed stress tests to propose a refined rule for diminishing returns testing.
> Date: 2026-03-28

## Background

The current Seed rule for diminishing returns testing states:

> **Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility (improves vault answers), connection (links to 2+ existing naturally), uniqueness (adds new knowledge), effort (maintenance worth value).

This rule has been stress tested across multiple domains:
- Medical knowledge bases
- Machine Learning/Data Science
- Board game design
- Legal knowledge bases
- Veterinary medicine
- Cooking/culinary arts

## Cross-Domain Findings

### Issue 1: Binary Threshold Doesn't Account for Domain Context

The current test uses a binary pass/fail (fails 2+ = skip). But different domains have different risk profiles:

| Domain | Risk of Marginal Note | Risk of Missing Note |
|--------|----------------------|----------------------|
| Medical | Misleading advice | Missing critical knowledge |
| ML/DS | Outdated version | Tutorial gap |
| Legal | Incorrect precedent | Missing authority |
| Veterinary | Species error | Rare condition |

**Proposed Refinement:** Add domain-context modifier to the threshold:
```yaml
domain-risk-profile: high-stakes|rapid-evolution|high-variance|standard
stakes-modifier: 1.0  # multiply failures allowed
```

### Issue 2: Utility Test Ignores Temporal Dimension

In ML/DS and technical domains, utility is time-dependent. A note about "TensorFlow 1.x" was high utility in 2018, zero in 2026. The test doesn't account for this.

**Proposed Refinement:** Add temporal utility assessment:
```yaml
utility-timeline: current|declining|expiring|expired
version-scope: "1.0-2.0"  # version range where applicable
framework-status: active|deprecated|legacy
```

### Issue 3: Uniqueness Is Contextual, Not Global

The uniqueness test asks "is this new knowledge?" but misses that personal context makes knowledge unique even if the concept exists elsewhere.

**Proposed Refinement:** Reframe uniqueness as contextual:
```yaml
uniqueness-type: global-concept|personal-context|implementation-specific
has-personal-context: true|false
external-availability: high|medium|low  # how easily found online
```

### Issue 4: Critical Knowledge Exemptions Missing

The current rule doesn't account for notes that should be captured even if they fail tests:
- Rare medical conditions (low utility but critical for completeness)
- Emergency protocols (low connection but high actual utility)
- Foundational prerequisites (may not connect yet but needed for understanding)
- Design exploration notes (fail all tests but essential for ideation)

**Proposed Refinement:** Add override conditions:
```yaml
override-diminishing-returns: true
override-reason: rare-condition|emergency-protocol|prerequisite|design-ideation|criticality
criticality-level: low|medium|high|critical
```

### Issue 5: Stakes Weighting Absent

High-stakes domains (medical, legal, veterinary) have asymmetric costs — missing a note can cause harm, while a marginal note causes confusion.

**Proposed Refinement:** Add stakes weighting:
```yaml
stakes: none|low|medium|high|critical
stakes-weight: 1.0  # adjust threshold: fail-allowed * stakes-weight
```

## Proposed Refined Rule

**Rule (REFINED):** Apply diminishing returns testing with domain-specific modifications — adjust thresholds based on domain risk profile, account for temporal utility decay, recognize contextual uniqueness, and exempt critical knowledge from standard testing.

**Why:** The original rule is sound but binary. Different domains have different risk profiles where the cost of missing a note vs. adding a marginal note differs. Without domain-specific modifications, AI agents either skip too much (missing rare but critical knowledge) or add too much (bloating with version-specific or redundant content).

**Test:** 
1. For each note being considered: can you identify its domain risk profile?
2. Does the note pass OR have an override condition (criticality, rare condition, prerequisite)?
3. Is temporal utility assessed for version-sensitive knowledge?
4. Is uniqueness measured against available resources, not just existence?

**Implementation:** Use extended frontmatter:
```yaml
diminishing-returns:
  utility-score: 0-3
  connection-score: 0-3
  uniqueness-score: 0-3
  effort-score: 0-3
  failures: 0-4
  passed: true|false
  domain-modifier: standard|strict|relaxed
  override-applied: true|false
  override-reason: null|rare-condition|emergency|prerequisite|design-ideation|criticality
  
# Domain-specific fields
domain-risk-profile: standard|rapid-evolution|high-variance|high-stakes
utility-timeline: current|declining|expiring|expired
stakes: none|low|medium|high|critical
version-scope: "optional version range"
uniqueness-type: global|contextual|implementation
has-personal-context: true|false
```

**Threshold Guidance:**
- **Standard (default):** Skip if fails 2+ tests
- **Strict (high-stakes):** Skip if fails 1+ tests — medical, legal, veterinary
- **Relaxed (exploration):** Skip if fails 3+ tests — early-stage vault, creative domains

**Override Conditions (always capture):**
- `criticality: critical` — life safety, critical procedures
- `rare-condition: true` — completeness matters even with low utility
- `prerequisite: true` — foundational for understanding other notes
- `design-phase: ideation` — creative exploration, not final knowledge
- `emergency-protocol: true` — essential for emergency reference

## Relationship to Existing Seed Rules

This refinement complements:
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]] — original stress test
- [[Seed Stress Test - Legal Knowledge Bases]] — legal domain modifications
- [[Seed Stress Test - Veterinary Medicine Knowledge Base]] — veterinary domain modifications
- [[Seed Stress Test - 5-1 Ratio Across Domains]] — personal-to-general ratio

## Recommendation

Add this refined rule as an edge case or extension to the existing diminishing returns rule in the Seed. The core insight (don't add marginal notes) remains valid; the implementation needs domain-specific adaptations.

---

**Note:** This is a seed refinement proposal, not yet part of the core Seed. Test against your vault before promoting to Seed proper.