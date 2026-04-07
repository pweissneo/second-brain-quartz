---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - bootstrap
  - prioritization
  - capture-order
gap-status: identified
---

# Frontier Exploration - Capture Priority Sequence for Unfamiliar Domains

## The Gap

The Seed covers **when** to create notes (Note Creation Decision Framework), **what** to capture (priority signals, diminishing returns, triage categories), and **how** to bootstrap with relaxed standards (construction-phase model). However, there's **no explicit guidance for determining the SEQUENCE of what to capture first** when bootstrapping a knowledge base in an unfamiliar domain.

## Why This Matters

When an AI agent drops the Seed into an empty vault for an unfamiliar domain (e.g., "build a knowledge base about pottery"), they face:
1. **Unknown unknowns** — What concepts are foundational vs. advanced?
2. **Capture ordering** — What should be captured FIRST, SECOND, THIRD?
3. **Foundation vs. application** — When to switch from building foundations to filling gaps?
4. **Domain-specific prioritization** — How to prioritize without domain expertise?

Without guidance, agents either:
- Capture randomly based on encounter order (suboptimal)
- Over-capture foundational theory before practical application
- Miss critical safety/prerequisite knowledge
- Build in wrong order (e.g., advanced techniques before basic safety)

## Current Seed Coverage (What's Missing)

The Seed has:
- **Construction-phase model**: Relaxed standards during bootstrap, tightens as vault matures
- **Priority signals**: Ranking captures by connection potential, re-encounter probability
- **Note Creation Decision Framework**: Whether to create vs. extend
- **70-20-10 allocation**: For mature vaults (70% gap-filling, 20% verification, 10% exploration)
- **Triage categories**: IMMEDIATE, DEFER, ON-DEMAND, IGNORE

What's **NOT** covered:
- How to identify foundational concepts in an unfamiliar domain
- What sequence to follow when starting from absolute zero
- When to shift from "building foundations" to "filling applications"
- How to prioritize safety-critical knowledge in new domains

## The Missing Seed Rule

### Rule: Apply Domain-Aware Capture Sequence During Bootstrap

**Why:** Without explicit capture sequencing, AI agents default to encounter-order or interest-driven capture, which produces inconsistent and often suboptimal vault structures. Foundational concepts get mixed with advanced applications, safety knowledge gets delayed, and the graph develops in the wrong order — making later retrieval and learning inefficient.

**Test:** For a new domain bootstrap:
1. Can you identify the first 5 concepts to capture (foundational safety, core principles, essential techniques)?
2. Is there a documented sequence explaining WHY that order?
3. Does the sequence prioritize safety-critical knowledge before application?
4. Can you distinguish "foundations" (capture first) from "applications" (capture after foundations)?
5. When do you transition from "building foundations" to "filling gaps"?

## Proposed Capture Sequence

### Phase 1: Safety & Prerequisites (First)
- **Safety-critical knowledge**: What could hurt someone? (toxic materials, dangerous tools, health hazards)
- **Prerequisite knowledge**: What must be understood before anything else?
- **Scope boundaries**: What's IN the domain and what's OUT?

**Example (pottery):**
- Respiratory hazards from silica dust
- Proper ventilation requirements
- Clay body toxicity (lead glazes)
- Kiln fire safety

### Phase 2: Core Principles (Second)
- **Fundamental concepts**: The "why" behind the practice
- **Essential techniques**: Skills without which nothing else works
- **Core terminology**: Domain vocabulary for further learning

**Example (pottery):**
- How clay hydrates and fires
- Centering on the wheel
- Basic wheel throwing
- Drying stages and shrinkage

### Phase 3: Essential Materials & Tools (Third)
- **Materials properties**: What you're working with
- **Tool fundamentals**: What you need and why
- **Sourcing knowledge**: Where to get supplies

**Example (pottery):**
- Clay types (stoneware, earthenware, porcelain)
- Glaze components and chemistry
- Essential hand tools
- Kiln types and selection

### Phase 4: Standard Procedures (Fourth)
- **Common workflows**: How things are typically done
- **Quality benchmarks**: What "good" looks like
- **Troubleshooting basics**: Common problems and solutions

**Example (pottery):**
- Throwing procedures
- Trimming and finishing
- Bisque firing process
- Glaze application methods

### Phase 5: Applications & Variations (Fifth+)
- **Advanced techniques**: Building on foundations
- **Style-specific knowledge**: Different approaches within the domain
- **Edge cases and exceptions**: Where standard rules don't apply

**Example (pottery):**
- Advanced wheel throwing
- Hand-building techniques
- Special firing techniques
- Historical and cultural traditions

## Implementation Guidance

### How to Identify Foundational Concepts in Unfamiliar Domains

1. **Safety-first**: Look for knowledge that could cause harm if missed
2. **Prerequisite mapping**: Ask "What must someone understand before X?"
3. **Term frequency**: Core concepts appear in most other concepts
4. **Dependency analysis**: What do other notes ссылаются на (link to) most?
5. **Expert interviews**: What do experts say is "first thing to learn"?

### Transition Trigger

Switch from Phase 1-3 (foundations) to Phase 4-5 (applications) when:
- Safety knowledge is captured
- Core principles have dedicated notes
- Essential techniques have basic coverage
- You can answer "what is X?" for top 20 domain concepts

### 70-20-10 Adaptation for Bootstrap

Instead of mature-vault allocation, bootstrap phase should be:
- **50% foundations**: Safety, principles, prerequisites, core concepts
- **30% applications**: Standard procedures, common workflows
- **20% exploration**: Edge cases, variations, advanced topics

## Edge Cases

### Edge Case: Real-Time Learning vs. Planned Bootstrap
If actively learning a domain while building the vault, capture order should follow learning order with safety checks — don't delay capturing what you're actively learning just to follow a sequence.

### Edge Case: Domain Has Existing Structure
Some domains come with inherent structure (academic curricula, professional certifications). In these cases, follow the existing structure but ensure safety is prioritized within it.

### Edge Case: Unknown Safety Knowledge
If you don't know what safety knowledge exists in a domain, add "safety audit" as a Phase 1 task — research what safety knowledge exists before capturing other content.

## Related

- [[AI-Assisted Knowledge Management Seed.md]] — Bootstrap rules
- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] — Existing guidance
- [[Construction-Phase Model]] — Relaxed standards during bootstrap
- [[Note Creation Decision Framework]] — Whether to create notes
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]] — Discovery in unfamiliar domains