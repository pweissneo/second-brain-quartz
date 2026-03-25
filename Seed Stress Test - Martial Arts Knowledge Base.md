---
last-reviewed: 2026-03-22
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - martial-arts
  - experiential
  - sequential-knowledge
domain: martial-arts
test-type: stress-test
test-domain: Martial Arts (Striking, Grappling, Weapons)
---

# Seed Stress Test: Martial Arts Knowledge Base

Testing Seed rules against the martial arts domain reveals unique challenges for managing physical skill knowledge.

## Domain Overview

Martial arts knowledge bases face distinct challenges:
- Sequential belt progression (prerequisite chains)
- Experiential verification (must practice to confirm)
- Physical + philosophical components
- Multiple styles (striking, grappling, weapons) with different structures
- Tacit knowledge (feel, timing, body position)
- Safety-critical techniques

---

## 1. Diminishing Returns Test

**Rule:** Skip or defer if note fails 2+ of: utility, connection, uniqueness, effort.

**Martial Arts Application:**

The standard diminishing returns test FAILS for martial arts because:

### Issue 1: Execution Uncertainty

A technique may look identical in description but produce different results:
- "Hip throw (Ogoshi)" description: "Step forward, rotate hips, lift"
- Reality: The "feel" of weight transfer cannot be conveyed in text
- Two students reading the same note may get completely different outcomes

**Test fails:** The test assumes knowledge can be evaluated without execution. In martial arts, you often CANNOT assess utility without trying.

### Issue 2: Style-Specific Value

A technique's utility varies by style:
- "Single leg takedown" - high utility in MMA, lower in traditional judo
- "Gunpowder techniques" - zero utility in modern context

**Test fails:** Utility is style-dependent, not universally assessable.

### Issue 3: Tacit Knowledge Dominance

Martial arts knowledge is largely tacit:
- "Keep your elbows in" - what angle? What tension?
- "Step through" - how far? At what angle?

**Test fails:** Most high-value martial arts knowledge cannot be captured in text.

### Proposed Modification for Martial Arts:

```yaml
# For martial arts notes
verification-modality: practice-required  # Cannot verify by reading
tacit-knowledge-level: high|medium|low    # How much is "feel"
style-applicability: [style1, style2]     # Which styles this applies to
```

**Modified Test:**
> For martial arts notes: Apply standard test to utility+uniqueness only. For connection, accept 1+ natural link (not 2+). For effort, add: "Could this technique be learned from text alone?" If no, exempt from effort requirement.

---

## 2. Verification Status Rule

**Rule:** Track verification-status for procedural content.

**Martial Arts Application:**

Standard verification categories don't fit:

| Status | Definition | Martial Arts Application |
|--------|------------|------------------------|
| unverified | Captured but not tested | A technique you read about but haven't tried |
| testing | Actively experimenting | Practicing a technique in class |
| verified | Tested 2+ times | Can consistently perform the technique |
| failed | Tested but didn't work | Technique didn't work for your body type/style |

### Issue: "Verified" in Martial Arts Means Something Different

In cooking: "verified" = "recipe worked and tasted good"
In martial arts: "verified" = "can reliably execute under resistance"

A technique is not verified just because you did it once in class. It must work:
- Against resisting opponent
- Under fatigue
- In competition/sparring

**Suggested Addition:**
```yaml
verification-context: dojo|sparring|competition
resistance-level: cooperative|resisting|full
```

---

## 3. 2+ Links Rule

**Rule:** Every note must link to at least 2 other notes OR be tagged foundational/specialized.

**Martial Arts Application:**

### Issue 1: Style-Specific Techniques

A technique in one style may only connect to that style:
- "Sumi Gaeshi" (corner reversal) - specific to judo, only connects to judo notes
- Does it need 2 links outside judo?

### Issue 2: Foundational Elements

What's foundational in martial arts?
- "Stance" - applies to all
- "Breakfall" - safety-critical, foundational
- "Ukemi" (rolling) - foundational

**Proposed Foundational List for Martial Arts:**
```yaml
foundational: true
foundational-type: safety|technique|prerequisite
```

### Issue 3: Belt Progression

Notes naturally form prerequisite chains:
- White → Yellow → Orange → Green → Blue → Brown → Black
- Each belt depends on previous

This is sequential knowledge, not web knowledge.

**Test:** Does the 2+ links rule make sense for sequential progression domains?

---

## 4. Construction Phase Model

**Rule:** Apply relaxed standards during bootstrap, tighten as vault matures.

**Martial Arts Application:**

### Issue: Belt-Based Bootstrap

A martial arts vault might bootstrap by belt:
- All white belt techniques (<20 notes) = skeleton phase
- All yellow-orange techniques = flesh phase
- All green-blue = muscle phase
- All brown-black = maturity

But different styles mature at different rates:
- Judo: 100+ throws, 50+ pins, many transitions
- Brazilian Jiu-Jitsu: 100+ submissions, guard systems
- Boxing: Limited techniques but deep refinement

**Proposed Modification:**
```yaml
construction-phase-by-style: true
style: judo
current-phase: flesh  # 20-100 notes
notes-per-belt:
  white: 15
  yellow: 25
```

---

## 5. Atomicity Rule - Word Count

**Rule:** Notes should be 100-300 words.

**Martial Arts Application:**

### Issue 1: Technique Definition vs. Comprehensive Guide

A technique definition:
- "Armbar from guard" - 50 words sufficient

A comprehensive guide:
- "Armbar from guard" with variations, counters, setups - 500+ words

**Verdict:** Apply domain-specific atomicity - technique DEFINITIONS can be under 100 words. Comprehensive guides with variations should be hub notes.

