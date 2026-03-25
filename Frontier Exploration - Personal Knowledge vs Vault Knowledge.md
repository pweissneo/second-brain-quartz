---
last-reviewed: 2026-03-21
last-updated: 2026-03-21
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
schema-version: "1.0"
tags:
  - frontier-exploration
  - personal-knowledge
  - meta-learning
  - audit
---

# Frontier Exploration - Personal Knowledge vs Vault Knowledge

> How to audit whether the vault accurately represents what you actually know, have experienced, or have verified — distinct from general quality checks.

## The Problem

The Seed covers extensive quality and structural checks:
- Verification status (is knowledge accurate?)
- Confidence calibration (how reliable is the source?)
- Staleness detection (is knowledge still current?)
- Structural health (is the graph well-connected?)

But there's a gap: **Does the vault accurately represent what YOU actually know?**

A note can pass all quality checks and still be problematic:
- You wrote notes about "how to roast a chicken" but you've never actually roasted one
- You captured "lessons from my meditation practice" but you abandoned meditation months ago
- You have notes on "how I built my startup" but you're still in the ideation phase

This is the **personal knowledge audit** gap — distinguishing knowledge you've actually lived through vs. knowledge you've collected but not verified through personal experience.

## What Makes This Different

| Check | What It Measures | What's Missing |
|-------|-----------------|----------------|
| Verification | Is the source accurate? | Have I personally tested this? |
| Confidence | Is the source reliable? | Do I actually remember/know this? |
| Staleness | Is the info current? | Have I done this recently? |
| Quality | Is the note well-formed? | Does it reflect my actual experience? |

## The Core Question

**"Did I actually do this, or did I just write about doing it?"**

This matters because:
1. **Self-deception risk**: It's easy to convince yourself you've "learned" something by reading about it
2. **False expertise**: Notes create an illusion of competence you don't have
3. **Wrong application**: You'll recommend approaches you've never tried
4. **Knowledge debt**: The gap between "vault knowledge" and "personal knowledge" accumulates silently

## Audit Categories

### 1. Experience-Based Knowledge
Knowledge that requires personal experience to truly understand:
- "How to [practical skill]" notes
- "Lessons from [project]" notes
- "What I learned from [experience]" notes

**Audit question:** Have I actually done this? Multiple times?

### 2. Expertise Level Knowledge
Knowledge that implies a certain skill level:
- "Advanced [topic]" notes
- "Expert-level [domain]" notes
- Notes that assume mastery

**Audit question:** Would I rate myself as proficient in this area?

### 3. Verification Through Action
Knowledge that requires action to verify:
- Recipes you've cooked
- Exercises you've performed  
- Techniques you've practiced
- Tools you've used

**Audit question:** Have I executed this? Did it work for me?

### 4. Historical Knowledge
Notes about your past experiences or decisions:
- Career decisions
- Relationship insights
- Life lessons

**Audit question:** Is this my actual memory, or did I reconstruct it from external sources?

## Personal Knowledge Inventory

### The "What I Actually Know" Test

Create a periodic audit where you categorize notes:

```yaml
# Note frontmatter extension
personal-knowledge-status:
  personally-experienced: true|false
  experience-count: number  # times executed
  last-practiced: YYYY-MM-DD
  confidence-from_experience: high|medium|low
  # For knowledge claiming expertise:
  self-assessed-level: beginner|intermediate|advanced|expert
  evidence: "What proves this level"
```

### Experience Tiers

| Tier | Description | Vault Indicator |
|------|-------------|-----------------|
| **Theory Only** | Read about it, never did | Note exists but no personal details |
| **Tried Once** | Experimented briefly | Brief mention of attempt |
| **Practiced** | Multiple experiences | Rich detail, lessons learned |
| **Mastered** | Regular application | Can teach others from experience |

### The Impostor Check

For notes that imply expertise, ask:
1. Could I do this without looking at the note?
2. Have I done this successfully multiple times?
3. Could I teach this to a beginner?
4. What evidence supports my claimed level?

