---
last-reviewed: 2026-03-22
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - relationship-knowledge
  - personal-knowledge
  - network-knowledge
level: principle
---

# Frontier Exploration - Personal Network and Relationship Knowledge

> How should a knowledge base capture and organize knowledge about specific people, relationships, and social networks?

## The Problem

The Seed covers interpersonal knowledge in general terms — relationship dynamics, communication strategies, social skills. But there's a gap around **specific people knowledge** — notes about particular individuals, your relationship with them, their contact information, preferences, and interaction history.

This is different from:
- **General interpersonal knowledge**: "Active listening skills apply to conversations"
- **Relationship dynamics**: "People with avoidant attachment styles struggle with vulnerability"
- **Social skills**: "Networking best practices for professional settings"

Personal network knowledge is about **specific individuals** — your brother, your colleague, your mentor, your healthcare provider.

## Why This Matters

Knowledge bases often need to track:
- **Contact details**: How to reach someone, their preferred communication methods
- **Relationship context**: Your connection to them, how you met, significant events
- **Preferences**: What they like, what they've told you about themselves
- **Interaction history**: What you've discussed, agreements made, follow-ups needed
- **Network position**: How they connect you to other people or resources

Without guidance, AI agents either avoid capturing people knowledge entirely (losing valuable context) or treat it like any other domain knowledge (missing the unique considerations).

## Current Seed Gaps

1. **No guidance on relationship-to-note mapping** — Should each person get one note or multiple? How to handle people who appear in multiple contexts?
2. **No privacy framework for people knowledge** — What about people who haven't consented to being in your knowledge base?
3. **No distinction between relationship types** — Professional, personal, family, healthcare, service providers each have different knowledge needs
4. **No guidance on stale/dated relationship knowledge** — People change; how to handle outdated information about someone?
5. **No handling of multi-context individuals** — Your doctor is also your tennis partner; your colleague is also your neighbor

## Questions an AI Agent Would Have

An AI building a personal knowledge base would struggle with:

1. Should I create a note for every person I know?
2. How do I handle sensitive information about people who didn't consent to being recorded?
3. What if the information is about a minor?
4. How do I handle conflicting information about the same person from different sources?
5. Should I include deceased individuals?
6. How do I handle relationship changes (ex-partners, former colleagues)?
7. What's the boundary between "useful context" and "creepy surveillance"?

## Existing Seed Rules That Apply

The Seed already has relevant rules that need adaptation:

- **Exclusion knowledge** (Rule in Foundation section): "Assess harm potential before capturing personal or sensitive information"
- **Privacy rule**: "Exclude or protect knowledge about living individuals without consent"
- **Relationship-specific knowledge**: "Distinguish relationship-specific knowledge from general interpersonal knowledge"

These rules provide a foundation but lack specific guidance for organizing personal network knowledge systematically.

## Emerging Rule Suggestions

### Rule: Create a dedicated people taxonomy with relationship type tagging

**Proposed structure:**
```yaml
person-type: professional|personal|family|service-provider|historical
relationship-context: how-you-know-this-person
connection-strength: close|regular|occasional|one-time
last-interaction: YYYY-MM-DD
```

**Why:** Different relationship types need different knowledge. Your doctor needs medical-relevant context; your mentor needs career-relevant context; your friend needs personal-preference context.

**Test:** Can you categorize each person note by relationship type? Does the knowledge captured match what that relationship type needs?

### Rule: Apply consent-based privacy tiers

**Proposed tiers:**
- `consent: explicit` — Person has agreed to being in your knowledge base
- `consent: implied` — Public figure or relationship where recording is normal
- `consent: none` — Person hasn't consented; minimize personal details
- `consent: retracted` — Person asked to be removed; archive or delete

**Why:** Capturing information about people without their knowledge creates ethical and legal risk. Consent tiers enable appropriate boundaries.

**Test:** For each person note, can you identify the consent status? Are non-consented notes minimized to basic facts only?

### Rule: Separate factual from analytical relationship notes

**Proposed structure:**
- **Person note**: Factual information — name, contact, role, how you met
- **Relationship note**: Your analysis — dynamics, patterns, what you've learned about interacting with them
- **Interaction notes**: Specific conversations or events (time-boxed)

**Why:** Factual notes are relatively stable; analytical notes evolve. Mixing them creates maintenance burden and potential privacy issues if you share the vault.

**Test:** Can you separate factual person data from your interpretations? Would sharing the vault expose more than intended?

### Rule: Use temporal markers for relationship knowledge

**Proposed fields:**
```yaml
relationship-status: active|former|evolving
known-since: YYYY-MM-DD
last-verified: YYYY-MM-DD
```

**Why:** Relationships change. Information that was accurate two years ago may be wrong now. Temporal markers help identify potentially stale knowledge.

**Test:** Can you identify which person knowledge might be outdated? Do relationship notes have reasonable update timestamps?

### Rule: Handle multi-context people with role-based organization

**Proposed approach:**
- Single person note with role-based sections OR
- Separate notes per role with explicit linkage

**Why:** Your doctor who is also your friend appears in multiple contexts. The knowledge that applies in each context differs.

