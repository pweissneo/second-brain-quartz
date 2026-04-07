---
last-reviewed: 2026-03-26
last-updated: 2026-04-06
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
---

# Frontier Exploration - Problem-Centered Knowledge Organization

## The Gap

The Seed provides extensive guidance for organizing knowledge BY TOPIC (cooking notes, photography notes, woodworking notes) but lacks explicit guidance for organizing knowledge BY PROBLEM TYPE.

When building a knowledge base from scratch, an AI following the Seed will naturally create topic-based vaults: "cooking vault," "photography vault," "trading vault." But problems cut across topics in ways topics don't anticipate.

## The Problem

Consider these scenarios where topic-based organization fails:

1. **"How do I debug this?"** — A programmer, cook, and gardener all need debugging approaches, but each has their own topic vault with no cross-link.

2. **"What could go wrong?"** — Risk assessment knowledge exists in each domain but with no shared structure or terminology.

3. **"What's the decision framework?"** — Decision-making under uncertainty applies everywhere but is captured separately in each topic.

4. **"How do I prioritize?"** — Prioritization frameworks (Eisenhower matrix, MoSCoW, ICE scoring) are universally applicable but exist only in topic-specific notes.

5. **"What are failure modes?"** — Failure taxonomy (false positive, false negative, mode collapse, cascade failure) applies across domains but isn't unified.

The Seed covers error knowledge capture (programming errors, cooking errors) but doesn't address the structural gap: problem-centered knowledge exists in parallel to topic-centered knowledge, with no connection.

## Why This Matters

Without problem-centered guidance:
- Knowledge about PROBLEMS (not solutions) remains scattered across topics
- Cross-domain patterns are invisible to the AI
- Users must rediscover universal patterns in each new domain
- The vault can't answer "how do I X?" questions that span topics

## Proposed Seed Rule

**Rule:** Organize problem-solving knowledge separately from domain knowledge — create cross-topic hubs for universal problems (debugging, decision-making, risk assessment, prioritization, failure analysis) and link from domain-specific notes to these hubs.

**Why:** Problems are orthogonal to topics. The same problem (debugging, risk assessment, prioritization) appears in every domain but with domain-specific implementations. Without explicit problem-centered structure, this cross-cutting knowledge is invisible.

**Test:** Can you navigate from any domain note about a problem (debugging, deciding, assessing risk) to a universal problem-solving hub? Do domain-specific implementations link to the hub rather than existing in isolation?

**Implementation:** Use frontmatter to tag problem-type:
```yaml
problem-type: debugging|decision|risk|prioritization|failure-analysis|verification|verification
problem-domain: universal|implementation  # universal=applies everywhere, implementation=domain-specific
cross-topic-hub: [[Universal Problem Hub Name]]
```

**Example structure:**
- [[Problem Debugging]] (universal hub)
  - links to [[Debugging Cooking]] (implementation)
  - links to [[Debugging Code]] (implementation)
  - links to [[Debugging Garden]] (implementation)

## Connection to Existing Seed Rules

This gap relates to:
- [[Seed Stress Test - Gap Identification Rule in Cooking]] — gap identification is itself a problem-type that could be centralized
- [[Frontier Exploration - Compound Context Knowledge]] — compound problems often span multiple domains
- [[Frontier Exploration - Learning Progression and Curriculum Design]] — learning problems cut across topics

## Test Scenario

Pick a new domain (e.g., beekeeping). Ask: "What problem-solving knowledge from other domains applies here?" If the vault can answer this via cross-topic links, problem-centered organization is working.

---

**See also:**
- [[Thinking Tools as Cross-Topic Knowledge]] — thinking tools are one form of problem-centered knowledge
- [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]]