## Warning Signs

### Knowledge Inflation
- Many notes on topics you've never practiced
- Notes sound authoritative but lack personal anecdotes
- "How-to" notes written before you've actually done it

### Stale Expertise Claims
- Notes claiming advanced knowledge in areas you've abandoned
- Outdated practice claims ("I regularly meditate" when you stopped)
- Skills listed that no longer apply

### Experience-Claim Mismatch
- Project notes for projects you never started
- Lessons from experiences you didn't have
- Insights from domains you've only read about

## Audit Process

### Quarterly Personal Knowledge Audit

1. **List all notes with experience claims**
   - Look for: "I learned", "I discovered", "my experience", "lessons from"
   
2. **Categorize each as:**
   - Still accurate to my current practice
   - Was accurate but I've changed
   - Never was accurate to my experience
   - Requires updating to reflect reality

3. **Calculate Personal Knowledge Ratio:**
   - Notes with personal experience / Total notes claiming experience
   - Target: >70% for active knowledge areas

4. **Identify knowledge inflation:**
   - Topics with many notes but no personal experience
   - Areas where reading replaced doing

### The "Actually Done" List

Maintain a separate track of what you've actually completed:

```yaml
# Separate file: Personal Accomplishments.md
actually-done:
  - skill: "Cooking"
    level: "practiced"
    evidence: "Cooked 200+ meals"
    last: "2026-03-15"
  - tool: "Python"
    level: "professional"
    evidence: "Used at work for 3 years"
    last: "2026-03-20"
```

## Relationship to Other Knowledge Types

- **Verification**: External verification is different from personal experience verification
- **Confidence**: Source confidence is different from personal knowledge confidence
- **Lifecycle**: A note can be "evergreen" in the vault but represent abandoned practice
- **Experimentation**: Personal experimentation results are the most personal knowledge

## Proposed Seed Rules

### Rule: Track personal experience separately from source verification

**Why:** Knowing a source is accurate (verification) is different from having personally experienced the knowledge. Personal experience adds unique value that external sources cannot replace.

**Test:** For notes containing personal claims ("I learned", "I tried", "my experience"): (1) Is there `personally-experienced:` frontmatter? (2) Can you distinguish theory-only knowledge from practiced knowledge? (3) Is there a mechanism to track experience level?

### Rule: Conduct periodic personal knowledge audits

**Why:** The gap between vault knowledge and personal knowledge grows silently. Regular audits surface knowledge inflation and keep the vault honest about what you actually know.

**Test:** (1) Can you calculate a personal knowledge ratio? (2) Do you have a process to identify theory-only knowledge? (3) When did you last audit what you actually know vs. what you've collected?

### Rule: Mark expertise claims with self-assessment

**Why:** Notes that imply expertise ("advanced", "expert", "mastery") need self-assessment to prevent false expertise claims. What you wrote about a topic and what you can actually do may differ.

**Test:** For notes implying expertise: (1) Is there self-assessed level? (2) Can you defend that level with evidence? (3) Would a colleague agree with your self-assessment?

## The Humility Principle

A knowledge base is most valuable when it's honest about what it doesn't know. Notes about topics you've never practiced should be clearly marked as "research/collection" not "experience." This prevents:
- Giving advice you shouldn't
- Overestimating your abilities  
- Recommending untested approaches

**The goal:** A vault where what you know and what the vault says you know are aligned.

## Related Notes

- [[Frontier Exploration - Personal Experimentation Results]] — captures what didn't work personally
- [[Frontier Exploration - Verification Status]] — verification workflow
- [[Frontier Exploration - Confidence Calibration]] — confidence assessment
- [[Self-Improvement Cycle]] — continuous improvement process
- [[Frontier Exploration - Knowledge Maintenance]] — accumulates when ignored

---

*This is an emerging area. The rules around personal knowledge auditing are not yet well-established.*
