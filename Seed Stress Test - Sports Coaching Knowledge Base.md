---
last-reviewed: 2026-03-16
last-updated: 2026-03-18
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
schema-version: "2026-03"
verification-status: verified
tags:
  - seed-stress-test
  - sports-coaching
  - edge-case
  - experiential
---

# Seed Stress Test: Sports Coaching Knowledge Base

Testing Seed rules in sports coaching reveals unique challenges around physical skill instruction, periodization, and athlete-specific knowledge.

## Domain Overview

Sports coaching knowledge bases face unique challenges:
- Physical skills require kinesthetic learning (cannot be fully captured in text)
- Athlete knowledge is highly individual (what works for one person may not work for another)
- Periodization (training cycles) involves temporal planning across multiple timescales
- Safety-critical knowledge requires precise protocols
- Performance metrics vary by sport and position

---

## 1. Atomicity: Skill vs. Drill Distinction

**Seed Rule:** Notes should be 100-300 words; procedural content may exceed this if executable.

**Sports Application:**

### Edge Case: Compound Skills vs. Component Drills

**Problem:** "Passing in soccer" could be:
- A single comprehensive note (1000+ words covering technique, timing, weight, vision)
- Split into: passing fundamentals, passing under pressure, passing in tight spaces, crossing

**Analysis:** Is this one skill comprehensively covered, or multiple distinct skills?

**Test:** Can this skill be performed as a unit, or does it decompose into separate skills that could be practiced independently?

**Refinement:** For physical skills, atomicity should follow skill decomposition in the sport's pedagogy, not arbitrary word counts.

---

## 2. Diminishing Returns: Athlete-Specific Knowledge

**Seed Rule:** Apply diminishing returns testing before adding notes - skip if fails 2+ of: utility, connection, uniqueness, effort.

**Sports Application:**

### Edge Case: Individual Athlete Profiles

**Problem:** A note about "John's pre-game routine" has:
- Utility: Only for John (very low general utility)
- Connection: Links to team, sport (2+)
- Uniqueness: Very high (unique to one athlete)
- Effort: Low maintenance

**Analysis:** This fails 2+ tests but is HIGH VALUE for the team. In sports, individual athlete knowledge is crucial.

**Solution:** Add `athlete-specific: true` tag that exempts from standard diminishing returns. Individual knowledge serves different purpose than general knowledge.

### Edge Case: Sport-Specific Metrics

**Problem:** "40-yard dash time" only matters for American football; "VO2 max" matters for endurance sports.

**Test:** Do metric notes specify sport applicability? Are metrics tagged with `sport-scope:`?

---

## 3. 3-Hop Rule: Training Periodization

**Seed Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.

**Sports Application:**

### Path Example

```
_root → Training → Periodization → Macrocycles → Mesocycles → Microcycles → Weekly Schedule → Daily Session → Specific Drill
```
= **8+ hops** for a specific training session

**Analysis:** This is a genuine domain taxonomy (training design follows hierarchical structure). But it exceeds 3 hops.

**Seed Edge Case:** "Natural domain hierarchies may legitimately exceed 3 hops."

**Solution:** This is a genuine domain taxonomy. Allow deeper paths OR create hub shortcuts at major boundaries (Periodization, Training Phases, Session Types).

---

## 4. Experiential Knowledge: "Feel" and Kinesthesia

**Seed Rule:** For domains with experiential knowledge, include `experiential-component` frontmatter.

**Sports Application:**

### Edge Case: Teaching "Feel"

**Problem:** Coaching cues like "feel your weight on your outside foot" or "snap through the ball" describe kinesthetic sensations that:
- Vary by athlete body type
- Cannot be verified by the athlete until they try
- Require interpretation by the coach

**Test:** Are coaching cues tagged with `experiential-component: kinesthetic`? Are multiple cue variations provided for different athlete body types?

### Edge Case: Pain vs. Discomfort Distinction

**Problem:** "No pain, no gain" vs. "listen to your body" - the line between productive discomfort and injury warning is:
- Sport-specific (different in contact vs. non-contact sports)
- Individual (varies by athlete)
- Context-dependent (game vs. practice)

**Test:** Does injury-related knowledge specify when to push through vs. stop? Is there `safety-mandatory:` tagging for injury-prevention knowledge?

---

## 5. Safety: Return-to-Play Protocols

**Seed Rule:** For high-stakes domains, critical knowledge should be exempt from diminishing returns.

**Sports Application:**

### Edge Case: Concussion Protocols

**Problem:** Concussion knowledge:
- Rarely needed (low utility by standard measure)
- Critical when needed (life-altering consequences)
- Very specific (symptoms, protocols)

