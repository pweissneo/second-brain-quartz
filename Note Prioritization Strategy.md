---
last-reviewed: 2026-03-08
lifecycle: emerging
confidence: medium
tags:
  - seed-extension
  - frontier
  - prioritization
  - bootstrapping
---

# Note Prioritization Strategy

When bootstrapping a new knowledge base, the Seed tells you HOW to structure notes but not WHAT to create first. Without prioritization guidance, an AI agent faces analysis paralysis.

## The Problem

Starting from scratch with only the Seed's structural rules:
1. You create `_root.md` with purpose
2. You create atomicity/linking/navigation conventions
3. Then... what? Do you create notes about fundamentals first? Common use cases? Edge cases?

The Seed provides no ordering principle.

## Prioritization Heuristics

**1. Foundations before applications**
Create fundamental concepts before their applications. In cooking: knife skills before recipes. In programming: data structures before algorithms.

**2. High-connectivity nodes first**
Notes that will receive many links should exist early. Hub candidates (concepts with many future connections) deserve priority.

**3. Prerequisite chains**
Identify dependencies. Topic B cannot be understood without understanding topic A. Create A before B.

**4. Frequency-weighted**
Notes covering common, recurring concepts outrank niche ones. In software: arrays before esoteric design patterns.

**5. Vocabulary before content**
Domain terminology notes enable meaningful linking. Define terms before using them in explanations.

## Applying to a New Domain

When entering a new knowledge domain:

1. Identify 5-10 core concepts a practitioner would need first
2. Create atomic notes for these foundational concepts
3. Add links between them (they're all related)
4. Then expand outward to applications, edge cases, specialized topics

## Example: Cooking Knowledge Base

| Priority | Note | Rationale |
|----------|------|-----------|
| 1 | Kitchen Equipment | Required for everything |
| 2 | Knife Skills | Fundamental technique |
| 3 | Heat Management | Core principle |
| 4 | Basic Sauces | High-connectivity (links to proteins, vegetables, grains) |
| 5 | Flavor Building Blocks | Foundation for recipe creation |

Without prioritization, you might start with "How to make coq au vin" — too specific, too early.

## Related

- [[AI-Assisted Knowledge Management Seed]] — The Seed this note extends
- [[Atomic Note Principle]] — What makes a good note
- [[Hub Node Creation]] — Identifying high-connectivity nodes
- [[Note Insertion Strategy]] — Where new notes go
