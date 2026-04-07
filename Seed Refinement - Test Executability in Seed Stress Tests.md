---
last-reviewed: 2026-04-02
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - seed-refinement
  - stress-test
  - testing
  - quality-assurance
---

# Seed Refinement - Test Executability in Seed Stress Tests

**Date:** 2026-04-02
**Method:** SEED_STRESS_TEST
**Domains Analyzed:** Cooking, Woodworking, Philosophy, Medical

---

## Finding: Seed Tests Are Often Descriptive Rather Than Executable

While reviewing Seed Stress Tests across multiple domains, I found that many Seed rules have tests that are **descriptive** (what to check) but not **executable** (how to actually check it programmatically).

### Issue 1: Contradiction Detection Test

**Current Test:**
> Can you identify any pairs of verified notes that directly contradict each other?

**Problem:** This requires scanning all verified note pairs - expensive and difficult to automate. The test tells you WHAT to check but not HOW to efficiently check it.

**Proposed Refinement:**
```markdown
**Test:** Execute: grep -l "verification-status: verified" *.md | wc -l
Then for each verified note:
1. Extract factual claims (statements with true/false assertion)
2. For claims about X, search for claims about NOT-X
3. Flag if both have overlapping validity periods
```

**Simpler Alternative:**
Add frontmatter to notes with factual claims:
```yaml
claim-type: factual|procedural|opinion|preference
factual-claim: "One-sentence summary of what this note claims"
```
Then grep for contradictions by comparing factual-claim values.

### Issue 2: Consensus Level Requires Field Knowledge

**Current Test:**
> Can you identify the consensus level (mainstream/debated/emerging/fringe)?

**Problem:** For unfamiliar domains, an AI cannot determine consensus level without external research. The test assumes domain familiarity.

**Proposed Refinement:**
```markdown
**Test:** For notes with knowledge-type: factual:
1. Does frontmatter include consensus-level: ?
2. If no, is there a gap-note generated for manual review?
3. Can you identify 3+ sources that explicitly disagree?
```

Add to implementation:
```yaml
consensus-determination-source: external-research|explicit-disagreement|human-review-required
```

### Issue 3: Verification Mode Conflict Tests Are Complex

**Current Test:**
> For any note where two verification modes produced different results, is conflict documented?

**Problem:** The test assumes you've already run multiple verification modes. There's no guidance on WHEN to run multiple modes.

**Proposed Refinement:**
Add a **trigger** criterion:
```markdown
**Trigger:** Run multiple verification modes when:
1. Note has knowledge-type: empirical AND confidence: high
2. Note claims universal rule (not domain-specific)
3. Note contradicts existing verified note
4. Note has safety-critical: true

**Test:** For notes matching trigger criteria:
1. Have multiple verification modes been attempted?
2. Is conflict documented if results differ?
```

---

## Edge Case: Embodied Knowledge Defies Standard Tests

Cooking and woodworking stress tests reveal that **embodied knowledge** (sensory cues, tactile feedback, kinesthetic awareness) cannot be verified through standard modes.

### Current Issue:
- Verification modes assume: source check, tool check, or practice check
- Embodied knowledge requires: **sensory interpretation** which is subjective

### Proposed Refinement:
Add new verification mode for embodied knowledge:
```yaml
verification-mode: source|tool|practice|sensory-interpretation
sensory-interpretation-criteria:
  - "Who can interpret this sensory cue?"
  - "What training/experience is required?"
  - "Is there objective correlation (temp, color, sound)?"
```

For embodied knowledge notes:
**Test:** (1) Does note include sensory cues? (2) Are cues described with objective correlates? (3) Is it clear who can interpret (novice/expert)?

---

## Finding: Stress Tests Need Explicit "Pass" Criteria

Many Seed Stress Tests describe what to look for but don't define what "passing" looks like.

### Example - Cooking Stress Test:

**Current:**
> Does the note explore ONE technique comprehensively, or does it bundle distinct sub-techniques?

**Problem:** This is subjective. What counts as "comprehensive"?

**Proposed Pass Criteria:**
> **Pass:** Note covers (1) terminology, (2) technique steps, (3) common mistakes, (4) troubleshooting - OR - explicitly acknowledges "this note covers subset, see also [related notes]"

---

## Summary of Recommended Seed Updates

1. **Add executable scanning commands** to tests where possible
2. **Add claim-type frontmatter** to enable automated contradiction detection
3. **Add consensus-determination-source** to clarify how consensus was determined
4. **Add verification-mode triggers** to clarify when to run multiple modes
5. **Add sensory-interpretation mode** for embodied knowledge domains
6. **Add explicit pass criteria** to stress tests, not just what to check

---

## Related Notes

- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[Seed Stress Test - Philosophy Knowledge Base]]
- [[Seed Refinement - Verification Mode Conflict Resolution]]
