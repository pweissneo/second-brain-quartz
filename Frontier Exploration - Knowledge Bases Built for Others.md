---
last-reviewed: 2026-04-08
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
verification-status: unverified
knowledge-type: conceptual
access-pattern: learning
tags:
  - frontier-exploration
  - knowledge-management
  - user-centered-design
  - vault-architecture
gap-status: identified
gap-source: manual
---

# Frontier Exploration: Knowledge Bases Built for Others

> Exploring the unique challenges of creating AI-managed knowledge bases for other people — where the creator is not the primary user. This differs fundamentally from building your own vault.

## The Problem Space

Building a knowledge base for yourself is straightforward:
- You know your context
- You know what you want to find
- Personal knowledge ratio (5:1) applies
- You can iterate based on your own usage

Building for others introduces fundamental differences:
- You don't know their specific context
- "Personal" knowledge means THEIR personal, not yours
- The 5:1 ratio may not apply
- You need to design for unknown expertise levels
- You need to anticipate their needs

## Distinct from Collaborative Creation

The Seed covers collaborative knowledge creation (multiple people building together). This is different:

| Aspect | Collaborative KB | KB Built for Others |
|--------|-----------------|-------------------|
| Users | Known participants | Unknown/unspecified |
| Knowledge source | Shared creation | One-way transfer |
| Personal ratio | Everyone's personal | Target user's personal |
| Iteration | Based on group feedback | Based on assumed needs |
| Ownership | Shared | Creator = architect, user = owner |

## Key Challenges

### Challenge 1: Unknown User Context

When you build for yourself, you implicitly understand:
- Your goals and priorities
- Your expertise level
- Your search behavior
- What "utility" means for you

When building for others, you must either:
- Ask detailed questions upfront (and get incomplete answers)
- Make assumptions (often wrong)
- Build generic structures that work for "typical" users
- Include extensive context-setting that works for unknowns

### Challenge 2: The Personal Knowledge Ratio Inversion

The 5:1 rule (personal:general) assumes the builder is the user. For a KB built for others:
- YOUR personal insights may not help THEM
- Their personal insights (which you don't have) are what would help
- General knowledge may be MORE valuable if you're teaching them basics

**Hypothesis**: The ratio should invert for teaching/learning scenarios:
- Building FOR a beginner: more general knowledge acceptable (3:1)
- Building FOR an expert: higher personal ratio (5:1 or more)
- Building FOR unknown: default to balanced (1:1) until user context known

### Challenge 3: Unknown Expertise Level

You must design for users at unknown skill levels:
- Beginner: needs foundational knowledge, warnings about basics
- Intermediate: assumes basics, needs application-level knowledge
- Expert: skips basics, needs advanced/edge case knowledge
- Variable: same KB used by multiple expertise levels

### Challenge 4: Anticipating User Needs

You don't know what they'll search for:
- Their questions won't match your mental model
- Their terminology will differ
- Their priorities will differ from yours

### Challenge 5: Maintenance and Ownership

When the user takes over:
- They may not understand your organizational logic
- They may not follow your conventions
- The KB may diverge from your intent
- You lose control but might still be asked for help

## Proposed Patterns

### Pattern 1: Context-Rich Entry Points

Build multiple entry points for different user contexts:
```yaml
entry-point-for:
  - context: beginner
    description: "Starting from zero knowledge"
  - context: intermediate  
    description: "Knows basics, wants to deepen"
  - context: reference
    description: "Needs quick lookups"
```

### Pattern 2: Explicit Assumption Documentation

Document what you assumed when building:
```yaml
design-assumptions:
  user-expertise: beginner
  user-goals: ["general understanding", "practical application"]
  terminology: "plain-language"
  cultural-context: "western-industrial"
confidence: emerging
```

### Pattern 3: Adaptive Structure

Build flexible structures that work for multiple contexts:
- Multiple hub notes at different abstraction levels
- Redundant linking (same content accessible from multiple paths)
- Explicit "path" notes that guide through the KB for specific goals

### Pattern 4: Onboarding as First-Class

Include extensive onboarding since you can't rely on shared context:
- What this KB is FOR
- How to navigate it
- What conventions are used
- How to extend it

### Pattern 5: Feedback Integration

Build in explicit feedback mechanisms since you can't observe usage:
```yaml
feedback-channel: "embedded survey link"
feedback-prompts: "Does this answer your question?"
usage-questions:
  - "What were you looking for?"
  - "Did you find it?"
  - "What was missing?"
```

## Seed Rule Proposals

### Proposal 1: KB Purpose Tagging

Add explicit purpose tagging:
```yaml
kb-purpose: personal-reference | learning | teaching | collaborative | client-facing
target-user-description: "Free-text description of intended user"
```

### Proposal 2: Context Assumption Frontmatter

For KBs built for others:
```yaml
assumed-context:
  expertise-level: beginner|intermediate|advanced|variable
  domain-familiarity: none|some|extensive
  use-patterns: [reference, learning, decision-support]
  terminology-preference: technical|plain|both
```

### Proposal 3: Multi-Path Navigation

For unknown users, provide explicit navigation paths:
```yaml
navigation-paths:
  - path-name: "For complete beginners"
    steps: ["[[Foundation 1]]", "[[Foundation 2]]", "[[Foundation 3]]"]
  - path_name: "Quick reference"
    steps: [["Topic Hub A]]", "[[Topic Hub B]]"]
```

### Proposal 4: Transfer Documentation

When transferring a KB to someone else:
```yaml
transfer-metadata:
  original-builder: "creator name"
  transfer-date: "YYYY-MM-DD"
  recipient-context-known: true|false
  handover-notes: "[[Handover Documentation]]"
```

## Test Scenarios

### Scenario 1: Parent building KB for Child

- Parent knows child's context (some)
- Child's expertise: zero
- Knowledge type: learning-focused
- Challenge: Child may not know what they don't know

### Scenario 2: Consultant building KB for Client

- Consultant knows domain, not client's specific situation
- Client needs: reference + decision-support
- Challenge: Sensitive information boundaries

### Scenario 3: Developer building KB for Users

- Developer knows software, not user's use case
- Users: multiple expertise levels
- Challenge: Documentation vs. knowledge base distinction

### Scenario 4: Estate/Heir KB

- Building KB for someone who will receive it after your death
- Unknown expertise level (future)
- Challenge: Must be self-explanatory

### Scenario 5: Organization KB for Employees

- Built by org, used by employees
- Multiple users, different roles
- Challenge: Balancing general org knowledge with personal employee knowledge

## Questions for Seed Incorporation

1. Should "KB built for others" be a distinct vault type with modified Seed rules?
2. How should the 5:1 ratio adapt for teaching scenarios?
3. Should onboarding be mandatory for external-facing KBs?
4. How do you measure success of a KB you don't use yourself?

## Related Notes

- [[Frontier Exploration - Multi-Vault Architecture]] - Related to managing multiple vaults
- [[Frontier Exploration - Knowledge Base Onboarding]] - Onboarding patterns
- [[Frontier Exploration - Collaborative Knowledge Creation]] - Different from building for others
- [[Frontier Exploration - User Situational Constraints]] - Understanding user context
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] - Different expertise levels

---

**Status**: This is frontier exploration. Building knowledge bases for others is a common but underexplored use case with distinct challenges not addressed by the Seed.
