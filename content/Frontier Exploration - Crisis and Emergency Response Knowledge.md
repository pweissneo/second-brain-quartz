---
last-reviewed: 2026-03-25
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - frontier-exploration
  - crisis
  - emergency
  - decision-tree
  - high-stakes
---

# Frontier Exploration: Crisis and Emergency Response Knowledge

> How should knowledge bases handle domains where retrieval speed and decision accuracy directly affect outcomes?

## The Problem

The Seed's rules assume:
- Knowledge is consumed at the user's pace
- Atomicity enables reuse and recombination
- Verification happens over days or weeks
- Links enable exploration and deep understanding

**Crisis and emergency domains violate all these assumptions:**
- A medical emergency requires decisions in seconds, not minutes
- A decision tree isn't a nice-to-have — it's the entire knowledge structure
- The cost of "unverified" knowledge can be life or death
- Links can't help when every second counts

## Gap Analysis

### What the Seed Covers Well

The Seed has solid foundations for emergency contexts:

1. **Decision-Tree Knowledge Organization** — The Seed covers branching decision knowledge with hub + node pattern
2. **Safety-Critical Knowledge** — High-stakes domains have exemptions from diminishing returns
3. **Verification Hierarchy** — Critical knowledge requires higher verification standards

### What's Missing

1. **Retrieval Speed as a First-Class Concern**
   - Standard atomicity creates multi-note traversals
   - Emergency responders can't click through 3 hops in a crisis
   - The Seed has no guidance for "single-view" emergency notes

2. **Training Knowledge vs. Reference Knowledge**
   - In crises, you DON'T have time to reason through links
   - Muscle memory and flowcharts beat linked notes
   - The Seed conflates learning and reference vaults

3. **Explicit Confidence Thresholds**
   - Normal knowledge: "confidence: emerging" is okay
   - Emergency knowledge: "confidence: emerging" can kill people
   - No minimum confidence threshold for safety-critical domains

4. **Temporal Decay for Critical Knowledge**
   - CPR guidelines change — old versions are actively dangerous
   - The Seed has general expiration handling but no emergency-specific guidance

5. **Format Considerations for High-Stress Retrieval**
   - Visual flowcharts beat text for panic states
   - Abbreviated language for time-pressured reading
   - No guidance for panic-optimized formatting

## Domain Examples

### Medical Emergency Response

Current Seed issues:
- A note on "choking response" splitting into multiple atomic notes violates the single-action requirement
- Verification takes weeks, but CPR guidelines change years
- 3-hop navigation depth assumes leisure time

Proposed emergency adaptation:
- Single-action notes that can be executed without clicking away
- Explicit "last-verified" with 90-day max for life-critical content
- Visual flowcharts stored as images for quick scanning
- Abbreviated format: [SIGN] → [ACTION] instead of paragraphs

### Fire/Emergency Response

The decision-tree is the entire knowledge structure:
- Smoke detected → Evacuate → Call 911 → Close doors → Assembly point
- Each node is a decision, not an idea to explore
- Navigation is mechanical following, not understanding

### Crisis De-escalation

Training vs. reference is inverted:
- What you need IS muscle memory
- You don't have time to click through links
- The "hub" is the training protocol itself

## Proposed Seed Enhancement

### 1. Emergency Knowledge Category

```yaml
emergency-knowledge: true
response-criticality: critical|urgent|preventive
time-to-action: seconds|minutes|hours
training-mode: required|recommended|none
minimum-confidence: high|immediate-action
verification-recency: 90days  # max age for critical knowledge
```

### 2. Single-Action Note Format

For critical-response notes, provide:
- **Header:** Clear signal (e.g., "CHOKING: ADULT")
- **One-line action:** The exact step to take
- **Visual aid:** Embedded flowchart or image
- **No links required:** Self-contained within one view

Example:
```markdown
# CHOKING: ADULT

## DO THIS NOW
1. Stand behind person
2. Wrap arms around waist
3. Make fist above navel
4. Thrust upward

[Insert flowchart image]

Call 911 if: person becomes unconscious
```

### 3. Emergency Verification Protocol

Standard verification insufficient for crisis knowledge:

```yaml
verification-mode: emergency-specific
training-required: true
last-practice-date: 2026-03-15
certification-valid-until: 2027-03-15
review-interval: 90days  # shorter for critical knowledge
```

### 4. Retrieval Format Hierarchy

For emergency knowledge, structure in order:
1. **Visual flowchart** — process in single image
2. **Abbreviated text** — signal → action (no explanation)
3. **Full note** — explanation for training, not crisis use
4. **Background/links** — deep context after crisis resolves

### 5. Distinction: Training vs. Crisis Reference

The same knowledge should exist in two formats:

| Aspect | Training Format | Crisis Format |
|--------|-----------------|---------------|
| Purpose | Build competence | Enable execution |
| Depth | Explain why | State what to do |
| Links | Multiple, explanatory | None |
| Format | Prose, images | Abbreviated, flowchart |
| Verification | Standard timeline | Expedited |

## Edge Cases

### Contested Emergency Procedures

Different organizations teach different approaches ( Heimlich vs. chest thrusts). The vault must:
- Flag contested procedures with `procedure-status: contested`
- Document which authorities recommend what
- NOT present contested as single truth

### Equipment-Dependent Procedures

Some emergencies require specific equipment (AED, EpiPen). Notes must include:
- Required equipment explicitly listed
- Equipment alternatives when known
- "If no equipment" fallback procedures

### Context Variations

Emergency procedures vary by:
- Age (adult vs. child vs. infant)
- Environment (home vs. workplace vs. wilderness)
- Available resources

Use explicit context gates: `applies-when: adult conscious choking`

## Connection to Other Frontier Notes

- **Decision-Tree Knowledge Organization** — extends with emergency-specific formatting
- **Safety-Critical Knowledge Thresholds** — establishes minimum confidence levels
- **Tool-Executable Knowledge** — includes emergency tool execution
- **Verification Hierarchy** — needs emergency-specific protocol

## Test for Emergency Knowledge Compliance

For notes tagged `emergency-knowledge: true`:
1. Can this be retrieved and executed in <30 seconds by a stressed user?
2. Is this self-contained (no clicking required)?
3. Is confidence level explicitly high or immediate-action?
4. Has verification recency been checked within 90 days?
5. Is there a visual aid (flowchart/image) for panic-state retrieval?

If yes to all → emergency-compliant
If no to any → needs revision

## Why This Matters

The Seed optimizes for **learning and understanding**. Crisis domains optimize for **execution under stress**. These are fundamentally different knowledge structures that the Seed doesn't currently distinguish.

Without emergency-specific guidance:
- Knowledge bases produce "helpful" notes that are useless in crises
- Critical knowledge gets buried under atomicity requirements
- Verification timelines assume weeks, not seconds
- Navigation depth assumes calm reading, not panic retrieval

This isn't just about emergency response — any high-stakes, time-critical domain (trading floors, military operations, surgical suites) has similar requirements.

---

**See also:**
- [[Frontier Exploration - Decision-Tree Knowledge Organization]]
- [[Frontier Exploration - Safety-Critical Knowledge Thresholds]]
- [[Frontier Exploration - Tool-Executable Knowledge]]
- [[Seed Gap - Empirically Validatable Knowledge]] (emergency knowledge requires empirical validation)
