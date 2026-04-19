---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-gap
  - seed-refinement
  - injury-prevention
  - health-tracking
  - physical-skills
  - music-performance
  - sports
gap-status: open
---

# Seed Refinement - Physical Health and Injury Prevention in Skill-Based Domains

Stress test of Seed rules against Music Performance Knowledge Base (2026-03-24) identified gaps in capturing pain, discomfort, and remedy knowledge in physical skill domains. This note addresses whether this gap needs Seed integration.

## Status: OPEN - Needs Seed Rule Addition

## The Gap

The Seed lacks explicit guidance for **capturing physical health and injury prevention knowledge** in domains where skill execution involves physical movement, repetitive motion, or sustained physical strain.

This applies to:
- Music performance (instrumental: repetitive strain, posture issues)
- Sports (athletic injuries, overuse, training impacts)
- Crafts (woodworking: dust exposure, noise; ceramics: chemical exposure)
- Physical therapy / rehabilitation knowledge
- Dance (foot injuries, strain)
- Any domain with physical execution components

## Current Seed Coverage

The Seed covers:
- `risk-level:` frontmatter for content with injury potential (line ~290)
- `learning-mode:` with practice-required, teacher-required
- Embodied knowledge handling
- Tacit prerequisite knowledge

## What's Missing

### 1. Physical Symptom Documentation

How to capture knowledge about physical responses to practice?

Missing guidance for:
- Pain location and type (sharp, dull, chronic, acute)
- Trigger identification (what causes symptoms)
- Temporal patterns (when symptoms occur, duration)
- Severity tracking (mild discomfort vs. stopimmediately)
- Remediation attempts (what worked/didn't)

### 2. Injury Prevention Protocol Knowledge

How to document preventive practices?

Missing:
- Warm-up routines for physical preparation
- Ergonomic setup knowledge
- Recovery practices
- Warning signs that indicate rest needed
- Technique modifications to prevent injury

### 3. Health-Skill Interaction Tracking

How to capture how physical health affects skill performance?

Missing:
- Days unavailable due to physical condition
- Performance impact of health status
- Adaptation strategies when injured
- Long-term health trajectory in skill development

### 4. Professional Medical Knowledge Boundary

When does skill knowledge end and medical advice begin?

Missing:
- Scope guidance (when to recommend professional consultation)
- Distinguishing symptom tracking from diagnosis
- Liability considerations for health advice

## Gap Analysis

### Gap Type: seed-missing
### Gap Priority: high
### Reason: Physical health in skill domains is high-stakes - incorrect guidance could cause real harm

### Testability Assessment

**Rule's Test Executable by AI?** Partially.
- Symptom tracking: Yes (structured fields)
- Prevention protocols: Yes (practice-based verification)
- Medical boundary: Requires human judgment (testable as "has disclaimer")

### Cross-Domain Applicability

- Music performance: HIGH (repetitive strain injuries common)
- Sports: HIGH (injury prevention core to training)
- Crafts: MEDIUM (exposure hazards, repetitive strain)
- Dance: HIGH (physical impact significant)
- General physical skills: HIGH

## Proposed Seed Rule

### Rule: Capture physical health knowledge separately in skill-based domains

**Why:** Physical health and skill performance are interdependent but distinct types of knowledge. Mixing health tracking with technique notes makes both harder to find, update, and act upon. Health knowledge also has different verification approaches (medical professional consultation vs. self-experimentation).

**Test:** For skill domains with physical execution: (1) Can you find health/symptom notes separate from technique notes? (2) Are injury prevention practices documented? (3) Is there clear boundary between skill guidance and medical advice?

**Implementation:**
```yaml
knowledge-type: health-tracking
health-domain: physical-skill

# Symptom documentation
symptom-tracking:
  - location: "wrist, right"
    type: "dull ache"
    triggers: ["long sessions", "specific movement"]
    severity: 1-5
    timeline: "comes and goes"

# Prevention protocols
prevention-protocols:
  - name: "wrist stretches"
    frequency: "daily"
    effectiveness: "high"
    when-ineffective: "if already painful"

# Boundary management
medical-boundary:
  self-treatment-scope: "symptom-tracking|technique-modification"
  referral-triggers: ["persistent pain", "acute injury", "numbness"]
  disclaimer: "consult healthcare professional for diagnosis"
```

### Edge Cases

1. **Overlapping with medical advice:** Health notes in skill domains should ALWAYS include disclaimer to consult professionals. The note tracks symptoms and documents what worked - not diagnosis.

2. **Legal liability:** Notes suggesting specific exercises or techniques for injury prevention should include liability disclaimer. This is distinct from technique advice.

3. **Verification:** Health tracking verification is longitudinal (months/years) - different from technique verification (days/weeks). Use `verification-cycle: long-horizon` for health notes.

4. **Privacy:** Health information is sensitive. Consider access control for health tracking notes - they may need to remain private.

## Evidence of Need

From the original stress test (2026-03-24):
> "Injury prevention: No guidance for capturing pain/discomfort and remedy knowledge (high-stakes for instrumentalists)"

This gap remains unaddressed in current Seed (as of 2026-04-06).

## Recommendation

Add new Seed rule under "Experiential Domains" section addressing physical health tracking in skill-based domains with the proposed structure above.

---

**Related Notes:**
- [[Seed Stress Test - Music Performance Knowledge Base]] - Original stress test
- [[Seed Stress Test - Fitness Knowledge Base]] - May have similar gaps
- [[Seed Refinement - Performance Psychology Knowledge Capture]] - Related mental health in performance
- [[AI-Assisted Knowledge Management Seed]] - Canonical Seed file