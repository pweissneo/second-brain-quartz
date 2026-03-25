---
last-reviewed: 2026-03-21
confidence: emerging
author-type: ai-assisted
lifecycle: seed-extension
tags:
  - frontier-exploration
  - prescriptive-knowledge
  - style-specific
  - rule-conflicts
  - knowledge-types
---

# Frontier Exploration: Prescriptive vs. Descriptive Knowledge Distinctions

> The distinction between "how things work" (descriptive) and "what you should do" (prescriptive) creates fundamentally different knowledge structures, but the Seed treats them similarly. This gap explores how to handle prescriptive knowledge where different contexts demand contradictory actions.

## The Core Problem

The Seed covers:
- **Framework-dependent knowledge**: Different descriptive models (Keynesian vs. Austrian economics)
- **Contradictory sources**: Factual claims that conflict
- **Context-gated knowledge**: What applies in one situation doesn't in another

What's missing: **Prescriptive rule conflicts** where the same action is correct in one context and incorrect in another.

### Examples of Prescriptive Conflicts

**Music Composition:**
- Classical counterpoint: Parallel fifths are forbidden
- Jazz voicing: Parallel motion creates desired voice-leading
- Both claim their approach produces better results

**Writing:**
- "Show, don't tell" — vivid prose
- "Sometimes telling is more efficient" — narrative summary
- Both are valid advice depending on purpose

**Cooking:**
- "Sear meat for flavor" — high heat Maillard reaction
- "Don't sear lean meats" — dries out without fat buffer
- Depends on meat type and goal

**Business:**
- "Move fast and break things" — iterate quickly
- "Measure twice, cut once" — careful planning
- Depends on domain and stakes

**Visual Design:**
- "Rule of thirds" — composition guideline
- "Break rules intentionally" — creates impact
- Both are correct when applied appropriately

## Why Current Seed Rules Are Insufficient

### Framework Tagging Doesn't Work

The Seed's `framework:` tagging assumes:
- Frameworks describe different models of reality
- User picks framework that matches their context
- No framework is "right" or "wrong"

But prescriptive conflicts are different:
- Both approaches claim to be "correct" for the SAME goal
- The conflict is about methods, not goals
- Resolution depends on INTENT, not framework choice

### Context-Gating Is Incomplete

The Seed's context-gating (`applicability:`) assumes:
- Knowledge clearly applies or doesn't apply
- Context boundaries are identifiable
- User can determine their context

But prescriptive conflicts are different:
- The context is "what you're trying to achieve"
- Multiple valid goals may conflict (e.g., speed vs. quality)
- There's no clear boundary — just different valid approaches

## Proposed Solution: Intent-Based Resolution

### New Frontmatter: `prescriptive-type`

```yaml
# For descriptive frameworks (current approach works)
prescriptive-type: descriptive  # Describes how things work

# For prescriptive rules that may conflict
prescriptive-type: prescriptive
prescriptive-intent: [aesthetic-quality, efficiency, safety, tradition]
```

### New Frontmatter: `conflict-resolution-mode`

```yaml
# How to handle conflicts with this knowledge
conflict-resolution-mode: framework-choice  # User picks framework
conflict-resolution-mode: intent-based      # Depends on goal
conflict-resolution-mode: context-dependent # Depends on situation
conflict-resolution-mode: hierarchy        # Some contexts override others
```

### Example: Musical Style Rules

```yaml
---
title: Parallel Voice Motion
prescriptive-type: prescriptive
prescriptive-intent: [voice-independence, harmonic-clarity]
conflict-resolution-mode: intent-based

# Style-specific variants
style-variants:
  - style: classical-counterpoint
    rule: "Avoid parallel fifths"
    rationale: "Preserves voice independence"
    context: "Baroque/Classical composition"
    
  - style: jazz-voicing
    rule: "Parallel motion is acceptable"
    rationale: "Creates desired voice-leading effects"
    context: "Jazz and popular music"
---

# Resolution Guide

**To use this knowledge:**
1. What is your goal? (voice independence vs. harmonic richness)
2. What style are you working in? (classical vs. jazz/pop)
3. Apply the appropriate variant

**Transferability:**
- Classical → Jazz: Rarely transfers directly
- Jazz → Contemporary pop: Often transfers
- Both → Film scoring: Depends on scene context
```

## Rule Proposal

**Rule:** Distinguish prescriptive from descriptive knowledge and apply intent-based resolution for prescriptive conflicts.

**Why:** Prescriptive knowledge tells you what to DO, not just what IS. When prescriptive rules conflict, resolution requires understanding user intent, not just framework selection.

**Test:** For knowledge that provides guidance or rules:
1. Is this prescriptive ("you should do X") or descriptive ("X is Y")?
2. If prescriptive, could a different context validly recommend "do NOT X"?
3. If yes, does the note include intent-based resolution guidance?

**Implementation:**
```yaml
# Required for prescriptive knowledge
prescriptive-type: prescriptive
prescriptive-intent: [primary-goal]
conflict-resolution-mode: intent-based

# Include resolution guidance
resolution-guide:
  - when: "goal is X"
    do: "follow rule A"
  - when: "goal is Y"  
    do: "follow rule B"
```

## Alternative: Compatibility Mapping

For domains with complex style interactions:

```yaml
style-compatibility:
  # What can this style teach?
  transferable-to: [contemporary-pop, film-scoring]
  not-transferable-to: [classical-counterpoint]
  
  # What can it learn from others?
  receives-from: [jazz-harmony]
  
  # Explicit boundary
  boundary-type: aesthetic  # vs. technical, structural
```

## Test Criteria

- [ ] Can you identify whether a rule is prescriptive or descriptive?
- [ ] For prescriptive rules, can you identify what intent they serve?
- [ ] Do prescriptive notes include resolution guidance for conflicts?
- [ ] Can you determine transferability between styles?
- [ ] Is intent-based resolution preferred over framework tagging for prescriptive conflicts?

## Edge Cases

**When prescriptive becomes descriptive:**
- "Parallel fifths create a specific sound" (descriptive)
- "Avoid parallel fifths" (prescriptive)

**Hierarchical resolution:**
- Some contexts genuinely override others (safety rules > aesthetic preferences)
- Use `conflict-resolution-mode: hierarchy` with explicit priority

**Genuine contradictions:**
- When two prescriptive rules cannot both be followed AND there's no resolution
- Mark with `contradiction-status: genuine` and escalate to human

## Related Notes

- [[Frontier Gap - Conflicting Style-Specific Rules]] — Original gap identification
- [[Frontier Exploration - Framework-Dependent Knowledge]] — Existing framework handling
- [[Frontier Exploration - Context-Gated Knowledge]] — Existing context handling
- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — Related topic