**Analysis:** Per Seed edge case for high-stakes domains, should be exempt from diminishing returns with `criticality: high`.

**Test:** Are safety-critical notes tagged with `criticality: high`? Do they link to emergency protocols?

---

## 6. Temporal Knowledge: Periodization Cycles

**Seed Rule:** Track knowledge validity periods.

**Sports Application:**

### Edge Case: Training Phases

**Problem:** "Off-season training" vs. "in-season maintenance" vs. "pre-season preparation" - advice that works in one phase may be counterproductive in another.

**Test:** Do training notes specify `training-phase:` (off-season | pre-season | in-season | transition)? Can users filter by current phase?

### Edge Case: Athlete Development Stages

**Problem:** Training advice for adolescents vs. adults vs. masters athletes differs significantly.

**Test:** Does athlete development advice specify `developmental-stage:`? Is there guidance on age-appropriate training load?

---

## 7. Source Quality: Coaching Credentials

**Seed Rule:** For knowledge with established expertise hierarchies, capture source quality tier.

**Sports Application:**

| Source Type | Reliability | Example |
|-------------|-------------|---------|
| Sports science research | High | Peer-reviewed journals |
| Elite coach | High | Olympic-level coaches |
| Certified coach | Medium-High | Licensed through sport federation |
| Community coach | Medium | Volunteer youth coaches |
| Athlete testimonials | Variable | What worked for one athlete |
| Social media | Low | Viral training content |

**Test:** Can you identify coaching credentials of sources? Is there a `source-credentials:` field?

---

## 8. Relationship-Specific Knowledge

**Seed Rule:** Notes about specific people need `subject:`, `verification:`, and `sensitivity:` tags.

**Sports Application:**

### Edge Case: Athlete-Coach Communication Styles

**Problem:** Notes about "how to communicate with Athlete X" - highly specific to that relationship.

**Test:** Are relationship-specific coaching notes tagged with `subject:` and `sensitivity: restricted`? Are they protected from general access?

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Atomicity | Compound skills vs. drills | Follow sport pedagogy for decomposition |
| Diminishing Returns | Individual athlete profiles | Add `athlete-specific: true` exemption |
| Diminishing Returns | Sport-specific metrics | Add `sport-scope:` tagging |
| 3-Hop Rule | Training periodization taxonomy | Allow domain taxonomy; create hub shortcuts |
| Experiential | Kinesthetic coaching cues | Add `experiential-component: kinesthetic` |
| Experiential | Pain vs. discomfort | Use `safety-mandatory:` for injury knowledge |
| High-Stakes | Concussion protocols | Exempt with `criticality: high` |
| Temporal | Training phase specificity | Add `training-phase:` field |
| Temporal | Developmental stages | Add `developmental-stage:` field |
| Source Quality | Coaching credentials | Add `source-credentials:` field |
| Relationship | Athlete-specific communication | Tag with `subject:` and `sensitivity:` |

---

## Proposed Seed Refinements

### 1. Athlete-Specific Knowledge Exemption

> **Rule:** Notes about specific athletes (individual profiles, personalized training, communication styles) are exempt from standard diminishing returns testing when tagged with `athlete-specific: true`.
> **Why:** Individual athlete knowledge is high-value for team sports despite limited general utility.
> **Test:** Can you identify athlete-specific notes and do they have the appropriate tag?

### 2. Experiential Component: Kinesthetic

> **Rule:** For physical skill instruction, add `experiential-component: kinesthetic` to notes describing physical sensations, body positioning, or movement feel.
> **Why:** Kinesthetic knowledge requires different teaching approaches (multiple cues, hands-on practice) than declarative knowledge.
> **Test:** Can you identify kinesthetic coaching cues and are they appropriately tagged?

### 3. Temporal Scope: Training Phase

> **Rule:** For periodized training knowledge, include `training-phase:` field with values: off-season, pre-season, in-season, transition, recovery.
> **Why:** Training advice is phase-specific; off-season advice may be harmful in-season.
> **Test:** Can you filter training notes by current training phase?

### 4. Safety Tagging: Sport-Specific

> **Rule:** For injury-prevention and safety-critical knowledge, use `safety-mandatory:` for non-negotiable protocols and `safety-advisory:` for recommended guidelines.
> **Why:** Sports have different risk profiles; safety knowledge needs explicit priority tagging.
> **Test:** Can you identify mandatory vs. advisory safety guidelines?

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Cooking Knowledge Base]] — Similar experiential knowledge challenges
- [[Seed Stress Test - Gardening Knowledge Base]] — Seasonal/temporal knowledge
- [[Domain-Specific Knowledge Bases]]
- [[Handling Temporal Knowledge]]

