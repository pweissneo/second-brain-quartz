---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
  - seed-extension
  - audience
  - accessibility
  - frontier
---

# Multi-Audience Knowledge Bases

Serving beginners and experts from the same vault.

## The Problem

The Seed assumes a single audience, but many knowledge bases must serve multiple expertise levels:

- A medical vault → patients AND physicians
- A programming vault → juniors AND seniors  
- A law vault → paralegals AND attorneys
- A cooking vault → beginners AND professional chefs

The same note cannot be all things to all people. Yet splitting every note by expertise level duplicates content and fragments the graph.

## The Gap

The Seed provides:
- Atomicity (one idea per note)
- Jargon vs Plain Language rules
- Prerequisite tracking
- Gateway notes

But it lacks guidance on:
- When to create tiered content vs. unified content
- How to organize entry points for different audiences
- Whether to mark notes with intended expertise level

## Strategy 1: Tiered Entry Points

> **Note:** The following are illustrative examples of multi-audience structure.

Create separate hub notes for each audience:

```
Programming Index *[illustrative]*         → For beginners
  → Links to basic concepts
  
Advanced Programming *[illustrative]*      → For experts  
  → Links to deep dives, patterns

Programming Gateway *[illustrative]*       → For everyone
  → Links to both entry points
```

Each hub serves its audience without duplicating atomic notes.

## Strategy 2: Expertise Tags

Add frontmatter to signal intended level:

```yaml
---
audience: [beginner|intermediate|advanced|all]
prerequisites: Basic Concept 1 *[illustrative]*, Basic Concept 2 *[illustrative]*
---

For example:
- Variables *[illustrative]* → audience: beginner
- Monads *[illustrative]* → audience: advanced
- Control Flow *[illustrative]* → audience: all
```

## Strategy 3: Layered Notes

For complex topics, create layered notes:

```
Database Index *[illustrative]*            → Overview (all audiences)
  → SQL Basics *[illustrative]*           → audience: beginner
  → Query Optimization *[illustrative]*   → audience: advanced
  → Database Theory *[illustrative]*      → audience: intermediate
```

The index links to all layers; readers self-select their entry point.

## Strategy 4: Progressive Depth

Structure notes to flow from accessible to deep:

```markdown
# Relational Databases

[One-paragraph plain-language overview - all audiences]

## For Beginners
[Explanation using analogies and simple terms]

## Advanced Details
[Technical deep-dive - marked with audience: advanced]
```

Use horizontal rules or clear headings to separate layers.

## When to Use Each Strategy

| Situation | Strategy |
|-----------|----------|
| Totally different needs | Tiered Entry Points |
| Same content, different depth | Layered Notes |
| Quick filtering needed | Expertise Tags |
| Complex topic with prerequisites | Prerequisite Chains |

## Seed Rule Proposal

**Rule:** For vaults serving multiple expertise levels, create audience-specific entry points rather than duplicating atomic notes.
**Why:** Duplication fragments knowledge and creates maintenance burden; tiered entry points preserve atomicity while serving diverse audiences.
**Test:** Can a beginner find accessible entry points? Can an expert find deep dives without wading through basics?

**Rule:** Mark notes with `audience` frontmatter field when serving specific expertise levels.
**Why:** Enables filtering and helps readers/programs identify appropriate content.
**Test:** Can you filter notes by audience level? Do prerequisite notes link to appropriate audience-tagged content?

## Stress Test: Medical Vault

> **Note:** The following are illustrative examples — hypothetical notes for a medical knowledge base.

**Scenario:** Building a knowledge base about heart disease

**Without this rule:**
- One note on "Myocardial Infarction" *[illustrative]* trying to serve everyone
- Patients confused by clinical jargon
- Doctors frustrated by oversimplification

**With this rule:**
- Heart Disease Gateway *[illustrative]* → links to all entry points
- Heart Disease for Patients *[illustrative]* → plain language, links to Heart Disease for Professionals *[illustrative]*
- Heart Disease for Professionals *[illustrative]* → clinical terminology, links to Heart Disease for Patients *[illustrative]* for patient education

Both audiences served; atomic notes shared.

## Related
- [[Hub Node Creation]]
- [[Frontier Exploration - Jargon vs Plain Language]]
- [[Prerequisite Knowledge Tracking]]
- [[AI-Assisted Knowledge Management Seed]]