**Test:** For people in multiple contexts, does each role have appropriate context-specific knowledge? Can you navigate by context?

### Rule: Apply data minimization for non-consented persons

**For people without explicit consent:**
- Only include information that's publicly available or incidental
- Avoid personal preferences, private details, or interaction history
- Don't include contact methods or locations

**Why:** Privacy isn't just about encryption — it's about what you collect in the first place. Non-consented notes should be skeleton minimum.

**Test:** For non-consented person notes, can you verify they contain only minimal factual information? Would the person be comfortable if they knew?

## Edge Cases

### Deceased individuals
- Generally OK to have richer notes (no privacy concern)
- Mark with `deceased: true` and date of death
- May contain more personal/analytical content

### Minors
- Treat as higher sensitivity than adults
- Parental consent preferred
- Minimize location and identifying details

### Ex-relationships (partners, colleagues)
- Archive rather than delete (interaction history may be valuable)
- Mark as `relationship-status: former`
- Consider what knowledge still has value vs. what is now irrelevant

### Public figures
- Higher tolerance for factual recording (public interest)
- Still need to distinguish fact from speculation
- Analytical notes about public figures are still your opinion

## Domains Where This Matters Most

- **Personal knowledge management**: Contacts, family history, social network
- **Professional CRM**: Client relationships, networking, business development
- **Research**: Interview subjects, research participants (with consent protocols)
- **Healthcare**: Patient relationships (with HIPAA considerations)

## Relationship to Existing Seed Rules

This exploration extends:
- **Privacy rule** (Foundation): Applies but needs implementation specifics
- **Relationship-specific knowledge** (Foundation): Different from general interpersonal dynamics
- **Harm assessment** (Foundation): Particularly relevant for relationship knowledge
- **Staleness detection** (Quality Maintenance): Apply to relationship knowledge

## Additional Perspectives: Relationship Knowledge vs General Knowledge

Traditional knowledge management assumes knowledge comes from external sources: books, courses, research, websites. But some of the most valuable knowledge comes from accumulated experience with specific people — your partner, children, friends, colleagues. This is **relationship-specific knowledge**: insights about how a particular person thinks, what motivates them, what triggers them, what brings them joy.

### What Makes Relationship Knowledge Different

| Aspect | General Knowledge | Relationship Knowledge |
|--------|-------------------|----------------------|
| Source | External (books, courses, research) | Internal (accumulated observation) |
| Applicability | Universal or domain-wide | Specific to one person |
| Verification | Can check sources | Must rely on memory/observation |
| Updates | Source-based changes | Person changes over time |
| Sharing | Generally safe | Often private/sensitive |

### Types of Relationship Knowledge

1. **Communication Preferences** — How someone prefers to receive difficult news, conflict resolution style, topics that are safe vs. sensitive, communication rhythms (morning person vs. night owl)

2. **Motivational Drivers** — What excites them about the future, what fears hold them back, what praise format resonates (public vs. private), what stressors are current

3. **Behavioral Patterns** — How they handle stress, decision-making process, sleep/energy patterns, how they process big decisions

4. **Practical Logistics** — Important dates (anniversaries, birthdays, milestones), health considerations, schedule constraints, contact preferences

### Capture Strategies

- **Direct Query**: Ask directly — "What do you appreciate about how I handle X?" Capture immediately.
- **Observation Logging**: After significant interactions, capture: "When I did X, Partner responded with Y. This suggests they value A but are sensitive to B."
- **Joint Documentation**: Some relationship knowledge should be documented WITH the person, not ABOUT them — preferences, boundaries, and expectations are better captured collaboratively.

### Seed Rule: Distinguish Relationship-Specific Knowledge

**Rule:** Distinguish relationship-specific knowledge from general interpersonal knowledge — relationship knowledge applies to one specific person and should be tagged with subject, verification-status, and sensitivity level.

**Why:** Conflating relationship knowledge with general knowledge misleads readers and AI agents about applicability. A tip that works for your partner may not work for anyone else.

**Test:** For a note about interpersonal dynamics: (1) Does this apply to a specific person or to people in general? (2) If specific, is there subject/sensitivity frontmatter? (3) Is it marked as verification-status: inferred vs. verification-status: direct-confirmed?

## Related Notes

- [[Frontier Exploration - Personal Health Metrics and Body Knowledge]] — Similar privacy considerations
- [[Frontier Exploration - User Situational Constraints]] — May include relationship context
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules
- [[Best Practice - Selective Capture]] — Related to over-collecting people information

## Test Case: Building a Personal Network Knowledge Base

An AI building a knowledge base about "my social network" using only current Seed rules would:
- ✓ Apply privacy principles to people knowledge
- ✓ Distinguish relationship-specific from general interpersonal
- ✗ Not know how to organize individual person notes
- ✗ Not know consent tiers to apply
- ✗ Not know how to handle multi-context individuals
- ✗ Not know what temporal markers to use

---

*This is a frontier exploration note. The Seed rules around personal network knowledge are not yet solidified — this represents emerging understanding that may eventually become formal Seed rules.*
