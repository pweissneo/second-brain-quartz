---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - context-dependency
  - constraints
---

# Frontier Exploration - User Situational Constraints

> When does knowledge validity depend on user context beyond expertise level?

## The Gap

The Seed covers many scope dependencies:
- **Expertise level** (beginner/intermediate/advanced)
- **Jurisdiction** (legal, geographic)
- **Climate zone** (hardiness zones, environmental)
- **Equipment** (physical tools required)
- **Version** (software/tool dependencies)

But there's a gap: **user situational constraints** that limit applicability even when someone has the expertise.

## What Are User Situational Constraints?

Conditions that affect whether knowledge can be applied, regardless of whether the user understands it:

### Time Constraints
- "Make a dinner in 15 minutes" vs "make a proper French meal"
- Both require expertise, but time limits which approach applies

### Budget Constraints  
- "Cook on $10/week" vs "unlimited budget"
- Same domain, vastly different valid approaches

### Access Constraints
- No oven, no stand mixer, no specialized equipment
- Urban vs rural access to ingredients
- Online vs offline access

### Physical Constraints
- Mobility limitations
- Sensory impairments
- Space limitations (apartment cooking vs kitchen lab)

### Social Constraints
- Cooking for 1 vs cooking for 20
- Dietary restrictions (own or others being cooked for)
- Cultural/religious food limitations

## Why This Matters

A knowledge base optimized for AI assistance needs to understand:
1. What does the user actually need RIGHT NOW?
2. What constraints do they operate under?
3. Which knowledge applies given their situation?

Without constraint tracking, an AI might suggest:
- A 3-hour recipe to someone with 20 minutes
- Expensive ingredients to someone on a budget  
- Professional equipment to a home cook
- Solutions requiring ingredients only available in major cities

## The Problem in Practice

The Seed's expertise-level tagging handles "what you know" but not "what you can actually do given your situation."

Example:
- A beginner baker with a stand mixer vs a beginner baker with only a whisk
- Same expertise level, different valid knowledge

Example:
- An expert chef with 2 hours vs an expert chef with 30 minutes
- Same expertise, different time constraint changes valid approaches

## Proposed Solution: Constraint Scope Tags

Add constraint scope to notes that are context-dependent:

```yaml
constraints:
  time: "<15min" | "15-30min" | "30-60min" | "1-2hr" | "2hr+"
  budget: "budget" | "moderate" | "premium"
  equipment: [list of required equipment]
  servings: "1-2" | "3-4" | "5+" 
  dietary: [relevant restrictions]
```

## Alternative: Constraint-Aware Hub Notes

Create hub notes specifically for constraint intersections:
- "Quick Weeknight Dinners (Under 30 min)"
- "Budget Cooking (<$10/day)"
- "One-Pot Meals" (minimal cleanup constraint)

This mirrors how the Seed suggests hub notes for topics - create constraint hubs for common user situations.

## Test Cases

### Cooking Domain
- Knowledge: "Sear steak for 3 minutes per side for medium-rare"
- Valid for: home cook with cast iron, 7 minutes
- NOT valid for: backpacking stove (no cast iron), 3 minutes total

### Home Repair Domain
- Knowledge: "Use a table saw for precise cuts"
- Valid for: woodworker with shop
- NOT valid for: apartment dweller, renter who can't use power tools

### Music Learning Domain
- Knowledge: "Practice with a metronome at 120 BPM"
- Valid for: anyone with metronome access
- Constraint note: "No-metronome alternatives"

### Programming Domain
- Knowledge: "Use Docker for local development"
- Valid for: developer with admin rights on machine
- NOT valid for: corporate environment with restrictions

## Seed Rule Proposal

**Rule:** For knowledge where applicability depends on user situational constraints (time, budget, equipment, physical ability, social context), include explicit constraint scope in frontmatter.
**Why:** Without constraint tracking, AI agents cannot determine which knowledge is relevant to a user's actual situation. An expert can know many approaches but only apply those matching their constraints.
**Test:** Pick 10 notes in a domain with time/budget/equipment variation. Can you determine: (1) What constraints does this knowledge assume? (2) Are constraint assumptions explicit? (3) Could an AI filter this knowledge by user constraints?

## Relationship to Existing Rules

This extends:
- [[Note Types and Templates]] - adding constraint types to note metadata
- [[Metadata and Tagging]] - new constraint tags
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] - complements expertise with situation
- [[Frontier Exploration - Equipment and Tool Dependencies]] - extends equipment from "required to execute" to "required to apply this approach"

## Related
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[Frontier Exploration - Equipment and Tool Dependencies]]
- [[Note Types and Templates]]
- [[Metadata and Tagging]]
- [[AI-Assisted Knowledge Management Seed]]
