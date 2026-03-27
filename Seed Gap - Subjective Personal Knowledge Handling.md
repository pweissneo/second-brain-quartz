---
last-reviewed: 2026-03-26
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: epistemic
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-26
gap-source: frontier-exploration
tags:
  - seed-gap
  - subjective-knowledge
  - personal-knowledge
  - epistemic
---

# Seed Gap - Subjective Personal Knowledge Handling

## The Gap

The Seed has rules for confidence levels (high, emerging, speculative, disputed) and verification status (verified, unverified, pending, disputed), but lacks explicit guidance for **subjective personal knowledge** — knowledge that is true for an individual but cannot be verified against external sources. This creates ambiguity in how to handle opinions, personal preferences, subjective assessments, and belief-based knowledge.

## Why This Matters

- **Epistemic ambiguity**: When someone says "I believe X" vs. "X is true," the Seed treats them similarly, but they have different epistemic statuses
- **False confidence inflation**: Personal opinions marked as "high" confidence misleadingly imply external verification
- **Verification impossibility**: Some knowledge is inherently personal and cannot be verified — the Seed needs explicit handling for this category
- **Filtering problems**: Without distinguishing subjective personal knowledge, retrieval may return opinions as facts
- **Conflict with authoritative sources**: When personal belief contradicts expert consensus, the Seed lacks guidance on how to represent this

## What the Seed Currently Covers

1. **Confidence markers**: high, emerging, speculative, disputed
2. **Verification status**: verified, unverified, pending, disputed, testing, failed, blocked
3. **5:1 ratio**: Original insights vs. captured knowledge
4. **Personal experimentation**: Results from self-testing
5. **Personal knowledge vs. vault knowledge**: Frontier exploration note exists

## What's Missing

### 1. Subjective Personal Knowledge Category

The current "speculative" confidence level is meant for knowledge that "cannot be verified through any known verification pathway (future predictions, private subjective experience, philosophical claims)" — but this conflates:
- Things that are fundamentally unverifiable (personal feelings, beliefs, opinions)
- Things that might be verifiable with better methods (future predictions, new research)

**Missing**: A distinct category for knowledge that is:
- True for the individual (subjective)
- Cannot be verified externally (personal)
- Not disputed in the sense of contested — just not generalizable

### 2. Opinion vs. Fact Distinction

The Seed doesn't explicitly distinguish:
- **Factual claims**: "The recipe uses 200°F for 2 hours"
- **Opinion statements**: "200°F produces better results than 225°F"
- **Personal beliefs**: "I believe low-and-slow is the best approach"

All might be marked "emerging" or "high," but they have different epistemic statuses.

### 3. Subjective Knowledge Propagation Rules

When subjective personal knowledge is used as a basis for further reasoning, the Seed doesn't track:
- Is this a fact or an opinion?
- If opinion, whose opinion?
- How does subjectivity propagate through derived knowledge?

### 4. Handling Conflicts with External Knowledge

When personal belief contradicts authoritative sources:
- Current guidance: Inverse authority rule (can contradict if 5 conditions met)
- Missing: How to represent that personal belief IS held despite contradiction

### 5. Temporal Subjectivity

Some subjective knowledge changes over time:
- "I prefer X" may become "I prefer Y"
- How to track this evolution vs. treating old notes as wrong

## Gap Type

**Epistemic Knowledge Gap** — The Seed covers confidence and verification but lacks explicit handling for knowledge that is inherently subjective and personal.

## Proposed Seed Rules

### Rule: Add subjective-personal knowledge type

**Why:** Subjective personal knowledge (opinions, preferences, beliefs) has different characteristics than verifiable knowledge. It cannot be "verified" in the traditional sense — it can only be acknowledged, tracked for consistency, and updated over time. Without explicit handling, AI agents cannot distinguish between "fact with high confidence" and "opinion with high personal certainty."

**Test:** Pick 10 notes containing personal opinions, preferences, or beliefs. (1) Can you identify which are subjective personal knowledge vs. factual claims? (2) Do they have metadata indicating subjectivity? (3) Can you distinguish personal preference from verifiable recommendation?

**Implementation:**
```yaml
knowledge-type: subjective-personal
subjectivity-type: opinion|preference|belief|perspective
personal-validity: personal-only  # cannot be generalized
evolves: true|false  # whether this may change over time
held-since: 2026-03-26
acknowledged-conflicts:  # optional - known conflicts with external sources
  - source: "expert consensus"
    resolution: "hold-personal-view"
    reason: "personal-experience-overrides"
```

### Rule: Track subjective knowledge separately from verification

**Why:** Subjective personal knowledge cannot be "verified" against external sources — it can only be:
- Acknowledged as held
- Tracked for internal consistency
- Updated when the person changes their view

Mixing verification logic with subjective knowledge creates false precision about "truth."

**Test:** For subjective-personal notes: (1) Is verification-status set to "not-applicable" or similar? (2) Is there a separate "acknowledgment" status? (3) Can you query for all subjective knowledge?

