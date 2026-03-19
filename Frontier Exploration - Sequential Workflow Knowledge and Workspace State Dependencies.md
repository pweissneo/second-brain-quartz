---
last-reviewed: 2026-03-18
lifecycle: active
confidence: emerging
author-type: ai-assisted
status: draft
review-by: 2026-03-25
tags:
  - frontier-exploration
  - sequential-knowledge
  - workflow
  - home-renovation
  - construction
---

# Frontier Exploration - Sequential Workflow Knowledge and Workspace State Dependencies

> Notes on capturing knowledge where the workspace itself changes during the process, and subsequent steps depend on those changes.

## The Challenge

In domains like home renovation, automotive repair, fabrication, and crafting, the knowledge isn't just about techniques — it's about working in a specific space where each step changes the state of that space, and subsequent steps depend on those changes.

### What Makes This Different

Standard procedural knowledge assumes a static environment. The recipe doesn't change the kitchen; the code tutorial doesn't change your IDE. But sequential workspace knowledge has a fundamental difference:

- **Workspace state matters**: What you're working ON changes during the process
- **Subsequent steps depend on prior state**: You can only sand after you've demolished
- **Re-entry is costly**: If you realize you missed something 3 steps back, the cost to fix it is high
- **Sequence can't be parallelized**: You can't do steps 3 and 4 simultaneously because step 3 creates the condition step 4 needs

### Examples

1. **Tile installation**: You lay mortar, then set tile, then grout. Each step changes what the workspace looks like. You can't grout before the tile is set.
2. **Automotive repair**: You remove components in a specific order to access deeper components. The "what's removed" state matters.
3. **Painting a room**: Primer → paint → finish. Each layer changes the surface. The sequence isn't optional.
4. **Plumbing**: You shut off water, drain pipes, replace fitting, test for leaks, restore water. The sequence creates the condition for the next step.

## The Seed Gap

The Seed treats procedures as atomic or split-able units. It handles:
- Procedural content that's >300 words
- Condition-triggered knowledge (when to apply)
- Equipment-dependent techniques

But it lacks:
- **Workspace state tracking**: Rules for documenting what the workspace looks like at each stage
- **Prerequisite state documentation**: Rules for stating what must be true before a step can begin
- **Recovery procedures**: What to do when you discover an error 3 steps back
- **Dependency mapping**: Explicit documentation of which steps create conditions for subsequent steps
- **Cost of re-entry assessment**: Estimating the cost of fixing errors vs. continuing

## Proposed Seed Rules (Draft)

### Rule: Sequential Workspace State Documentation

**Rule:** For sequential workflow knowledge where each step changes the workspace, include explicit state documentation: what the workspace looks like after each step, and what must be true before the next step begins.

**Why:** Without explicit state documentation, users can't verify they're ready for the next step, can't diagnose where errors occurred, and can't assess whether they need to re-enter a prior stage.

**Test:** For each step in a sequential workflow note: (1) Can you state what the workspace looks like after completing this step? (2) Can you state what must be true before the next step can begin? (3) Can you identify what would indicate something went wrong at this step?

### Rule: Error Recovery Path Documentation

**Rule:** For complex sequential workflows (5+ steps), include explicit error recovery paths: what to do if you discover an issue at step N that requires fixing step N-2.

**Why:** The cost of re-entry is a critical decision factor. Without explicit recovery documentation, users either avoid troubleshooting (wasting resources on flawed work) or dive in without understanding the cost.

**Test:** For workflows with 5+ steps: (1) Can you identify the error recovery points? (2) Does each recovery path state what resources/time it requires? (3) Can users choose between "continue anyway" vs "go back and fix" based on documented costs?

### Rule: Dependency Chain Mapping

**Rule:** For sequential workflows, use explicit dependency chain frontmatter to map which steps create conditions for subsequent steps.

**Why:** Some steps are independent (can be done in any order), some are sequential (must follow), and some are interdependent (each affects the other). Without explicit mapping, users assume all steps are equally sequential.

**Test:** For sequential workflow notes: (1) Can you identify which steps are independent? (2) Can you identify which steps depend on prior steps creating specific conditions? (3) Is there a dependency map in frontmatter or explicit in the note structure?

## Implementation Approaches

### State Checkpoint Pattern

Structure sequential workflow notes with explicit state checkpoints:
```markdown
## Step 3: Install Subfloor

### Pre-conditions
- Joists exposed and inspected
- Underlayment removed
- Workspace clear

### Actions
[step description]

### Post-conditions  
- Subfloor laid
- Gap <1/8" between sheets
- Screws set flush
- Ready for Step 4
```

### Recovery Map

Include recovery decision matrix:
```markdown
## Error Recovery Options

| If issue discovered at | Cost to fix | Recommendation |
|-----------------------|-------------|----------------|
| Step 2 | Low (materials intact) | Fix before proceeding |
| Step 3 | Medium (partial work) | Evaluate vs. continue |
| Step 4 | High (significant rework) | Document for later fix |
```

### Dependency Graph

Frontmatter for complex workflows:
```yaml
workflow-type: sequential
step-count: 8
dependencies:
  - { step: 3, requires: [1, 2], creates-condition-for: [4, 5] }
  - { step: 4, requires: [3], creates-condition-for: [6] }
independent-steps: [1, 2, 7]
```

## Related

- [[Frontier Exploration - Equipment and Tool Dependencies]] — Related to tool chains
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]] — Context-dependent knowledge
- [[Frontier Exploration - Safety-Critical Procedural Knowledge]] — Safety in procedures
- [[AI-Assisted Knowledge Management Seed]] — Seed rules on procedural content