### Issue 2: Philosophical Content

Martial arts have philosophical components:
- "Bushido" - 50 words or 5000?
- "Mindset" notes - can be short principles

**Verdict:** Philosophical notes are valid at any length when they're complete principles.

### Issue 3: Combination/Chain Techniques

"Triangle choke setup from closed guard" - this is a SEQUENCE, not a single technique.

**Proposed Distinction:**
- Single technique: One atomic action
- Combination: Link to component techniques
- Chain: Sequence of techniques with conditional transitions

---

## 6. Expertise Level Tagging

**Rule:** Tag expertise-level for knowledge appropriate at certain skill levels.

**Martial Arts Application:**

### Belt-Based Expertise

| Belt | Typical Expertise |
|------|------------------|
| White-Yellow | Fundamentals, safety, basic escapes |
| Orange-Green | Basic submissions, positional control |
| Blue-Brown | Advanced submissions, transitions |
| Black | Mastery, teaching, philosophy |

### Issue: Crossover Knowledge

Some techniques appear at multiple levels:
- "Armbar from guard" - taught at white belt BUT advanced variations exist

**Proposed Addition:**
```yaml
expertise-levels: [white, yellow, blue]  # Multiple levels
expertise-note: "Basics at white, variations at blue"
```

---

## 7. Sequential Knowledge - Belt Progression

**Rule:** Use temporal-type for sequential knowledge.

**Martial Arts Application:**

Belt progression is inherently sequential:
- Cannot learn blue belt techniques before white belt fundamentals
- This is stricter than most sequential domains (must master, not just understand)

**Proposed Metadata:**
```yaml
temporal-type: progressive
prerequisites:
  required:
    - Fundamental Ukemi
    - Basic Stances
progression-level: white-belt
belt-equivalent: 6th-kyu
```

---

## 8. Individual Variation - Body Type

**Rule:** For domains with extreme individual variation, add individual-variation tagging.

**Martial Arts Application:**

### Body Type Affects Technique Effectiveness

| Body Type | Technique Adaptation |
|-----------|---------------------|
| Tall/Lanky | Long limbs - triangles, reach advantage |
| Short/Stocky | Power techniques, clinch work |
| Flexible | Advanced bends, contortionist submissions |
| Not Flexible | Pressure submissions, wrestling |

**Critical:** A technique that works for one body type may be impossible for another.

**Proposed Addition:**
```yaml
individual-variation: high
body-type-factors:
  - height
  - limb-length-ratio
  - flexibility
  - strength-ratio
body-type-applicability: "Best for long-limbed practitioners"
```

---

## 9. Safety-Critical Knowledge

**Rule:** For high-stakes domains, include explicit safety tagging.

**Martial Arts Application:**

### Risk Categories

| Technique Type | Risk Level | Examples |
|---------------|-----------|----------|
| Basic falls | Low | Forward roll, breakfalls |
|Throws | Medium-High | Hip throw, suplex |
| Joint locks | High | Armbars, kimuras (injury risk) |
| Chokes | High | Rear naked choke (death risk) |
| Strikes | High | Punches, kicks, knees |

**Proposed Addition:**
```yaml
safety-critical: true
risk-level: low|medium|high|critical
injury-type: bruise|fracture|dislocation|concussion|suffocation
safety-notes: "Never apply to training partners without proper instruction"
```

---

## 10. Cross-Style Knowledge

**Rule:** Handle knowledge that spans multiple styles.

**Martial Arts Application:**

### Style Categories

- **Striking**: Boxing, Karate, Muay Thai, Taekwondo
- **Grappling**: Judo, BJJ, Wrestling, Sambo
- **Weapons**: Kendo, Arnis, Kenjutsu

### Cross-Style Techniques

Some techniques appear across styles:
- "Armbar" - Judo (kansetsu-waza), BJJ, Sambo
- "Hip throw" - Judo (koshi-waza), Sambo

**Proposed Addition:**
```yaml
style-origin: judo  # Where the technique originated
style-applicability: [judo, bjj, sambo]
style-tags: [grappling, standing-throw]
```

---

## Summary of Martial Arts-Specific Metadata

```yaml
# Martial arts frontmatter
verification-modality: practice-required
tacit-knowledge-level: high
resistance-level: cooperative|resisting|full
foundational-type: safety|technique|prerequisite
temporal-type: progressive
prerequisites:
  required:
    - Basic Ukemi
body-type-factors: [height, flexibility]
body-type-applicability: "Best for flexible practitioners"
safety-critical: true
risk-level: high
injury-type: joint-lock
style-origin: bjj
style-applicability: [bjj, judo]
style-tags: [grappling, ground-game]
expertise-levels: [white, blue]
```

---

## Recommended Seed Rule Additions

### 1. For Experiential Domains (including martial arts):

> **Modified diminishing returns test:** For practice-required knowledge, apply the test only to utility + uniqueness. Accept 1+ connection instead of 2+. For effort, add: "Could this be learned from text alone?" If no, exempt.

### 2. For Verification Status:

> **Add verification context:** For physical skills, track resistance level (cooperative → resisting → full) as separate from verification count.

### 3. For Sequential Domains:

> **Add progression metadata:** For belt/skill-based domains, track prerequisites explicitly with required/optional distinction.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Cooking Knowledge Base]] (experiential domains)
- [[Seed Stress Test - Dance Knowledge Base]] (future)
- [[Frontier Gap - Embodied Knowledge]]
- [[Handling Temporal Knowledge]]
- [[Seed Stress Test - Embodied Knowledge Rule]]