**Implementation:**
```yaml
verification-status: not-applicable  # cannot verify personal opinions
acknowledgment-status: acknowledged|updated|superseded
evolve-log:
  - date: 2026-03-26
    status: "held"
    basis: "personal experience"
```

### Rule: Separate opinion strength from confidence

**Why:** "I strongly believe X" is different from "X is verified." Current confidence conflates belief strength with knowledge certainty. A person can hold a strong opinion (high personal certainty) about something that is fundamentally uncertain.

**Test:** For subjective notes: (1) Is belief-strength distinguished from confidence? (2) Do notes distinguish "I believe X strongly" from "X is likely true"? (3) Can you identify the difference between confidence in knowledge vs. certainty in opinion?

**Implementation:**
```yaml
# For subjective-personal knowledge
belief-strength: strong|moderate|weak
# Use this instead of confidence for subjective knowledge
# Or use both:
confidence: speculative  # epistemic confidence (what the knowledge is)
belief-strength: strong  # personal certainty (how strongly held)
```

### Rule: Propagate subjectivity through derived notes

**Why:** If note A contains subjective knowledge and note B builds on A, note B's subjectivity should be tracked. The Seed doesn't currently propagate this.

**Test:** Pick a note that references subjective personal knowledge. (1) Can you trace back to the subjective source? (2) Does the derived note acknowledge its dependence on subjective knowledge? (3) Is there a way to filter out subjective-dependent knowledge when seeking facts?

**Implementation:**
```yaml
subjective-dependencies:
  - [[Note containing subjective knowledge]]
  rationale: "derived from personal preference"
```

### Rule: Document when subjective knowledge conflicts with consensus

**Why:** Personal beliefs may contradict expert consensus or established facts. The Seed's inverse authority rule allows this, but doesn't track HOW it's represented.

**Test:** For notes where personal view contradicts external consensus: (1) Is the conflict documented? (2) Is the source of the contradiction (subjective vs. verified) clear? (3) Can users distinguish "my view differs from experts" from "experts disagree with each other"?

**Implementation:**
```yaml
conflict-documentation:
  external-position: "What experts/sources say"
  personal-position: "What I believe"
  conflict-type: value|fact|interpretation
  resolution: hold-personal|undecided|defer-to-experts
  reason: "Personal experience / philosophical alignment"
```

### Rule: Add temporal tracking for evolving subjective knowledge

**Why:** Preferences, beliefs, and opinions change over time. The Seed has evolution tracking for some knowledge but not explicitly for subjective personal knowledge.

**Test:** For subjective notes that have been updated: (1) Is there a history of belief changes? (2) Do old notes remain as historical record? (3) Can you see what changed and when?

**Implementation:**
```yaml
belief-evolution:
  - date: 2024-01
    position: "Preferred dark roast"
    context: "Initial preference"
  - date: 2025-06
    position: "Prefer medium roast"
    trigger: "Palate development"
  - date: 2026-03
    position: "Prefer light roast for pour-over"
    context: "Style-specific preference"
```

## Related Seed Rules

- [[Confidence Markers]] — Current confidence system
- [[Note Creation Decision Framework]] — When to create notes
- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — Related but focuses on creative evaluation
- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — Related but specific to taste preferences
- [[Seed Gap - Sensory Evaluation Knowledge]] — Related but focuses on sensory evaluation of external objects

## Edge Cases

### Edge Case: Shifting from Subjective to Verified

What happens when personal opinion becomes supported by evidence?
- Personal: "I think X works" → Evidence: "X works (verified)"
- Track this transition explicitly

### Edge Case: Group Subjectivity

Family, team, or community shared beliefs
- "Our family prefers X" — is this personal or group-level?
- Document whose subjectivity it represents

### Edge Case: Temporary vs. Stable Subjectivity

Some opinions are stable (core values), others situational (current preference)
- Mark with `stability: core|preference|contextual`

### Edge Case: Aspirational Beliefs

What you want to believe vs. what you actually believe
- "I want to believe X" is different from "I believe X"
- Track separately

## Test for Gap Closure

Can you:
1. Distinguish subjective personal knowledge from verifiable knowledge?
2. Track belief strength separately from epistemic confidence?
3. Document when personal views conflict with external consensus?
4. Propagate subjectivity through derived notes?
5. Track evolution of subjective knowledge over time?

If yes to all 5, the gap is closed.

## Related Notes

### Frontier Explorations
- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — Specific to taste/preferences
- [[Frontier Exploration - Interpretive Knowledge]] — Related to perspective
- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — Related to subjectivity in creative domains

### Seed Gaps
- [[Seed Gap - Sensory Evaluation Knowledge]] — Related but focuses on external evaluation
- [[Seed Gap - Empirically Validatable Knowledge]] — Related but focuses on verifiability

### Structural
- [[Note Types and Templates]]
- [[Note Lifecycle Management]]